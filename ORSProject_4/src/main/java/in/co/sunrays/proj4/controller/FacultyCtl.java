package in.co.sunrays.proj4.controller;


import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.FacultyBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.model.SubjectModel;
import in.co.sunrays.proj4.model.CollegeModel;
import in.co.sunrays.proj4.model.CourseModel;
import in.co.sunrays.proj4.model.FacultyModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.DataValidator;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


/**
 * Faculty functionality Controller. Performs operation for add, update, delete
 * and get Faculty
 * 
 * @author Ravi Rathore
 * @version 1.0
 * @Copyright (c) RaviOS
 */

@WebServlet(name = "FacultyCtl", urlPatterns = { "/ctl/FacultyCtl" })
public class FacultyCtl extends BaseCtl {

	
	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(FacultyCtl.class);

	/**
	 * Loads list and other data required to display at HTML form
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 */
	@Override
	protected void preload(HttpServletRequest request) {
		CollegeModel collegeModel = new CollegeModel();
		CourseModel courseModel = new CourseModel();
		SubjectModel subjectModel = new SubjectModel();
		try {
			List collegeList = collegeModel.list();
			List courseList = courseModel.list();
			List subjectList = subjectModel.list();
			request.setAttribute("collegeList", collegeList);
			request.setAttribute("courseList", courseList);
			request.setAttribute("subjectList", subjectList);
			System.out.println(collegeList+" "+courseList+" "+subjectList);
		} catch (ApplicationException e) {
			log.error(e);
		}

	}

	
	/**
	 * Validates the input data entered by user
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @return pass:
	 * 				a boolean variable
	 */
	@Override
	protected boolean validate(HttpServletRequest request) {

		log.debug("FacultyCtl Method validate Started");
	
		boolean pass = true;

		String emailId = request.getParameter("email");
		String dob = request.getParameter("jod");

		if (DataValidator.isNull(request.getParameter("firstName"))) {
			
			request.setAttribute("firstName", PropertyReader.getValue("error.require", "First Name"));
			pass = false;
		
		}

		if (DataValidator.isNull(request.getParameter("lastName"))) {
			
			request.setAttribute("lastName", PropertyReader.getValue("error.require", "Last Name"));
			pass = false;
		}

		if(DataUtility.getString(request.getParameter("Gender")).equals("")) {
			request.setAttribute("Gender", PropertyReader.getValue("error.require", "gender"));
			pass = false;
		}
       
		if(DataUtility.getInt(request.getParameter("collegeName"))==0) {
			request.setAttribute("collegeName", PropertyReader.getValue("error.require", "college Name"));
			pass = false;
		}
		
		if(DataUtility.getInt(request.getParameter("courseName"))==0) {
			request.setAttribute("courseName", PropertyReader.getValue("error.require", "course Name"));
			pass = false;
		}

		if(DataUtility.getInt(request.getParameter("subjectName"))==0) {
			request.setAttribute("subjectName", PropertyReader.getValue("error.require", "subject Name"));
			pass = false;
		}

		
		if (DataValidator.isNull(request.getParameter("qualification"))) {
		
			request.setAttribute("qualification", PropertyReader.getValue("error.require", "Qualification"));
			pass = false;
		}

		if (DataValidator.isNull(emailId)) {
		
			request.setAttribute("email", PropertyReader.getValue("error.require", "Email Id"));
			pass = false;
		} else if (!DataValidator.isEmail(emailId)) {
		
			request.setAttribute("email", PropertyReader.getValue("error.require", "Email "));
			pass = false;
		}

		if(DataValidator.isNull(request.getParameter("mob"))) {
			request.setAttribute("mob", PropertyReader.getValue("error.require", "Mobile number"));
			pass = false;
		}
		

		if (DataValidator.isNull(dob)) {
			
			request.setAttribute("jod", PropertyReader.getValue("error.require", "Joining Date"));
		
			pass = false;
		} /*else if (!DataValidator.isDate(dob)) {
			
			request.setAttribute("jod", PropertyReader.getValue("error.require", "Joining Date"));
			pass = false;
		}*/
		
		log.debug("FacultyCtl Method validate Ended");
		
		return pass;
	}

	/**
	 * Populates FacultyBean object from request parameters
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @return bean:
	 * 				FacultyBean object
	 */
	@Override
	protected BaseBean populateBean(HttpServletRequest request) {

		log.debug("FacultyCtl Method populatebean Started");

		FacultyBean bean = new FacultyBean();

		bean.setId(DataUtility.getLong(request.getParameter("id")));

		bean.setFirstName(DataUtility.getString(request.getParameter("firstName")));

		bean.setLastName(DataUtility.getString(request.getParameter("lastName")));

		bean.setCollegeId(DataUtility.getLong(request.getParameter("collegeName")));

		bean.setSubjectId(DataUtility.getLong(request.getParameter("subjectName")));
		
		bean.setCourseId(DataUtility.getLong(request.getParameter("courseName")));

		bean.setQualification(DataUtility.getString(request.getParameter("qualification")));

		bean.setEmailId(DataUtility.getString(request.getParameter("email")));

		bean.setMobileNo(DataUtility.getLong(request.getParameter("mob")));
		
		bean.setGender(DataUtility.getString(request.getParameter("Gender")));

		bean.setJoiningDate(DataUtility.getDate(request.getParameter("jod")));

		populateDTO(bean, request);

		log.debug("FacultyCtl Method populatebean Ended");

		return bean;
	}

	/**
	 * Display Add Faculty and Update faculty form
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @param response:
	 * 					HttpServletResponse object
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("FacultyCtl Method doGet Started");
		
		String op = DataUtility.getString(request.getParameter("operation"));
		// get model
		FacultyModel model = new FacultyModel();
		long id = DataUtility.getLong(request.getParameter("id"));
		if (id > 0 || op != null) {
			
			FacultyBean bean;
			try {
				bean = model.findByPK(id);
				ServletUtility.setBean(bean, request);
			} catch (ApplicationException e) {
				log.error(e);
				e.printStackTrace();
				ServletUtility.handleException(e, request, response);
				return;
			}
		}
		

		ServletUtility.forward(getView(), request, response);
		log.debug("FacultyCtl Method doGet Ended");
	}

	/**
	 * Contains Submit logics
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @param response:
	 * 					HttpServletResponse object
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("FacultyCtl Method doPost Started");
	
		String op = DataUtility.getString(request.getParameter("operation"));
		// get model
		FacultyModel model = new FacultyModel();
		long id = DataUtility.getLong(request.getParameter("id"));
	
		if (OP_SAVE.equalsIgnoreCase(op) || OP_UPDATE.equalsIgnoreCase(op)) {
			FacultyBean bean = (FacultyBean) populateBean(request);

			try {
				if (id > 0) {
					model.update(bean);
					ServletUtility.setBean(bean, request);
					ServletUtility.setSuccessMessage("Data is succesfully updated", request);
				} else {
					long pk = model.add(bean);
					///bean.setId(pk);
					 ServletUtility.setBean(bean, request);
					ServletUtility.setSuccessMessage("Data is successfully saved", request);
				}
				
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			} catch (DuplicateRecordException e) {
				ServletUtility.setBean(bean, request);
				ServletUtility.setErrorMessage("Login id already exists", request);
			}
		} else if (OP_DELETE.equalsIgnoreCase(op)) {

			FacultyBean bean = (FacultyBean) populateBean(request);
			try {
				model.delete(bean);
				ServletUtility.redirect(ORSView.FACULTY_LIST_CTL, request, response);
				return;
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}

		} else if (OP_CANCEL.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.FACULTY_LIST_CTL, request, response);
			return;
		}
		else if(OP_RESET.equalsIgnoreCase(op))
        {
        	ServletUtility.redirect(ORSView.FACULTY_CTL, request, response);
        	return;
        }
		ServletUtility.forward(getView(), request, response);

		log.debug("FacultyCtl Method doPostEnded");
	}

	
	/**
	 * Returns the VIEW page of FacultyCtll
	 * 
	 * @return FacultyView.jsp:
	 * View page of FacultyCtl
	 */
	@Override
	protected String getView() {
		return ORSView.FACULTY_VIEW;
	}

}
package in.co.sunrays.proj4.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.TimeTableBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.exception.RecordNotFoundException;
import in.co.sunrays.proj4.model.CourseModel;
import in.co.sunrays.proj4.model.SubjectModel;
import in.co.sunrays.proj4.model.TimeTableModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.DataValidator;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;

/**
 * TimeTable functionality Controller. Performs operation for add, update, delete
 * and get TimeTable
 * 
 * @author Ravi Rathore
 * @version 1.0
 * @Copyright (c) RaviOS
 */
@WebServlet(name = "TimeTableCtl", urlPatterns = { "/ctl/TimeTableCtl" })
public class TimeTableCtl extends BaseCtl {


	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(TimeTableCtl.class);

	/**
	 * Loads list and other data required to display at HTML form
	 * 
	 * @param request:	
	 * 					HttpServletRequest object
	 */
	protected void preload(HttpServletRequest request) {
		CourseModel courseModel = new CourseModel();
		
		try {
			List listCourse = courseModel.list();
			request.setAttribute("cLIst", listCourse);

		} catch (ApplicationException e) {
			log.error(e);
		}
		SubjectModel subjectModel = new SubjectModel();
		try {
			List listSubject = subjectModel.list();
			request.setAttribute("sLIst", listSubject);
		} catch (ApplicationException e) {
			log.error(e);
		}
	}

	/**
	 * Validates the input data entered by the user
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @return pass:
	 * 				a boolean variable
	 */
	protected boolean validate(HttpServletRequest request) {

		log.debug("TimeTableCtlMethod validate started");
		boolean pass = true;
		String op = DataUtility.getString(request.getParameter("operation"));

		if(DataUtility.getString(request.getParameter("couName")).equals("")) {
			request.setAttribute("couName", PropertyReader.getValue("error.require", "Course Name"));
			pass = false;
		}
		
		if(DataUtility.getString(request.getParameter("subName")).equals("")) {
			request.setAttribute("subName", PropertyReader.getValue("error.require", "Subject Name"));
			pass = false;
		}

		if(DataUtility.getString(request.getParameter("semester")).equals("")) {
			request.setAttribute("semester", PropertyReader.getValue("error.require", "Semester"));
			pass = false;
		}
		
		if (DataValidator.isNull(request.getParameter("examDate"))) {
			request.setAttribute("examDate", PropertyReader.getValue("error.require", "Date of exam"));
			pass = false;
		} else if (!DataValidator.isDate(request.getParameter("examDate"))) {
			request.setAttribute("examDate", PropertyReader.getValue("error.date", "Date of exam"));
			pass = false;
		}else if (DataUtility.getDate(request.getParameter("examDate")).getDay() == 0) {
			request.setAttribute("examDate", "Exam can't be scheduled on sunday");
			pass = false;

		}/*else if (DataUtility.getDate(request.getParameter("examDate"))!=new Date()){
			request.setAttribute("examDate", "Use Another Date");
			pass = false;
	
		}*/
		
		if(DataUtility.getString(request.getParameter("examTime")).equals("")) {
			request.setAttribute("examTime", PropertyReader.getValue("error.require", "Examtime"));
			pass = false;
		}

		
		log.debug("TimeTableCtl Method validate Ended");
		return pass;

	}

	/**
	 * Populates the TimeTableBean object from request parameters
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @return bean:
	 * 				TmeTableBean object
	 */
	protected BaseBean populateBean(HttpServletRequest request) {
		log.debug("TimeTableCtl Method populatebean Started");

		TimeTableBean bean = new TimeTableBean();

		bean.setId(DataUtility.getLong(request.getParameter("id")));
		bean.setCourseId(DataUtility.getLong(request.getParameter("couName")));
		bean.setCourseName(DataUtility.getString(request.getParameter("courseName")));
		bean.setSubId(DataUtility.getInt(request.getParameter("subName")));
		bean.setSubName(DataUtility.getString(request.getParameter("subjectName")));
		bean.setSemester(DataUtility.getString(request.getParameter("semester")));
		bean.setExamDate(DataUtility.getDate(request.getParameter("examDate")));
		bean.setExamTime(DataUtility.getString(request.getParameter("examTime")));
		System.out.println("time...." + bean.getExamTime());

		populateDTO(bean, request);

		log.debug("TimeTableCtl Method populatebean Ended");
		return bean;

	}

	/**
	 * Display Add TimeTable and Update TimeTable form
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
		System.out.println("inside time table Ctl");
		log.debug("TimeTableCtl Method doGet Started");
		// System.out.println("In do get");
		String op = DataUtility.getString(request.getParameter("operation"));
		long id = DataUtility.getLong(request.getParameter("id"));
		// System.err.println("bbd.b" + op);
		// get model
		System.out.println("id  "+id);
		TimeTableModel model = new TimeTableModel();
		if (id > 0) {
			System.out.println("inside id>0");
			TimeTableBean bean;
			try {
				bean = model.findByPK(id);
				System.out.println(bean.getCourseName()+" "+bean.getSubName()+" "+bean.getExamTime());
				ServletUtility.setBean(bean, request);
			} catch (ApplicationException e) {
				e.printStackTrace();
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}
		}

		ServletUtility.forward(getView(), request, response);

		log.debug("TimeTableCtl Method doGet Ended");
	}

	/**
	 * Contains Submit logic
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
		log.debug("TimeTableCtl Method doPost Started");
		String op = DataUtility.getString(request.getParameter("operation"));
		// get model

		TimeTableModel model = new TimeTableModel();
		long id = DataUtility.getLong(request.getParameter("id"));
		if (OP_SAVE.equalsIgnoreCase(op) || OP_UPDATE.equalsIgnoreCase(op)) {
			TimeTableBean bean = (TimeTableBean) populateBean(request);
			try {
				if (id > 0) {
					model.update(bean);
					ServletUtility.setBean(bean, request);
					ServletUtility.setSuccessMessage("Data is successfully updated", request);
				} else {
					long pk = model.add(bean);
					/////bean.setId(pk);
					 ServletUtility.setBean(bean, request);
					ServletUtility.setSuccessMessage("Data is successfully added", request);
				}
			} catch (ApplicationException e) {
				log.error(e);
				e.printStackTrace();
				ServletUtility.handleException(e, request, response);
				return;
			} catch (DuplicateRecordException e) {
				ServletUtility.setBean(bean, request);
				ServletUtility.setErrorMessage("TimeTable is already exists", request);
			}catch (RecordNotFoundException e) {
				ServletUtility.setBean(bean, request);
				ServletUtility.setErrorMessage(e.getMessage(), request);
			}
			
		} else if (OP_DELETE.equalsIgnoreCase(op)) {

			TimeTableBean bean = (TimeTableBean) populateBean(request);
			try {
				model.delete(bean);
				ServletUtility.redirect(ORSView.TIME_TABLE_LIST_CTL, request, response);
				return;
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}

		} else if (OP_RESET.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.TIME_TABLE_CTL, request, response);
			return;

		} else if (OP_CANCEL.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.TIME_TABLE_LIST_CTL, request, response);
			return;

		}
		ServletUtility.forward(getView(), request, response);

		log.debug("TimeTableCtl Method doPost Ended");
	}

	/**
	 * Returns the view page of TimeTableCtl
	 * 
	 * @return TimeTableView.jsp:
	 * 							View page of TimeTableCtl
	 */
	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.TIME_TABLE_VIEW;
	}

}


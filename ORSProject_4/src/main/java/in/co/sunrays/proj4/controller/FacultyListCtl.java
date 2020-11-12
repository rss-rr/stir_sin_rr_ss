package in.co.sunrays.proj4.controller;
import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.FacultyBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.model.CollegeModel;
import in.co.sunrays.proj4.model.CourseModel;
import in.co.sunrays.proj4.model.FacultyModel;
import in.co.sunrays.proj4.util.DataUtility;
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
 * Faculty List functionality Controller. Performs operation for list, search
 * and delete operations of Faculty
 * 
 * @author Ravi Rathore
 * @version 1.0
 * @Copyright (c) RaviOS
 */
@WebServlet(name = "FacultyListCtl", urlPatterns = { "/ctl/FacultyListCtl" })
public class FacultyListCtl extends BaseCtl {
	
	
	private static Logger log = Logger.getLogger(FacultyListCtl.class);

	
	
	/**
	 * Loads list and other data required to display at HTML form
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 */
	@Override
	protected void preload(HttpServletRequest request) {


		 CollegeModel smodel = new CollegeModel();
		try {
			
			 List l = smodel.list();
	            
	           
	            request.setAttribute("collegeList", l);
			
		} catch (ApplicationException e) {
			log.error(e);
		}
		
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
		FacultyBean bean = new FacultyBean();
		bean.setId(DataUtility.getLong(request.getParameter("facultyId")));
		bean.setCourseId(DataUtility.getLong(request.getParameter("courseId")));
		bean.setFirstName(DataUtility.getString(request.getParameter("firstName")));

		bean.setCollegeId(DataUtility.getLong(request.getParameter("roleName")));
		bean.setEmailId(DataUtility.getString(request.getParameter("email")));

		return bean;
	}

	/**
	 * Display Faculty List
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
		log.debug("FacultyListCtl doGet Start");
		List list = null;
		int pageNo = 1;
		int pageSize = DataUtility.getInt(PropertyReader.getValue("pageSize"));
		FacultyBean bean = (FacultyBean) populateBean(request);
		String op = DataUtility.getString(request.getParameter("operation"));

		FacultyModel model = new FacultyModel();
		try {
			list = model.search(bean, pageNo, pageSize);
			ServletUtility.setlist(list, request);
			if (list == null || list.size() == 0) {
				ServletUtility.setErrorMessage("No record found ", request);
			}
			ServletUtility.setlist(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);
		} catch (ApplicationException e) {
			log.error(e);
			e.printStackTrace();
			ServletUtility.handleException(e, request, response);
			return;
		}
		log.debug("FacultyListCtl doGet End");
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
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("FacultyListCtl doPost Start");
		List list = null;
		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

		pageNo = (pageNo == 0) ? 1 : pageNo;
		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("pageSize")) : pageSize;
		FacultyBean bean = (FacultyBean) populateBean(request);
		String op = DataUtility.getString(request.getParameter("operation"));
		
		// get the selected checkbox ids array for delete list
		String[] ids = request.getParameterValues("chk_1");
		FacultyModel model = new FacultyModel();
		try {

			if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op) || "Previous".equalsIgnoreCase(op)) {

				if (OP_SEARCH.equalsIgnoreCase(op)) {
					///pageNo = 1;
				} else if (OP_NEXT.equalsIgnoreCase(op)) {
					pageNo++;
				} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
					pageNo--;
				}

			} else if (OP_NEW.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.FACULTY_CTL, request, response);
				return;
			}else if (OP_DELETE.equalsIgnoreCase(op)) {
				pageNo = 1;
				if (ids != null && ids.length > 0) {
					FacultyBean deletebean = new FacultyBean();
					for (String id : ids) {
						deletebean.setId(DataUtility.getInt(id));
						model.delete(deletebean);
					}

					ServletUtility.setSuccessMessage("Record deleted successfully", request);
				} else {
					ServletUtility.setErrorMessage("Select at least one record", request);
				}
			}else if(OP_BACK.equalsIgnoreCase(op)){
				pageNo=DataUtility.getInt(request.getParameter("pageNo1"));
            	System.out.println("page"+pageNo);
			}
			else if(OP_RESET.equalsIgnoreCase(op))
            {
            	ServletUtility.redirect(ORSView.FACULTY_LIST_CTL, request, response);
            	return;
            }
           
			list = model.search(bean, pageNo, pageSize);
			ServletUtility.setlist(list, request);
			
			
			if ((list == null || list.size() == 0) &&!OP_DELETE.equalsIgnoreCase(op)) {
				ServletUtility.setErrorMessage("No record found ", request);
			}
			request.setAttribute("sbean", bean);
			ServletUtility.setBean(bean, request);
			ServletUtility.setlist(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);

		} catch (ApplicationException e) {
			log.error(e);
			e.printStackTrace();
			ServletUtility.handleException(e, request, response);
			return;
		}
		log.debug("FacultyListCtl doPost End");
	}

	/**
	 * Returns the VIEW page of FacultyListCtl
	 * 
	 * @return FacultyListView.jsp:
	 * 								View page of FacultyListCtl
	 */
	@Override
	protected String getView() {
		return ORSView.FACULTY_LIST_VIEW;
	}

}

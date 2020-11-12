package in.co.sunrays.proj4.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.CourseBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.model.CourseModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;

/**
 * Course List functionality Controller. Performs operation for list, search
 * and delete operations of Course
 * 
 * @author Ravi Rathore
 * @version 1.0
 * 
 */
@WebServlet(name = "CourseListCtl", urlPatterns = { "/ctl/CourseListCtl","/ravi" })
public class CourseListCtl extends BaseCtl {

	private static Logger log = Logger.getLogger(CourseListCtl.class);

	
	/**
	 * Loads list and other data required to display at HTML form
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 */
	@Override
	protected void preload(HttpServletRequest request) {

		CourseModel courseModel = new CourseModel();
		try {
			List list = courseModel.list();
			request.setAttribute("courseList", list);
		} catch (ApplicationException e) {
			log.error(e);
		}

	}

	
	/**
	 * Populates CourseBean object from request parameters
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @return bean:
	 * 				CourseBean object
	 */
	@Override
	protected BaseBean populateBean(HttpServletRequest request) {
		CourseBean bean = new CourseBean();

		bean.setId(DataUtility.getLong(request.getParameter("courseId")));
		bean.setCourseName(DataUtility.getString(request.getParameter("cName")));
		bean.setDuration(DataUtility.getString(request.getParameter("duration")));
		return bean;
	}

	/**
	 * Display Course List
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @param response:
	 * 					HttpServletResponse object
	 * @throws ServletException,IOException
	 *  
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("CourseListCtl doGet Start");
		List list = null;
		int pageNo = 1;
		int pageSize = DataUtility.getInt(PropertyReader.getValue("pageSize"));
		CourseBean bean = (CourseBean) populateBean(request);
		String op = DataUtility.getString(request.getParameter("operation"));

		CourseModel model = new CourseModel();
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
			ServletUtility.handleException(e, request, response);
			return;
		}
		log.debug("CourseListCtl doGet End");
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
		log.debug("CourseListCtl doPost Start");
		List list = null;
		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

		pageNo = (pageNo == 0) ? 1 : pageNo;
		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("pageSize")) : pageSize;
		CourseBean bean = (CourseBean) populateBean(request);
		String op = DataUtility.getString(request.getParameter("operation"));
		// get the selected checkbox ids array for delete list
		String[] ids = request.getParameterValues("chk_1");
		CourseModel model = new CourseModel();
		try {

			if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op) || "Previous".equalsIgnoreCase(op)) {

				if (OP_SEARCH.equalsIgnoreCase(op)) {
					pageNo = 1;
				} else if (OP_NEXT.equalsIgnoreCase(op)) {
					pageNo++;
				} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
					pageNo--;
				}

			} else if (OP_NEW.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.COURSE_CTL, request, response);
				return;
			} else if (OP_DELETE.equalsIgnoreCase(op)) {
				///pageNo = 1;
				if (ids != null && ids.length > 0) {
					CourseBean deletebean = new CourseBean();
					for (String id : ids) {
						deletebean.setId(DataUtility.getInt(id));
						model.delete(deletebean);
					}
					ServletUtility.setSuccessMessage("Record successfully deleted", request);

				} else {
					ServletUtility.setErrorMessage("Select at least one record", request);
				}
			} else if ( OP_BACK.equalsIgnoreCase(op)) {
				pageNo=DataUtility.getInt(request.getParameter("pageNo1"));
            	System.out.println("page"+pageNo);
			}
			else if(OP_RESET.equalsIgnoreCase(op))
            {
            	ServletUtility.redirect(ORSView.COURSE_LIST_CTL, request, response);
            	return;
            }
			list = model.search(bean, pageNo, pageSize);
			request.setAttribute("courseList", list);
			ServletUtility.setlist(list, request);
			
				if ((list == null || list.size() == 0)&&!OP_DELETE.equalsIgnoreCase(op)) {
					ServletUtility.setErrorMessage("No records Found", request);
				}
			request.setAttribute("sbean", bean);
			///ServletUtility.setBean(bean, request);
			ServletUtility.setlist(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);

		} catch (ApplicationException e) {
			log.error(e);
			ServletUtility.handleException(e, request, response);
			return;
		}
		log.debug("CourseListCtl doPost End");
	}

	
	/**
	 * Returns the VIEW page of CourseListCtl
	 * 
	 * @return CourseListView.jsp:
	 * 								View page of CourseListCtl
	 */
	@Override
	protected String getView() {
		return ORSView.COURSE_LIST_VIEW;
	}
}


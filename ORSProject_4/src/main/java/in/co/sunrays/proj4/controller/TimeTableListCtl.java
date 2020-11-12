package in.co.sunrays.proj4.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import in.co.sunrays.proj4.model.CourseModel;
import in.co.sunrays.proj4.model.SubjectModel;
import in.co.sunrays.proj4.model.TimeTableModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;
/**
 * Timetable List functionality Controller. Performs operation for list, search
 * and delete operations of Timetables
 * 
 * @author Ravi Rathore
 * @version 1.0
 * @Copyright (c) RaviOS
 */
@WebServlet(name = "TimeTableListCtl", urlPatterns = { "/ctl/TimeTableListCtl" })

public class TimeTableListCtl extends BaseCtl {
	private static Logger log = Logger.getLogger(TimeTableListCtl.class);
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
     * Display TimeTable List
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
		long id = DataUtility.getLong(request.getParameter("id"));
		int pageNo = 1;
		int pageSize = DataUtility.getInt(PropertyReader.getValue("pageSize"));
		TimeTableBean bean = (TimeTableBean) populateBean(request);
		TimeTableModel model = new TimeTableModel();
		List list = null;
		try {
			list = model.search(bean, pageNo, pageSize);
			ServletUtility.setlist(list, request);
			if (list == null || list.size() == 0) {
				ServletUtility.setErrorMessage("No Record Found", request);
			}
			ServletUtility.setlist(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);
		} catch (ApplicationException e) {
			e.printStackTrace();
			ServletUtility.handleException(e, request, response);
			return;
		}
	}
	
	
	/**
     * Contains submit logics
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

		List list = null;

		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));
		int count=0;
		pageNo = (pageNo == 0) ? 1 : pageNo;
		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("pageSize")) : pageSize;

		TimeTableBean bean = (TimeTableBean) populateBean(request);
		String op = DataUtility.getString(request.getParameter("operation"));

		String[] ids = request.getParameterValues("chk_1");
		TimeTableModel model = new TimeTableModel();
		try {
			if (OP_SEARCH.equalsIgnoreCase(op) || OP_NEXT.equalsIgnoreCase(op) || OP_PREVIOUS.equalsIgnoreCase(op)) {
				if (OP_SEARCH.equalsIgnoreCase(op)) {
					pageNo = 1;
				} else if (OP_NEXT.equalsIgnoreCase(op)) {
					pageNo++;
				} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
					pageNo--;
				}
			}else if (OP_NEW.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.TIME_TABLE_CTL, request, response);
				return;
			} else if (OP_DELETE.equalsIgnoreCase(op)) {
				
				///pageNo=1;
				if (ids != null && ids.length > 0) {
					TimeTableBean deleteBean = new TimeTableBean();
					for (String id : ids) {
						deleteBean.setId(DataUtility.getInt(id));
						model.delete(deleteBean);
						count++;
					}
					ServletUtility.setSuccessMessage("Record deleted successfully", request);
					} else {
					ServletUtility.setErrorMessage("Please Select at least one record ", request);
				}
			} else if ( OP_BACK.equalsIgnoreCase(op)) {
				pageNo=DataUtility.getInt(request.getParameter("pageNo1"));
			}
			else if(OP_RESET.equalsIgnoreCase(op))
            {
            	ServletUtility.redirect(ORSView.TIME_TABLE_LIST_CTL, request, response);
            	return;
            }
			list = model.search(bean, pageNo, pageSize);
			ServletUtility.setlist(list, request);
			if (list == null || list.size() == 0 && !OP_DELETE.equalsIgnoreCase(op)) {
				ServletUtility.setErrorMessage("No Record Found", request);
			}
			request.setAttribute("sbean", bean);
			//ServletUtility.setBean(bean, request);
			ServletUtility.setlist(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);
		} catch (ApplicationException e) {
			e.printStackTrace();
			ServletUtility.handleException(e, request, response);
			return;
		}
	}

	/**
	 * Populates TimeTableBean object from request parameters
	 * 
	 * @param request:
	 * 					HttpServletRequest object
	 * @return bean:
	 * 				TimeTableBean object
	 */
	protected BaseBean populateBean(HttpServletRequest request) {
		TimeTableBean bean = new TimeTableBean();
		//bean.setCourseName(DataUtility.getString(request.getParameter("cName")));
		bean.setCourseId(DataUtility.getLong(request.getParameter("roleName1")));
		bean.setSubId(DataUtility.getInt(request.getParameter("roleName")));
		//bean.setSemester(DataUtility.getString(request.getParameter("semester")));
		
			bean.setExamDate(DataUtility.getDate(request.getParameter("examDate")));
		    System.out.println(bean.getExamDate());
	
		
		return bean;
	}
	
	/**
	 * Returns the view page of TimeTableListCtl
	 * 
	 * @return TimeTableListView.jsp:
	 * 									View page of TimeTableListCtl
	 */
	protected String getView() {
		return ORSView.TIME_TABLE_LIST_VIEW;
	}
}


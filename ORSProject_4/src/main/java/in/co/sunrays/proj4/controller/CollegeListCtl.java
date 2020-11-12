package in.co.sunrays.proj4.controller;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.CollegeBean;
import in.co.sunrays.proj4.bean.UserBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.model.CollegeModel;
import in.co.sunrays.proj4.model.CourseModel;
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
 * College List functionality Controller. Performs operation for list, search
 * and delete operations of College
 *
 * @author Ravi Rathore
 * @version 1.0
 * @Copyright (c) RaviOS
 */
@ WebServlet(name="CollegeListCtl",urlPatterns={"/ctl/CollegeListCtl"})
public class CollegeListCtl extends BaseCtl {

    private static Logger log = Logger.getLogger(CollegeListCtl.class);
    
    
    protected void preload(HttpServletRequest request) {
        CollegeModel model = new CollegeModel();
        CourseModel crModel=new CourseModel();
        try {

            List l = model.list();
            List l1=crModel.list();
           
            request.setAttribute("collegeList", l);
            request.setAttribute("courseList", l1);
            System.out.println("list of student "+l+" "+l1);
        } catch (ApplicationException e) {
            log.error(e);
        }

    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        CollegeBean bean = new CollegeBean();

        bean.setId(DataUtility.getInt(request.getParameter("cName")));
        bean.setCity(DataUtility.getString(request.getParameter("city")));

        return bean;
    }

    /**
     * Contains display logic
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        int pageNo = 1;
        int pageSize = DataUtility.getInt(PropertyReader.getValue("pageSize"));

        CollegeBean bean = (CollegeBean) populateBean(request);
        CollegeModel model = new CollegeModel();

        List list = null;

        try {
            list = model.search(bean, pageNo, pageSize);
        } catch (ApplicationException e) {
            log.error(e);
            ServletUtility.handleException(e, request, response);
            return;
        }

        if (list == null || list.size() == 0) {
            ServletUtility.setErrorMessage("No record found ", request);
        }

        ServletUtility.setlist(list, request);
        ServletUtility.setPageNo(pageNo, request);
        ServletUtility.setPageSize(pageSize, request);
        ServletUtility.forward(getView(), request, response);
    }

    /**
     * Contains submit logic
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        log.debug("CollegeListCtl doPost Start");

        List list = null;

        int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
        int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

        pageNo = (pageNo == 0) ? 1 : pageNo;

        pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader
                .getValue("pageSize")) : pageSize;

        CollegeBean bean = (CollegeBean) populateBean(request);

        String op = DataUtility.getString(request.getParameter("operation"));

        CollegeModel model = new CollegeModel();
        String[] ids = request.getParameterValues("chk_1");
        try {

            if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op)
                    || "Previous".equalsIgnoreCase(op)) {

                if (OP_SEARCH.equalsIgnoreCase(op)) {
                    ////pageNo = 1;
                } else if (OP_NEXT.equalsIgnoreCase(op)) {
                    pageNo++;
                } else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
                    pageNo--;
                }

            }
            else if (OP_DELETE.equalsIgnoreCase(op)) {
                //// pageNo = 1;
                 if (ids != null && ids.length > 0) {
                     CollegeBean deletebean = new CollegeBean();
                     for (String id : ids) {
                         deletebean.setId(DataUtility.getInt(id));
                         model.delete(deletebean);
                     }
                     ServletUtility.setSuccessMessage(
                             "Record has deleted successfully", request);
                 } else {
                     ServletUtility.setErrorMessage(
                             "Select at least one record", request);
                 }
             }
            else if(OP_BACK.equalsIgnoreCase(op))
            {
            	pageNo=DataUtility.getInt(request.getParameter("pageNo1"));
            	System.out.println("page"+pageNo);
            }
            else if(OP_RESET.equalsIgnoreCase(op))
            {
            	ServletUtility.redirect(ORSView.COLLEGE_LIST_CTL, request, response);
            	return;
            }
            else if(OP_NEW.equalsIgnoreCase(op))
            {
            	ServletUtility.redirect(ORSView.COLLEGE_CTL, request, response);
            	return;	
            }
            list = model.search(bean, pageNo, pageSize);
            ServletUtility.setlist(list, request);
            if (list == null || list.size() == 0) {
                ServletUtility.setErrorMessage("No record found ", request);
            }
            request.setAttribute("cbean", bean);
            ServletUtility.setlist(list, request);

            ServletUtility.setPageNo(pageNo, request);
            ServletUtility.setPageSize(pageSize, request);
            ServletUtility.forward(getView(), request, response);

        } catch (ApplicationException e) {
            log.error(e);
            ServletUtility.handleException(e, request, response);
            return;
        }
        log.debug("CollegeListCtl doGet End");
    }

    @Override
    protected String getView() {
        return ORSView.COLLEGE_LIST_VIEW;
    }
}

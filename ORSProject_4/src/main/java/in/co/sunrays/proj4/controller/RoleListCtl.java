package in.co.sunrays.proj4.controller;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.RoleBean;
import in.co.sunrays.proj4.bean.UserBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.model.RoleModel;
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
 * Role List functionality Controller. Performs operation for list, search
 * operations of Role
 *
 * @author Ravi Rathore
 * @version 1.0
 * @Copyright (c) RaviOS
 */
@ WebServlet(name="RoleListCtl",urlPatterns={"/ctl/RoleListCtl"})
public class RoleListCtl extends BaseCtl {
    private static Logger log = Logger.getLogger(RoleListCtl.class);
    
    
    protected void preload(HttpServletRequest request) {
        RoleModel model = new RoleModel();
        try {
            List l = model.list();
            request.setAttribute("roleList", l);
        } catch (ApplicationException e) {
            log.error(e);
        }

    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        RoleBean bean = new RoleBean();
        bean.setId(DataUtility.getInt(request.getParameter("roleName")));

        return bean;
    }

    /**
     * Contains Display logics
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        log.debug("RoleListCtl doGet Start");
        List list = null;
        int pageNo = 1;
        int pageSize = DataUtility.getInt(PropertyReader.getValue("pageSize"));
        RoleBean bean = (RoleBean) populateBean(request);
        String op = DataUtility.getString(request.getParameter("operation"));
        RoleModel model = new RoleModel();
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
        log.debug("RoleListCtl doGet End");
    }

    /**
     * Contains Submit logics
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        log.debug("RoleListCtl doPost Start");
        System.out.println("in do post of search");
        List list = null;
        int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
        int pageSize = DataUtility.getInt(request.getParameter("pageSize"));
        pageNo = (pageNo == 0) ? 1 : pageNo;
        pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader
                .getValue("pageSize")) : pageSize;
        RoleBean bean = (RoleBean) populateBean(request);
        String op = DataUtility.getString(request.getParameter("operation"));

        RoleModel model = new RoleModel();
        String[] ids = request.getParameterValues("chk_1");
        try {

            if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op)
                    || "Previous".equalsIgnoreCase(op)) {
            	 System.out.println("inside do post of search");
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
                     RoleBean deletebean = new RoleBean();
                     for (String id : ids) {
                         deletebean.setId(DataUtility.getInt(id));
                         model.delete(deletebean);
                     }
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
            else if (OP_NEW.equalsIgnoreCase(op)) {
                ServletUtility.redirect(ORSView.ROLE_CTL, request, response);
                return;
            }
            else if(OP_RESET.equalsIgnoreCase(op))
            {
            	ServletUtility.redirect(ORSView.ROLE_LIST_CTL, request, response);
            	return;
            }
            list = model.search(bean, pageNo, pageSize);
            ////ServletUtility.setlist(list, request);
            System.out.println(bean.getId());
            System.out.println(list);
            if (list == null || list.size() == 0 && !OP_DELETE.equalsIgnoreCase(op)) {
                ServletUtility.setErrorMessage("No record found ", request);
            }
            ///ServletUtility.setBean(bean, request);
            request.setAttribute("bean2", bean);
            ServletUtility.setlist(list, request);
            ServletUtility.setPageNo(pageNo, request);
            ServletUtility.setPageSize(pageSize, request);
            ServletUtility.forward(getView(), request, response);

        } catch (ApplicationException e) {
            log.error(e);
            ServletUtility.handleException(e, request, response);
            return;
        }
        log.debug("RoleListCtl doPost End");
    }

    @Override
    protected String getView() {
        return ORSView.ROLE_LIST_VIEW;
    }

}

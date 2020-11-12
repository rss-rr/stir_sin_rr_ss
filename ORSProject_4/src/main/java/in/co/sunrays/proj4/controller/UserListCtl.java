package in.co.sunrays.proj4.controller;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.RoleBean;
import in.co.sunrays.proj4.bean.UserBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.model.RoleModel;
import in.co.sunrays.proj4.model.UserModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * User List functionality Controller. Performs operation for list, search and
 * delete operations of User
 *
 * @author Ravi Rathore
 * @version 1.0
 * @Copyright (c) RaviOS
 */
@ WebServlet(name="UserListCtl",urlPatterns={"/ctl/UserListCtl"})
public class UserListCtl extends BaseCtl {
    private static Logger log = Logger.getLogger(UserListCtl.class);
     
    
    protected void pre(HttpServletRequest request) {
    	RoleModel model=new RoleModel();
    	RoleBean bean=new RoleBean();
    	try {
			List list=model.list();
			request.setAttribute("roleList", list);
		} catch (ApplicationException e) {
			
			e.printStackTrace();
		}
    	
    }
    public static String roleName(long a ,List list)
    { 
    	String s="";;
    	Iterator it=list.iterator();
    	while(it.hasNext())
    	{
    		RoleBean bean=(RoleBean) it.next();
    		if(a==bean.getId())
    		{
    		s=bean.getName();
    		break;
    		}
    	}
    	return s;
    }
    protected BaseBean populateBean(HttpServletRequest request) {
        UserBean bean = new UserBean();

        bean.setFirstName(DataUtility.getString(request
                .getParameter("firstName")));

        bean.setLastName(DataUtility.getString(request.getParameter("lastName")));

        bean.setLogin(DataUtility.getString(request.getParameter("login")));
        bean.setRollId(DataUtility.getLong(request.getParameter("roleName")));

        return bean;
    }

    /**
     * Contains Display logics
     */
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	
    	pre(request);
        log.debug("UserListCtl doGet Start");
        List list = null;
        int pageNo = 1;
        int pageSize = DataUtility.getInt(PropertyReader.getValue("pageSize"));
        UserBean bean = (UserBean) populateBean(request);
        String op = DataUtility.getString(request.getParameter("operation"));
        // get the selected checkbox ids array for delete list
        String[] ids = request.getParameterValues("ids");
        UserModel model = new UserModel();
        try {
            list = model.search(bean, pageNo, pageSize);
            ServletUtility.setlist(list, request);
            if (list == null || list.size() == 0) {
                ServletUtility.setErrorMessage("No record found ", request);
            }
            request.setAttribute("roleId", bean.getRollId());
            ServletUtility.setlist(list, request);
            ServletUtility.setPageNo(pageNo, request);
            ServletUtility.setPageSize(pageSize, request);
            ServletUtility.forward(getView(), request, response);
        } catch (ApplicationException e) {
            log.error(e);
            ServletUtility.handleException(e, request, response);
            return;
        }
        log.debug("UserListCtl doPOst End");
    }

    /**
     * Contains Submit logics
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        log.debug("UserListCtl doPost Start");
        List list = null;
        int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
        int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

        pageNo = (pageNo == 0) ? 1 : pageNo;
        pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader
                .getValue("pageSize")) : pageSize;
        UserBean bean = (UserBean) populateBean(request);
        String op = DataUtility.getString(request.getParameter("operation"));
        // get the selected checkbox ids array for delete list
        String[] ids = request.getParameterValues("chk_1");
        pre(request);
        UserModel model = new UserModel();
        try {

            if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op)
                    || "Previous".equalsIgnoreCase(op)) {

                if (OP_SEARCH.equalsIgnoreCase(op)) {
                    pageNo = 1;
                } else if (OP_NEXT.equalsIgnoreCase(op)) {
                    pageNo++;
                } else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
                    pageNo--;
                }

            } else if (OP_NEW.equalsIgnoreCase(op)) {
                ServletUtility.redirect(ORSView.USER_CTL, request, response);
                return;
            } else if (OP_DELETE.equalsIgnoreCase(op)) {
                 ///pageNo = 1;
                if (ids != null && ids.length > 0) {
                    UserBean deletebean = new UserBean();
                    for (String id : ids) {
                        deletebean.setId(DataUtility.getInt(id));
                        model.delete(deletebean);
                    }
                    ServletUtility.setSuccessMessage("Record successfully deleted", request);
                    
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
            	ServletUtility.redirect(ORSView.USER_LIST_CTL, request, response);
            	return;
            }
            list = model.search(bean, pageNo, pageSize);
            ServletUtility.setlist(list, request);
            if (list == null || list.size() == 0 && !OP_DELETE.equalsIgnoreCase(op)) {
                ServletUtility.setErrorMessage("No record found ", request);
            }
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
        log.debug("UserListCtl doGet End");
    }

    @Override
    protected String getView() {
        return ORSView.USER_LIST_VIEW;
    }

}
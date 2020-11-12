package in.co.sunrays.proj4.util;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.controller.BaseCtl;
import in.co.sunrays.proj4.controller.ORSView;
import in.co.sunrays.proj4.model.UserModel;
/**
 * This class provides utility operation for Servlet container like forward,
 * redirect, handle generic exception, manage success and error message, manage
 * default Bean and List, manage pagination parameters
 *
 * @author RAvi Rathore
 * @version 1.0
 * @Copyright (c) RaviOS
 */
public class ServletUtility {
	/**
     * Forward to given JSP/Servlet
     *
     * @param page
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
	public static void forward(String page, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher(page);
		rd.forward(req, resp);
	}

	public static void setErrorMessage(String msg, HttpServletRequest req) {
		req.setAttribute(BaseCtl.MSG_ERROR, msg);
	}
	  /**
     * Forward to Layout View
     *
     * @param page
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
	public static void forwardView(String page, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setAttribute("bodyPage", page);
		RequestDispatcher rd = req.getRequestDispatcher(ORSView.LAYOUT_VIEW);
		rd.forward(req, resp);

	}
	/**
     * Redirect to given JSP/Servlet
     *
     * @param page
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
	public static void redirect(String page, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.sendRedirect(page);
	}
	/**
     * Redirect to Application Error Handler Page
     *
     * @param e
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
	public static void handleException(Exception e, HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		if(e!=null)
		{
		req.setAttribute("ex", e);
		}
		RequestDispatcher rd = req.getRequestDispatcher(ORSView.ERROR_VIEW);
		rd.forward(req, resp);
		return;
	}
	 /**
     * Gets error message from request
     *
     * @param request
     * @return
     */
	public static String getErrorMessage(String property, HttpServletRequest req) {
		String val = (String) req.getAttribute(property);
		if (val == null) {
			return "";
		} else {
			return val;
		}
	}

	public static String getErrorMessageHtml(HttpServletRequest req) {
		Enumeration<String> e = req.getAttributeNames();
		StringBuffer sb = new StringBuffer("<UL>");
		String name = null;
		while (e.hasMoreElements()) {
			name = e.nextElement();
			if (name.startsWith("error")) {
				sb.append("<LI class='error'>" + req.getAttribute(name) + "</LI>");
			}
		}
		sb.append("</UL>");
		return sb.toString();
	}

	public static String getMessage(String property, HttpServletRequest req) {
		String val = (String) req.getAttribute(property);
		if (val == null) {
			return "";
		} else {
			return val;
		}
	}

	public static String getErrorMessage(HttpServletRequest req) {
		String val = (String) req.getAttribute(BaseCtl.MSG_ERROR);
		if (val == null) {
			return "";
		} else {
			return val;
		}
	}

	public static void setSuccessMessage(String msg, HttpServletRequest req) {
		req.setAttribute(BaseCtl.MSG_SUCCESS, msg);
	}

	public static String getSuccessMessage(HttpServletRequest req) {
		String val = (String) req.getAttribute(BaseCtl.MSG_SUCCESS);
		if (val == null) {
			return "";
		} else {
			return val;
		}
	}

	// public static void setModel(BaseModel model, HttpServletRequest request)
	// {
	// request.setAttribute("model", model);
	// }
	public static void setBean(BaseBean bean, HttpServletRequest req) {
		req.setAttribute("bean", bean);
	}

	public static void setUserModel(UserModel model, HttpServletRequest req) {
		req.getSession().setAttribute("user", model);
	}

	public static BaseBean getBean(HttpServletRequest req) {
		return (BaseBean) req.getAttribute("bean");
	}

	public static boolean isLoggegIn(HttpServletRequest req) {
		UserModel model = (UserModel) req.getSession().getAttribute("user");
		return model != null;
	}

	public static long getRole(HttpServletRequest req) {
		UserModel model = (UserModel) req.getSession().getAttribute("user");
		if (model != null) {
			return 0;
		}
		return 0;
	}

	// public static BaseModel getModel(HttpServletRequest request) {
	// return (BaseModel) request.getAttribute("model");
	// }
	public static String getParameter(HttpServletRequest req, String property) {
		String val = req.getParameter(property);
		///// System.out.println(val);
		if (val == null) {
			return "";
		} else {
			return val;
		}
	}

	public static void setlist(List list, HttpServletRequest req) {
		req.setAttribute("list", list);
	}

	public static List getList(HttpServletRequest req) {
		return (List) req.getAttribute("list");
	}

	public static void setPageNo(int pageNo, HttpServletRequest req) {

		req.setAttribute("pageNo", pageNo);
	}

	public static int getPageNo(HttpServletRequest req) {
		return (Integer) req.getAttribute("pageNo");
	}

	public static void setPageSize(int pageSize, HttpServletRequest req) {
		req.setAttribute("pageSize", pageSize);
	}

	public static int getPageSize(HttpServletRequest req) {
		return (Integer) req.getAttribute("pageSize");
	}
}

package in.co.sunrays.proj4.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.UserBean;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.DataValidator;
import in.co.sunrays.proj4.util.ServletUtility;
/**
 * Base controller class of project. It contain (1) Generic operations (2)
 * Generic constants (3) Generic work flow
 *
 * @author RaviRathore
 * @version 1.0
 * 
 */

public abstract class BaseCtl extends HttpServlet{

	public static final String OP_SAVE="Save";
	public static final String OP_UPDATE="Update";
	public static final String OP_CANCEL="Cancel";
	public static final String OP_RESET="Reset";
	public static final String OP_DELETE="Delete";
	public static final String OP_LIST="List";
	public static final String OP_SEARCH="Search";
	public static final String OP_VIEW="View";
	public static final String OP_NEXT="Next";
	public static final String OP_PREVIOUS="Previous";
	public static final String OP_NEW = "New";
	public static final String OP_GO="Go";
	public static final String OP_BACK ="BACK";
	public static final String OP_LOG_OUT="Logout";
	 /**
     * Success message key constant
     */
	public static final String MSG_SUCCESS="success";
	/**
     * Error message key constant
     */
	public static final String MSG_ERROR="error";
	 /**
     * Validates input data entered by User
     *
     * @param object of HttpRequest
     * @return
     */
    protected boolean validate(HttpServletRequest request) {
        return true;
    }
    /**
     * Loads list and other data required to display at HTML form
     *
     * @param request
     */
    protected void preload(HttpServletRequest request){
    	
        }
    /**
     * Populates bean object from request parameters
     *
     * @param request
     * @return
     */
    protected BaseBean populateBean(HttpServletRequest request){
		return null;
    	
    } 
    /**
     * Populates Generic attributes in DTO
     *
     * @param dto
     * @param request
     * @return
     */
    protected BaseBean populateDTO(BaseBean dto,HttpServletRequest request){
    	String createdBy=request.getParameter("createdBy");
    	String modifiedBy=null;
    	UserBean userbean=(UserBean)request.getSession().getAttribute("user");
    	if(userbean ==null){
    		createdBy="root";
    		modifiedBy="root";
    	}else{
    		modifiedBy=userbean.getLogin();
    		if("null".equalsIgnoreCase(createdBy)||DataValidator.isNull(createdBy)){
    			createdBy=modifiedBy;
    			
    		}
    	}
    	dto.setCreatedBy(createdBy);
    	dto.setModifiedBy(modifiedBy);
    	long cdt=DataUtility.getLong(request.getParameter("createdDatetime"));
    if(cdt>0){
    	dto.setCreatedDatetime(DataUtility.getTimeStamp(cdt));
    }else{
    	dto.setCreatedDatetime(DataUtility.getCurrentTimeStamp());
    }
    dto.setModifiedDatetime(DataUtility.getCurrentTimeStamp());
    return dto;
    }
    
    @Override
    protected void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
    	preload(request);
    	String op=DataUtility.getString(request.getParameter("operation"));
    	System.out.println("operation is "+ op);
    	
    	if(DataValidator.isNotNull(op)&& !OP_CANCEL.equalsIgnoreCase(op)&&
    			!OP_VIEW.equalsIgnoreCase(op) && 
    			!OP_DELETE.equalsIgnoreCase(op)&&!OP_RESET.equalsIgnoreCase(op))
    	   {
    		
    		if(!validate(request)){
    			BaseBean bean=(BaseBean)populateBean(request);
    			ServletUtility.setBean(bean, request);
    			ServletUtility.forward(getView(), request, response);
    			return;
    		}
    		
    	}
    	super.service(request, response);
    }
    /**
     * Returns the VIEW page of this Controller
     *
     * @return
     */
    protected abstract String getView();

	
	}
    
    


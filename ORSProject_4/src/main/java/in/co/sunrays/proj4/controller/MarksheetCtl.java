package in.co.sunrays.proj4.controller;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.MarksheetBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.model.MarksheetModel;
import in.co.sunrays.proj4.model.StudentModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.DataValidator;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * Marksheet functionality Controller. Performs operation for add, update,
 * delete and get Marksheet
 *
 * @author Ravi Rathore
 * @version 1.0
 * @Copyright (c) RaviOS
 */
@ WebServlet(name="MarksheetCtl",urlPatterns={"/ctl/MarksheetCtl"})
public class MarksheetCtl extends BaseCtl {

    private static Logger log = Logger.getLogger(MarksheetCtl.class);

    
    protected void preload(HttpServletRequest request) {
    	System.out.println("Student List ");
        StudentModel model = new StudentModel();
        try {
            List l = model.list();
            
            request.setAttribute("studentList", l);
        } catch (ApplicationException e) {
            log.error(e);
        }

    }

    @Override
    protected boolean validate(HttpServletRequest request) {

        log.debug("MarksheetCtl Method validate Started");

        boolean pass = true;

        if (DataValidator.isNull(request.getParameter("rollNo"))) {
            request.setAttribute("rollNo",
                    PropertyReader.getValue("error.require", "Roll Number"));
            pass = false;
        }

        if (DataValidator.isNull(request.getParameter("physics"))
                ) {
        	System.out.println("yesp");
            request.setAttribute("physics",
                    PropertyReader.getValue("error.require", "Marks"));
            pass = false;
        }
        if (!(DataValidator.isInteger(request.getParameter("physics")))&& request.getParameter("physics")!="") {
            request.setAttribute("physics",
                    PropertyReader.getValue("error.integer", "Marks"));
            pass = false;
        }


        if (DataUtility.getInt(request.getParameter("physics")) > 100) {
            request.setAttribute("physics", "Marks can not be greater than 100");
            pass = false;
        }

        if (DataValidator.isNull(request.getParameter("chemistry"))
                ) {
            request.setAttribute("chemistry",
                    PropertyReader.getValue("error.require", "Marks"));
            pass = false;
        }
        if (!(DataValidator.isInteger(request.getParameter("chemistry")))&& request.getParameter("chemistry")!="") {
            request.setAttribute("chemistry",
                    PropertyReader.getValue("error.integer", "Marks"));
            pass = false;
        }

        if (DataUtility.getInt(request.getParameter("chemistry")) > 100) {
            request.setAttribute("chemistry",
                    "Marks can not be greater than 100");
            pass = false;
        }

        if (DataValidator.isNull(request.getParameter("maths"))
                ) {
            request.setAttribute("maths",
                    PropertyReader.getValue("error.require", "Marks"));
            pass = false;
        }
        if (!(DataValidator.isInteger(request.getParameter("maths")))&& request.getParameter("maths")!="") {
            request.setAttribute("maths",
                    PropertyReader.getValue("error.integer", "Marks"));
            pass = false;
        }
        if (DataUtility.getInt(request.getParameter("maths")) > 100) {
            request.setAttribute("maths", "Marks can not be greater than 100");
            pass = false;
        }

        if (DataUtility.getInt(request.getParameter("studentId"))==0) {
            request.setAttribute("studentId",
                    PropertyReader.getValue("error.require", "Student Name"));
            pass = false;
        }

        log.debug("MarksheetCtl Method validate Ended");

        return pass;
    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {

        log.debug("MarksheetCtl Method populatebean Started");

        MarksheetBean bean = new MarksheetBean();

        bean.setId(DataUtility.getLong(request.getParameter("id")));

        bean.setRollNo(DataUtility.getString(request.getParameter("rollNo")));

       //// bean.setName(DataUtility.getString(request.getParameter("name")));

        bean.setPhysics(DataUtility.getInt(request.getParameter("physics")));

        bean.setChemistry(DataUtility.getInt(request.getParameter("chemistry")));

        bean.setMaths(DataUtility.getInt(request.getParameter("maths")));

        bean.setStudentId(DataUtility.getLong(request.getParameter("studentId")));

        populateDTO(bean, request);

        System.out.println("Population done");

        log.debug("MarksheetCtl Method populatebean Ended");

        return bean;
    }

    /**
     * Contains Display logics
     */
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        log.debug("MarksheetCtl Method doGet Started");
         System.out.println("in do get of MarksheetCtl");
        String op = DataUtility.getString(request.getParameter("operation"));
        MarksheetModel model = new MarksheetModel();
        long id = DataUtility.getLong(request.getParameter("id"));
        if (id > 0) {
            MarksheetBean bean;
            try {
                bean = model.findByPK(id);
                ServletUtility.setBean(bean, request);
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            }
        }
        ServletUtility.forward(getView(), request, response);
        log.debug("MarksheetCtl Method doGet Ended");
    }

    /**
     * Contains Submit logics
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        log.debug("MarksheetCtl Method doPost Started");

        String op = DataUtility.getString(request.getParameter("operation"));
        // get model
        MarksheetModel model = new MarksheetModel();

        long id = DataUtility.getLong(request.getParameter("id"));

        if (OP_SAVE.equalsIgnoreCase(op)) {

            MarksheetBean bean = (MarksheetBean) populateBean(request);
            try {
                if (id > 0) {
                    model.update(bean);
                    ServletUtility.setBean(bean, request);
                    ServletUtility.setBean(bean, request);
                    ServletUtility.setSuccessMessage("Data is successfully updated",
                            request);
                } else {
                    long pk = model.add(bean);
                    ServletUtility.setBean(bean, request);
                    ServletUtility.setSuccessMessage("Data is successfully saved",
                            request);
                    //bean.setId(pk);
                }
               

            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            } catch (DuplicateRecordException e) {
                ServletUtility.setBean(bean, request);
                ServletUtility.setErrorMessage("Roll no already exists",
                        request);
            }

        } else if (OP_DELETE.equalsIgnoreCase(op)) {

            MarksheetBean bean = (MarksheetBean) populateBean(request);
            System.out.println("in try");
            try {
                model.delete(bean);
                ServletUtility.redirect(ORSView.MARKSHEET_LIST_CTL, request,
                        response);
                System.out.println("in try");
                return;
            } catch (ApplicationException e) {
                System.out.println("in catch");
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            }

        } else if (OP_CANCEL.equalsIgnoreCase(op)) {

            ServletUtility.redirect(ORSView.MARKSHEET_LIST_CTL, request,
                    response);
            return;

        }
        else if(OP_RESET.equalsIgnoreCase(op))
        {
        	ServletUtility.redirect(ORSView.MARKSHEET_CTL, request, response);
        	return;
        }
        ServletUtility.forward(getView(), request, response);

        log.debug("MarksheetCtl Method doPost Ended");
    }

    @Override
    protected String getView() {
        return ORSView.MARKSHEET_VIEW;
    }

}


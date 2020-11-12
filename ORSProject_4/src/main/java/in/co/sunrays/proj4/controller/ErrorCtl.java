package in.co.sunrays.proj4.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.sunrays.proj4.util.ServletUtility;
@WebServlet(name="ErrorCtl",urlPatterns="/ErrorCtl")
public class ErrorCtl extends HttpServlet{
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ServletUtility.forward("jsp/ErrorView.jsp", req, resp);
		return;
		
	}
   
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	ServletUtility.forward("jsp/ErrorView.jsp", req, resp);
	return;
}
}

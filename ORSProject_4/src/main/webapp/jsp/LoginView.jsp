
<%@page import="in.co.sunrays.proj4.controller.ORSView"%>
<%@page import="in.co.sunrays.proj4.controller.LoginCtl"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@ page errorPage="ErrorView.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="<%=ORSView.LOGIN_CTL%>" method="post">
<%@ include file="Header.jsp"%>

<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean" scope="request"></jsp:useBean>
<center>
<%System.out.println(request.getParameter("uri")); %>
<h1>Login</h1>
<%if(ServletUtility.getSuccessMessage(request)!=null){ %>
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
<%} %>
<H3>
<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
<font color="red"><%=DataUtility.getStringData(request.getAttribute("message"))%></font>
</H3>
<input type="hidden" name="id" value="<%=bean.getId()%>">
<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy() %>">
<input type="hidden" name="createdDateTime" value="<%=bean.getCreatedDatetime() %>">
<input type="hidden" name="modifiedDateTime" value="<%=bean.getModifiedDatetime() %>">
<input type="hidden" name="uri" value="<%=DataUtility.getStringData(request.getAttribute("uri"))%>">
<table align="center" style="margin-left: 37%">
<tr>
<th>UserId<font color="red">*</font></th>
<td><input type="text" name="login" size=30 placeholder="Enter Your Login ID" value="<%=DataUtility.getStringData(bean.getLogin())%>">
</td><td><font color="red"><%=ServletUtility.getErrorMessage("login", request) %></font>
</td>
</tr>
<tr>
<th>Password<font color="red">*</font></th>
<td><input type="password" name="password" size=30 placeholder="Enter Password" value="<%=DataUtility.getStringData(bean.getPassword())%>">
</td><td><font color="red"><%=ServletUtility.getErrorMessage("password", request) %></font>
</td>
</tr>
<tr>
<th></th>
<td colspan="2"><input type="submit" name="operation"
                          value="<%=LoginCtl.OP_SIGN_IN%>"> &nbsp;<input type="submit"
                        name="operation" value="<%=LoginCtl.OP_SIGN_UP %>" >&nbsp;</td>
</tr>
<tr><th></th>
                <td><a href="<%=ORSView.FORGET_PASSWORD_CTL%>"><b>Forget my password</b></a>&nbsp;</td>
            </tr>
</table>
</center>
</form>
<%@ include file="Footer.jsp"%>
</body>
</html>
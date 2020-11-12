<%@page import="in.co.sunrays.proj4.controller.ForgetPasswordCtl"%>
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
<form  action="<%=ORSView.FORGET_PASSWORD_CTL%>" method="post">
<%@include file="Header.jsp" %>
<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
            scope="request"></jsp:useBean>
<center>
<h1>Forgot Your Password</h1>
<input type="hidden" name="id" value="<%=bean.getId()%>">

<table align="center" style="margin-left: 37%">
<label>Submit your email address and We'll send you password</label><br><br>
<H3>
                <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font>
            </H3>
            <H3>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
            </H3>
<label>Email Id<font color="red">*</font></label>&nbsp;
<input type="text" name="login" placeholder="Enter EmailId here" value="<%=ServletUtility.getParameter(request, "login")%>">&nbsp;
<input type="submit" name="operation" value="<%=ForgetPasswordCtl.OP_GO%>">
<font color="red"><%=ServletUtility.getErrorMessage("login", request) %></font>
</table>

</center>
</form>
<%@include file="Footer.jsp" %>
</body>
</html>
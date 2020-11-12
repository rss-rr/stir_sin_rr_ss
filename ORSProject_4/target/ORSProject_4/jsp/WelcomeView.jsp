<%@page import="in.co.sunrays.proj4.controller.ORSView"%>
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
<from action="<%= ORSView.WELCOME_CTL%>">
<%@include file="Header.jsp" %>
<h1 align="center"><font size="10px" color="red">Welcome To ORS</font></h1>
<% UserBean userBean=(UserBean)session.getAttribute("user");
if(userBean!=null)
{
	if(userBean.getRollId()==RoleBean.STUDENT)
	{
	%>	
	<h2 align="center"><a href="<%=ORSView.GET_MARKSHEET_CTL%>">Click here to see your Marksheet</a></h2>
	<% }
}%>
</from>
<%@include file="Footer.jsp" %>
</body>
</html>
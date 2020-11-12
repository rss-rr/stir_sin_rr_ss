<%@page import="in.co.sunrays.proj4.controller.ORSView"%>

<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="<%=ORSView.WELCOME_CTL%>">
	<%if(exception!=null) 
	{%>
		<h3><font color="red"><%= exception%></font></h3>
    <%}else
	{%>
	      <%if(request.getAttribute("msg")!=null) {%>
		<h4>
			<font color="red"><%=request.getAttribute("msg")%>"Your
			Application is down.please contact rathoreravi2623@gmail.com"</font>
		</h4>
		<input type="submit" name="operation" value="Back">
		<%} %>
		<%if(request.getAttribute("ex")!=null) {%>
		<h4>
			<font color="red"><%=request.getAttribute("ex")%>"Your
			Application is down.please contact rathoreravi2623@gmail.com"</font>
		</h4>
		<input type="submit" name="operation" value="Back">
		<%} %>
		<div>
<h4><font color="red">Oops Something went wrong.......</font></h4>
		</div>
		<%} %>
	</form>

</body>
</html>
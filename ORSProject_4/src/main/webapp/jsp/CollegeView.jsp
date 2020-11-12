<%@page import="in.co.sunrays.proj4.controller.CollegeCtl"%>
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
<form action="<%=ORSView.COLLEGE_CTL%>" method="post">
<%@include file="Header.jsp" %>
<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.CollegeBean"
            scope="request"></jsp:useBean>
<center>
<%if(bean.getId()>0){ %>
<h1>Update College</h1>
<%}else{ %>
<h1>Add College</h1>
<%} %>
<H3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></H3>
<H3><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></H3>
<input type="hidden" name="id" value="<%=bean.getId()%>">
<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimeStamp((bean.getCreatedDatetime()))%>">
<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimeStamp((bean.getModifiedDatetime()))%>">
<table align="center" style="margin-left: 37%">
<tr>
<th>College Name<font color="red">*</font></th>
<td><input type="text" name="cName" placeholder="Enter Name" value="<%=DataUtility.getString(bean.getName())%>">
<font color="red"><%=ServletUtility.getErrorMessage("cName", request)%></font></td>
</tr>
<tr>
<th>Address<font color="red">*</font></th>
<td><input type="text" name="address" placeholder="Enter Address" value="<%=DataUtility.getString(bean.getAddress())%>">
<font color="red"><%=ServletUtility.getErrorMessage("address", request)%></font></td>
</tr>
<tr>
<th>State<font color="red">*</font></th>
<td><input type="text" name="state" placeholder="Enter State" value="<%=DataUtility.getString(bean.getState())%>">
<font color="red"><%=ServletUtility.getErrorMessage("state", request)%></font></td>
</tr>
<tr>
<th>City<font color="red">*</font></th>
<td><input type="text" name="city" placeholder="Enter city" value="<%=DataUtility.getString(bean.getCity())%>">
<font color="red"><%=ServletUtility.getErrorMessage("city", request) %></font></td>
</tr>
<tr>
<th>Phone No<font color="red">*</font></th>
<td><input type="text" name="phoneNo" placeholder="Enter PhoneNo" value="<%=(DataUtility.getStringData(bean.getPhoneNo()).equals("0"))?"":DataUtility.getStringData(bean.getPhoneNo())%>">
<font color="red"><%=ServletUtility.getErrorMessage("phoneNo", request) %></font></td>
</tr>
<tr>
<th></th>
<%if(bean.getId()==0){ %>
<td colspan="2"><input type="submit" name="operation" value="<%=CollegeCtl.OP_SAVE%>">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="operation" value="<%=CollegeCtl.OP_RESET%>"></td>
<%} %>
<%if(bean.getId()>0)
	{%>
	<td colspan="2"><input type="submit" name="operation" value="<%=CollegeCtl.OP_SAVE%>">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" name="operation" value="<%=CollegeCtl.OP_CANCEL%>"></td>
	<%} %>
	</tr>
</table>
</center>
<%@ include file="Footer.jsp" %>
</form>
</body>
</html>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.controller.StudentCtl"%>
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
<%@include file="Header.jsp" %>
<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.StudentBean" scope="request"></jsp:useBean>
<center>
<%if(bean.getId()>0) {%>
<h1>Update Student</h1>
<%}else{ %>
<h1>Add Student</h1>
<%} %>
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
<form action="<%=ORSView.STUDENT_CTL%>" method="post">
<%List list=(List)request.getAttribute("collegeList");
  List list1=(List)request.getAttribute("courseList");
%>
<input type="hidden" name="id" value="<%=bean.getId()%>">
<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
<input type="hidden" name=createdDatetime value="<%=DataUtility.getTimeStamp(bean.getCreatedDatetime())%>">
<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimeStamp(bean.getModifiedDatetime())%>">
<table align="center" style="margin-left: 37%">
<tr>
<td><label>First Name<font color="red">*</font></label></td><td><input type="text" name="firstName" value="<%=DataUtility.getString(bean.getFirstName()) %>" placeholder="Enter First Name">
<font color="red"><%=ServletUtility.getErrorMessage("firstName", request) %></font></td>
</tr>
<tr>
<td><label>Last Name<font color="red">*</font></label></td><td><input type="text" name="lastName" value="<%=DataUtility.getString(bean.getLastName()) %>" placeholder="Enter Last Name">
<font color="red"><%=ServletUtility.getErrorMessage("lastName", request) %></font></td>
</tr>
<tr>
<td><label>Date Of Birth<font color="red">*</font></label></td><td><input type="text" name="dob" readonly="readonly" id="datepicker" value="<%=DataUtility.getDateString(bean.getDob()) %>" placeholder="Enter Date Of Birth">
<font color="red"><%=ServletUtility.getErrorMessage("dob", request) %></font></td>
</tr>
<tr>
<td><label>Mobile No<font color="red">*</font></label></td><td><input type="text" name="mobileNo" value="<%=((bean.getId()>0)?DataUtility.getStringData(bean.getMobileNo()):"") %>" placeholder="Enter Mobile No">
<font color="red"><%=ServletUtility.getErrorMessage("mobileNo", request) %></font></td>
</tr>
<tr>
<td><label>Email ID<font color="red">*</font></label></td><td><input type="text" name="email" value="<%=DataUtility.getString(bean.getEmail()) %>" placeholder="Must be EmailId" <%=(bean.getId()>0)?"readonly":""%>>
<font color="red"><%=ServletUtility.getErrorMessage("email", request) %></font></td>
</tr>
<tr>
<% System.out.println(list+""); %>
<td><label>College Name<font color="red">*</font></label></td><td><%=HTMLUtility.getList("collegeName",
                    String.valueOf(bean.getCollegeId()), list)%>
                    <font color="red"><%=ServletUtility.getErrorMessage("collegeName", request) %></font></td></tr><tr>
                    <td><label>Course Name<font color="red">*</font></label></td><td><%=HTMLUtility.getList("courseName",
                    String.valueOf(bean.getCourseId()), list1)%>
                    <font color="red"><%=ServletUtility.getErrorMessage("courseName", request) %></font></td>
</tr>
<tr>
<th></th>
<%if(bean.getId()==0){ %>
<td><input type="submit" name="operation" value="<%=StudentCtl.OP_SAVE%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="operation" value="<%=StudentCtl.OP_RESET%>"></td>
<%}else { %>

<td><input type="submit" name="operation" value="<%=StudentCtl.OP_SAVE%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="operation" value="<%=StudentCtl.OP_CANCEL%>"></td>
<%} %>
</tr>
</table>
</form>
<%@include file="Footer.jsp" %>
</center>
</body>
</html>
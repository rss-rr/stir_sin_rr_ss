<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.controller.SubjectCtl"%>
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
 <%
            List list = (List) request.getAttribute("courseList");
        	System.out.println(list.get(1)+"   one");
        %>
<form action="<%=ORSView.SUBJECT_CTL%>" method="post">

<%@ include file="Header.jsp" %>
<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.SubjectBean" scope="request"></jsp:useBean>
<center>
<%if(bean.getId()>0){
%>
<h1>Update Subject</h1>
<%}else{ %>
<h1>Add Subject</h1>
<%} %>
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
<input type="hidden" name="id" value="<%=bean.getId()%>">
<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
<input type="hidden" name=createdDatetime value="<%=DataUtility.getTimeStamp(bean.getCreatedDatetime())%>">
<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimeStamp(bean.getModifiedDatetime())%>">
<table align="center" style="margin-left: 37%">
<tr>
<th>Subject Name<font color="red">*</font></th>
<td>
<input type="text" name="subName" value="<%=DataUtility.getString(bean.getSubjectName()) %>" placeholder="Enter Subject Name">
<font color="red"><%=ServletUtility.getErrorMessage("subName", request) %></font></td>

</tr>
<tr>
<th>Course Name<font color="red">*</font></th>
<td>
<%=HTMLUtility.getList("cName",
                    String.valueOf(bean.getCourseId()), list)%>
<font color="red"><%=ServletUtility.getErrorMessage("cName", request) %></font>
</td>
</tr>
<tr>
<th>Description<font color="red">*</font></th>
<td>
<input type="text" name="description" value="<%=DataUtility.getString(bean.getDescription()) %>" placeholder="Enter Description">
<font color="red"><%=ServletUtility.getErrorMessage("description", request) %></font>
</td>
</tr>
<tr>
<th></th>
<%if(bean.getId()==0) {%>
<td><input type="submit" name="operation" value="<%=SubjectCtl.OP_SAVE%>">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="operation" value="<%=SubjectCtl.OP_RESET%>"></td>

<%}else{ %>

<td><input type="submit" name="operation" value="<%=SubjectCtl.OP_SAVE%>">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
<input type="submit" name="operation" value="<%=SubjectCtl.OP_CANCEL%>"></td>
</tr>
<%} %>
</table>
</center>
</form>
<%@ include file="Footer.jsp" %>
</body>
</html>
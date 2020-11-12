<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.controller.CourseCtl"%>
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
<%@ include file="Header.jsp" %>
<form action="<%=ORSView.COURSE_CTL %>" method="post">
<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.CourseBean"
            scope="request"></jsp:useBean>
<center>
<%if(bean.getId()==0) {%>
<h1>Add Course</h1>
<%}else{
	%>
	<h1>Update Course</h1>
<%} %>
<table align="center" style="margin-left: 37%">
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
<input type="hidden" name="id" value="<%=bean.getId()%>">
<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
<input type="hidden" name=createdDatetime value="<%=DataUtility.getTimeStamp(bean.getCreatedDatetime())%>">
<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimeStamp(bean.getModifiedDatetime())%>">
<tr>
<th>Course Name<font color="red">*</font></th>
<td><input type="text" name="cName" value="<%=DataUtility.getString(bean.getCourseName()) %>" placeholder="Enter Course Name">
<font color="red"><%=ServletUtility.getErrorMessage("cName",request) %></font></td>
</tr>
<tr>
<th>Description<font color="red">*</font></th>
<td><input type="text" name="description" value="<%=DataUtility.getString(bean.getDescription()) %>" placeholder="Enter Description">
<font color="red"><%=ServletUtility.getErrorMessage("description",request) %></font></td>
</tr>
<tr>
<th>Duration<font color="red">*</font></th>
<td>
                        <%
                            HashMap map = new HashMap();
                           /// map.put("","-----select-----");
                             map.put("II", "2Year");
                            map.put("III", "3Year");
                            map.put("IV", "4Year");
                            map.put("V", "5Year");
                            map.put("VI", "6Year");
                            String htmlList = HTMLUtility.getList("duration", bean.getDuration(),
                                    map);
                        %> <%=htmlList%>
                    
                    
<font color="red"><%=ServletUtility.getErrorMessage("duration",request) %></font></td>
</tr>
<tr>
<%if(bean.getId()==0){ %>
<th></th>
<td><input type="submit" name="operation" value="<%=CourseCtl.OP_SAVE%>">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="operation" value="<%=CourseCtl.OP_RESET%>"></td>

<%}else{ %>
<th></th>
<td><input type="submit" name="operation" value="<%=CourseCtl.OP_SAVE%>">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;
<input type="submit" name="operation" value="<%=CourseCtl.OP_CANCEL%>"></td>
</tr>
<%} %>
</table>
</center>
</form>
<%@ include file="Footer.jsp" %>
</body>

</html>
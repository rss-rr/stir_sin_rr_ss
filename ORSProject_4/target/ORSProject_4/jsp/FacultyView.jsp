<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.controller.FacultyCtl"%>
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
<form action="<%=ORSView.FACULTY_CTL%>" method="post">
<%@ include file="Header.jsp" %>
<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.FacultyBean"
            scope="request"></jsp:useBean>
<%List cList=(List)request.getAttribute("collegeList");
List crList=(List)request.getAttribute("courseList");
List sList=(List)request.getAttribute("subjectList");
System.out.println(cList+"  "+crList+"  "+sList);%>
<center>
<%if(bean.getId()>0){ %>
<h1>Update Faculty</h1>
<%}else{ %>
<h1>Add Faculty</h1>
<%} %>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
<table align="center" style="margin-left: 37%">
<tr>
<input type="hidden" name="id" value="<%=bean.getId()%>">
<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
<input type="hidden" name=createdDatetime value="<%=DataUtility.getTimeStamp(bean.getCreatedDatetime())%>">
<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimeStamp(bean.getModifiedDatetime())%>">
<th>First Name<font color="red">*</font></th>
<td><input type="text" name="firstName" value="<%=DataUtility.getString(bean.getFirstName()) %>" placeholder="Enter First Name">
<font color="red"><%=ServletUtility.getErrorMessage("firstName",request) %></font></td>
</tr>
<tr>
<th>Last Name<font color="red">*</font></th>
<td><input type="text" name="lastName" value="<%=DataUtility.getString(bean.getLastName()) %>" placeholder="Enter Last Name">
<font color="red"><%=ServletUtility.getErrorMessage("lastName",request)%></font></td>
</tr>
<tr>
<th>Gender<font color="red">*</font></th>
<td><%
                            HashMap map = new HashMap();
                            map.put("M", "Male");
                            map.put("F", "Female");

                            String htmlList = HTMLUtility.getList("Gender", bean.getGender(),
                                    map);
                        %> <%=htmlList%>
                        <font color="red"><%=ServletUtility.getErrorMessage("Gender",request) %></font></td>
</tr>
<tr>
<th>Joining Date<font color="red">*</font></th>
<td><input type="text" name="jod" value="<%=DataUtility.getDateString(bean.getJoiningDate()) %>" placeholder="Enter Joining Date" readonly="readonly" id="datepicker">
<font color="red"><%=ServletUtility.getErrorMessage("jod",request) %></font></td>
</tr>
<tr>
<th>Qualification<font color="red">*</font></th>
<td><input type="text" name="qualification" value="<%=DataUtility.getString(bean.getQualification()) %>" placeholder="Enter Qualification" >
<font color="red"><%=ServletUtility.getErrorMessage("qualification",request) %></font></td>
</tr>
<tr>
<th>EmailId<font color="red">*</font></th>
<td><input type="text" name="email" value="<%=DataUtility.getString(bean.getEmailId()) %>" placeholder="Must be Email Id" <%=(bean.getId()>0)?"readonly":""%>">
<font color="red"><%=ServletUtility.getErrorMessage("email",request) %></font></td>
</tr>
<tr>
<th>Mobile No<font color="red">*</font></th>
<td><input type="text" name="mob" value="<%=((bean.getId()>0)?DataUtility.getStringData(bean.getMobileNo()):"") %>" placeholder="Enter Mobile No">
<font color="red"><%=ServletUtility.getErrorMessage("mob",request) %></font></td>
</tr>

<tr>
<th>College Name<font color="red">*</font></th>
<td><%=HTMLUtility.getList("collegeName",
                    String.valueOf(bean.getCollegeId()), cList)%>
                    <font color="red"><%=ServletUtility.getErrorMessage("collegeName",request) %></font></td>
</tr>
<tr>
<th>Course Name<font color="red">*</font></th>
<td><%=HTMLUtility.getList("courseName",
                    String.valueOf(bean.getCourseId()), crList)%>
                    <font color="red"><%=ServletUtility.getErrorMessage("courseName",request) %></font></td>
</tr><tr>
<th>Subject Name<font color="red">*</font></th>
<td><%=HTMLUtility.getList("subjectName",
                    String.valueOf(bean.getSubjectId()), sList)%>
                    <font color="red"><%=ServletUtility.getErrorMessage("subjectName",request) %></font></td>
</tr>
<tr>
<th></th>
<%if(bean.getId()==0){ %>
<td><input type="submit" name="operation" value="<%=FacultyCtl.OP_SAVE%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="operation" value="<%=FacultyCtl.OP_RESET%>"></td>

<%}else{ %>

<td><input type="submit" name="operation" value="<%=FacultyCtl.OP_SAVE%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="operation" value="<%=FacultyCtl.OP_CANCEL%>"></td></tr>
<%} %>
</tr>
</table>
</center>
</form>
<%@ include file="Footer.jsp" %>
</body>
</html>
<%@page import="in.co.sunrays.proj4.controller.UserRegistraitionCtl"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
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
<form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="post">
<%@ include file="Header.jsp" %>
 <script type="text/javascript" src="./js/calendar.js"></script>
<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean" scope="request"></jsp:useBean>
<center>
<h1>User Registration</h1>
<H3><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></H3>
<H3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></H3>
<input type="hidden" name="id" value="<%=bean.getId()%>">
<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimeStamp(bean.getCreatedDatetime())%>">
<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimeStamp(bean.getModifiedDatetime())%>">
<table align="center" style="margin-left: 37%">
<tr>
<th>First Name<font color="red">*</font></th>
<td><input type="text" name="firstName" placeholder="Enter First Name" value="<%=DataUtility.getStringData(bean.getFirstName())%>">
<font color="red"><%=ServletUtility.getErrorMessage("firstName",request) %></font></td>
</tr>
<tr>
<th>Last Name<font color="red">*</font></th>
<td><input type="text" name="lastName" placeholder="Enter Last Name" value="<%=DataUtility.getStringData(bean.getLastName())%>">
<font color="red"><%=ServletUtility.getErrorMessage("lastName",request) %></font></td>
</tr>
<tr>
<th>LoginId<font color="red">*</font></th>
<td><input type="text" name="login" placeholder="Must be Email ID" value="<%= DataUtility.getStringData(bean.getLogin())%>">
<font color="red"><%=ServletUtility.getErrorMessage("login", request) %></font></td>
</tr>
<tr>
<th>Password<font color="red">*</font></th>
<td><input type="password" name="password" placeholder="Enter Password" value="<%= DataUtility.getStringData(bean.getPassword())%>">
<font color="red"><%=ServletUtility.getErrorMessage("password", request) %></font>
<%-- <font color="red"><%=ServletUtility.getErrorMessage("pass", request) %></font></td> --%>
</tr>
<tr>
                    <th>Confirm Password<font color="red">*</font></th>
                    <td><input type="password" name="confirmPassword" placeholder="Enter Confirm Password"
                        value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>"><font
                        color="red"> <%=ServletUtility
                    .getErrorMessage("confirmPassword", request)%></font>
                    <font color="red"><%=ServletUtility.getErrorMessage("pass", request) %></font></td></td>
                </tr>
 <tr>
 <th>Gender<font color="red">*</font></th>
 <td>
                        <%
                            HashMap map = new HashMap();
                            map.put("M", "Male");
                            map.put("F", "Female");

                            String htmlList = HTMLUtility.getList("gender", bean.getGender(),
                                    map);
                        %> <%=htmlList%>

                <font
                        color="red"> <%=ServletUtility
                    .getErrorMessage("gender", request)%></font> </td>
 </tr>  
    <tr>
                    <th>Date Of Birth (mm/dd/yyyy)<font color="red">*</font></th>
                    <td><input type="text" name="dob" id="datepicker" readonly="readonly" placeholder="Enter Date Of Birth"
                        value="<%=DataUtility.getDateString(bean.getDob())%>"><font color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
                </tr>
                <tr>
                    <th></th>
                    <td colspan="2"> <input type="submit" name="operation" value="<%=UserRegistraitionCtl.OP_SIGN_UP%>">&nbsp;
                      &nbsp; &nbsp;
                        &nbsp;  &nbsp; &nbsp;
                        &nbsp;&nbsp; &nbsp;
                        &nbsp;<input type="submit" name="operation" value="<%=UserRegistraitionCtl.OP_RESET%>">
                    </td>
                </tr>       
                      
</table>
</center>
</form>
<%@ include file="Footer.jsp"%>
</body>
</html>
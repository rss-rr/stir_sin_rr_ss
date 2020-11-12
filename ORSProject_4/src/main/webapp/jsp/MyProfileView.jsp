<%@page import="in.co.sunrays.proj4.controller.MyProfileCtl"%>
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
<form action="<%=ORSView.MY_PROFILE_CTL%>" method="post">
<%@ include file="Header.jsp" %>
<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
            scope="request"></jsp:useBean>
<center>
<h1>My Profile</h1>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
<input type="hidden" name="id" value="<%=bean.getId()%>">
<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimeStamp(bean.getCreatedDatetime())%>"> 
<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimeStamp(bean.getModifiedDatetime())%>"> 
<table align="center" style="margin-left: 37%">
<tr>
<th>LoginId<font color="red">*</font></th>
<td><input type="text" name="login" value="<%=DataUtility.getStringData(bean.getLogin())%>" readonly="readonly">
<font color="red"><%=ServletUtility.getErrorMessage("login", request) %></font></td>
</tr>
 <tr>
                    <th>First Name<font color="red">*</font></th>
                    <td><input type="text" name="firstName"
                        value="<%=DataUtility.getStringData(bean.getFirstName())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
                </tr>
                 <tr>
                    <th>Last Name<font color="red">*</font></th>
                    <td><input type="text" name="lastName"
                        value="<%=DataUtility.getStringData(bean.getLastName())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
                </tr>
                <tr>
                    <th>Mobile No<font color="red">*</font></th>
                    <td><input type="text" name="mob"
                        value="<%=DataUtility.getString(bean.getMobileNo())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("mobileNo", request)%></font></td>
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
                        color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font></td>
                </tr>
                <tr>
                    <th>Date Of Birth (mm/dd/yyyy)<font color="red">*</font></th>
                    <td><input type="text" name="dob" readonly="readonly" 
                        value="<%=DataUtility.getDateString(bean.getDob())%>">
                    <!-- <a href="javascript:getCalendar(document.forms[0].dob);">
                            <img src="../img/cal.jpg" width="16" height="15" border="0"
                            alt="Calender"></a> -->
                    <font
                        color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
                </tr>
                <tr>
                <th></th>
                <td><input type="submit" name="operation" value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD%>">
                &nbsp; 
                <input type="submit" name="operation" value="<%=MyProfileCtl.OP_SAVE%>"></td>
                </tr>
</table>
</center>
</form>
<%@ include file="Footer.jsp" %>
</body>
</html>
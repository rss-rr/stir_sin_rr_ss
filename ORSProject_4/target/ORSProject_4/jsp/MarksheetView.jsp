<%@page import="in.co.sunrays.proj4.controller.MarksheetCtl"%>
<%@page import="in.co.sunrays.proj4.controller.MarksheetCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
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
<form action="<%=ORSView.MARKSHEET_CTL%>" method="post">
<%@include file="Header.jsp" %>
<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.MarksheetBean"
            scope="request"></jsp:useBean>
             <%
            List list = (List) request.getAttribute("studentList");
             System.out.println("RAvi"+list);
        %>
<center>
<%if(bean.getId()>0){ %>
<h1>Update Marksheet</h1>
<%}else { %>
<h1>Add Marksheet</h1>
<%} %>
<H3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></H3>
<H3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></H3>
<input type="hidden" name="id" value="<%=bean.getId()%>">
<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimeStamp(bean.getCreatedDatetime())%>">
<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimeStamp(bean.getModifiedDatetime())%>">
<table align="center" style="margin-left: 37%">
<tr>
<th>RollNo<font color="red">*</font></th>
<td><input type="text" name="rollNo" placeholder="Enter Roll No" value="<%=DataUtility.getStringData(bean.getRollNo())%>" <%=(bean.getId() > 0) ? "readonly" : ""%>>
<font color="red"><%=ServletUtility.getErrorMessage("rollNo", request) %></font></td>
</tr>
<tr>
<th>Student Name<font color="red">*</font></th>
<td><%=HTMLUtility.getList("studentId",String.valueOf(bean.getStudentId()), list) %>
<font color="red"><%=ServletUtility.getErrorMessage("studentId", request) %></font></td>
</tr>
<tr>
<th>Physics<font color="red">*</font></th>
<td>
<input type="text" name="physics" placeholder="Enter Marks of Physics" value="<%=(DataUtility.getStringData(bean.getPhysics()).equals("0"))?"":DataUtility.getStringData(bean.getPhysics())%>">
<font color="red"><%=ServletUtility.getErrorMessage("physics", request) %></font>
</td>
</tr>
<tr>
                    <th>Chemistry<font color="red">*</font></th>
                    <td><input type="text" name="chemistry" placeholder="Enter Marks of Chemistry"
                        value="<%=(DataUtility.getStringData(bean.getChemistry()).equals("0"))?"":DataUtility.getStringData(bean.getChemistry())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("chemistry", request)%></font></td>
                </tr>
  <tr>
                    <th>Maths<font color="red">*</font></th>
                    <td><input type="text" name="maths" placeholder="Enter Marks of Maths"
                        value="<%=(DataUtility.getStringData(bean.getMaths()).equals("0"))?"":DataUtility.getStringData(bean.getMaths())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("maths", request)%></font></td>

                </tr>     
 <tr>
 <th></th>
 <%if(bean.getId()==0){ %>
 <td><input type="submit" name="operation" value="<%=MarksheetCtl.OP_SAVE%>"">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="submit" name="operation" value="<%=MarksheetCtl.OP_RESET%>"></td>  
 <%} %>           
   <%if(bean.getId()>0)
	   {%> 
<td><input type="submit" name="operation" value="<%=MarksheetCtl.OP_SAVE%>">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="operation" value="<%=MarksheetCtl.OP_CANCEL%>"></td>
 <%} %> 
 
 </tr>                      
</table>
</center>
 <%@ include file="Footer.jsp"%>
</form>
</body>
</html>
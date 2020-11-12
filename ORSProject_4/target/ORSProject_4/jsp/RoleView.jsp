<%@page import="in.co.sunrays.proj4.controller.RoleCtl"%>
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
<form  action="<%=ORSView.ROLE_CTL%>" method="post">
<%@ include file="Header.jsp" %>
<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.RoleBean"
            scope="request"></jsp:useBean>
<center>
<%-- <% int a= (Integer)request.getAttribute("a"); %> --%>
<%if(bean.getId()==0)
	{%>
<h1>Add Role</h1>
<%}else{ %>
<h1>Update Role</h1>
<%} %>
<font color="green"><H3><%=ServletUtility.getSuccessMessage(request) %></H3></font>
<font color="red"><H3><%=ServletUtility.getErrorMessage(request) %></H3></font>
<input type="hidden" name="id" value="<%=bean.getId()%>">
<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
<input type="hidden" name=createdDatetime value="<%=DataUtility.getTimeStamp(bean.getCreatedDatetime())%>">
<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimeStamp(bean.getModifiedDatetime())%>">
<table align="center" style="margin-left: 37%">
<tr>
<th>Name<font color="red">*</font></th>

<td><input type="text" name="name" value="<%=DataUtility.getStringData(bean.getName())%>" placeholder="Enter Role Name">
<font color="red"><%=ServletUtility.getErrorMessage("name",request) %></font></td>
</tr>
<tr>
<th>Description<font color="red">*</font></th>
<td><input type="text" name="description" value="<%=DataUtility.getStringData(bean.getDescription())%>" placeholder="Enter Description">
<font color="red"><%=ServletUtility.getErrorMessage("description",request) %></font></td>
</tr>
<tr>
                    <th></th>
                    <%if(bean.getId()==0)
                    {%>
                    <td colspan="2"><input type="submit" name="operation"
                        value="<%=RoleCtl.OP_SAVE%>">&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; <input type="submit"
                        name="operation" value="<%=RoleCtl.OP_RESET%>"></td>
                         
                        <%} 
                        else
                     {%>
                     <td colspan="2"><input type="submit" name="operation"
                        value="<%=RoleCtl.OP_SAVE%>">&emsp;&emsp;&emsp;&emsp;&nbsp; <input type="submit"
                        name="operation" value="<%=RoleCtl.OP_CANCEL%>"></td>
                     <%} %>
                </tr>
</table>
</center>            
</form>
<%@ include file="Footer.jsp"%>
</body>
</html>
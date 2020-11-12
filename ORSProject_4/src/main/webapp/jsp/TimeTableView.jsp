<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.controller.TimeTableCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@ page errorPage="ErrorView.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   function noSunday(date)
   {
	   return[date.getDay()!=0,false]
	   }


	$(function() {
		$("#datepicker1").datepicker(
				{
					changeMonth:true,
					changeYear:true,
					minDate:+1,
				    beforeShowDay:noSunday,
				    yearRange:"1970:new Date()"
					
				});
		$("#date").datepicker("setDate", new Date());
	});
	</script>

</head>
<body>
<form action="<%=ORSView.TIME_TABLE_CTL %>" method="post">
<%@ include file="Header.jsp" %>
<jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.TimeTableBean"
            scope="request"></jsp:useBean>
<center>
<% List l=(List)request.getAttribute("cLIst");
 List l1=(List)request.getAttribute("sLIst");%>
<%if(bean.getId()==0) {%>
<h1>Add Time Table</h1>
<%}else { %>
<h1>Update Time Table</h1>
<%} %>
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
 <input type="hidden" name="id" value="<%=bean.getId()%>">
            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimeStamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimeStamp(bean.getModifiedDatetime())%>">
<table align="center" style="margin-left: 37%">
<tr>
<th>Course Name<font color="red">*</font></th>
<td><%=HTMLUtility.getList("couName",
                    String.valueOf(bean.getCourseId()), l)%>
<font color="red"><%=ServletUtility.getErrorMessage("couName", request) %></font></td>
</tr>
<tr>
<th>Subject Name<font color="red">*</font></th>
<td><%=HTMLUtility.getList("subName",
                    String.valueOf(bean.getSubId()), l1)%>
<font color="red"><%=ServletUtility.getErrorMessage("subName", request) %></font></td>
</tr>
<tr>
<th>Semester<font color="red">*</font></th>
<td>
                        <%
                            HashMap map = new HashMap();
                           /// map.put("","-----select-----");
                            map.put("1", "I");
                            map.put("2", "II");
                            map.put("3", "III");
                            map.put("4", "IV");
                            map.put("5", "V");
                            map.put("6", "VI");
                            map.put("7", "VII");
                            map.put("8", "VIII");
                            String htmlList = HTMLUtility.getList("semester", bean.getSemester(),
                                    map);
                        %> <%=htmlList%>
<font color="red"><%=ServletUtility.getErrorMessage("semester", request) %></font></td>
</tr>
<tr>
<th>Exam Date<font color="red">*</font></th>
<td><input type="text" name="examDate" id="datepicker1" readonly="readonly" value="<%=DataUtility.getDateString(bean.getExamDate())%>" placeholder="Enter Exam Date">
<font color="red"><%=ServletUtility.getErrorMessage("examDate", request) %></font></td>
</tr>
<tr>
<th>Exam Time<font color="red">*</font></th>
<% System.out.println(bean.getExamTime()); %>
<td>
                        <%
                            HashMap map1 = new HashMap();
                            map1.put("8:00AM To 11:00AM", "8:00AM To 11:00AM");
                            map1.put("12:00PM To 3:00PM", "12:00PM To 3:00PM");
                            map1.put("4:00PM To 7:00PM", "4:00PM To 7:00PM");
                            String htmlList1 = HTMLUtility.getList("examTime", bean.getExamTime(),
                                    map1);
                        %> <%=htmlList1%>
                    
              <font color="red"><%=ServletUtility.getErrorMessage("examTime", request) %></font></td>
</tr>
<tr>
<th></th>
<%if(bean.getId()==0){ %>
<td><input type="submit" name="operation" value="<%=TimeTableCtl.OP_SAVE%>">&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="operation" value="<%=TimeTableCtl.OP_RESET%>"></td>

<%}else { %>

<td><input type="submit" name="operation" value="<%=TimeTableCtl.OP_SAVE%>">&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="operation" value="<%=TimeTableCtl.OP_CANCEL%>"></td>
</tr>
<%} %>
</table>
</center>
</form>
<%@ include file="Footer.jsp" %>
</body>
</html>
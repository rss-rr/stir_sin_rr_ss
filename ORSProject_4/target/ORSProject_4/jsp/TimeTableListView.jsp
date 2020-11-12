<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.model.TimeTableModel"%>
<%@page import="in.co.sunrays.proj4.bean.TimeTableBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.sunrays.proj4.controller.TimeTableListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@ page errorPage="ErrorView.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <script type="text/javascript">

function checkedAll()
{
	
	var totalElement=document.forms[0].elements.length;
	console.log(totalElement+" .....")
	for(var i=0;i<totalElement;i++){
		var en=document.forms[0].elements[i].name;
		console.log(en+"  its en in check all..."+i)
		if(en!=undefined & en.indexOf("chk_1")!=-1)
		{	console.log("inside if in check all"+en)
			document.forms[0].elements[i].checked=document.frm.chk_all.checked;
		 
		}		
	}
}

 function check(frm){
	var en=document.forms[0].elements[4].name;
	console.log(en+".... en ....")
	if(en!=undefined & en.indexOf("chk_1")!=-1)
	{	
		console.log("inside check fun "+document.forms[0].elements[3].checked)
		document.forms[0].elements[3].checked=document.frm.chk_all.unchecked;
	}	
} 
</script> -->
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
					
				    beforeShowDay:noSunday,
				    yearRange:"1970:new Date()"
					
				});
		$("#date").datepicker("setDate", new Date());
	});
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% List l=(List)request.getAttribute("cLIst");
 List l1=(List)request.getAttribute("sLIst");%>
<%@ include file="Header.jsp" %>
<form action="<%=ORSView.TIME_TABLE_LIST_CTL%>" method="post">
<jsp:useBean id="sbean" class="in.co.sunrays.proj4.bean.TimeTableBean"
            scope="request"></jsp:useBean>
<center>
<h1>Time Table List</h1>
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
<%List list=ServletUtility.getList(request); 
if(list.size()>0)
{%>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
<table width="100%">
<tr>
<label>Subject Name:</label><%=HTMLUtility.getList("roleName",
                    String.valueOf(sbean.getSubId()), l1)%>&nbsp;
<label>Course Name:</label><%=HTMLUtility.getList("roleName1",
                    String.valueOf(sbean.getCourseId()), l)%>&nbsp;
<label>Exam Date:</label><input type="text" name="examDate" id="datepicker1" readonly="readonly" value="<%=DataUtility.getDateString(sbean.getExamDate()) %>" placeholder="Enter the Exam Date">&nbsp;
<input type="submit" name="operation" value="<%=TimeTableListCtl.OP_SEARCH%>">
<input type="submit" name="operation"
						value="<%=TimeTableListCtl.OP_RESET
						%>">
</tr>
</table><br>
<table width="100%" border="1px">
<tr>
<th width="10%"><input type="checkbox" id="select_all"><b>Select</b></th>
<th><b>S.No.</b></th>
<th><b>Subject Name</b></th>
<th><b>Course Name</b></th>
<th><b>Semester</b></th>
<th><b>Exam Date</b></th>
<th><b>Exam Time</b></th>
<th><b>Edit</b></th>
</tr>
<%
int index=0;
int pageNo=ServletUtility.getPageNo(request);
int pageSize=ServletUtility.getPageSize(request);
long a=0,b=0;
TimeTableModel model=new TimeTableModel();
b=model.nextPK();
b--;
index=((pageNo-1)*pageSize)+1;
Iterator<TimeTableBean> it=list.iterator();
while(it.hasNext())
{
 TimeTableBean bean=it.next();
 a=bean.getId();
%>
<tr>
	<td><input type="checkbox" class="checkbox" name="chk_1" value="<%=bean.getId()%>"></td>
<td><%=index++ %></td>
<td><%=bean.getSubName() %></td>
<td><%=bean.getCourseName() %></td>
<td><%=bean.getSemester() %></td>
<td><%=bean.getExamDate() %></td>
<td><%=bean.getExamTime() %></td>
<%if(3==bean1.getRollId() || 1==bean1.getRollId()){ %>
<td><a href="TimeTableCtl?id=<%=bean.getId()%>">Edit</a></td>
<%} %>
</tr>
<%} %>
</table><br>
<table width="100%">
<td><input type="submit" name="operation" value="<%=TimeTableListCtl.OP_PREVIOUS%>" <%=(pageNo==1)?"disabled":""%>></td>
<%if(1==bean1.getRollId()||3==bean1.getRollId()){ %>
<td><input type="submit" name="operation" value="<%=TimeTableListCtl.OP_NEW%>"></td>
<td><input type="submit" name="operation" value="<%=TimeTableListCtl.OP_DELETE%>"></td>
<%} %>
<td align="right"><input type="submit" name="operation" value="<%=TimeTableListCtl.OP_NEXT%>" <%=(b>a)?"":"disabled" %>></td>
</table>
<input type="hidden" name="pageNo" value="<%=pageNo%>">
<input type="hidden" name="pageNo" value="<%=pageSize%>">
<%} 
if(list.size()==0)
{%>
<table>
<input type="hidden" name="pageNo1" value="<%=ServletUtility.getPageNo(request)%>">
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
<tr><td><input type="submit" name="operation" value="<%=TimeTableListCtl.OP_BACK%>"></td></tr>
</table>
<%} %>
</center>
</form>
</body>
<br><br>
<%@ include file="Footer.jsp" %>
</html>
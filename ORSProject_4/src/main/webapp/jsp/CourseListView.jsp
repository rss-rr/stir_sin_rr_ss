<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj4.model.CourseModel"%>
<%@page import="in.co.sunrays.proj4.bean.CourseBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.controller.CourseListCtl"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="<%=ORSView.COURSE_LIST_CTL%>" method="post">
<jsp:useBean id="sbean" class="in.co.sunrays.proj4.bean.CourseBean"
            scope="request"></jsp:useBean>
<%@ include file="Header.jsp" %>
<%List list=ServletUtility.getList(request);%>
<center>
<h1>Course List</h1>
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
<%if(list.size()!=0) 
{%>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
<table>
<tr>
<td>
<label>Course Name:</label><input type="text" name="cName" value="<%=ServletUtility.getParameter(request,"cName")%>" placeholder="Enter Course Name">&nbsp;
<label>Duration:</label> <%
                            HashMap map = new HashMap();
                           /// map.put("","-----select-----");
                             map.put("II", "2Year");
                            map.put("III", "3Year");
                            map.put("IV", "4Year");
                            map.put("V", "5Year");
                            map.put("VI", "6Year");
                            String htmlList = HTMLUtility.getList("duration", sbean.getDuration(),
                                    map);
                        %> <%=htmlList%>&nbsp;
<input type="submit" name="operation" value="<%=CourseListCtl.OP_SEARCH%>">
<input type="submit" name="operation"
						value="<%=CourseListCtl.OP_RESET
						%>">
</td>
</tr>
</table><br>
<table width="100%" border="1px">
<tr>
<th width="10%"><input type="checkbox" id="select_all"><b>Select</b></th>
<th><b>S.No.</b></th>
<th><b>Course Name</b></th>
<th><b>Duration</b></th>
<th><b>Description</b></th>
<th><b>Edit</b></th>
</tr>

<% 
int pageNo=ServletUtility.getPageNo(request);
int pageSize=ServletUtility.getPageSize(request);
int index=(pageNo-1)*pageSize+1;
long a=0;
long b=CourseModel.nextPK();
b--;
Iterator<CourseBean> it=list.iterator();
while(it.hasNext())
{
	CourseBean bean=it.next();
	a=bean.getId();
%>
<tr>
<td><input type="checkbox" class="checkbox" name="chk_1" value="<%=bean.getId()%>"></td>
<td><%=index++ %></td>
<td><%=bean.getCourseName()%></td>
          <td><%=bean.getDuration()%></td>
          <td><%=bean.getDescription()%></td>
          <%if(1==bean1.getRollId()||3==bean1.getRollId()){ %>
          <td><a href="CourseCtl?id=<%=bean.getId()%>">Edit</a></td>
          <%} %>
<%} %>
</tr>
</table><br>
<table width="100%">
<tr>
<td><input type="submit" name="operation" value="<%=CourseListCtl.OP_PREVIOUS%>" <%=(pageNo==1)?"disabled":""%>></td>
<%if(1==bean1.getRollId()||3==bean1.getRollId()){ %>
<td><input type="submit" name="operation" value="<%=CourseListCtl.OP_DELETE%>"></td>
<td><input type="submit" name="operation" value="<%=CourseListCtl.OP_NEW%>"></td>
<%} %>

<td align="right"><input type="submit" name="operation" value="<%=CourseListCtl.OP_NEXT%>" <%=(b>a)?"":"disabled"%>></td>
</tr>
</table>
<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
                <%} %>
   <%if(list.size()==0)
	   {%>  
  <table>
  <tr>
  <td>
  <h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
  <h1 align="center"><input type="submit" name="operation" value="<%=CourseListCtl.OP_BACK%>"></h1>
  <input type="hidden" name="pageNo1" value="<%=ServletUtility.getPageNo(request)%>">
  </td>
  </tr>
  </table> 	     
	   <%} %>   
</center>
</form>
<br><br>
<%@ include file="Footer.jsp" %>
</body>
</html>
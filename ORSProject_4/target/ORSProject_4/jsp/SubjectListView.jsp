<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.model.SubjectModel"%>
<%@page import="in.co.sunrays.proj4.bean.SubjectBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.controller.SubjectListCtl"%>
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
		console.log("i is "+i+"  en is "+en)
		 
		}		
	}
}

 function check(frm){
	var en=document.forms[0].elements[6].name;
	console.log(en+".... en ....")
	if(en!=undefined & en.indexOf("chk_1")!=-1)
	{	
		console.log("inside check fun "+document.forms[0].elements[4].checked)
		document.forms[0].elements[4].checked=document.frm.chk_all.unchecked;
	}	
} 
</script> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="<%=ORSView.SUBJECT_LIST_CTL%>" method="post">
<jsp:useBean id="sbean" class="in.co.sunrays.proj4.bean.SubjectBean"
            scope="request"></jsp:useBean>
<%List list=ServletUtility.getList(request); %>
<%List list1=(List)request.getAttribute("courseList"); %>
<%System.out.println(ServletUtility.getParameter(request, "ravi")); %>
<%@ include file="Header.jsp" %>
<center>
<h1>Subject List</h1>
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
<%if(list.size()!=0){ %>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
<table width="100%">
<tr>
<td align="center">
<label>Subject Name:</label><input type="text" placeholder="Enter Subject Name" name="subName" value="<%=ServletUtility.getParameter(request,"subName")%>">&nbsp;
<label>Course Name:</label><%=HTMLUtility.getList("roleName",
                    String.valueOf(sbean.getCourseId()), list1)%>&nbsp;
<input type="submit" name="operation" value="<%=SubjectListCtl.OP_SEARCH%>">&nbsp;
<input type="submit" name="operation" value="<%=SubjectListCtl.OP_RESET%>">
</td>
</tr>
</table><br>
<table width="100%" border="1px">
<tr>
<th width="10%"><input type="checkbox" id="select_all"><b>Select</b></th>
<th><b>S.No.</b></th>
<th><b>Subject Name</b></th>
<th><b>Course Name</b></th>
<th><b>Description</b></th>
<th><b>Edit</b></th>
</tr>

<%
int pageNo=ServletUtility.getPageNo(request);
int pageSize=ServletUtility.getPageSize(request);
int index=((pageNo-1)*pageSize)+1;
long a=0,b=0;
SubjectModel model=new SubjectModel();
b=model.nextPK();
b--;
Iterator<SubjectBean>it=list.iterator();
while(it.hasNext())
{
	SubjectBean bean=it.next();
	a=bean.getId();
%>
<tr>
<td><input type="checkbox" class="checkbox" name="chk_1" value="<%=bean.getId()%>"></td>
<td><%=index++ %></td>
<td><%=bean.getSubjectName()%></td>
          <td><%=bean.getCourseName()%></td>
          <td><%=bean.getDescription()%></td>
          <%if(1==bean1.getRollId()|| 3==bean1.getRollId()){ %>
          <td><a href="SubjectCtl?id=<%=bean.getId()%>">Edit</a></td>
          <%} %>
<%} %>
</tr>
</table>
<br>
<table width="100%">
<tr>
<td><input type="submit" name="operation" value="<%=SubjectListCtl.OP_PREVIOUS%>" <%=(pageNo==1)?"disabled":""%>></td>
<%if(1==bean1.getRollId()||3==bean1.getRollId()){ %>
<td><input type="submit" name="operation" value="<%=SubjectListCtl.OP_DELETE%>"></td>
<td><input type="submit" name="operation" value="<%=SubjectListCtl.OP_NEW%>"></td>
<%} %>

<td align="right"><input type="submit" name="operation" value="<%=SubjectListCtl.OP_NEXT%>" <%=(b>a)?"":"disabled"%>></td>
</tr>
 <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
                <%}else{ %>
                <tr>
                <td><input type="submit" name="operation" value="<%=SubjectListCtl.OP_BACK%>"></td>
                <input type="hidden" name="pageNo1" value="<%=ServletUtility.getPageNo(request)%>">
                </tr>
                <h3 align="center"><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
                <%} %>
</table>
</center>
<br><br>
<%@ include file="Footer.jsp" %>
</form>
</body>
</html>
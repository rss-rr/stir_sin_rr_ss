<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.model.FacultyModel"%>
<%@page import="in.co.sunrays.proj4.controller.FacultyListCtl"%>
<%@page import="in.co.sunrays.proj4.bean.FacultyBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
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
<%List list1=(List)request.getAttribute("collegeList"); %>
<form action="<%=ORSView.FACULTY_LIST_CTL%>" method="post">
<jsp:useBean id="sbean" class="in.co.sunrays.proj4.bean.FacultyBean"
            scope="request"></jsp:useBean>
<%@ include file="Header.jsp" %>
<%List list=ServletUtility.getList(request); %>
<center>
<h1>Faculty List</h1>
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
<%if(list.size()>0)
	{%>
	<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
<table width="100%">
<tr>
<td align="center"><label>First Name:-</label>
<input type="text" name="firstName" value="<%=DataUtility.getString(sbean.getFirstName()) %>" placeholder="Enter First Name">&nbsp;
<label>College Name:-</label><%=HTMLUtility.getList("roleName",
                    String.valueOf(sbean.getCollegeId()), list1)%>&nbsp;
<label>Email ID:-</label><input type="text" name="email" value="<%=DataUtility.getStringData(sbean.getEmailId()) %>" placeholder="Must be EmailId">&nbsp;
<input type="submit" name="operation" value="search">
<input type="submit" name="operation"
						value="<%=FacultyListCtl.OP_RESET%>"></td>
</tr>
</table><br>
<table width="100%" border="1px">
<tr>
<th width="10%"><input type="checkbox" id="select_all"><b>Select</b></th>
<th><b>S.No.</b></th>
<th><b>FirstName</b></th>
<th><b>LastName</b></th>
<th><b>Email ID</b></th>
<th><b>Gender</b></th>
<th><b>Joining Date</b></th>
<th><b>Qualification</b></th>
<th><b>Mobile No</b></th>
<th><b>College Name</b></th>
<th><b>Course Name</b></th>
<th><b>Subject Name</b></th>
<th><b>Edit</b></th>
</tr>

<%
int pageNo=ServletUtility.getPageNo(request);
int pageSize=ServletUtility.getPageSize(request);
int index=((pageNo-1)*pageSize)+1;
long a=0,b=0;
FacultyModel model=new FacultyModel();
b=model.nextPK();
b--;

Iterator<FacultyBean>it=list.iterator();
while(it.hasNext())
{
	FacultyBean bean=it.next();
	a=bean.getId();
%>
<tr>
<td><input type="checkbox" class="checkbox" name="chk_1" value="<%=bean.getId()%>"></td>
<td><%=index++ %></td>
<td><%=bean.getFirstName()%></td>
          <td><%=bean.getLastName()%></td>
          <td><%=bean.getEmailId()%></td>
          <td><%=bean.getGender()%></td>
          <td><%=bean.getJoiningDate()%></td>
          <td><%=bean.getQualification()%></td>
          <td><%=bean.getMobileNo()%></td>
          <td><%=bean.getCollegeName()%></td>
          <td><%=bean.getCourseName()%></td>
          <td><%=bean.getSubjectName()%></td>
          <%if(1==bean1.getRollId()||3==bean1.getRollId()){ %>
          <td><a href="FacultyCtl?id=<%=bean.getId()%>">Edit</a></td>
          <%} %>
<%} %>
</tr>
</table><br>
<table width="100%">
<input type="hidden" name="pageNo" value="<%=pageNo%>">
<input type="hidden" name="pageSize" value="<%=pageSize%>">
<tr>
<td><input type="submit" name="operation" value="<%=FacultyListCtl.OP_PREVIOUS %>" <%=(pageNo==1)?"disabled":""%>></td>
<%if(1==bean1.getRollId() || 3==bean1.getRollId()){ %>
                        <td><input type="submit" name="operation"
                        value="<%=FacultyListCtl.OP_DELETE%>"></td>
                        <td><input type="submit" name="operation" value="<%=FacultyListCtl.OP_NEW %>" ></td>
                        <%} %>

<td align="right"><input type="submit" name="operation" value="<%=FacultyListCtl.OP_NEXT %>" <%=(b>a)?"":"disabled"%>></td>
</tr>
<%}else { %>
<tr>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
<input type="hidden" name="pageNo1" value="<%=ServletUtility.getPageNo(request)%>">
<td><input type="submit" name="operation" value="<%=FacultyListCtl.OP_BACK %>" ></td></tr>
<%} %>
</table>
</center>

</form>
</body>
<br><br>
<%@ include file="Footer.jsp" %>
</html>
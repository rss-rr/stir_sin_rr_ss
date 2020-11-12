<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.model.StudentModel"%>
<%@page import="in.co.sunrays.proj4.bean.StudentBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.controller.StudentListCtl"%>
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
<%@include file="Header.jsp" %>
<form  action="<%=ORSView.STUDENT_LIST_CTL%>" method="post">
<jsp:useBean id="sbean" class="in.co.sunrays.proj4.bean.StudentBean"
            scope="request"></jsp:useBean>
<center>
<h1>Student List</h1>

  <h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
     
<%List list=ServletUtility.getList(request); 
  List list1=(List)request.getAttribute("collegeList");%>
<%if(list.size()>0) 
{%>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></h3>
<table width="100%">
<tr>
<td align="center"><label>First Name:</label><input type="text" name="firstName" placeholder="Enter First Name" value="<%=ServletUtility.getParameter(request,"firstName")%>">&nbsp;
<label>College Name:</label><%=HTMLUtility.getList("roleName",
                    String.valueOf(sbean.getCollegeId()), list1)%>&nbsp;
<label>Email Id:</label><input type="text" name="email" placeholder="Must be Email ID" value="<%=ServletUtility.getParameter(request,"email")%>">&nbsp;
<input type="submit" name="operation" value="<%=StudentListCtl.OP_SEARCH %>">
<input type="submit" name="operation" value="<%=StudentListCtl.OP_RESET %>">
</td>
</tr>

</table><br>
<table width="100%" border="1px">
<tr>
<th width="10%"><input type="checkbox" id="select_all"><b>Select</b></th>
<th>S.No</th>
<th>First Name</th>
<th>Last Name</th>
<th>Date Of Birth</th>
<th>College Name</th>
<th>Course Name</th>
<th>Mobile No</th>
<th>Email ID</th>
<th>Edit</th>
</tr>

 <%
 int pageNo=ServletUtility.getPageNo(request);
 int pageSize=ServletUtility.getPageSize(request);
 int index=((pageNo-1)*pageSize)+1;
 StudentModel model= new StudentModel();
 long a=0;
 int b=model.nextPK();
 b--;
Iterator<StudentBean> it=list.iterator();
while(it.hasNext())
{
	
StudentBean bean=it.next();
System.out.println(bean.getCollegeName());
a=bean.getId();
 %>
 <tr>
 <td><input type="checkbox" class="checkbox" name="chk_1" value="<%=bean.getId()%>"></td>
 <td><%=index++ %></td>
 
                   
                    <td><%=bean.getFirstName()%></td>
                    <td><%=bean.getLastName()%></td>
                    <td><%=bean.getDob()%></td>
                    <td><%=bean.getCollegeName()%></td>
                    <td><%=bean.getCourseName() %></td>
                    <td><%=bean.getMobileNo()%></td>
                    <td><%=bean.getEmail()%></td>
                    <%if(1==bean1.getRollId() || 3==bean1.getRollId()){ %>
                    
                    <td><a href="StudentCtl?id=<%=bean.getId()%>">Edit</a></td>
                    <%} %>
 </tr>
 <%} %>
</table><br>
<table width="100%">
<tr>
 <td><input type="submit" name="operation"
                        value="<%=StudentListCtl.OP_PREVIOUS%>" <%=(pageNo==1)?"disabled":""%>></td>
                        
                        <%if(1==bean1.getRollId() || 3==bean1.getRollId()){ %>
                        <td><input type="submit" name="operation"
                        value="<%=StudentListCtl.OP_NEW%>"></td>
                        <td><input type="submit" name="operation"
                        value="<%=StudentListCtl.OP_DELETE%>"></td>
                        <%} %>
                    <td align="right"><input type="submit" name="operation"
                        value="<%=StudentListCtl.OP_NEXT%>" <%=(b>a)?"":"disabled" %>></td>
</tr>
</table>
 <input type="hidden" name="pageNo" value="<%=pageNo%>"><input
                type="hidden" name="pageSize" value="<%=pageSize%>">
                <%} 
                if(list.size()==0)
                {%>
                <table>
                <h3><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></h3>
                <input type="hidden" name="pageNo1" value="<%=ServletUtility.getPageNo(request)%>"> 
                <tr><td><input type="submit" name="operation" value="<%=StudentListCtl.OP_BACK%>"></td></tr>
                </table>
                <%} %>
                
</center>
</form>
<br><br>
<%@include file="Footer.jsp" %>
</body>
</html>
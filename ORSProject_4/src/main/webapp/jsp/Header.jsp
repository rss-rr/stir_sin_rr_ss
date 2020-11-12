
<%@page import="javax.management.relation.Role"%>
<%@page import="java.util.Date"%>
<%@page import="in.co.sunrays.proj4.bean.RoleBean"%>
<%@page import="in.co.sunrays.proj4.bean.UserBean"%>
<%@page import="in.co.sunrays.proj4.controller.ORSView"%>
<%@page import="in.co.sunrays.proj4.controller.LoginCtl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <style>
.footer {
   position: fixed;
   top:2%;
   left: 0;
   bottom: 0;
   width: 100%;
   
   color: black;
  
}
</style> -->
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker(
				{
					changeMonth:true,
					changeYear:true,
					yearRange:"1970:new Date()"
					
				});
		$("#date").datepicker("setDate", new Date());
	});
	</script>
	<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body >
	<%  %>
	<%
		UserBean bean1 = (UserBean) session.getAttribute("user");
		boolean userLoggedIn = (bean1 != null);
		String welcomeMsg = "Hi, ";
		if (userLoggedIn) {
			String role = (String) session.getAttribute("role");
			welcomeMsg += bean1.getFirstName() + "(" + role + ")";
		} else {
			welcomeMsg += "Guest";
		}
	%>
	<table width="100%" border="0">
		<tr>
			<td width="90%"><a href="<%=ORSView.WELCOME_CTL%>"><b>Welcome</b></a>|
				<%
				if (userLoggedIn) {
			%> <a
				href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>"><b>Logout</b></a>

				<%
					} else {
				%> <a href="<%=ORSView.LOGIN_CTL%>"><b>Login</b></a> <%
 	}
 %></td>
			<td rowspan="2">
				<h1 align="right">
					<img src="<%=ORSView.APP_CONTEXT%>/img/SUNRAYSFamily2.jpg"
						width="318" height="90">
				</h1>
			</td>


		</tr>
		<tr>
			<td>
				<h3><%=welcomeMsg%></h3>
			</td>
		</tr>
    
		<%
		   if(userLoggedIn){
			if (RoleBean.ADMIN==bean1.getRollId()) {
		%>
		<tr>
			<td colspan="2"><a href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</a> |
				<a href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</a>|<a href="<%=ORSView.GET_MARKSHEET_CTL%>">Get
					Marksheet </a> | <a href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>">Marksheet
					Merit List </a> | 
				 <a href="<%=ORSView.MARKSHEET_CTL%>">Add Marksheet</a> | <a
				href="<%=ORSView.MARKSHEET_LIST_CTL%>">Marksheet List</a> | <a
				href="<%=ORSView.USER_CTL%>">Add User</a> | <a
				href="<%=ORSView.USER_LIST_CTL%>">User List</a> | <a
				href="<%=ORSView.COLLEGE_CTL%>">Add College</a> | <a
				href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a> | <a
				href="<%=ORSView.STUDENT_CTL%>">Add Student</a> | <a
				href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a> | <a
				href="<%=ORSView.ROLE_CTL%>">Add Role</a> | <a
				href="<%=ORSView.ROLE_LIST_CTL%>">Role List</b></a> | <a
				href="<%=ORSView.FACULTY_CTL%>">Add Faculty</a>| <a
				href="<%=ORSView.FACULTY_LIST_CTL%>">Faculty List</a>| <a
				href="<%=ORSView.SUBJECT_CTL%>">Add Subject</a>| <a
				href="<%=ORSView.SUBJECT_LIST_CTL%>">Subject List</a>| <a
				href="<%=ORSView.TIME_TABLE_CTL%>">Add TimeTable</a>| <a
				href="<%=ORSView.TIME_TABLE_LIST_CTL%>">TimeTable List</a>| <a
				href="<%=ORSView.COURSE_CTL%>">Add Course</a>| <a
				href="<%=ORSView.COURSE_LIST_CTL%>">Course List</a> | <a
				href="<%=ORSView.JAVA_DOC_VIEW%>" target="blank">Java Doc</a> <%
 	
 %></td>
			<%
				}
			else if(RoleBean.COLLEGE_SCHOOL==bean1.getRollId())
			{%>
			<td colspan="2"><a href="<%=ORSView.GET_MARKSHEET_CTL%>">Get Marksheet </a>
				| <a href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>">Marksheet
					Merit List </a> | <a href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</a> |
				<a href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</a>|<%
				%> <a href="<%=ORSView.MARKSHEET_CTL%>">Add Marksheet</a> | <a
				href="<%=ORSView.MARKSHEET_LIST_CTL%>">Marksheet List</a>| <a
				href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a> | <a
				href="<%=ORSView.STUDENT_CTL%>">Add Student</a> | <a
				href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a> | <a
				href="<%=ORSView.ROLE_LIST_CTL%>">Role List</b></a>|<a
				href="<%=ORSView.FACULTY_LIST_CTL%>">Faculty List</a>|<a
				href="<%=ORSView.SUBJECT_LIST_CTL%>">Subject List</a>|<a
				href="<%=ORSView.TIME_TABLE_LIST_CTL%>">TimeTable List</a>|<a
				href="<%=ORSView.COURSE_LIST_CTL%>">Course List</a></td>
			<% }
			else if(RoleBean.STUDENT==bean1.getRollId())
			{%>
			<td colspan="2">
			<a href="<%=ORSView.GET_MARKSHEET_CTL%>">Get Marksheet </a>
				| <a href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>">Marksheet
					Merit List </a> | <a href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</a> |
				<a href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</a>| <a
				href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a> | <a
				href="<%=ORSView.FACULTY_LIST_CTL%>">Faculty List</a>|<a
				href="<%=ORSView.TIME_TABLE_LIST_CTL%>">TimeTable List</a>|<a
				href="<%=ORSView.COURSE_LIST_CTL%>">Course List</a></td>
				</td>
			<%}
			else if(RoleBean.KIOSK==bean1.getRollId())
			{%>
			
			<td colspan="2"><a href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</a>
				| <a href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</a> | <a
				href="<%=ORSView.USER_CTL%>">Add User</a> | <a
				href="<%=ORSView.USER_LIST_CTL%>">User List</a> | <a
				href="<%=ORSView.COLLEGE_CTL%>">Add College</a> | <a
				href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a> | <a
				href="<%=ORSView.STUDENT_CTL%>">Add Student</a> | <a
				href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a> | <a
				href="<%=ORSView.ROLE_CTL%>">Add Role</a> | <a
				href="<%=ORSView.ROLE_LIST_CTL%>">Role List</b></a> | <a
				href="<%=ORSView.FACULTY_CTL%>">Add Faculty</a>| <a
				href="<%=ORSView.FACULTY_LIST_CTL%>">Faculty List</a>| <a
				href="<%=ORSView.SUBJECT_CTL%>">Add Subject</a>| <a
				href="<%=ORSView.SUBJECT_LIST_CTL%>">Subject List</a>| <a
				href="<%=ORSView.TIME_TABLE_CTL%>">Add TimeTable</a>| <a
				href="<%=ORSView.TIME_TABLE_LIST_CTL%>">TimeTable List</a>| <a
				href="<%=ORSView.COURSE_CTL%>">Add Course</a>| <a
				href="<%=ORSView.COURSE_LIST_CTL%>">Course List</a></td>
			<% }
		  }
			%>

		</tr>
	</table>
	<hr>
</body>
</html>
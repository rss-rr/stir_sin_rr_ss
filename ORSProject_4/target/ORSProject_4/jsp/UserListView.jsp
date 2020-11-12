<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.model.RoleModel"%>
<%@page import="in.co.sunrays.proj4.model.UserModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.controller.UserListCtl"%>
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
</script>  -->
<%-- <script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>
 --%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="Header.jsp"%>
	<center>
		<h1>User List</h1>
		<form action="<%=ORSView.USER_LIST_CTL%>" method="post" name="frm">
		<jsp:useBean id="bean2" class="in.co.sunrays.proj4.bean.UserBean"
            scope="request"></jsp:useBean>
			<%
				List list = ServletUtility.getList(request);
			%>
			<%
            List list1 = (List) request.getAttribute("roleList");
        	System.out.println(list1.get(1)+"  role one"+bean2.getRollId());
        %>
     <h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
			<%
				if (list.size() != 0) {
			%>
			<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
			
			<table width="100%">
				<tr>
					<td align="center"><label>First Name:</label> <input
						type="text" name="firstName" placeholder="Enter First Name"
						value="<%=ServletUtility.getParameter(request, "firstName")%>">&nbsp;
						<label>Login:</label><input type="text" name="login"
						placeholder="Must be EmailId"
						value="<%=ServletUtility.getParameter(request, "login")%>">&nbsp;
						<label>Role:-</label>
                <%=HTMLUtility.getList("roleName",
                    String.valueOf(bean2.getRollId()), list1)%>
						<input type="submit" name="operation"
						value="<%=UserListCtl.OP_SEARCH%>">
						<input type="submit" name="operation"
						value="<%=UserListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<br>
			<table style="width: 100%" border="1px">
				<tr>
					<th><b>S.No.</b></th>
					<th width="10%"><input type="checkbox" id="select_all"><b>Select</b></th>
				
					<th><b>FirstName</b></th>
					<th><b>LastName</b></th>
					<th><b>LoginId</b></th>
					<th><b>Role</b></th>
					<th><b>Gender</b></th>
					<th><b>DOB</b></th>
					<th><b>Edit</b></th>
				</tr>
				<%
					List roleList = (List) request.getAttribute("roleList");
						int pageNo = ServletUtility.getPageNo(request);
						int pageSize = ServletUtility.getPageSize(request);
						System.out.println(pageNo);
						int index = ((pageNo - 1) * pageSize) + 1;
						int a = 0;
						String roleName = "";
						int b=UserModel.nextPK();
						System.out.println(b);
						b--;
						Iterator<UserBean> it = list.iterator();
						Iterator<RoleBean> itr = roleList.iterator();
						while (it.hasNext()) {
							UserBean bean = it.next();
							a = (int) bean.getId();
				%>
				<tr>
				<td><%=index++ %></td>
					<%
						if (!(bean1.getLogin().equals(bean.getLogin()))) {
					%>
					<td><input type="checkbox" class="checkbox" name="chk_1" value="<%=bean.getId()%>"></td>
					<%
						} 
						else {
							%>
							<td></td>
							<% 
						}
					%>
					<td><%=bean.getFirstName()%></td>
					<td><%=bean.getLastName()%></td>
					<td><%=bean.getLogin()%></td>
					<td><%=UserListCtl.roleName(bean.getRollId(), roleList)%></td>
					<td><%=bean.getGender()%></td>
					<td><%=bean.getDob()%></td>
					<%
						
							if(1==bean1.getRollId() || 3==bean1.getRollId())
							{
					      if(!(bean.getRollId()==RoleBean.ADMIN)){%>    
					<td><a href="UserCtl?id=<%=bean.getId()%>">Edit</a></td>
				</tr>
				<%}
							}
					}
						
				%>
			</table>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						value="<%=UserListCtl.OP_PREVIOUS%>"
						<%=(pageNo==1)?"disabled":"" %>></td>
					<td><input type="submit" name="operation"
						value="<%=UserListCtl.OP_DELETE%>"></td>
					<td><input type="submit" name="operation"
						value="<%=UserListCtl.OP_NEW%>"></td>
					<td align="right"><input type="submit" name="operation"
						value="<%=UserListCtl.OP_NEXT%>"
					<%=(b>a)?"":"disabled" %>	></td>
				</tr>

			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
			<%
			 System.out.println(a);
				}
			%>
			<%
				if (list.size() == 0) {
			%>
			<h3 align="center">
				<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
			</h3>
			<table>
				<tr>
				  
					<td><input type="submit" name="operation"
						value="<%=UserListCtl.OP_BACK%>"></td>
				</tr>
			</table>
			<%
				}
			%>
			<%System.out.println(ServletUtility.getPageNo(request)); %>
			<input type="hidden" name="pageNo1" value="<%=ServletUtility.getPageNo(request)%>">
		</form>
		<br><br><br>
		 <%@include file="Footer.jsp"%>
	</center>
	
	
</body>
</html>
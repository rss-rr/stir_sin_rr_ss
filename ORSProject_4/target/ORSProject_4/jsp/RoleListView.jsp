<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.model.RoleModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.controller.RoleListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@ page errorPage="ErrorView.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <script type="text/javascript">
	function checkedAll() {

		var totalElement = document.forms[0].elements.length;
		console.log(totalElement + " .....")
		for (var i = 0; i < totalElement; i++) {
			var en = document.forms[0].elements[i].name;
			console.log(en + "  its en in check all..." + i)
			if (en != undefined & en.indexOf("chk_1") != -1) {
				console.log("inside if in check all" + en)
				document.forms[0].elements[i].checked = document.frm.chk_all.checked;

			}
		}
	}

	function check(frm) {
		var en = document.forms[0].elements[4].name;
		console.log(en + ".... en ....")
		if (en != undefined & en.indexOf("chk_1") != -1) {
			console.log("inside check fun "
					+ document.forms[0].elements[3].checked)
			document.forms[0].elements[3].checked = document.frm.chk_all.unchecked;
		}
	}
</script> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bean2" class="in.co.sunrays.proj4.bean.RoleBean"
            scope="request"></jsp:useBean>
            <%-- <%RoleBean bean2=(RoleBean)request.getAttribute("bean"); %> --%>
<%
            List list1 = (List) request.getAttribute("roleList");
        	System.out.println(list1.get(1)+"  role one");
        %>
	<%@ include file="Header.jsp"%>
	<center>
		<h1>Role List</h1>
		<h3>
			<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
		</h3>
		<%
			List list = ServletUtility.getList(request);
		%>
		
		<form action="<%=ORSView.ROLE_LIST_CTL%>" method="post">
		
            <%System.out.println(bean2.getId()); %>
			<%
				if (list.size() > 0) {
			%>
			<h3>
			<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
		</h3>
			<table width="100%">
				<tr>

					<td align="center"><label>RoleName:</label><%=HTMLUtility.getList("roleName",
                    String.valueOf(bean2.getId()), list1)%>
                    &nbsp; <input type="submit"
						name="operation" value="<%=RoleListCtl.OP_SEARCH%>"> <input
						type="submit" name="operation" value="<%=RoleListCtl.OP_RESET%>">
					</td>

				</tr>

			</table>
			<table width="100%" border="1px">
				<tr>
					<th width="10%"><input type="checkbox" id="select_all"><b>Select</b></th>
					<th><b>S.No.</b></th>
					<th><b>Name</b></th>
					<th><b>Description</b></th>
					<th><b>Edit</b></th>

				</tr>
				<%
					int pageNo = ServletUtility.getPageNo(request);
						int pageSize = ServletUtility.getPageSize(request);
						int index = ((pageNo - 1) * pageSize) + 1;
						long a = 0;
						long b = RoleModel.nextPK();
						b--;
						Iterator<RoleBean> it = list.iterator();
						while (it.hasNext()) {
							RoleBean bean = it.next();
							a = bean.getId();
				%>
				<tr>

					<td><input type="checkbox" class="checkbox" name="chk_1" value="<%=bean.getId()%>"></td>
					<td><%=index++%></td>
					<td><%=bean.getName()%></td>
					<td><%=bean.getDescription()%></td>
					<%if(1==bean1.getRollId()||3==bean1.getRollId()){ %>
					<td><a href="RoleCtl?id=<%=bean.getId()%>">Edit</a></td>
					<%} %>
 				</tr>
				<%
					}
				%>

			</table>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_PREVIOUS%>" <%=(pageNo==1)?"disabled":"" %>></td>
					<td><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_NEW%>"></td>
						<%if(1==bean1.getRollId()||3==bean1.getRollId()){ %>
					<td><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_DELETE%>"></td>
                          <%} %>
					<td align="right"><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_NEXT%>"
						<%=(b > a) ? "" : "disabled"%>></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
			<%
				}
			%>
			<%
				if (list.size() == 0) {
			%>
			<table>
				<tr>
				  <h3>
			         <font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
		          </h3>
		          <input type="hidden" name="pageNo1" value="<%=ServletUtility.getPageNo(request)%>">
					<td><input type="submit" name="operation"
						value="<%=RoleListCtl.OP_BACK%>"></td>
				</tr>
			</table>
			<%
				}
			%>
		</form>
	</center>
	<br><br>
	<%@ include file="Footer.jsp"%>
</body>
</html>
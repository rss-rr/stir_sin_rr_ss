<%@page import="in.co.sunrays.proj4.model.MarksheetModel"%>
<%@page import="in.co.sunrays.proj4.bean.MarksheetBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.sunrays.proj4.controller.MarksheetMeritListCtl"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
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
	<center>
		<%@ include file="Header.jsp"%>

		<form action="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>" method="post">

			<%
				List list = ServletUtility.getList(request);
				int back = 0;
			%>

			<h1 align="center">Marksheet Merit List</h1>
			<%
				if (list.size() > 0) {
					back++;
			%>
			<h3>
				<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
			</h3>
			<table width="100%" border="1px">

				<tr>
					<th><b>S.No</b></th>
					<th><b>Roll No</b></th>
					<th><b>Name</b></th>
					<th><b>Physics</b></th>
					<th><b>Chemistry</b></th>
					<th><b>Maths</b></th>
					<th><b>Total</b></th>
					<th><b>Grade</b></th>
				</tr>
				<%!public String grade(int a) {
		if ((a / 3) >= 85) {
			return "A+";
		} else if ((a / 3 >= 75)) {
			return "A";
		} else if ((a / 3) >= 65) {
			return "B+";
		} else if ((a / 3) >= 55) {
			return "B";
		} else if ((a / 3) >= 45) {
			return "C+";
		} else if ((a / 3) >= 40)

		{
			return "C";
		} else if ((a / 3) >= 35) {
			return "D";
		} else {
			return "fail";
		}
	}%>
				<%
					int index = 0;
						int pageNo = ServletUtility.getPageNo(request);
						int pageSize = ServletUtility.getPageSize(request);
						Iterator<MarksheetBean> it = list.iterator();
						MarksheetModel model = new MarksheetModel();
						long a = model.nextPK();
						a--;
						System.out.println(a);
						long b=0;
						index = ((pageNo - 1) * pageSize) + 1;
						while (it.hasNext()) {
							MarksheetBean bean = it.next();
							b = bean.getId();
				%>
				<tr>
					<td><%=index++%></td>
					<td><%=bean.getRollNo()%></td>
					<td><%=bean.getName()%></td>
					<td><%=bean.getPhysics()%><%=(bean.getPhysics() >= 35) ? "" : "*"%></td>
					<td><%=bean.getChemistry()%><%=(bean.getChemistry() >= 35) ? "" : "*"%></td>
					<td><%=bean.getMaths()%><%=(bean.getMaths() >= 35) ? "" : "*"%></td>
					<td><%=bean.getPhysics() + bean.getChemistry() + bean.getMaths()%>
						<%=(((bean.getPhysics() + bean.getChemistry() + bean.getMaths()) / 3) >= 35
							&& (bean.getPhysics() >= 35 && bean.getChemistry() >= 35 && bean.getMaths() >= 35)) ? ""
									: "*"%></td>
					<td><%=grade(bean.getPhysics() + bean.getChemistry() + bean.getMaths())%></td>

				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<%-- <td><input type="submit" name="operation"
					value="<%=MarksheetMeritListCtl.OP_PREVIOUS%>"
					<%=(pageNo == 1) ? "disabled" : ""%>></td>

				<td align="right"><input type="submit" name="operation"
					value="<%=MarksheetMeritListCtl.OP_NEXT%> 
"
					<%=(a > b) ? "" : "disabled"%>></td>
					
 --%>
 <td align="center"><input type="submit" name="operation"
						value="<%=MarksheetMeritListCtl.OP_BACK%>"></td>
			</table>
			<%
			   System.out.println(b);
				} else {
			%>
			
			<table width="100%">
			    <input type="hidden" name="pageNo1" value="<%=ServletUtility.getPageNo(request)%>">
				<tr>
				   <h3 align="center">
				<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
			</h3> 
			     
					<td align="center"><input type="submit" name="operation"
						value="<%=MarksheetMeritListCtl.OP_BACK%>"></td>
				</tr>
			</table>
			<%
				}
			%>

		</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>
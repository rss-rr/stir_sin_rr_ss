<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.model.CollegeModel"%>
<%@page import="in.co.sunrays.proj4.model.CollegeModel"%>
<%@page import="in.co.sunrays.proj4.controller.CollegeListCtl"%>
<%@page import="in.co.sunrays.proj4.bean.CollegeBean"%>
<%@page import="in.co.sunrays.proj4.controller.MarksheetListCtl"%>
<%@page import="in.co.sunrays.proj4.bean.MarksheetBean"%>
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
<%@include file="Header.jsp" %>
<form action="<%=ORSView.COLLEGE_LIST_CTL%>" method="POST">
<jsp:useBean id="cbean" class="in.co.sunrays.proj4.bean.CollegeBean"
            scope="request"></jsp:useBean>
<%List list=ServletUtility.getList(request);
List list1=(List)request.getAttribute("collegeList");%>
<center>
<h1>College List</h1>
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
<%if(list.size()!=0){ %>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
<table width="100%">
<tr>
<td align="center"><label>College Name:</label>
<%=HTMLUtility.getList("cName",
                    String.valueOf(cbean.getId()), list1)%>&nbsp;
<label>City:</label><input type="text" name="city" value="<%=DataUtility.getStringData(cbean.getCity()) %>" placeholder="Enter City Name">
<input type="submit" name="operation" value="<%=CollegeListCtl.OP_SEARCH%>">
<input type="submit" name="operation"
						value="<%=CollegeListCtl.OP_RESET%>"></td>
</tr>
</table><br>
<table width="100%" border="1px">
<tr>
<th><input type="checkbox" name="chk_all" onclick="checkedAll(this)"><b>Select</b></th>
<th>S.No</th>
<th>Name</th>
<th>Address</th>
<th>State</th>
<th>City</th>
<th>Phone No</th>
<th>Edit</th>
</tr>

<%
int pageNo=ServletUtility.getPageNo(request);
int pageSize=ServletUtility.getPageSize(request);
int index=((pageNo-1)*pageSize)+1;
CollegeModel model=new CollegeModel();
long b=model.nextPK();
b--;
long a=0;
Iterator<CollegeBean> itr=list.iterator();
while(itr.hasNext())
{
 CollegeBean bean=itr.next();
 a=bean.getId();
%>
  <tr>
        <td><input type="checkbox" id="sid" name="chk_1"  onchange="check()" value="<%=bean.getId()%>"></td>
                    <td><%=index++%></td>
                    <td><%=bean.getName()%></td>
                    <td><%=bean.getAddress()%></td>
                    <td><%=bean.getState()%></td>
                    <td><%=bean.getCity()%></td>
                    <td><%=bean.getPhoneNo()%></td>
                    <%if(1==bean1.getRollId()||3==bean1.getRollId()){ %>
                    <td><a href="CollegeCtl?id=<%=bean.getId()%>">Edit</a></td>
                    <%} %>
                </tr>

<%} %>
</table><br>
<table width="100%">
<tr>
<td><input type="submit" name="operation" value="<%=CollegeListCtl.OP_PREVIOUS%>" <%=(pageNo==1)?"disabled":""%>></td>

<%if(1==bean1.getRollId()||3==bean1.getRollId()){ %>
<td><input type="submit" name="operation" value="<%= CollegeListCtl.OP_DELETE%>"></td>
<td><input type="submit" name="operation" value="<%= CollegeListCtl.OP_NEW%>"></td>
<%} %>
<td align="right"><input type="submit" name="operation" value="<%= CollegeListCtl.OP_NEXT%>" <%=(b>a)?"":"disabled" %>></td>
</tr>
</table>
 <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
                <%} 
                else {%>
                <input type="submit" name="operation" value="<%=CollegeListCtl.OP_BACK%>">
                <input type="hidden" name="pageNo1" value="<%=ServletUtility.getPageNo(request)%>">
                <h3 align="center"><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>
                <%} %>
</center>
</form>
<br><br>
<%@ include file="Footer.jsp" %>
</body>
</html>
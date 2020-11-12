<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="in.co.sunrays.proj4.model.MarksheetModel"%>
<%@page import="in.co.sunrays.proj4.bean.MarksheetBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.controller.MarksheetListCtl"%>
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
	var en=document.forms[0].elements[5].name;
	console.log(en+".... en ....")
	if(en!=undefined & en.indexOf("chk_1")!=-1)
	{	
		console.log("inside check fun "+document.forms[0].elements[4].checked)
		document.forms[0].elements[5].checked=document.frm.chk_all.unchecked;
	}	
} 
</script> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ include file="Header.jsp" %>
<form action="<%=ORSView.MARKSHEET_LIST_CTL%>" method="post">
 <jsp:useBean id="mbean" class="in.co.sunrays.proj4.bean.MarksheetBean"
            scope="request"></jsp:useBean>
<%List list1=(List)request.getAttribute("roleList"); 
%>
<center>
<h1>Marksheet List</h1>
<h3><font color="green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>	
<%List list=ServletUtility.getList(request); 
%>
<%if(list.size()>0)
	{%>
<h3><font color="red"><%=ServletUtility.getErrorMessage(request) %></font></h3>	

<table width="100%">
<tr>
<td align="center"><label>Name:-</label><input type="text" name="mname" placeholder="Enter Name" value="<%=DataUtility.getStringData(mbean.getName())%>">
&nbsp;<label>RollNo:-</label><%=HTMLUtility.getList("rollNo",
                    String.valueOf(mbean.getId()), list1)%>
&nbsp;<input type="submit" name="operation" value="<%=MarksheetListCtl.OP_SEARCH%>">
&nbsp;<input type="submit" name="operation" value="<%=MarksheetListCtl.OP_RESET%>">
</td>
</tr>
</table><br>
<table width="100%" border="1px">
<tr>
<th width="10%"><input type="checkbox" id="select_all"><b>Select</b></th>
<th><b>RollNo</b></th>
<th><b>Name</b></th>
<th><b>Physics</b></th>
<th><b>Chemistry</b></th>
<th><b>Maths</b></th>
<th><b>Total</b></th>
<th><b>Grade</b></th>
<th><b>Result</b></th>
<th><b>Edit</b></th>
</tr>
<%! public String grade(int a)
{
	System.out.println(a);
	if(a==0)
	{
		return"F";
	}
	if((a/3)>=85)
	{
		return"A+";	
	}
	else if((a/3>=75))
	{
		return"A";
	}
	else if((a/3)>=65)
	{
		return"B+";
	}
	else if((a/3)>=55)
	{
		return"B";
	}
	else if((a/3)>=45)
	{
		return"C+";
	}
	else if((a/3)>=40)

	{
		return"C";
	}
	else if((a/3)>=35)
	{
		return"D";
	}
	else
	{
		return"F";
	}
}
%>
<%
MarksheetModel model=new MarksheetModel();
int pageNo=ServletUtility.getPageNo(request);
int pageSize=ServletUtility.getPageSize(request);
int index=((pageNo-1)*pageSize)+1;
long a=0,b=0;
b=model.nextPK();
b--;
Iterator<MarksheetBean> it=list.iterator();
while(it.hasNext())
{ 
	MarksheetBean bean=it.next();
	a=bean.getId();
%>
<tr>
 <td><input type="checkbox" class="checkbox" name="chk_1" value="<%=bean.getId()%>"></td>
                    <td><%=bean.getRollNo()%></td>
                    <td><%=bean.getName()%></td>
                    <td><%=bean.getPhysics()%><%=(bean.getPhysics()>=35)?"":"*" %></td>
                    <td><%=bean.getChemistry()%><%=(bean.getChemistry()>=35)?"":"*" %></td>
                    <td><%=bean.getMaths()%><%=(bean.getMaths()>=35)?"":"*" %></td>
                    <td><%=bean.getPhysics()+bean.getChemistry()+bean.getMaths() %>
                    <%=(((bean.getPhysics()+bean.getChemistry()+bean.getMaths())/3)>=35 &&(bean.getPhysics()>=35&&bean.getChemistry()>=35&&bean.getMaths()>=35))?"":"*" %></td>
                    <td><%=((bean.getPhysics()>=35&&bean.getChemistry()>=35&&bean.getMaths()>=35)? grade(bean.getPhysics()+bean.getChemistry()+bean.getMaths()):"F")%></td>
                    <td><%=(bean.getPhysics()>=35 && bean.getChemistry()>=35 && bean.getMaths()>=35)?"Pass":"Fail" %></td>
                    <%if(1==bean1.getRollId()||3==bean1.getRollId()||4==bean1.getRollId()){ %>
                    <td><a href="MarksheetCtl?id=<%=bean.getId()%>">Edit</a></td>
                    <%} %>
</tr>
<%} %>
</table><br>
<table width="100%">
<tr>
<td><input type="submit" name="operation"
                        value="<%=MarksheetListCtl.OP_PREVIOUS%>" <%=(pageNo==1)?"disabled":""%>></td>
                        <%if(1==bean1.getRollId()||3==bean1.getRollId()||4==bean1.getRollId()){ %>
                    <td><input type="submit" name="operation"
                        value="<%=MarksheetListCtl.OP_NEW%>"></td>
                        
                    <td><input type="submit"
                        name="operation" value="<%=MarksheetListCtl.OP_DELETE%>"></td>
                        <%} %>
                    <td align="right"><input type="submit" name="operation"
                        value="<%=MarksheetListCtl.OP_NEXT%>" <%=(b>a)?"":"disabled"%>></td>
</tr>
</table>
   <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
                <%} %>
                <%if(list.size()==0)
                	{%>
                	<input type="hidden" name="pageNo1" value="<%=ServletUtility.getPageNo(request)%>">
                	<table width="100%">
                    <h3><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></h3>
                	<tr><td align="center"><input type="submit" name="operation" value="<%=MarksheetListCtl.OP_BACK%>"></td></tr>
                	</table>
                	<%} %>
</center>
</form>
<br><br><br>
<%@ include file="Footer.jsp" %>
</body>
</html>
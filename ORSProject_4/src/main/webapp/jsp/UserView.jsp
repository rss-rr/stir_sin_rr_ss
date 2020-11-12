<%@page import="in.co.sunrays.proj4.controller.UserCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.sunrays.proj4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.sunrays.proj4.util.DataUtility"%>
<%@page import="in.co.sunrays.proj4.util.ServletUtility"%>
<%@ page errorPage="ErrorView.jsp" %>
<html>
<body>
    <form action="<%=ORSView.USER_CTL%>" method="post">
        <%@ include file="Header.jsp"%>
        <script type="text/javascript" src="js/calendar.js"></script>
        <jsp:useBean id="bean" class="in.co.sunrays.proj4.bean.UserBean"
            scope="request"></jsp:useBean>

        <%
            List list = (List) request.getAttribute("roleList");
        	System.out.println(list.get(1)+"  role one");
        %>

        <center>
        <%if(bean.getId()==0) 
        {%>
            <h1>Add User</h1>
            <%}else
            	{
            	%>
            	<h1>Update User</h1>
            	<%} %>

            <H3>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
            </H3>

            <H3>
                <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font>
            </H3>



            <input type="hidden" name="id" value="<%=bean.getId()%>">
            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimeStamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimeStamp(bean.getModifiedDatetime())%>">


            <table align="center" style="margin-left: 37%">
                <tr>
                    <th>First Name<font color="red">*</font></th>
                    <td><input type="text" name="firstName" placeholder="Enter First Name"
                        value="<%=DataUtility.getStringData(bean.getFirstName())%>"></td><td><font
                        color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
                </tr>
                <tr>
                    <th>Last Name<font color="red">*</font></th>
                    <td><input type="text" name="lastName" placeholder="Enter Last Name"
                        value="<%=DataUtility.getStringData(bean.getLastName())%>"></td><td><font
                        color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
                </tr>
                <tr>
                    <th>LoginId<font color="red">*</font></th>
                    <td><input type="text" name="login" placeholder="Must be Email Id"
                        value="<%=DataUtility.getStringData(bean.getLogin())%>"
                        <%=(bean.getId() > 0) ? "readonly" : ""%>></td><td><font
                        color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
                </tr>
                <tr>
                    <th>Password<font color="red">*</font></th>
                    <td><input type="password" name="password" placeholder="Enter Password"
                        value="<%=DataUtility.getStringData(bean.getPassword())%>"></td><td><font
                        color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font></td>
                </tr>
                <tr>
                    <th>Confirm Password<font color="red">*</font></th>
                    <td><input type="password" name="confirmPassword" placeholder="Enter Confirm Password"
                        value="<%=DataUtility.getStringData(bean.getPassword())%>"></td><td><font
                        color="red"> <%=ServletUtility.getErrorMessage("confirmPassword",
                    request)%></font>
                    <font
                        color="red"> <%=DataUtility.getStringData(request.getAttribute("msg"))%></font></td>
                </tr>
                <tr>
                    <th>Gender<font color="red">*</font></th>
                    <td>
                        <%
                            HashMap map = new HashMap();
                           /// map.put("","-----select-----");
                            map.put("M", "Male");
                            map.put("F", "Female");

                            String htmlList = HTMLUtility.getList("gender", bean.getGender(),
                                    map);
                        %> <%=htmlList%>
                    
                    </td>
                    <td><font
                        color="red"> <%=ServletUtility.getErrorMessage("gender",
                    request)%></font></td>
                </tr>
                <tr>
                <th>Role<font color="red">*</font></th>
                <td><%=HTMLUtility.getList("roleName",
                    String.valueOf(bean.getRollId()), list)%></td>
                    <td><font
                        color="red"> <%=ServletUtility.getErrorMessage("roleName",
                    request)%></font></td>
                </tr>
                <tr>
                    <th>Date Of Birth (mm/dd/yyyy)<font color="red">*</font></th>
                    <td><input type="text" name="dob"id="datepicker"readonly="readonly" placeholder="Enter Date Of Birth"
                        value="<%=DataUtility.getDateString(bean.getDob())%>"></td><td><font
                        color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
                </tr>
                <tr>
                <th></th>
                    <%if(bean.getId()==0)
                	{%>
                    <td colspan="2"><input type="submit" name="operation"
                        value="<%=UserCtl.OP_SAVE%>">&emsp;
                        &emsp;&emsp;&emsp;&nbsp;&nbsp;<input type="submit" name="operation"
                        value="<%=UserCtl.OP_RESET%>"></td>
                        <%} 
                        else
                        {%> <td><input type="submit"
                        name="operation" value="<%=UserCtl.OP_SAVE%>">&emsp;
                        &emsp;&emsp;&emsp;&nbsp;<input type="submit"
                        name="operation" value="<%=UserCtl.OP_CANCEL%>"></td>
                        <%} %>
                </tr>
            </table>
    </form>
    </center>
    <%@ include file="Footer.jsp"%>
</body>
</html>
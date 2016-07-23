<%@page import="java.util.ArrayList"%>
<%@page import="termp.dao.DiscusionDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="termp.model.*" %>
<%@ page import="termp.dao.*" %>
<%@ page import="java.util.*" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>University Board</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">University Board</a>
		</div>

		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-center">
				<li><a href="Announcement.jsp">Announcement</a></li>
				<li><a href="Resources.jsp">Resources</a></li>
				<li><a href="#">Course</a></li>
				<li><a href="viewdiscussforum.jsp">Discussion Forum</a></li>
				<li><a href="ViewAlumniInfo.jsp">Alumni Information</a></li>
				<li><a href="ManageExam.jsp">Exams</a></li>
				<li><a href="editprofile.jsp">Edit Profile</a></li>
				<li><a href="managephdstudent.jsp">PHD Students</a></li>
				<li><a href="logout.jsp"> Log Out</a></li>
			</ul>

		</div>
	</div>
	</nav>


	<div class="container-fluid">

		<div class="row row-offcanvas row-offcanvas-left">

			<div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar"
				role="navigation">
				<br>
				<br>
				<ul class="nav nav-sidebar">
					

				</ul>


			</div>
			<!--/span-->
			<span><br>
			<br></span>
			<div class="col-sm-9 col-md-10 main">

				<!--toggle sidebar button-->
				<p class="visible-xs">
					
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">
						<i class="glyphicon glyphicon-chevron-left"></i>
					</button>
				</p>

				<hr>
				<form action="ManagePhdStudentInfo" method = "post">
						<%
						Person PersonObject;
						List<Student> PhdStudentList;
						
						PersonObject = (Person) session.getAttribute("PersonObject");
						//String UserInfo = (String) session.getAttribute("UserInfo");
						if(null == PersonObject)
						{	response.sendRedirect("login.jsp");
							return;
						}
						%>
<% 
registrationDAO RegistratoinDAOObj = new registrationDAO();

PhdStudentList = RegistratoinDAOObj.GetAllPhdStudentList();
out.print("The length is "+ PhdStudentList.size());
//out.print((String) session.getAttribute("NetID"));
request.setAttribute("PhdStudentList", PhdStudentList);

%>
<input type ="hidden" name="hiddenPara" value="default"/>
<input type ="hidden" name="operation" value="posttopic"/>

<%
	Student StudentObj = null;
	if(!(PersonObject instanceof Student))
	{
			out.print("Not Student object found.");
	%>
	<table class="table table-striped">
	<tr>
	<td>Net ID: <input type="text" name="netid" id="netid" readonly="readonly" ></td>
	<td>First Name : <input type="text" name="firstname" id="firstname" readonly="readonly"></td>
	<tr>
	<td>Last Name : <input type="text" name="lastname" id="lastname" readonly="readonly"></td>
	<td>Status : <input type="text" name="status" id="status"></td>
	<tr>
	<td>Candidate: <input type="text" name="candidate" id="candidate"></td>
	<td>Contact: <input type="text" name="contact" id="contact" required></td>	
	</tr>
	<tr>
	<td>Email ID: <input type="text" name="emailid" id="emailid" required></td>	
	</tr>
	</table><br>	
	<button class="btn btn-primary" > &nbsp;&nbsp; Update Information </button><br><br>
	<%
	}
%>


<table class="table table-striped">
 
  <tr>
    <th>Net ID</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Status</th>
    <th>Candidate</th>
    <th>Contact</th>
    <th>Email-id</th>
   </tr>
      <c:forEach items="${PhdStudentList}" var="PhdStudentObj">
        <tr>
        	<td id="netid${PhdStudentObj.getNetid()}" value="netid${PhdStudentObj.getNetid()}"> <c:out value="${PhdStudentObj.getNetid()}" /></td>
			<td id="fname${PhdStudentObj.getNetid()}" value="netid${PhdStudentObj.getFirstname()}"> <c:out value="${PhdStudentObj.getFirstname()}" /></td>
		    <td id="lname${PhdStudentObj.getNetid()}" value="netid${PhdStudentObj.getLastname()}"> <c:out value="${PhdStudentObj.getLastname()}" /></td>
			<td id="sts${PhdStudentObj.getNetid()}" value="netid${PhdStudentObj.getStatus()}"> <c:out value="${PhdStudentObj.getStatus()}" /></td>
			<td id="candi${PhdStudentObj.getNetid()}" value="netid${PhdStudentObj.getCandidate()}"> <c:out value="${PhdStudentObj.getCandidate()}" /></td>
			<td id="conct${PhdStudentObj.getNetid()}" value="netid${PhdStudentObj.getContact()}"> <c:out value="${PhdStudentObj.getContact()}" /></td>			
			<td id="eid${PhdStudentObj.getNetid()}" value="netid${PhdStudentObj.getEmailid()}"> <c:out value="${PhdStudentObj.getEmailid()}" /></td>
			<td> <button class="btn btn-primary" type="button" onclick="HandleDelete(this)" id="${PhdStudentObj.getNetid()}" value="delete1"> Edit Phd Info</button> </td>					
      </tr>
      </c:forEach>

</table>


</form>
				

			</div>
			<!--/row-->
		</div>
	</div>
	<!--/.container-->
<script>
function HandleDelete(obj) {
	//alert("hello");
	var id = obj.id;
	//alert(id);
	//alert(document.getElementById("fname"+id).innerHTML);
	
	//var infopara = "info" + id;
//	var InfoValue = document.getElementById(infopara).innerHTML;
//	var linkpara = "link" + id;
//	var linkValue = document.getElementById(linkpara).innerHTML;
	document.getElementById("netid").value=id;
	document.getElementById("firstname").value=document.getElementById("fname"+id).innerHTML;;
	document.getElementById("lastname").value=document.getElementById("lname"+id).innerHTML;;
	document.getElementById("status").value=document.getElementById("sts"+id).innerHTML;;
	document.getElementById("candidate").value=document.getElementById("candi"+id).innerHTML;;
	document.getElementById("contact").value=document.getElementById("conct"+id).innerHTML;;
	document.getElementById("emailid").value=document.getElementById("eid"+id).innerHTML;;
		
	//document.getElementById("netid").disabled = "true";
	//document.getElementById("firstname").disabled = "true";
	//document.getElementById("lastname").disabled = "true";
	//document.getElementById("status").disabled = "true";
	
	return false;
}
</script>


</body>
</html>
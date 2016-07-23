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
				<li><a href="ViewResource.jsp">Resources</a></li>
				<li><a href="#">Course</a></li>
				<li><a href="viewdiscussforum.jsp">Discussion Forum</a></li>
				<li><a href=""ViewAlumniInfo.jsp"">Alumni Information</a></li>
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
					<img src="images/seal.jpg" alt="Seal"
						style="width: 210px; height: 250px;">

					<!-- <li class="active"><a href="#">Resources</a></li>
              <li><a href="http://bootstrapzero.com" target="_ext">View</a></li>
              <li><a href="AddResource.jsp">Add</a></li>
              <li><a href="BookResource.jsp">Book</a></li>
              <li><a href="https://wrapbootstrap.com?ref=skelly" target="_ext">cancel</a></li>
             -->

				</ul>


			</div>
			<!--/span-->
			<span><br>
			<br></span>
			<div class="col-sm-8 col-md-8 col-md-offset-1 main">

				<!--toggle sidebar button-->
				<p class="visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">
						<i class="glyphicon glyphicon-chevron-left"></i>
					</button>
				</p>
<form action="ManageAlumniInfo" method = "post">
<%

String Operation = null;
Person PersonObject;
List<Alumniinfo> AlumniInfoList;

Operation = (String) session.getAttribute("Operation");
PersonObject = (Person) session.getAttribute("PersonObject");
//String UserInfo = (String) session.getAttribute("UserInfo");
if(null == PersonObject)
{	response.sendRedirect("login.jsp");
	return;
}

AlumniinfoDAO AlumniinfoDAOObj = new AlumniinfoDAO();
AlumniInfoList = AlumniinfoDAOObj.GetAllAlumniInfo();
out.print("The length is "+ AlumniInfoList.size());
out.print((String) session.getAttribute("NetID"));
request.setAttribute("AlumniInfoList", AlumniInfoList);
%>

<input type ="hidden" name="hiddenPara" value="default"/>
<input type ="hidden" name="operation" value="posttopic"/>

<%
	Student StudentObj = null;
	if(!(PersonObject instanceof Student))
	{
			out.print("Not Student object found.");
	%>					<br><h5>Alumni Info</h5><br>
	
	
	Full Name: <input type="text" name="fullname" id="fullname" value=""><br>
	Current Info: <input type="text" name="currentinfo" id="currentinfo" value=""><br>
	Personal Information: <input type="text" name="personallink" id="personallink" value=""><br><br>
	 
	<button > &nbsp;&nbsp; Add New Alumni Information</button><br><br>
	<%
	}
%>


<table style="width:100%">
 
  <tr>
    <th>Name</th>
    <th>Current Info </th>
    <th>Personal Link</th>
   </tr>

      <c:forEach items="${AlumniInfoList}" var="AlumniObj">
        <tr>
        	<td id="name${AlumniObj.getFullname()}"> <c:out value="${AlumniObj.getFullname()}" /></td>
			<td id="info${AlumniObj.getFullname()}"> <c:out value="${AlumniObj.getCurrentinfo()}" /></td>
			<td id="link${AlumniObj.getFullname()}"> <c:out value="${AlumniObj.getPersonallink()}" /></td>

			<%
			//out.print(i);
			if(!(PersonObject instanceof Student))
			{
					out.print("Not Student object found.");
			%>
           	 <td> <button type="button" onclick="HandleDelete(this)" id="${AlumniObj.getFullname()}" value="delete1"> Edit Record </button> </td>
			<%
			}
			%>
           	</tr>
        
        </c:forEach>
</table>

<script>

function Handle() {
	alert("hello");
	alert(datais);
}	

function HandleDelete(obj) {
	//alert("hello");
	var id = obj.id;
	var infopara = "info" + id;
	var InfoValue = document.getElementById(infopara).innerHTML;
	var linkpara = "link" + id;	
	var linkValue = document.getElementById(linkpara).innerHTML;
	document.getElementById("personallink").value=linkValue;
	document.getElementById("fullname").value=id;
	document.getElementById("currentinfo").value=InfoValue;
	document.getElementById("fullname").disabled = "true";
	
		
	//alert(InfoValue);
	//alert(linkValue);
	//alert(id);
	//var va2 = obj.value2;
	//alert(val2);
	return false;
	//alert(datais);
	//document.getElementsByName("hiddenPara")[0].value = datais;
	//document.getElementsByName("operation")[0].value = "reply";
	
	//document.getElementsByName("hiddenPara")[0].value = datais;
	//$('input[name=hiddenPara]').val(datais);
	//alert(document.getElementsByName("hiddenPara")[0].value);
	//datais = "amol" + datais;
	// alert(datais);
   // alert(document.getElementById(i));
    //document.getElementById(datais).style.visibility = "visible";
}
</script>


</form>
</body>
</html>
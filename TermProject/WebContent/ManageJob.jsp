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
				<li><a href="ManageNews.jsp">Announcement</a></li>
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
					<li ><a href="ManageNews.jsp">News</a></li>
					<li class="active"><a href="ManageJob.jsp">Jobs</a></li>
					<li ><a href="ManageEvent.jsp">Events</a></li>


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
				
<form action="ManageJobServlet" method = "post">
						<%
						
						String NetID;
						Person PersonObject;
						List<Job> JobList;

						
						NetID = (String) session.getAttribute("NetID");
						//out.print("NetID "+ NetID);
						
						PersonObject = (Person) session.getAttribute("PersonObject");
						//String UserInfo = (String) session.getAttribute("UserInfo");
						if(null == PersonObject)
						{	response.sendRedirect("login.jsp");
							return;
						}
						%>
<% 
JobDAO JobOObj = new JobDAO();

JobList = JobOObj.GetAllJobInfo();
//out.print("The length is "+ JobList.size());
//out.print((String) session.getAttribute("NetID"));
request.setAttribute("JobList", JobList);

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
	<td>Description : <input type="text" name="description" id="description"></td>
	<td>Email-ID : <input type="text" name="emailid" id="emailid"></td>
	<td>Web-Link : <input  type="text" name="weblink" id="weblink"></td>
	</tr>
	</table><br>	
	<button class="btn btn-primary" id="dotask"> &nbsp;&nbsp;Create New Job</button><br><br>
	<%
	}
%>


<table class="table table-striped">
 
  <tr>
  <!--  <th>Job ID</th>-->  
    <th>Description</th>
   <!--<th>Poster Net ID</th>--> 
    <!--<th>Original Posted Date</th>-->
    <th>Email ID</th>
    <th>Web-link</th>
   </tr>
      <c:forEach items="${JobList}" var="JobListObj">
        <tr>
        	<!--<td id="jid${JobListObj.getJobid()}"> <c:out value="${JobListObj.getJobid()}" /></td>  -->
        	<td id="descrip${JobListObj.getJobid()}"> <c:out value="${JobListObj.getDescription()}" /></td>
			<!--  <td id="posterid${JobListObj.getJobid()}" > <c:out value="${JobListObj.getPosternetid()}" /></td>-->
		 <!--  <td id="postdate${JobListObj.getJobid()}" > <c:out value="${JobListObj.getPosteddate()}" /></td>-->   
			<td id="eid${JobListObj.getJobid()}"> <c:out value="${JobListObj.getEmailid()}" /></td>
			<td id="wlink${JobListObj.getJobid()}"><a target="_blank" href= <c:out value="${JobListObj.getWeblink()}"  />> Apply On Website</a> </td>
			
			<c:set var="loopnetid" value="${JobListObj.getPosternetid()}"/>
					
			<%
			String loopnetid = (String)pageContext.getAttribute("loopnetid"); 
			//out.println("LoopNetId "+ loopnetid);			
			if((NetID.equals(loopnetid)))
			{
					//out.print("Same NetID Found");
			%>
			<td> <button class="btn btn-primary" type="button" onclick="HandleDelete(this)" id="${JobListObj.getJobid()}" value="delete1"> Edit </button> </td>
			<td> <button class="btn btn-primary" onclick="Handle(this,${JobListObj.getJobid()})" id="del${JobListObj.getJobid()}" value="delete1"> Delete </button> </td>
			<%
			}
			%>				
				
					
			
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

function Handle(obj,val) {
	//alert("hello");
	var id = obj.id;
	//alert(val);
	//alert(document.getElementById("posterid"+id).innerHTML);
	
	//var infopara = "info" + id;
	//var InfoValue = document.getElementById(infopara).innerHTML;
//	var linkpara = "link" + id;
//	var linkValue = document.getElementById(linkpara).innerHTML;
	
	document.getElementsByName("hiddenPara")[0].value = val;
	document.getElementsByName("operation")[0].value = "delete";
		
	//document.getElementById("eventid").value=id;
	//document.getElementById("emailid").value=document.getElementById("eid"+id).innerHTML;
	//document.getElementById("weblink").value=document.getElementById("wlink"+id).innerHTML;
	//document.getElementById("description").value=document.getElementById("descrip"+id).innerHTML;
		
   // var elem = document.getElementById("dotask");
    //elem.firstChild.data = "Edit Record";
	
	//document.getElementById("netid").disabled = "true";
	//document.getElementById("firstname").disabled = "true";
	//document.getElementById("lastname").disabled = "true";
	//document.getElementById("status").disabled = "true";
	
	return false;
}



function HandleDelete(obj) {
	//alert("hello");
	var id = obj.id;
	//alert(id);
	//alert(document.getElementById("posterid"+id).innerHTML);
	
	//var infopara = "info" + id;
	//var InfoValue = document.getElementById(infopara).innerHTML;
//	var linkpara = "link" + id;
//	var linkValue = document.getElementById(linkpara).innerHTML;
	
	document.getElementsByName("hiddenPara")[0].value = id;
	document.getElementsByName("operation")[0].value = "edit";
	//document.getElementById("eventid").value=id;
	document.getElementById("emailid").value=document.getElementById("eid"+id).innerHTML;
	document.getElementById("weblink").value=document.getElementById("wlink"+id).innerHTML;
	document.getElementById("description").value=document.getElementById("descrip"+id).innerHTML;
		
    var elem = document.getElementById("dotask");
    elem.firstChild.data = "Edit Record";
	
	//document.getElementById("netid").disabled = "true";
	//document.getElementById("firstname").disabled = "true";
	//document.getElementById("lastname").disabled = "true";
	//document.getElementById("status").disabled = "true";
	
	return false;
}
</script>


</body>
</html>
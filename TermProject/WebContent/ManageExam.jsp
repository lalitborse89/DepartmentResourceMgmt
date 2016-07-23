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
				
<form action="ManageExamServlet" method = "post">
						<%
						
						String NetID;
						ExamDAO ExamDAOObj;
						Person PersonObject;
						List<Exam> ExamList;
						List<String> StudentExamsList = null;
						
						NetID = (String) session.getAttribute("NetID");
						out.print("NetID "+ NetID);
						
						PersonObject = (Person) session.getAttribute("PersonObject");
						//String UserInfo = (String) session.getAttribute("UserInfo");
						if(null == PersonObject)
						{	response.sendRedirect("login.jsp");
							return;
						}
						%>
<% 
ExamDAOObj = new ExamDAO();

ExamList = ExamDAOObj.GetAllExamInfo();

if(PersonObject instanceof Student)
{
	StudentExamsList = ExamDAOObj.GetStudentExamsList(NetID);
	out.print("Student exam list "+StudentExamsList.toString());
	
	out.print("Student exam list size "+StudentExamsList.size());
	
}			

out.print("The length is "+ ExamList.size());
//out.print((String) session.getAttribute("NetID"));
request.setAttribute("ExamList", ExamList);

%>
<input type ="hidden" name="hiddenPara" value="default"/>
<input type ="hidden" name="operation" value="posttopic"/>

<%
	Student StudentObj = null;
	if(!(PersonObject instanceof Student))
	{
			out.print("Not Student object found.");
	%>
	<table style="width:100%">
	<tr>
	<td>Name : <input type="text" name="name" id="name"></td>
	<td>Exam Date : <input type="date" name="dateofexam" id="dateofexam" placeholder="yyyy-mm-dd"></td>
	<td>Description : <input type="text" name="description" id="description"></td>
	</tr>
	</table><br>	
	<!--
	
                        <button class="btn btn-primary" type="submit">Login <i class="fa fa-fw fa-unlock-alt"></i></button>  -->
	<button  class="btn btn-primary" id="dotask"> &nbsp;&nbsp;Post New Exam</button><br><br>
	<%
	}
	else
	{
	//	StudentExamsList = ExamDAOObj.getCurrentStudentsExamList(NetID);
	}
%>


<table class="table table-striped">
 
  <tr>
    <th>Exam ID</th>
    <th>Exam Name</th>
    <th>Exam Description</th>    
    <th>Exam Date</th>
    <th>Poster Net ID</th>
   </tr>
      <c:forEach items="${ExamList}" var="ExamListObj">
        <tr>
        	<td id="eid${ExamListObj.getExamid()}"> <c:out value="${ExamListObj.getExamid()}" /></td>
        	<td id="name${ExamListObj.getExamid()}"> <c:out value="${ExamListObj.getName()}" /></td>
        	<td id="descrip${ExamListObj.getExamid()}"> <c:out value="${ExamListObj.getDescription()}" /></td>
			<td id="examd${ExamListObj.getExamid()}" > <c:out value="${ExamListObj.getDateofexam()}" /></td>
		    <td id="posterid${ExamListObj.getExamid()}" > <c:out value="${ExamListObj.getPosternetid()}" /></td>
					    
			<c:set var="loopnetid" value="${ExamListObj.getPosternetid()}"/>
			<c:set var="loopexamid" value="${ExamListObj.getExamid()}"/>

			<%
			String loopnetid = (String)pageContext.getAttribute("loopnetid"); 
			String loopexamid = (String)pageContext.getAttribute("loopexamid"); 

			out.print("LoopExam ID "+ loopexamid);
			
			if((PersonObject instanceof Student))
			{
				if(-1 == StudentExamsList.indexOf(loopexamid))
				{
						out.print("New Exam For Student. ExamId "+ loopexamid);
				%>
				<td> <button  class="btn btn-primary" onclick="Register(this,${ExamListObj.getExamid()})" id="regi${ExamListObj.getExamid()}"> Register </button> </td>
				<%
				}
				else
				{
				%>				
				<td> <button  class="btn btn-primary" type="button"> Registered </button> </td>				
				<%
				}
			}
				%>
				
					
			<%
			//loopnetid = (String)pageContext.getAttribute("loopnetid"); 
			//loopexamid = (String)pageContext.getAttribute("loopnetid"); 
			//if(PersonObject != null)
			if((NetID.equals(loopnetid)))
			{
					out.print("Same NetID Found");
			%>
			<!--  
			
                        <button class="btn btn-primary" type="submit">Login <i class="fa fa-fw fa-unlock-alt"></i></button>
			-->
			<td> <button class="btn btn-primary" type="button" onclick="HandleDelete(this)" id="${ExamListObj.getExamid()}" > Edit </button> </td>
			<td> <button  class="btn btn-primary" onclick="Handle(this,${ExamListObj.getExamid()})" id="del${ExamListObj.getExamid()}"> Delete </button> </td>
			<%
			}
			%>				
		
      </tr>
      </c:forEach>
      			

</table>
	
	



			</div>
			<!--/row-->
		</div>
	</div>
	<!--/.container-->
	
	
	
<script>

function Register(obj,val) {
	var id = obj.id;
	
	document.getElementsByName("hiddenPara")[0].value = val;
	document.getElementsByName("operation")[0].value = "register";
		
	return false;
}


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
	document.getElementById("description").value=document.getElementById("descrip"+id).innerHTML;
	document.getElementById("name").value=document.getElementById("name"+id).innerHTML;
	document.getElementById("dateofexam").value=document.getElementById("examd"+id).innerHTML;
	
    var elem = document.getElementById("dotask");
    elem.firstChild.data = "Edit Exam";
	
	//document.getElementById("netid").disabled = "true";
	//document.getElementById("firstname").disabled = "true";
	//document.getElementById("lastname").disabled = "true";
	//document.getElementById("status").disabled = "true";
	
	return false;
}
</script>

</form>
</body>
</html>
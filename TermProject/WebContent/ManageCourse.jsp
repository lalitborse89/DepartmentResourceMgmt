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
				
				
<form action="CourseServlet" method = "post">

<%
Person PersonObject;
List<Course> CourseList;

PersonObject = (Person) session.getAttribute("PersonObject");
//String UserInfo = (String) session.getAttribute("UserInfo");
if(null == PersonObject)
{	response.sendRedirect("login.jsp");
	return;
}

List<String> StaffCourseList = null;
String NetID = (String) session.getAttribute("NetID");

CourseDAO CourseDAOObj = new CourseDAO();

StaffCourseList = CourseDAOObj.GetStaffCourseList(NetID);

CourseList = CourseDAOObj.GetAllCourseInfo();

out.print("The length is "+ CourseList.size());
//out.print((String) session.getAttribute("NetID"));
request.setAttribute("CourseList", CourseList);

%>
<input type ="hidden" name="hiddenPara" value="default"/>
<input type ="hidden" name="operation" value="postcourse"/>

<%
	Student StudentObj = null;
	if(!(PersonObject instanceof Student))
	{
			out.print("Not Student object found.");
			//courseid, coursename, category, basicsyllabus, credit, isvariablecredit
	%>
	<table class="table table-striped">
	<tr>
	<td>Course Name: <input type="text" name="coursename" id="coursename"></td>
	<td>Category : <input type="text" name="category" id="category"></td>
	<tr>
	<td>Basic Syllabus : <input type="text" name="basicsyllabus" id="basicsyllabus"></td>
	<td>Credit : <input type="text" name="credit" id="credit"></td>
	<tr>
	<td>Is variable Credit: <input type="text" name="isvariablecredit" id="isvariablecredit"></td>
	</tr>
	</table><br>	
	<button id="dotask" class="btn btn-primary" > &nbsp;&nbsp; Add New Course </button><br><br>
	<%
	}
%>


<table class="table table-striped">
 
  <tr>
    <th>Course Name</th>
    <th>Category</th>
    <th>Basic Syllabus</th>
    <th>Credit</th>
    <th>Is variable credit</th>
   </tr>
      <c:forEach items="${CourseList}" var="CourseListObj">
        <tr>
        	<td id="cname${CourseListObj.getCourseid()}"}> <c:out value="${CourseListObj.getCoursename()}" /></td>
			<td id="cat${CourseListObj.getCourseid()}" > <c:out value="${CourseListObj.getCategory()}" /></td>
		    <td id="syl${CourseListObj.getCourseid()}" > <c:out value="${CourseListObj.getBasicsyllabus()}" /></td>
			<td id="cred${CourseListObj.getCourseid()}"> <c:out value="${CourseListObj.getCredit()}" /></td>
			<td id="isvari${CourseListObj.getCourseid()}"> <c:out value="${CourseListObj.getIsvariablecredit()}" /></td>

			<c:set var="courseid" value="${CourseListObj.getCourseid()}"/>


			<%
			String loopnetid = (String)pageContext.getAttribute("courseid"); 

			if((PersonObject instanceof Faculty))
			{
				if(-1 == StaffCourseList.indexOf(loopnetid))
				{
						//out.print("New Exam For Student. ExamId "+ loopexamid);
				%>
				<td> <button  class="btn btn-primary" onclick="HandleTeach(this,${CourseListObj.getCourseid()})" id="teach${CourseListObj.getCourseid()}"> Teach </button> </td>
				<%
				}
				else
				{
				%>				
				<td> <button  class="btn btn-primary" type="button"> Teaching </button> </td>				
				<%
				}
			}
				%>

			<%
			//loopnetid = (String)pageContext.getAttribute("loopnetid"); 
			//loopexamid = (String)pageContext.getAttribute("loopnetid"); 
			//if(PersonObject != null)
			if(!(PersonObject instanceof Student))
			{
					//out.print("Same NetID Found");
			%>
			<!--  
			
                        <button class="btn btn-primary" type="submit">Login <i class="fa fa-fw fa-unlock-alt"></i></button>
			-->
			<td> <button  class="btn btn-primary" onclick="HandleDelete(this,${CourseListObj.getCourseid()})" id="del${CourseListObj.getCourseid()}"> Delete </button> </td>


			<td> <button class="btn btn-primary" type="button" onclick="HandleEdit(this)" id="${CourseListObj.getCourseid()}" value="delete"> Edit</button> </td>
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


function HandleTeach(obj, cid) {
	//alert("hello");
	var id = obj.id;
	//alert(id);
	//alert(document.getElementById("fname"+id).innerHTML);
	document.getElementsByName("hiddenPara")[0].value = cid;
	document.getElementsByName("operation")[0].value = "teach";	
	return false;
}


function HandleDelete(obj, cid) {
	//alert("hello");
	var id = obj.id;
	//alert(id);
	//alert(document.getElementById("fname"+id).innerHTML);
	document.getElementsByName("hiddenPara")[0].value = cid;
	document.getElementsByName("operation")[0].value = "delete";	
	return false;
}

function HandleEdit(obj) {
	//alert("hello");
	var id = obj.id;
	//alert(id);

	document.getElementsByName("hiddenPara")[0].value = id;
	document.getElementsByName("operation")[0].value = "edit";
		
    var elem = document.getElementById("dotask");
    elem.firstChild.data = "Edit Course";
	
	document.getElementById("coursename").value=document.getElementById("cname"+id).innerHTML;;
	document.getElementById("category").value=document.getElementById("cat"+id).innerHTML;;
	document.getElementById("basicsyllabus").value=document.getElementById("syl"+id).innerHTML;;
	document.getElementById("credit").value=document.getElementById("cred"+id).innerHTML;;
	document.getElementById("isvariablecredit").value=document.getElementById("isvari"+id).innerHTML;;
	
	return false;
}

</script>


</body>
</html>
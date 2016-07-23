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

	<%
 
						Person PersonObject;


						PersonObject = (Person) session.getAttribute("PersonObject");
						//String UserInfo = (String) session.getAttribute("UserInfo");
						if(null == PersonObject)
						{	response.sendRedirect("login.jsp");
							return;
						}
						%>




				<div id=project>
					<table class="table table-striped">
						<form action="UpdateProfileServlet">
						<tbody>
							<tr>
								<td>


									<h5>
										<strong>UAlbany Board</strong>
									</h5> First Name: <input name="firstname"
									value=<%out.print(PersonObject.getFirstname());%> readonly><br>
								</td>
							</tr>
							<tr>
								<td>Last Name: <input name="lastname"
									value=<%out.print(PersonObject.getLastname());%> readonly><br>
								</td>
							</tr>
							<tr>
								<td>Net ID: <input name="netid"
									value=<%out.print(PersonObject.getNetid()); %> readonly><br>
								</td>
							</tr>
							<tr>
								<td>Contact Number: <input name="contact"
									value=<%out.print(PersonObject.getContact()); %> required><br>
								</td>
							</tr>

							<tr>
								<td>Email ID: <input name="emailid"
									value=<%out.print(PersonObject.getEmailid()); %> required><br>

								</td>
							</tr>



							<tr>
								<td>
                            
                       
                        <%
                            Student StudentObj = null;
                            if(PersonObject instanceof Student)
                            {
                                    StudentObj = (Student)PersonObject;
                                    out.print("Student object found.");
                            %>
							Advisor:
							<input name="advisorname"
								value=<% if(StudentObj.getAdvisorname() != null) out.print(StudentObj.getAdvisorname());%>>
							<br>
							<%
                            }
                            %>

							</td>
							</tr>



							<tr>
								<td>


									<button class="btn btn-primary" type="submit">
										Update <i class="fa fa-fw fa-unlock-alt"></i>
									</button>



								</td>

							</tr>
							
                  </form>                           
                
                    
						</tbody>
                </table>

    </div>

       <a href="#">About US</a> | <a href="#">@ SE 2016 Amol Shete</a>
          
      </div>
			<!--/row-->
    </div>
</div>
	<!--/.container-->







						
						
						
						

</body>
</html>

<!--
//////////////////////////////


































</body>
</html>


<!-- 


<body>


                    
</body>

</html>











































 -->



  -->

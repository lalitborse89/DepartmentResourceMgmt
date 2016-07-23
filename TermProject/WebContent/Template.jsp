<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>TEMPLATE AHE HE </title>
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
				<li><a href="#">PHD Students</a></li>
				<li><a href="#">Job Announcement</a></li>
				<li><a href="#">Event</a></li>
				<li><a href="#">News</a></li>
				<li><a href="#">Discussion Forum</a></li>

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
					<li class="active"><a href="#">News</a></li>
					<li><a href="ManageJob.jsp">Jobs</a></li>
					<li><a href="ManageEvent.jsp">Events</a></li>


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
				<table class="table table-striped">


				</table>

			</div>
			<!--/row-->
		</div>
	</div>
	<!--/.container-->
</body>
</html>
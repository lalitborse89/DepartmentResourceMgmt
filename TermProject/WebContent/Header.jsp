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

<meta name="generator" content="Bootply" />
<meta name="viewport"
    content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<link href="css/styles.css" rel="stylesheet">




<title>University Board</title>

</head>






                        <%
                        
                        String NetID;
                        Person PersonObject;
                        PersonObject = (Person) session.getAttribute("PersonObject");
                        NetID = (String) session.getAttribute("NetID");
                     //   out.print("NetID "+ NetID);
                        //String UserInfo = (String) session.getAttribute("UserInfo");
                        if(null == PersonObject)
                        {    response.sendRedirect("login.jsp");
                            return;
                        }
                        %>


                        
                        
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
            <a class="navbar-brand" href="home.jsp">University Board</a>
        </div>

        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-center">
                <li><a href="ManageNews.jsp">Announcement</a></li>
                <li><a href="ViewResource.jsp">Resources</a></li>
                <li><a href="ManageCourse.jsp">Course</a></li>
                <li><a href="viewdiscussforum.jsp">Discussion Forum</a></li>
                <li><a href="ViewAlumniInfo.jsp">Alumni Information</a></li>
                <li><a href="ManageExam.jsp">Exams</a></li>
                <li><a href="editprofile.jsp">Edit Profile</a></li>

                <%
                if(!(PersonObject instanceof Student))
                {
                %>    
                <li><a href="managephdstudent.jsp">PHD Students</a></li>
                <%
                }
                %>

                <li><a href="logout.jsp"> Log Out</a></li>
            </ul>

        </div>
    </div>
    </nav>

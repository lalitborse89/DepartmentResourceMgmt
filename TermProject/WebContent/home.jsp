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
<%@ include file="Header.jsp"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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
String FirstName="";
String ID;

 PersonObject = (Person) session.getAttribute("PersonObject");
	//String UserInfo = (String) session.getAttribute("UserInfo");
	if(null != PersonObject)
	{
		FirstName = PersonObject.getFirstname();
		ID = PersonObject.getNetid();
	}
	else
	{
 		response.sendRedirect("login.jsp");
		return;
	}
	
%>
<h3>Welcome To University Board<br> 
<strong><% out.print(FirstName); %></strong>  <br>
<br></h3>

   	<%
	if (request.getAttribute("Info") == null || request.getAttribute("Info").equals(""))
	{
		//STILL
		//out.print("Info is not set<br>");
	}
	else
	{
		//out.print("2nd Time");
		String Info = (String) request.getAttribute("Info");
		//out.print(Error);
		
		if ((Info.equalsIgnoreCase("Updated")))
		{
			out.print("<font color=green>User Information is Updated!.</font> <br>");
		}
	}
	%>
<div id=project>
<table class="table table-striped">
                    <tbody>
                        <tr>
                            <td><h5><strong>UAlbany Board</strong></h5>
                           
                            </td>
                       
                        </tr>
                
                    </tbody>
                </table>

    </div>

          
      </div><!--/row-->
    </div>
</div><!--/.container-->


<%@ include file="footer.jsp"%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.Console"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="termp.model.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="./jquery.datetimepicker.css" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<style type="text/css">
.input {
	
}

.input-wide {
	width: 500px;
}

#red {
	color: red;
}
</style>
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
				<br> <br>
				<ul class="nav nav-sidebar">
					<li class="active"><a href="#">Resources</a></li>
					<li><a href="http://bootstrapzero.com" target="_ext">View</a></li>
					<li><a href="AddResource.jsp">Add</a></li>
					<li><a href="BookResource.jsp">Book</a></li>
					<li><a href="https://wrapbootstrap.com?ref=skelly"
						target="_ext">cancel</a></li>


				</ul>


			</div>
			<!--/span-->
			<span><br> <br></span>
			<div class="col-sm-9 col-md-10 main">

				<!--toggle sidebar button-->
				<p class="visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">
						<i class="glyphicon glyphicon-chevron-left"></i>
					</button>
				</p>

				<!--  <h1>HERE</h1>
                <select id="Resourcetype" name="Resourcetype"
                    onchange="showcont(this.name)">
                    <option>Select Resource</option>
                    <option>Projector</option>
                    <option>Book a Room.</option>
                    <option>Headphone</option>

                </select> -->





				<!--               <div id="baburao">

room 
projector
headphone



resourceid, category, name, capacity, configuration, company, description, maxviewablesize, minimumviewablesize, displaytype, inputtype, dimension, resourceid, id

   -->
				<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://localhost:3306/termp" user="root" password="root" />
				<%-- <c:set var="num" value="room"/>
 --%>
				<%-- <c:out value="${ 'num'}" /> --%>
				<%--  <c:out value="${stud.num}" />
 --%>







				<%--                  <select id="Resourcedetail" name="Resourcedetail"
                    onchange="showcontentof(this.name)">
                
                <c:foreach>
                    <option>${} </option>
<!--                     <option>Projector</option>
                    <option>Book a Room.</option>
                    <option>Headphone</option>
 -->
                </select>
                </c:foreach>
 --%>


				<!--  <input type="text" id="datetimepicker12" />
                -->

				<a href="BookResource.jsp">Choose Another Time</a>

				<hr>
				<%
HttpSession a= request.getSession();
String msg=(String)a.getAttribute("msgg");
int rid=1;
//(Integer)a.getAttribute("resourceid");
out.print("REsourceid-->"+rid);
rid=1;
out.print("REsourceid<>-->"+rid);
pageContext.setAttribute("rid", rid);
//(String)request.getAttribute("msgg");
%>


				<div id="red">
					<h2>
						<strong> <%   
if(msg!=null){
//out.println(msg);
}
%>
						</strong> <br>
					</h2>
				</div>

				<h3>Bookings for the Resource</h3>
				<br> here
				<c:out value="${rid}" />
				<sql:query var="listMenu" dataSource="${myDS}">
                    select * from registerexam join exam  where  registerexam.examid = exam.examid
                    
                    <%--       <sql:param value="${'1'}" />
                     --%>       
				</sql:query>

				<form action="ResultExamServlet" method="POST">

					<table class="table table-striped">
						<tbody>
							<tr>
								<th>Student NetID</th>
								<th>name</th>
								<th>Date of Exam</th>
								<th>Marks</th>
							</tr>
							<c:set var="markid" value="${1}" />
							<c:forEach var="stud" items="${listMenu.rows}">

								<tr>

									<td><c:out value="${stud.studentnetid}" /></td>
									<td><c:out value="${stud.name}" /></td>
									<td><c:out value="${stud.dateofexam}" /></td>
									<td>
						 <input type="text" name="${stud.regexamid}" value="${stud.mark}"> 
						 <c:set var="markid" value="${ markid + 1}" />
						  <c:out value="${stud.regexamid}" /> 
						  
						
									</td>

									<td></td>
								</tr>

							</c:forEach>
<tr>
<td>
<button type="submit">Enter Marks</button>
</td>
</tr>

						</tbody>
					</table>
					
					






				</form>










				<%--            <div id=project>



                    <sql:query var="listMenu" dataSource="${myDS}">
                           select * from resource where category = ?  
                         <sql:param value="${'projector'}" />
                    </sql:query>
                 
            <select id="Resourcedetail1" name="Resourcedetail1" onchange="showcontent1(this.name)">
                    <option>Select Resource</option>
                    <c:forEach var="stud" items="${listMenu.rows}">
                    <option value="${stud.resourceid}"><c:out value="${stud.name}" /></option>

                    </c:forEach>

               </select>

                    <table class="table table-striped">
                        <tbody>
                            <tr>
                            </tr>

                        </tbody>
                    </table>

                </div>

 --%>
				<%--                 <div id=Room>
                    <sql:query var="listMenu" dataSource="${myDS}">
                        select *from resource where category = ?  
                       <sql:param value="${'room'}" />
                    </sql:query>
                    <select id="Resourcedetail2" name="Resourcedetail2" onchange="showcontent2(this.name)">
                    <option>Select Resource</option>
                    <c:forEach var="stud" items="${listMenu.rows}">
                    <option value="${stud.resourceid}"><c:out value="${stud.name}" /></option>

                    </c:forEach>

               </select>
                </div>

 --%>
				<%--                 <div id=headphone>

                    <sql:query var="listMenu" dataSource="${myDS}">
                       select *from resource where category = ?  
                        <sql:param value="${'headphone'}" />
                    </sql:query>
                    <select id="Resourcedetail3" name="Resourcedetail3" onchange="showcontent3(this.name)">
                    <option>Select Resource</option>
                    <c:forEach var="stud" items="${listMenu.rows}">
                    <option value="${stud.resourceid}"><c:out value="${stud.name}" /></option>

                    </c:forEach>

               </select>
                </div> --%>

				<a href="#">About US</a> | <a href="#">@ SE 2016 Amol Shete</a>

			</div>
			<!--/row-->
		</div>
	</div>
	<!--/.container-->
	<script>
    var p,resourceid;
function showcont(ele)
{
p=document.getElementById("Resourcetype");

//alert(p.options[p.selectedIndex].text);
ele=p.options[p.selectedIndex].text;

    if (ele == "Projector") {
            $("#project").show();
            $("#Room").hide();
            $("#headphone").hide();
        } else if (ele == "Book a Room.") {
            $("#Room").show();
            $("#project").hide();
            $("#headphone").hide();
        } else if (ele == "Headphone") {
            $("#headphone").show();
            $("#Room").hide();
            $("#project").hide();
                    
        }
    }
</script>

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
	<script>
        $( document ).ready(function() {
                     $("#project").hide();
                     $("#Room").hide();
                     $("#headphone").hide();
        });
        </script>




	<script>
    function showcontent1(){
        resourceid= $( "#Resourcedetail1" ).val();
         alert(resourceid);
    }
    </script>

	<script>
    function showcontent2(){
        resourceid= $( "#Resourcedetail2" ).val();
         alert(resourceid);
    }
    </script>

	<script>
    function showcontent3(){
        resourceid= $( "#Resourcedetail3" ).val();
         alert(resourceid);
    }
    </script>




	<script>
    function getEntry(){
        p=document.getElementById("Resourcetype");
 //   alert(p.options[p.selectedIndex].text);
     //  document.getElementById("demo").innerHTML = $("#datetimepicker12").val();
        var x = $("#datetimepicker12").val();         
         var item=p.options[p.selectedIndex].text;
   //     alert("PP");
        /*  2016/04/05 19:54
        arr[0] --> 2016
        arr[1] --> 04
        arr[2] --> 05 19:54 
   */
   /*  year=arr[0];
    month=arr[1];
    str=arr[2];
    var arr1=str.split(' ');
    day= arr1[0];
    time=arr[1].split(':');
     */
     
     x=x+"/"+resourceid;
    //alert("MM");
   // x=x+resourceid;
   $.ajax({
        method: "POST",
        url: "./CheckAvailServlet",
        data: { q:x }
      })
        .done(function( msg ) {
          console.log( "Data Saved: " + msg );
        }); 
   
    
    }
    </script>

</body>
<script src="./jquery.js"></script>
<script src="build/jquery.datetimepicker.full.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
</html>

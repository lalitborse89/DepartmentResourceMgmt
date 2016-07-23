<%@ include file="Header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<div class="container-fluid">

	<div class="row row-offcanvas row-offcanvas-left">

		<div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar"
			role="navigation">
			<br> <br>

			<ul class="nav nav-sidebar">
				<li><a href="ViewResource.jsp">View</a></li>
				<li><a href="AddResource.jsp">Add</a></li>
				<li class="active"><a href="BookResource.jsp">Book</a></li>
				<li><a href="CancelResource.jsp">Cancel</a></li>
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

			<hr>

			<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost:3306/termp" user="root" password="root" />
		
		   <a href="BookResource.jsp">Choose Another Time</a>

			<hr>
<%
HttpSession a= request.getSession();
String msg=(String)a.getAttribute("msgg");

String rid =  request.getParameter("n");
//out.print("REsourceid-->"+rid);
//out.print("REsourceid<>-->"+rid);
pageContext.setAttribute("rid", rid);
//(String)request.getAttribute("msgg");
%>


			<div id="red">
				<h2>
					<strong>
						<%   
if(msg!=null){
out.println(msg);
}
%>
					</strong> <br>
				</h2>
			</div>

			<h3>Bookings for the Resource</h3>
			<br> <!-- here -->
			<c:out value="${rid}" />
			<sql:query var="listMenu" dataSource="${myDS}">
                           select * from resoucebook where resourceid = ?  
                         <sql:param value="${rid}" />
			</sql:query>



			<table class="table table-striped">
				<tbody>
					<tr>
						<th>Date</th>
						<th>Start Time</th>
					</tr>
					<c:forEach var="stud" items="${listMenu.rows}">

						<tr>
							<!--     bookernetid, resourceid, bookdate, timestart, resbookid, resbookid, id
                         -->

							<td><c:out value="${stud.bookdate}" /></td>
							<td><c:out value="${stud.timestart}" /></td>
							<td></td>
					</c:forEach>

					</tr>

				</tbody>
			</table>

		</div>
		<!--/row-->
	</div>
</div>
<!--/.container-->

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
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
    function getEntry(){
        p=document.getElementById("Resourcetype");
 //   alert(p.options[p.selectedIndex].text);
     //  document.getElementById("demo").innerHTML = $("#datetimepicker12").val();
        var x = $("#datetimepicker12").val();         
         var item=p.options[p.selectedIndex].text;
     
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

<%@ include file="footer.jsp"%>	
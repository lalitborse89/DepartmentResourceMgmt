<%@ include file="Header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

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
</style>
</head>
<body>

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

				<h1>HERE</h1>
				<select id="Resourcetype" name="Resourcetype"
					onchange="showcont(this.name)">
					<option>Select Resource</option>
					<option>Projector</option>
					<option>Book a Room.</option>
					<option>Headphone</option>

				</select>





				<!--               <div id="baburao">

room 
projector
headphone



resourceid, category, name, capacity, configuration, company, description, maxviewablesize, minimumviewablesize, displaytype, inputtype, dimension, resourceid, id

   -->
				<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://localhost:3306/termp" user="root"
					password="root" />
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


				<input type="text" id="datetimepicker12" />
				<button onclick="getEntry()">Check Availabilty</button>


				<hr>
<%
//String msg=(String)request.getAttribute("msgg");
                                   
  //  out.println(msg);

%>

				<div id=project>



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


				<div id=Room>
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


				<div id=headphone>

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
				</div>

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
   
window.location.href="BookResouce.jsp?n="+resourceid;
    
    }
    </script>

</body>
<script src="./jquery.js"></script>
<script src="build/jquery.datetimepicker.full.js"></script>
<script>

var dateToDisable = new Date();
    dateToDisable.setDate(dateToDisable.getDate() + 2);
$('#datetimepicker11').datetimepicker({
    beforeShowDay: function(date) {
        if (date.getMonth() == dateToDisable.getMonth() && date.getDate() == dateToDisable.getDate()) {
            return [false, ""]
        }

        return [true, ""];
    }
});
 

$('#datetimepicker12').datetimepicker({
    beforeShowDay: function(date) {
        if (date.getMonth() == dateToDisable.getMonth() && date.getDate() == dateToDisable.getDate()) {
            return [true, "custom-date-style"];
        }

        return [true, ""];
    }
});

$('#datetimepicker_dark').datetimepicker({theme:'dark'})


</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<%@ include file="footer.jsp"%>	
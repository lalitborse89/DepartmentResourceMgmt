<%@ include file="Header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">


<div class="container-fluid">

	<div class="row row-offcanvas row-offcanvas-left">

		<div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar"
			role="navigation">
			<br> <br>
			<ul class="nav nav-sidebar">
				<li><a href="ManageNews.jsp">News</a></li>
				<li><a href="ManageJob.jsp">Jobs</a></li>
				<li class="active"><a href="ManageEvent.jsp">Events</a></li>


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

			<form action="ManageEventServlet" method="post">

				<%
					//String NetID;
					//Person PersonObject;
					List<Event> EventList;

					NetID = (String) session.getAttribute("NetID");
					//out.print("NetID " + NetID);

					PersonObject = (Person) session.getAttribute("PersonObject");
					//String UserInfo = (String) session.getAttribute("UserInfo");
					if (null == PersonObject) {
						response.sendRedirect("login.jsp");
						return;
					}
				%>
				<%
					EventDAO EventDAOObj = new EventDAO();

					EventList = EventDAOObj.GetAllEventInfo();
					//out.print("The length is " + EventList.size());
					//out.print((String) session.getAttribute("NetID"));
					request.setAttribute("EventList", EventList);
				%>
				<input type="hidden" name="hiddenPara" value="default" /> <input
					type="hidden" name="operation" value="posttopic" />

				<%
					Student StudentObj = null;
					if (!(PersonObject instanceof Student)) {
						//out.print("Not Student object found.");
				%>
				<table style="width: 100%">
					<tr>
						<td>Description: <input type="text" name="description"
							id="description"></td>
						<td>Start Event Date : <input type="date" name="startdate"
							id="startdate" placeholder="yyyy-mm-dd"></td>
						<td>End Event Date: <input type="date" name="enddate"
							id="enddate" placeholder="yyyy-mm-dd"></td>
					</tr>
				</table>
				<br>
				<button class="btn btn-primary" id="dotask">
					&nbsp;&nbsp;Create New Event</button>
				<br>
				<br>
				<%
					}
				%>


				<table class="table table-striped">

					<tr>
					<!--  	<th>Event ID</th> -->
						<th>Description</th>
						<!--<th>Poster Net ID</th>  -->
					<!-- <th>Original Posted Date</th> -->	
						<th>Start Event Date</th>
						<th>End Event Date</th>
					</tr>
					<c:forEach items="${EventList}" var="EventListObj">
						<tr>
						<!--	<td id="eid${EventListObj.getEventid()}"><c:out
									value="${EventListObj.getEventid()}" /></td>  -->
							<td id="descrip${EventListObj.getEventid()}"><c:out
									value="${EventListObj.getDescription()}" /></td>
						<!--  	<td id="posterid${EventListObj.getEventid()}"><c:out
									value="${EventListObj.getPosternetid()}" /></td>-->
						<!--  	<td id="postdate${EventListObj.getEventid()}"><c:out
									value="${EventListObj.getPosteddate()}" /></td>-->
							<td id="startd${EventListObj.getEventid()}"><c:out
									value="${EventListObj.getStartdate()}" /></td>
							<td id="endd${EventListObj.getEventid()}"><c:out
									value="${EventListObj.getEnddate()}" /></td>

							<c:set var="loopnetid" value="${EventListObj.getPosternetid()}" />

							<%
								String loopnetid = (String) pageContext.getAttribute("loopnetid");
									//out.println("LoopNetId " + loopnetid);
									if ((NetID.equals(loopnetid))) {
										//out.print("Same NetID Found");
							%>
							<td>
								<button class="btn btn-primary" type="button"
									onclick="HandleDelete(this)" id="${EventListObj.getEventid()}"
									value="delete1">Edit</button>
							</td>
							<td>
								<button class="btn btn-primary"
									onclick="Handle(this,${EventListObj.getEventid()})"
									id="del${EventListObj.getEventid()}" value="delete1">
									Delete</button>
							</td>
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
	//document.getElementById("eventid").value=id;
	document.getElementById("startdate").value=document.getElementById("startd"+id).innerHTML;
	document.getElementById("enddate").value=document.getElementById("endd"+id).innerHTML;
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
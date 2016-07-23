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
					<li class="active"><a href="ManageNews.jsp">News</a></li>
					<li ><a href="ManageJob.jsp">Jobs</a></li>
					<li ><a href="ManageEvent.jsp">Events</a></li>


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
				<form action="ManageNewsServlet" method = "post">
						<%
						
						List<News> NewsList;
						
						NetID = (String) session.getAttribute("NetID");
						//out.print("NetID "+ NetID);
						
						PersonObject = (Person) session.getAttribute("PersonObject");
						//String UserInfo = (String) session.getAttribute("UserInfo");
						if(null == PersonObject)
						{	response.sendRedirect("login.jsp");
							return;
						}
						%>
<% 
NewsDAO NewsDAOObj = new NewsDAO();

NewsList = NewsDAOObj.GetAllJobInfo();
//out.print("The length is "+ NewsList.size());
//out.print((String) session.getAttribute("NetID"));
request.setAttribute("NewsList", NewsList);

%>
<input type ="hidden" name="hiddenPara" value="default"/>
<input type ="hidden" name="operation" value="posttopic"/>

<%
	Student StudentObj = null;
	if(!(PersonObject instanceof Student))
	{
		//	out.print("Not Student object found.");
	%>
	<table class="table table-striped">
	<tr>
	<td>
	<textarea rows="4" cols="150" name="description" id="description" placeholder="Enter News here..."></textarea></td>
	</tr>
	</table><br>	
	<button id="dotask"> &nbsp;&nbsp;Post New News</button><br><br>
	<%
	}
%>


<table class="table table-striped">
 
  <tr>
    <!-- <th>News ID</th> -->
    <th>News</th>
   <!-- <th>Poster Net ID</th> --> 
    <th>Original Posted Date</th>
   </tr>
      <c:forEach items="${NewsList}" var="NewsListObj">
        <tr>
       <!-- <td id="nid${NewsListObj.getNewsid()}"> <c:out value="${NewsListObj.getNewsid()}" /></td>-->
        	<td id="descrip${NewsListObj.getNewsid()}"> <c:out value="${NewsListObj.getDescription()}" /></td>
		<!--<td id="posterid${NewsListObj.getNewsid()}" > <c:out value="${NewsListObj.getPosternetid()}" /></td>  -->
		    <td id="postdate${NewsListObj.getNewsid()}" > <c:out value="${NewsListObj.getPosteddate()}" /></td>
			
			<c:set var="loopnetid" value="${NewsListObj.getPosternetid()}"/>
		
			<%
			String loopnetid = (String)pageContext.getAttribute("loopnetid"); 
			
			NetID = (String) session.getAttribute("NetID");
			//out.print("NetID "+ NetID);
			
		//	out.println("LoopNetId "+ loopnetid);
			
			if(null!=loopnetid)
			if((NetID.equals(loopnetid)))
			{
					//out.print("Same NetID Found");
			%>
			<td> <button type="button" onclick="HandleDelete(this)" id="${NewsListObj.getNewsid()}" > Edit </button> </td>
			<td> <button onclick="Handle(this,${NewsListObj.getNewsid()})" id="del${NewsListObj.getNewsid()}"> Delete </button> </td>
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
	document.getElementsByName("operation")[0].value = "edit";
	//document.getElementById("eventid").value=id;
	document.getElementById("description").value=document.getElementById("descrip"+id).innerHTML;
		
    var elem = document.getElementById("dotask");
    elem.firstChild.data = "Edit News";
	
	//document.getElementById("netid").disabled = "true";
	//document.getElementById("firstname").disabled = "true";
	//document.getElementById("lastname").disabled = "true";
	//document.getElementById("status").disabled = "true";
	
	return false;
}
</script>


<%@ include file="footer.jsp"%>
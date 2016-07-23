<%@ include file="Header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<div class="container-fluid">

	<div class="row row-offcanvas row-offcanvas-left">

		<div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar"
			role="navigation">
			<br> <br>

			<ul class="nav nav-sidebar">
				<li class="active"><a href="ViewResource.jsp">View</a></li>
				<li><a href="AddResource.jsp">Add</a></li>
				<li><a href="BookResource.jsp">Book</a></li>
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


			<form action="ManageResourceServlet" method="post">

<% 
String Operation = null;

List<Resource> ResourceList;

Operation = (String) session.getAttribute("Operation");
PersonObject = (Person) session.getAttribute("PersonObject");
if(null == PersonObject)
{	response.sendRedirect("login.jsp");
	return;	
}

ResourceDAO ResourceDAOObj = new ResourceDAO();
ResourceList = ResourceDAOObj.GetAllResource();

out.print("The length is "+ ResourceList.size());

out.print((String) session.getAttribute("NetID"));
request.setAttribute("ResourceList", ResourceList);
%>

				<input type="hidden" name="hiddenPara" value="default" /> <input
					type="hidden" name="operation" value="posttopic" />

				<table style="width: 100%" border=1>

					<tr>
						<th>Name</th>
						<th>Category</th>
						<th>Description</th>
						<th>company</th>
						<th>configuration</th>
						<th>Maxviewablesize</th>
						<th>Minimumviewablesize</th>
						<th>Displaytype</th>
						<th>Inputtype</th>
						<th>Dimension</th>
						<th>Capacity</th>


					</tr>
					<c:forEach items="${ResourceList}" var="ResourceObj">
						<tr>
							<%//out.print("In for"); %>
							<td><c:out value="${ResourceObj.getName()}" /></td>
							<td><c:out value="${ResourceObj.getCategory()}" /></td>
							<td><c:out value="${ResourceObj.getDescription()}" /></td>
							<td><c:out value="${ResourceObj.getCompany()}" /></td>
							<td><c:out value="${ResourceObj.getConfiguration()}" /></td>
							<td><c:out value="${ResourceObj.getMaxviewablesize()}" /></td>
							<td><c:out value="${ResourceObj.getMinimumviewablesize()}" /></td>
							<td><c:out value="${ResourceObj.getDisplaytype()}" /></td>
							<td><c:out value="${ResourceObj.getInputtype()}" /></td>
							<td><c:out value="${ResourceObj.getDimension()}" /></td>
							<td><c:out value="${ResourceObj.getCapacity()}" /></td>
						</tr>

					</c:forEach>
				</table>

			</form>
			</body>
</html>
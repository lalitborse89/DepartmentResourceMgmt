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

<form action="ViewDiscusServlet" method = "post">

<%
List<Discussion> DiscussionList;

PersonObject = (Person) session.getAttribute("PersonObject");
//String UserInfo = (String) session.getAttribute("UserInfo");
if(null == PersonObject)
{	response.sendRedirect("login.jsp");
	return;
}
 
DiscusionDAO DiscussionDAOObj = new DiscusionDAO();

DiscussionList = DiscussionDAOObj.GetDiscussion();
//out.print("The length is "+ DiscussionList.size());
//out.print((String) session.getAttribute("NetID"));
request.setAttribute("DiscussionList", DiscussionList);

%>
<input type ="hidden" name="hiddenPara" value="default"/>
<input type ="hidden" name="operation" value="posttopic"/>

<%
	Student StudentObj = null;
	if(!(PersonObject instanceof Student))
	{
		//	out.print("Not Student object found.");
	%>
	New Topic Title: <input type="text" name="newtopic" id="newtopic"> 
	<button > &nbsp;&nbsp; Create New Topic </button>
	<%
	}
%>


<table class="table table-striped" border=1>
 
  <tr>
    <th>Topic Title: Poster</th>
    <th>Discussion </th>
   </tr>
   
      <c:forEach items="${DiscussionList}" var="DicussionObj">
        <tr>
        	<%//out.print("In for"); %>
            <td> <c:out value="${DicussionObj.getMessage()}" />
            <!-- <td> <input type="radio" name="TXT" value="${TagFeed.ID}"> <c:out value="${TagFeed.ID}" /> <br> -->
    		<!-- <td> <a href="hashfeedcommentreply.jsp?hashtag=<c:out value="${TagFeed.hashtag}"/>&ID=<c:out value="${TagFeed.ID}"/>"> Reply </a></td> -->
			<%--  <td> <c:out value="${DicussionObj.duscussionid}" /></td>
			 --%>
			 <a href="#" onclick="HandleReply(this, ${DicussionObj.getDuscussionid()})"> &nbsp;&nbsp; Reply</a> 
			 </td>
			<div id=<c:out value= "amol${DicussionObj.getDuscussionid()}"/> style="visibility:hidden"> 
			<input type="text" name="${DicussionObj.getDuscussionid()}" /> 
			 <button type="submit" name="post_comment" > Post Comment </button></div> 
       <td>
        <c:forEach items="${DicussionObj.getDiscussDetailsdList()}" var="DiscussiondetailsObj">
           	<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           	 --><c:out value="${DiscussiondetailsObj.getReply()}" /> 
           	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <%
			if(!(PersonObject instanceof Student))
			{
					//out.print("Not Student object found.");
			%>
           	 <button class="btn btn-primary" onclick="HandleDelete(${DiscussiondetailsObj.getDuscussionreplyid()})" id="dooperation" value="delete" > Delete</button> 	
			<%
			}
			%><br><br>
          
        
        </c:forEach>
        
        </td>
        </tr>
     </c:forEach>

</table>



<script>


function HandleDelete(ID) {
	//return false;
	//alert("Hello");
	//alert(ID);
	document.getElementsByName("hiddenPara")[0].value = ID;
	document.getElementsByName("operation")[0].value = "delete";	
	//alert(operation);
	//document.getElementsByName("hiddenPara")[0].value = datais;
	//document.getElementsByName("operation")[0].value = operation;
	
	//document.getElementsByName("hiddenPara")[0].value = datais;
	//$('input[name=hiddenPara]').val(datais);
	//alert(document.getElementsByName("hiddenPara")[0].value);
	//datais = "amol" + datais;
	// alert(datais);
   // alert(document.getElementById(i));
   // document.getElementById(datais).style.visibility = "visible";
   return false;
}
</script>

<script>

function HandleReply(id, datais) {
	//alert(datais);
	document.getElementsByName("hiddenPara")[0].value = datais;
	document.getElementsByName("operation")[0].value = "reply";
	
	//document.getElementsByName("hiddenPara")[0].value = datais;
	//$('input[name=hiddenPara]').val(datais);
	//alert(document.getElementsByName("hiddenPara")[0].value);
	datais = "amol" + datais;
	// alert(datais);
   // alert(document.getElementById(i));
    document.getElementById(datais).style.visibility = "visible";
}
</script>

</form>
<%@ include file="footer.jsp"%>
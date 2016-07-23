<%@ page import= "termp.model.Registration" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	function a() {
		var x = document.getElementById("pd");
		var y = document.getElementById("rpd");
		submitok = "true";
		if (x.value == "") {
			alert("Enter Password");
			submitok = "false";
		}
		if (y.value == "") {
			alert("Enter Re-type Password");
			submitok = "false";
		}
		if (x.value != y.value) {
			alert("Password and  Re-type Password are not match");
			submitok = "false";
		} else {
			window.location.reload();
		}
	}
</script>


<% 
String FirstName="Not Resource Found";
int ID;
%>

<%
	Registration UserInfo = (Registration) session.getAttribute("UserInfo");
	
	if(null != UserInfo)
	{
		FirstName = UserInfo.getFname();
		ID = UserInfo.getUserID();
		
		//out.print(FirstName);
		//out.print(ID);
	}
	else
	{
 		response.sendRedirect("login.jsp");
	}
	
	out.print(FirstName);
	
%>
<form action="ResetPassword" method="post" onsubmit="a()">

Enter New Password: <input class="form-control" type="password" id="pd" name="password" placeholder="password" required >
Re-Enter New Password: <input class="form-control" type="password" id="rpd" name="repassword" placeholder="password" required >

<input type="submit" value= "Reset Password" >  
<a href="login.jsp"> Cancel</a>

</form>
</body>
</html>
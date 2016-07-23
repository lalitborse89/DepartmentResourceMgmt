<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="ForgetPasswordServlet">
                    	<input class="form-control" type="email" name="email" placeholder="Email">
                                  
                        <%

							if (request.getAttribute("error") == null || request.getAttribute("error").equals(""))
							{
								//out.print("First Time<br>");
							}
							else
							{
								//out.print("2nd Time");
								String Error = (String) request.getAttribute("error");
								//out.print(Error);
								
								if ((Error.equalsIgnoreCase("usernotfound")))
								{
									out.print("<font color=red>Email is not Registered.</font> <br>");
								}
							}
                          %>
                        
                        
                        <button class="btn btn-primary" type="submit">Get Password Reset Link<i class="fa fa-fw fa-unlock-alt"></i></button>
                        <a href="login.jsp"> Cancel</a>
                     </form>

</body>
</html>
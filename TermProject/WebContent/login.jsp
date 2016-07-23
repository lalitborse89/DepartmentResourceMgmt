<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Login | University Board</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--[if lt IE 9]>
            <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="css/styles.css" rel="stylesheet">
    </head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">University Board</a>
        </div>
        
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-center">
         
            <!-- <li><a href="Resources.jsp">Resources</a></li>
            <li><a href="#">Course</a></li>
            <li><a href="#">PHD Students</a></li>
            <li><a href="#">Job Announcement</a></li>
            <li><a href="#">Event</a></li>
            <li><a href="#">News</a></li>
            <li><a href="#">Discussion Forum</a></li>
             -->   
          </ul>
          
        </div>
      </div>
</nav>
<div class="container-fluid">
      
      <div class="row row-offcanvas row-offcanvas-left">
        
         <div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">
         <br><br>  
            <ul class="nav nav-sidebar">
            <img src="images/seal.jpg" alt="Seal" style="width:210px;height:250px;">
            
              <!-- <li class="active"><a href="#">Resources</a></li>
              <li><a href="http://bootstrapzero.com" target="_ext">View</a></li>
              <li><a href="AddResource.jsp">Add</a></li>
              <li><a href="BookResource.jsp">Book</a></li>
              <li><a href="https://wrapbootstrap.com?ref=skelly" target="_ext">cancel</a></li>
             -->
            
            </ul>
            
          
        </div><!--/span-->
        <span><br><br></span>
        <div class="col-sm-8 col-md-8 col-md-offset-1 main">
          
          <!--toggle sidebar button-->
          <p class="visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas"><i class="glyphicon glyphicon-chevron-left"></i></button>
          </p>
          
                 
          
          

<div id=project>
<table class="table table-striped">
                    <tbody>
                        <tr>
                            <td><h5><strong>UAlbany Board</strong></h5>

    <form action="LoginServlet">
                        Net ID: <input name="netid" placeholder="Net ID" value="as267691"><br><br>
                        Password: <input type="password" name="password" placeholder="Password" value="A"><br><br>
          <hr>
                       
                        <%

                            if (request.getAttribute("error") == null || request.getAttribute("error").equals(""))
                            {
                                //STILL
                                out.print("error not set<br>");
                            }
                            else
                            {
                                //out.print("2nd Time");
                                String Error = (String) request.getAttribute("error");
                                //out.print(Error);
                                
                                if ((Error.equalsIgnoreCase("usernotfound")))
                                {
                                    out.print("<font color=red>User is not Exist.</font> <br>");
                                }
                                else if ((Error.equalsIgnoreCase("alreadyexist")))
                                {
                                    out.print("<font color=red>Provided Net ID is already registered.</font> <br>");
                                }
                                else if ((Error.equalsIgnoreCase("invalidpassowrd")))
                                {
                                    out.print("<font color=red>Password is Incorrect.</font><br>");
                                }
                                else if ((Error.equalsIgnoreCase("chkmail")))
                                {
                                    out.print("<font color=red>Pelase check mail for reset password link.</font><br>");
                                }
                                else if ((Error.equalsIgnoreCase("passchange")))
                                {
                                    out.print("<font color=red>Pelase log in with your new credentials.</font><br>");
                                }
                                else
                                {
                                    out.print("<font color=red>Internal Error Occured, Please try later.</font><br>");                                  
                                }
                            }
                          %>
                        
                        
                        <button  class="btn btn-primary" type="submit">Login <i class="fa fa-fw fa-unlock-alt"></i></button>
                         &nbsp;&nbsp;<a href="forgetpassword.jsp">Forgot password?</a>&nbsp; &nbsp; 
                        <a href="register.jsp">Register Now</a> 
                       </form>




                           
                            </td>
                       
                        </tr>
                
                    </tbody>
                </table>

    </div>

       <a href="#">About US</a> | <a href="#">@ SE 2016 Amol Shete</a>
          
      </div><!--/row-->
    </div>
</div><!--/.container-->


                  	
</body>

</html>


























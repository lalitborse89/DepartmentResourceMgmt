<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Register | University Board</title>
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
       <form  action="Registration">
                        
                    <tbody>
                        <tr>
                            <td><h5><strong>UAlbany Board</strong></h5>
                           </td>
                       </tr>
                        <tr> 
                            <td>
                        First Name: <input name="firstname" placeholder="First Name" value="A" required><br>
                            </td>
                        </tr>
                        <tr> 
                            <td>
                       
                        
                        Last Name: <input name="lastname" placeholder="Last Name"  value="A" required><br>
                            </td>
                        </tr>
                        <tr> 
                            <td>


                       
                        Net ID: <input name="netid" placeholder="Net ID"  value="as267691" required><br>                                            

                            </td>
                        </tr>
                        <tr> 
                            <td>
                       
                        Contact Number: <input name="contact" placeholder="Contact Number" value="100"  required><br>

                            </td>
                        </tr>
                        <tr> 
                            <td>
                       
                        Password: <input type="password" name="password" placeholder="Password"  value="A" required><br>

                            </td>
                        </tr>
                        <tr> 
                            <td>
                       
                        Retype-Password: <input type="password" name="repassword" placeholder="Password"  value="A" required><br>
                            </td>
                        </tr>
                        <tr> 
                            <td>

                       
                        Date of Birth: <input name="dob" type="date" placeholder="Date of Birth"  value="02/02/1990" required><br>                                              
                            </td>
                        </tr>
                        <tr> 
                            <td>

                       
                        Gender: <input name="gender" type="radio" value="Male" checked > Male
                                <input name="gender" type="radio" value="Female"> Female<br>
                            </td>
                        </tr>
                        <tr> 
                            <td>

                       
                        Email ID: <input name="emailid" placeholder="Email ID"   value="A@a.com" required><br>
                            </td>
                        </tr>
                        <tr> 
                            <td>

                       
                        Semester: <input name="semester" type="radio" value="Spring" checked > Spring
                                <input name="semester" type="radio" value="Summer"> Summer
                                <input name="semester" type="radio" value="Fall"> Fall<br>                                                              
                            </td>
                        </tr>
                        <tr> 
                            <td>
                       
                        Joining Year: <input name="joiningyear" placeholder="Joining Year" value="2016" required><br>
                            </td>
                        </tr>
                        <tr> 
                            <td>

                       
                        Role: <select id="Role" name="Role" onchange ="HandleRole(this.name)">
                        <option>student</option>
                        <option>faculty</option>
                        <option>Staff</option>
                        </select><br><br>

<!--  
 <select id="Resourcetype" name="Resourcetype" onchange ="showcont(this.name)">
            <option>Select Resource</option>
            <option>Projector</option>
            <option>Book a Room.</option>
            <option>Headphone</option>
  
     </select>


-->




                            </td>
                        </tr>
                        <tr> 
                            <td>
                            
                        <div id=student>
                        Degree Type: <input name="degreetype" type="radio" value="BS"> BS
                                     <input name="degreetype" type="radio" value="BA"> BA
                                     <input name="degreetype" type="radio" value="MS" checked> MS       
                                     <input name="degreetype" type="radio" value="Ph.D"> Ph.D<br>   
                                     
                                     <input name="major" type="text"> Major<br> 
                                     
                                                
                        </div>
                            </td>
                        </tr>
                        
                        <tr> 
                            <td>
                        
                        <div id=faculty>
                        Department: <input name="deptnamefaculty" type="radio" value="Computer" checked> Computer Science
                                     <input name="deptnamefaculty" type="radio" value="NanoTech"> Nano Technology
                                     <input name="deptnamefaculty" type="radio" value="Biology"> Biology        
                                     <input name="deptnamefaculty" type="radio" value="Physics"> Physics<br>                
                        </div>
                            </td>
                        </tr>
                        
                        <tr> 
                            <td>


                        <div id=Staff>
                        Department: <input name="deptnamestaff"  type="radio" value="Computer" checked> Computer Science
                                     <input name="deptnamestaff" type="radio" value="NanoTech"> Nano Technology
                                     <input name="deptnamestaff" type="radio" value="Biology"> Biology      
                                     <input name="deptnamestaff" type="radio" value="Physics"> Physics              
                        </div>
                            
                            </td>
                        </tr>
                        <tr> 
                            <td>

                                                                              
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
                                else if ((Error.equalsIgnoreCase("alreadyexist")))
                                {
                                    out.print("<font color=red>User is already exists with this Net ID.</font><br>");
                                }
                                else
                                {
                                    out.print("<font color=red>Internal Error Occured, Please try later.</font><br>");                                  
                                }
                            }
                          %>                        
                            </td>
                        </tr>
                        <tr> 
                            <td>

                        <button class="btn btn-primary" type="submit">Register <i class="fa fa-fw fa-unlock-alt"></i></button>
                         <a href="forgetpassword.jsp">Forgot password?</a> 





                           
                            </td>
                       
                        </tr>
                
                    </tbody>
                        </form>

                </table>

    </div>

       <a href="#">About US</a> | <a href="#">@ SE 2016 Amol Shete</a>
          
      </div><!--/row-->
    </div>
</div><!--/.container-->








 <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/scripts.js"></script>
        <script>
        $( document ).ready(function() {
                     $("#faculty").hide();
                     $("#Staff").hide();
        });
        </script>
<script>
function HandleRole(input)
{
	//alert("Amol");

	RoleType=document.getElementById("Role");

	//alert(p.options[p.selectedIndex].text);
	RoleName=RoleType.options[RoleType.selectedIndex].text;
	
	
 /*  RoleType = document.getElementById("Role");

  RoleName = input.options[input.selectedIndex].text;
 */
  alert(RoleName);
 /* 
 student</option>
                        <option>faculty</option>
                        <option>staff
  */
	if (RoleName == "student") {
        $("#student").show();
        $("#faculty").hide();
        $("#OtherStaff").hide();
		} else if (RoleName == "faculty") {
			   $("#faculty").show();
		         
			$("#student").hide();
            $("#OtherStaff").hide();
		} else if (RoleName == "Staff") {
			 $("#Staff").show();
			$("#student").hide();
            $("#faculty").hide();
                	
		}
}

</script>

</body>

</html>

















                    
</body>

</html>














































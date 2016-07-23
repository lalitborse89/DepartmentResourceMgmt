	<%@ include file="Header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">


<div class="container-fluid">
      
      <div class="row row-offcanvas row-offcanvas-left">
        
         <div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">
         <br><br>  
            <ul class="nav nav-sidebar">
              <li ><a href="#">Resources</a></li>
              <li><a href="ViewResource.jsp">View</a></li>
              <li class="active"><a href="AddResource.jsp">Add</a></li>
              <li><a href="BookResource.jsp">Book</a></li>
              <li><a href="CancelResource.jsp">Cancel</a></li>
            
            
            </ul>
            
          
        </div><!--/span-->
        <span><br><br></span>
        <div class="col-sm-9 col-md-10 main">
          
          <!--toggle sidebar button-->
          <p class="visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas"><i class="glyphicon glyphicon-chevron-left"></i></button>
          </p>
          
          <h1>HERE</h1>
          <select id="Resourcetype" name="Resourcetype" onchange ="showcont(this.name)">
            <option>Select Resource</option>
            <option>Projector</option>
            <option>Book a Room.</option>
            <option>Headphone</option>
  
     </select>
          
          
          <hr>
<!-- projector:
projname
projconfiguration
projcompany
projdescription
projmaxviewablesize
projminimumviewablesize
projdisplaytype
projinputtype
projdimension

Headphone:
hpname
hpcompany
hpdescription
hpconfiguration

Room:
roomname
roomdescription
roomcapacity
 -->
<form action="ManageResourceServlet">
<input type ="hidden" name="operation" value="addresource"/>
<input type ="hidden" name="category" id="category" value="ghe"/>

<div id=project>
<table class="table table-striped">
                    <tbody>
                        <tr>
                            <td><h5><strong>Projector Name</strong></h5><input name=projname></td>
                        
                            <td><h5><strong>Projector Configuration</strong></h5><input name=projconfiguration></td>
                        </tr>
                        <tr>
                            <td><h5><strong>Projector Company</strong></h5><input name=projcompany></td>
                            <td><h5><strong>Projector Description</strong></h5>
                            <input name=projdescription></td>
                        </tr>
                        
                         <tr>
                            <td><h5><strong>Projector Max Size </strong></h5>
                            <input name=projmaxviewablesize>
                            </td>
                            <td><h5><strong>Projector Min Size </strong></h5>
                            <input name=projminimumviewablesize>
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td><h5><strong>Projector Display Type</strong></h5>
                            <input name=projdisplaytype>
                            </td>
                            <td><h5><strong> Projector InputType Compatibility(VGA/HDMI)</strong></h5>
                             <input name=projinputtype>
                           
                            </td>
                       
            <tr> </tr>
            
                            <td><h5><strong> Projector Dimension</strong></h5>
                             <input name=projdimension>
                           
                            </td>
                       
                        </tr>
            
                        
                
                    </tbody>
                </table>

    </div>
<div id=Room><table class="table table-striped">
                    <tbody>
<!-- name
description
capacity
 -->
                        <tr>
                            <td><h5><strong>Room Name</strong></h5><input name=roomname></td>
                        </tr>
                        <tr>
                            <td><h5><strong>Room Description</strong></h5><input name=roomdescription></td>
                        </tr>
                         <tr>
                            <td><h5><strong>Capacity</strong></h5>
                            <input name=roomcapacity></td>
                        </tr>
                         
                    </tbody>
                </table>
 </div>
<div id=headphone><table class="table table-striped">
                    <tbody>
        <!--name
company
description
configuration  -->
                        <tr>
                            <td><h5><strong>Head PhoneName</strong></h5><input name=hpname></td>
                        </tr>
                        <tr>
                            <td><h5><strong>Head Phone Company</strong></h5><input name=hpcompany></td>
                        </tr>
                        
                        
                        <tr>
                            <td><h5><strong>HeadPhone Description</strong></h5><input name=hpdescription></td>
                        </tr>
                        <tr>
                            <td><h5><strong>HeadPhone Configuration</strong></h5><input name=hpconfiguration></td>
                        </tr>
                                        
                    </tbody>
                </table>
 </div>
 <button type="submit" >
                    Submit 
                 </button>
</form>
       <a href="#">About US</a> | <a href="#">@ SE 2016 Amol Shete</a>
          
      </div><!--/row-->
    </div>
</div><!--/.container-->
<script>
function showcont(ele)
{
	
//	alert("Amol" );
p=document.getElementById("Resourcetype");

//alert(p.options[p.selectedIndex].text);
ele=p.options[p.selectedIndex].text;
	if (ele == "Projector") {
			$("#project").show();
			$("#Room").hide();
			$("#headphone").hide();
			//document.getElementById("category").value="projector";
	        $("#category").value="projector";
		    $('#category').attr( 'value', 'projector' );
//		    alert("BC3"+$("#category").value)
		
		} else if (ele == "Book a Room.") {
			$("#Room").show();
			$("#project").hide();
			$("#headphone").hide();

	        $("#category").value="room";
            $('#category').attr( 'value', 'room' );//    p.value="room";

			
            
		} else if (ele == "Headphone") {
			$("#headphone").show();
			$("#Room").hide();
			$("#project").hide();
		
			  //var p = document.getElementById("category");
              $("#category").value="headphone";
            $('#category').attr( 'value', 'headphone' );
              
            		
		}
	}
</script>

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
<%@ include file="footer.jsp"%>
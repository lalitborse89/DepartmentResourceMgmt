package termp.controller;

import termp.dao.registrationDAO;
import termp.model.*;
import termp.util.ProjectConstants;
import termp.util.StringConstant;

import java.io.IOException;
//import java.util.Date;
import java.sql.Date;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private registrationDAO registrationDao;	
        
    public Registration() {
        super();
        registrationDao = new registrationDAO();

        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Staff StaffObj = null;
		Person PersonObject = null;
		Student StudentObj = null;
		Faculty FacultyObj = null;
		ProjectConstants ProjConst;

		String netid = request.getParameter("netid");
		
	    ProjConst = registrationDao.CheckValidNetIDandGetType(netid);
	    switch(ProjConst)
	    {
	    	case SUCCESS:
				 request.setAttribute("error", "alreadyexist");

				 break;
	    }		
		
	    if(ProjectConstants.SUCCESS == ProjConst)
	    {
		   RequestDispatcher Dispatch = request.getRequestDispatcher("register.jsp");
		   Dispatch.forward(request, response);       
			 
		   return;
	    }

		String UserType = request.getParameter("role");
		
	    if(UserType.contentEquals(StringConstant.USER_TYPE_STUDENT))
	    {
	    	ProjConst = ProjectConstants.STUDENTOBJECT;
	    	StudentObj = (Student) (PersonObject =  registrationDao.GetPersonNewObj(ProjConst));
	    	
	    	StudentObj.setDegreetype(request.getParameter("degreetype"));
	    	
	    	StudentObj.setMajor(request.getParameter("major"));  	
	    	
	    }else if(UserType.contentEquals(StringConstant.USER_TYPE_FACULTY))
	    {
	    	ProjConst = ProjectConstants.FACULTYOBJECT;
	    	FacultyObj = (Faculty) (PersonObject =  registrationDao.GetPersonNewObj(ProjConst)); 
	    	
	    	String deptValue = request.getParameter("deptnamefaculty");
	    	
	    	FacultyObj.setDeptname(deptValue);
	    }
	    else if(UserType.contentEquals(StringConstant.USER_TYPE_STAFF))
	    {
	    	ProjConst = ProjectConstants.STAFFOBJECT;
	    	StaffObj = (Staff) (PersonObject =  registrationDao.GetPersonNewObj(ProjConst)); 
	    	
	    	String deptValue = request.getParameter("deptnamestaff");
	    	
	    	//FacultyObj.setDeptname(deptValue);
	    	
	    	StaffObj.setDeptname(deptValue);
	    	
	    	String updated = StaffObj.getDeptname();
	    	
	    	System.out.println("updated dept name is "+ updated);
	    }
	    else
	    {
	    	request.setAttribute("error", "Internal Error.");
	    	
			RequestDispatcher Dispatch = request.getRequestDispatcher("login.jsp");
			Dispatch.forward(request, response);       
				 
			return;
	    }
	
	    PersonObject.setFirstname(request.getParameter("firstname"));
	    PersonObject.setLastname(request.getParameter("lastname"));
	    PersonObject.setContact(request.getParameter("contact"));
	    PersonObject.setEmailid(request.getParameter("emailid"));
	    PersonObject.setGender(request.getParameter("gender"));
	    PersonObject.setJoiningyear(Integer.parseInt(request.getParameter("joiningyear")));
	    PersonObject.setSemester(request.getParameter("semester"));
	    PersonObject.setPassword(request.getParameter("password"));
	    PersonObject.setNetid(request.getParameter("netid"));
	    
		java.util.Date DOBdate = null;
		String dob = request.getParameter("dob");
		   
	    DateFormat format = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
	    try
	    {
	    	DOBdate =  format.parse(dob);	
	    }
	    catch(Exception e)
	    {
	    	System.out.println("Date Parsing Error");
			 request.setAttribute("error", "Internal Error");
			 RequestDispatcher Dispatch = request.getRequestDispatcher("register.jsp");
			 Dispatch.forward(request, response);     
	    }
	    
	    PersonObject.setDob(DOBdate);
	    
	    boolean result = registrationDao.RegisterPerson(PersonObject);
	    if(true == result)
	    {
	    	System.out.println("Person is successfully registered.");
	    }
	    else
	    {
	    	System.out.println("Error occured while registering Person.");
			request.setAttribute("error", "Internal Error");
			RequestDispatcher Dispatch = request.getRequestDispatcher("register.jsp");
			Dispatch.forward(request, response);   
	    }
	    
	    //Set the object in the Session.
		javax.servlet.http.HttpSession session = request.getSession();
		session.setAttribute("PersonObject", PersonObject);
		session.setAttribute("PersonRole", UserType);
		request.setAttribute("error", "");
		session.setAttribute("NetID", PersonObject.getNetid());		
		
		RequestDispatcher Dispatch = request.getRequestDispatcher("home.jsp");
		Dispatch.forward(request, response);  
		
	    		
		System.out.println("Reach in Registratoin servlet: Role is " + UserType);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package termp.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import termp.dao.registrationDAO;
import termp.util.*;
import termp.model.*;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
	private registrationDAO registrationDao;	
        
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
        registrationDao = new registrationDAO();

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
		
		javax.servlet.http.HttpSession session = request.getSession();
		PersonObject = (Person) session.getAttribute("PersonObject");
		
		String UserType = request.getParameter("role");
		
	    if(PersonObject instanceof Student)
	    {
	    	ProjConst = ProjectConstants.STUDENTOBJECT;
	    	StudentObj = (Student) (PersonObject);
	    	
	    	StudentObj.setAdvisorname(request.getParameter("advisorname"));
	    	
	    	
	    }else if(PersonObject instanceof Faculty)
	    {
	    	ProjConst = ProjectConstants.FACULTYOBJECT;
	    	FacultyObj = (Faculty) (PersonObject); 
	    	
	    }
	    else if(PersonObject instanceof Staff)
	    {
	    	ProjConst = ProjectConstants.STAFFOBJECT;
	    	StaffObj = (Staff) (PersonObject); 
	    }
	    else
	    {
	    	request.setAttribute("error", "Internal Error.");
	    	
			RequestDispatcher Dispatch = request.getRequestDispatcher("login.jsp");
			Dispatch.forward(request, response);       
				 
			return;
	    }
	
	    PersonObject.setContact(request.getParameter("contact"));
	    PersonObject.setEmailid(request.getParameter("emailid"));
	    
		boolean result = registrationDao.UpdatePerson(PersonObject);
	    if(true == result)
	    {
	    	System.out.println("Person is updated successfully.");
	    }
	    else
	    {
	    	System.out.println("Error occured while updating Person.");
			request.setAttribute("error", "Internal Error");
			RequestDispatcher Dispatch = request.getRequestDispatcher("login.jsp");
			Dispatch.forward(request, response);   
	    }
	    
	    //Set the object in the Session.
		session = request.getSession();
		session.setAttribute("PersonObject", PersonObject);
		request.setAttribute("error", "");
		request.setAttribute("Info", "Updated");
		
		RequestDispatcher Dispatch = request.getRequestDispatcher("home.jsp");
		Dispatch.forward(request, response);  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

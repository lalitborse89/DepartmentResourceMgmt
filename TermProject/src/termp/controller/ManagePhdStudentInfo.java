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
import termp.model.Faculty;
import termp.model.Person;
import termp.model.Staff;
import termp.model.Student;
import termp.util.ProjectConstants;
import termp.util.StringConstant;

/**
 * Servlet implementation class ManagePhdStudentInfo
 */
@WebServlet("/ManagePhdStudentInfo")
public class ManagePhdStudentInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private registrationDAO registrationDao;	
        
    public ManagePhdStudentInfo() {
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
		
    	ProjConst = ProjectConstants.STUDENTOBJECT;
    	StudentObj = (Student) (PersonObject =  registrationDao.GetPersonStudent(netid));
    	//Non-Editable: netid, firstname, lastname
    	StudentObj.setStatus(request.getParameter("status"));  	
    	StudentObj.setCandidate(request.getParameter("candidate"));  	
	    PersonObject.setContact(request.getParameter("contact"));
	    PersonObject.setEmailid(request.getParameter("emailid"));
	    
	    boolean result = registrationDao.UpdatePerson(PersonObject);
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
		//javax.servlet.http.HttpSession session = request.getSession();
		request.setAttribute("error", "");

		RequestDispatcher Dispatch = request.getRequestDispatcher("managephdstudent.jsp");
		Dispatch.forward(request, response);  
		
		//System.out.println("Reach in Registratoin servlet: Role is " + UserType);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

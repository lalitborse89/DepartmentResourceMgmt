package termp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import termp.dao.registrationDAO;
import termp.model.*;
import termp.util.*;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private registrationDAO registrationDao;	
    public LoginServlet() {
        super();
        registrationDao = new registrationDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String UserType;
		Boolean bResult;
		Person PersonObject = null;
		ProjectConstants ProjConst;
	    String netid = request.getParameter("netid");
	    String password = request.getParameter("password");
	    
	    ProjConst = registrationDao.CheckValidNetIDandGetType(netid);
	    switch(ProjConst)
	    {
	    	case USERNOTFOUND:
				 request.setAttribute("error", "usernotfound");

				 break;
	    }		
		
	    if(ProjectConstants.SUCCESS != ProjConst)
	    {
		   RequestDispatcher Dispatch = request.getRequestDispatcher("login.jsp");
		   Dispatch.forward(request, response);       
			 
		   return;
	    }
	    
	    UserType = registrationDao.GetUserType();
	    
	    if(UserType.contentEquals(StringConstant.USER_TYPE_STUDENT))
	    {
	    	ProjConst = ProjectConstants.STUDENTOBJECT;
	    	PersonObject =  registrationDao.GetPerson(ProjConst, netid);
	    	
	    }else if(UserType.contentEquals(StringConstant.USER_TYPE_FACULTY))
	    {
	    	ProjConst = ProjectConstants.FACULTYOBJECT;
	    	PersonObject =  registrationDao.GetPerson(ProjConst, netid); 
	    }
	    else if(UserType.contentEquals(StringConstant.USER_TYPE_STAFF))
	    {
	    	ProjConst = ProjectConstants.STAFFOBJECT;
	    	PersonObject =  registrationDao.GetPerson(ProjConst, netid); 
	    }
	    else
	    {
	    	request.setAttribute("error", "Internal Error.");
	    	
			RequestDispatcher Dispatch = request.getRequestDispatcher("login.jsp");
			Dispatch.forward(request, response);       
				 
			return;
	    }
	    
	    String dbPassword = PersonObject.getPassword();
	    
	    if(!dbPassword.contentEquals(password))
	    {
    	   request.setAttribute("error", "invalidpassowrd");
 		   RequestDispatcher Dispatch = request.getRequestDispatcher("login.jsp");
 		   Dispatch.forward(request, response);       
 			 
 		   return;    	
	    }
	    
		//Set the object in the Session.
		javax.servlet.http.HttpSession session = request.getSession();
		session.setAttribute("PersonObject", PersonObject);
		session.setAttribute("PersonRole", UserType);
		session.setAttribute("NetID", PersonObject.getNetid());		
		
		request.setAttribute("error", "");
		
		RequestDispatcher Dispatch = request.getRequestDispatcher("home.jsp");
		Dispatch.forward(request, response);  
		//System.out.println("Control is coming here");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}

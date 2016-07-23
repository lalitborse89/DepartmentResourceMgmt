package termp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import termp.dao.registrationDAO;
import termp.model.Registration;

/**
 * Servlet implementation class ResetPassword
 */
//@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPassword() {
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

		int ID = 0;
		String FirstName="";

		HttpSession session = request.getSession();
		Registration UserInfo = (Registration) session.getAttribute("UserInfo");
		
	    String password = request.getParameter("password");
	    
		//String password = request.getAttribute("password");
		
		if(null != UserInfo)
		{
			FirstName = UserInfo.getFname();
			ID = UserInfo.getUserID();
		}
		else
		{
	 		response.sendRedirect("login.jsp");
		}
		
		System.out.println("User name"+FirstName+"  ID "+ID+"  Password  "+password);
		
		//session.invalidate();	
		
		request.setAttribute("error", "passchange");
		RequestDispatcher Dispatch = request.getRequestDispatcher("login.jsp");
		Dispatch.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private registrationDAO registrationDao;
}

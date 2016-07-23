package termp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import termp.dao.registrationDAO;
import termp.model.Registration;

/**
 * Servlet implementation class PasswordResetServlent
 */
//@WebServlet("/PasswordResetServlent")
public class PasswordResetServlent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordResetServlent() {
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
		
//		Boolean bResult;
//	    String Email = request.getParameter("Email");
//	    String ResetID = request.getParameter("ResetID");
//	    
//		Registration UserInfo = registrationDao.GetUserInfo(Email);
//		
//		request.setAttribute("error", "");
//		//request.setAttribute("UserInfo", UserInfo);
//		
//		javax.servlet.http.HttpSession session = request.getSession();
//		session.setAttribute("UserInfo", UserInfo);		
//		
//		RequestDispatcher Dispatch = request.getRequestDispatcher("ResetPassword.jsp");
//		Dispatch.forward(request, response);	
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

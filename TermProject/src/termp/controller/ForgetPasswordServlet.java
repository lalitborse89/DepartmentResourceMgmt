package termp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import termp.dao.registrationDAO;
import termp.model.Registration;
import termp.util.DBHandle;
import termp.util.*;

/**
 * Servlet implementation class ForgetPasswordServlet
 */
//@WebServlet("/ForgetPasswordServlet")
public class ForgetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPasswordServlet() {
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
		
		Boolean bResult;
//	    String Email = request.getParameter("email");
//	    
//		Registration UserInfo = registrationDao.GetUserInfo(Email);
//		
//		Properties prop = new Properties();
//        InputStream inputStream = DBHandle.class.getClassLoader().getResourceAsStream("/db.properties");
//        prop.load(inputStream);
//        String BaseLink = prop.getProperty("baselink");
//         
//		
//	    String content = "Dear: "+UserInfo.getFname()+", \nPlease use foloowing link to reset your password. "+
//	    		BaseLink+"PasswordResetServlent?Email="+Email+"&ResetID="+"123456";
//	    String subject = "Reset Password";
//	 
//	     try {
//	    	 
//	    	 //Send(final String username, final String password, String recipientEmail, String title, String message) throws AddressException, MessagingException {
//	         //SendMail.Send("termproject2016", "TermProjecct!", Email, subject, content);	   
//	    		 
//	    	 
//	    	   SendMail.sendEmail(Email, subject, content);
//	     }
//	     catch(Exception e)
//	     {
//	    	 e.printStackTrace();
//	    	 
//	    	 return;
//	     }
//				
//		//request.setAttribute("UserInfo", UserInfo);
//		
//		//HttpSession session = request.getSession();
//		//session.setAttribute("error", "chkmail");
//		request.setAttribute("error", "chkmail");
//		
//		RequestDispatcher Dispatch = request.getRequestDispatcher("login.jsp");
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

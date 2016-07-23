package termp.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

import termp.dao.DiscusionDAO;
import termp.dao.registrationDAO;

import termp.model.*;
import termp.dao.*;

/**
 * Servlet implementation class ManageAlumniInfo
 */
@WebServlet("/ManageAlumniInfo")
public class ManageAlumniInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private AlumniinfoDAO AlmuniDAOObj;	
	
    public ManageAlumniInfo() {
        super();
        AlmuniDAOObj = new AlumniinfoDAO();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		boolean bIsUpdate = false;
		String ContentorReply = null; 		
		
		String postCommentId = request.getParameter("hiddenPara");
		String operatoin = request.getParameter("operation");
		
		System.out.println("ID is "+ postCommentId+"  Operation is "+operatoin);
		
		if(false == postCommentId.equals("default"))
		{
			bIsUpdate = true;
		}
		
		Alumniinfo AlumniinfoObj = new Alumniinfo();

		AlumniinfoObj.setFullname(request.getParameter("fullname"));
		AlumniinfoObj.setCurrentinfo(request.getParameter("currentinfo"));
		AlumniinfoObj.setPersonallink(request.getParameter("personallink"));

		System.out.println("Alumni Name: "+AlumniinfoObj.getFullname()+
				" currentInfo "+ AlumniinfoObj.getCurrentinfo()+
				" Link: "+AlumniinfoObj.getPersonallink());
		
		//AlmuniDAOObj.Update(AlumniinfoObj, bIsUpdate);
		
		RequestDispatcher Dispatch = request.getRequestDispatcher("ViewAlumniInfo.jsp");
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

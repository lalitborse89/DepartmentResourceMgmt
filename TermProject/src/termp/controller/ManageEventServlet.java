package termp.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import termp.dao.*;
import termp.model.*;

/**
 * Servlet implementation class ManageEventServlet
 */
@WebServlet("/ManageEventServlet")
public class ManageEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
    */

	private EventDAO EventDao;	

	public ManageEventServlet() {
        super();
        // TODO Auto-generated constructor stub
        EventDao = new EventDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		boolean bIsUpdate = false;
		
		String postCommentId = request.getParameter("hiddenPara");
		String operatoin = request.getParameter("operation");
		
		Event EventObj = new Event();
		
		if(true == operatoin.equals("edit"))
		{
			System.out.println("  Operation is Update");

			bIsUpdate = true;
			EventObj.setEventid(postCommentId);
		}
		else if(true == operatoin.equals("delete"))
		{
			System.out.println("  Operation is delete and jobid is "+postCommentId);

			EventDao.DeleteEvent(postCommentId);
			
			RequestDispatcher Dispatch = request.getRequestDispatcher("ManageEvent.jsp");
			Dispatch.forward(request, response);
			
			return;
			
		}
		
		
		
		
		javax.servlet.http.HttpSession session = request.getSession();
		String NetID = (String) session.getAttribute("NetID");

		String description = request.getParameter("description");
		
		description = description.trim();
		
		EventObj.setDescription(description);
		EventObj.setPosternetid(NetID);
		EventObj.setPosteddate(new Date());
		
		java.util.Date EventStartdate = null;
		java.util.Date EventEnddate= null;
		
		String StartDate = request.getParameter("startdate");
		String EndDate = request.getParameter("enddate");
		   
	    DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	    try
	    {
	    	EventStartdate =  format.parse(StartDate);
	    	EventEnddate = format.parse(EndDate);
	    }
	    catch(Exception e)
	    {
	    	 System.out.println("Date Parsing Error");
			 request.setAttribute("error", "Internal Error");
			 RequestDispatcher Dispatch = request.getRequestDispatcher("register.jsp");
			 Dispatch.forward(request, response);     
	    }
	    
		EventObj.setStartdate(EventStartdate);
		EventObj.setEnddate(EventEnddate);;
		
		EventDao.Update(EventObj, bIsUpdate);
		
		RequestDispatcher Dispatch = request.getRequestDispatcher("ManageEvent.jsp");
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

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
 * Servlet implementation class ManageJobServlet
 */
@WebServlet("/ManageJobServlet")
public class ManageJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	private JobDAO JobDao;	

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageJobServlet() {
        super();
        // TODO Auto-generated constructor stub
        
        JobDao = new JobDAO();
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
		
		Job JobObj = new Job();
		
		if(true == operatoin.equals("edit"))
		{
			System.out.println("  Operation is Update");

			bIsUpdate = true;
			JobObj.setJobid(postCommentId);
		}
		else if(true == operatoin.equals("delete"))
		{
			System.out.println("  Operation is delete and jobid is "+postCommentId);

			JobDao.DeleteJob(postCommentId);
			
			RequestDispatcher Dispatch = request.getRequestDispatcher("ManageJob.jsp");
			Dispatch.forward(request, response);
			
			return;
			
		}
				
		javax.servlet.http.HttpSession session = request.getSession();
		String NetID = (String) session.getAttribute("NetID");

		String description = request.getParameter("description");
		
		description = description.trim();
		
		JobObj.setDescription(description);
		JobObj.setPosternetid(NetID);
		JobObj.setPosteddate(new Date());
		
		JobObj.setEmailid(request.getParameter("emailid"));
		JobObj.setWeblink(request.getParameter("weblink"));
		
		JobDao.Update(JobObj, bIsUpdate);
		
		RequestDispatcher Dispatch = request.getRequestDispatcher("ManageJob.jsp");
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

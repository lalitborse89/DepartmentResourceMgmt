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
 * Servlet implementation class ManageExamServlet
 */
@WebServlet("/ManageExamServlet")
public class ManageExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private ExamDAO ExamDao;	
        
    public ManageExamServlet() {
        super();
        // TODO Auto-generated constructor stub
        ExamDao = new ExamDAO();
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
		
		javax.servlet.http.HttpSession session = request.getSession();				
		String NetID = (String) session.getAttribute("NetID");
		
		Exam ExamObj = new Exam();
		
		if(true == operatoin.equals("edit"))
		{
			System.out.println("  Operation is Update");

			bIsUpdate = true;
			ExamObj.setExamid(postCommentId);
		}
		else if(true == operatoin.equals("delete"))
		{
			System.out.println("  Operation is delete and Exam ID is "+postCommentId);

			ExamDao.DeleteExam(postCommentId);
			
			RequestDispatcher Dispatch = request.getRequestDispatcher("ManageExam.jsp");
			Dispatch.forward(request, response);
			
			return;			
		}
		else if(true == operatoin.equals("register"))
		{
			System.out.println("  Operation is delete and Exam ID is "+postCommentId);

			ExamDao.ApplyExam(NetID, postCommentId);
			
			RequestDispatcher Dispatch = request.getRequestDispatcher("ManageExam.jsp");
			Dispatch.forward(request, response);
			
			return;			
		}

		String description = request.getParameter("description");
		String name = request.getParameter("name");
		
		name = name.trim();
		ExamObj.setName(name);
		
		description = description.trim();		
		ExamObj.setDescription(description);
		ExamObj.setPosternetid(NetID);
		
		java.util.Date ExamDate = null;		
		String DateOfExam = request.getParameter("dateofexam");
		   
	    DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	    try
	    {
	    	ExamDate =  format.parse(DateOfExam);
	    }
	    catch(Exception e)
	    {
	    	 System.out.println("Date Parsing Error");
			 request.setAttribute("error", "Internal Error");
			 RequestDispatcher Dispatch = request.getRequestDispatcher("register.jsp");
			 Dispatch.forward(request, response);     
	    }
	    
	    ExamObj.setDateofexam(ExamDate);
	    
		ExamDao.Update(ExamObj, bIsUpdate);
		
		RequestDispatcher Dispatch = request.getRequestDispatcher("ManageExam.jsp");
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

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
 * Servlet implementation class CourseServlet
 */
@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private CourseDAO CourseDao;	
    
    public CourseServlet() {
        super();
        // TODO Auto-generated constructor stub
        CourseDao = new CourseDAO();

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
		
		Course CourseObj = new Course();
		
		if(true == operatoin.equals("edit"))
		{
			System.out.println("  Operation is Update");

			bIsUpdate = true;
			CourseObj.setCourseid(postCommentId);
		}
		else if(true == operatoin.equals("delete"))
		{
			System.out.println("  Operation is delete and course ID is "+postCommentId);

			CourseDao.DeleteCourse(postCommentId);
			
			RequestDispatcher Dispatch = request.getRequestDispatcher("ManageCourse.jsp");
			Dispatch.forward(request, response);
			
			return;			
		}
		else if(true == operatoin.equals("teach"))
		{
			System.out.println("Operation is regiger and Exam ID is " + postCommentId);

			CourseDao.TeachCourse(NetID, postCommentId);
			
			RequestDispatcher Dispatch = request.getRequestDispatcher("ManageCourse.jsp");
			Dispatch.forward(request, response);
			
			return;			
		}

		String coursename = request.getParameter("coursename");
		String category = request.getParameter("category");
		String basicsyllabus = request.getParameter("basicsyllabus");
		String credit = request.getParameter("credit");
		String isvariablecredit = request.getParameter("isvariablecredit");
		
		coursename = coursename.trim();
		CourseObj.setCoursename(coursename);
		
		category = category.trim();
		CourseObj.setCategory(category);
		
		basicsyllabus = basicsyllabus.trim();
		CourseObj.setBasicsyllabus(basicsyllabus);
		
		credit = credit.trim();
		CourseObj.setCredit(Integer.parseInt(credit));				
		
		isvariablecredit = isvariablecredit.trim();
		CourseObj.setIsvariablecredit(isvariablecredit);	
		
		//CourseDAO.Update(CourseObj,bIsUpdate);
		CourseDao.Update(CourseObj, bIsUpdate);
		
		RequestDispatcher Dispatch = request.getRequestDispatcher("ManageCourse.jsp");
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

package termp.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import termp.dao.*;
import termp.model.Job;
import termp.model.News;

/**
 * Servlet implementation class ManageNewsServlet
 */
@WebServlet("/ManageNewsServlet")
public class ManageNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private NewsDAO NewsDao;	
	
	public ManageNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
        NewsDao = new NewsDAO();
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
		
		News NewsObj = new News();
		
		if(true == operatoin.equals("edit"))
		{
			System.out.println("  Operation is Update");

			bIsUpdate = true;
			NewsObj.setNewsid(postCommentId);
		}
		else if(true == operatoin.equals("delete"))
		{
			System.out.println("  Operation is delete and News is "+postCommentId);

			NewsDao.DeleteNews(postCommentId);
			
			RequestDispatcher Dispatch = request.getRequestDispatcher("ManageNews.jsp");
			Dispatch.forward(request, response);
			
			return;
			
		}
				
		javax.servlet.http.HttpSession session = request.getSession();
		String NetID = (String) session.getAttribute("NetID");

		String description = request.getParameter("description");
		
		description = description.trim();
		
		NewsObj.setDescription(description);
		NewsObj.setPosternetid(NetID);
		NewsObj.setPosteddate(new Date());
		NewsDao.Update(NewsObj, bIsUpdate);
		
		RequestDispatcher Dispatch = request.getRequestDispatcher("ManageNews.jsp");
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

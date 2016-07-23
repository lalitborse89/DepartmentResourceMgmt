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
 * Servlet implementation class ViewDiscusServlet
 */
@WebServlet("/ViewDiscusServlet")
public class ViewDiscusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private DiscusionDAO DiscussionDAOObj;	
    
    public ViewDiscusServlet() {
        super();
        // TODO Auto-generated constructor stub
        DiscussionDAOObj = new DiscusionDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String ContentorReply = null; 
		boolean bIsReply = false;
		
		String postCommentId = request.getParameter("hiddenPara");
		String operatoin = request.getParameter("operation");
		
		System.out.println("ID is "+ postCommentId+"  Operation is "+operatoin);
		
		
		if(true == operatoin.equals("delete"))
		{
		
			System.out.println("Deleting reply with id "+ postCommentId);
			
			DiscussionDAOObj.DeleteReply(postCommentId);
			RequestDispatcher Dispatch = request.getRequestDispatcher("viewdiscussforum.jsp");
			Dispatch.forward(request, response);
		}
		else if(true == operatoin.equals("posttopic"))
		{
			ContentorReply = (String) request.getParameter("newtopic");
		}
		else
		{
			bIsReply = true;
			ContentorReply = request.getParameter(postCommentId);
		}
		
		javax.servlet.http.HttpSession session = request.getSession();
		Person PersonObject;
		String NetID;
		
		PersonObject = (Person) session.getAttribute("PersonObject");
		NetID = (String) session.getAttribute("NetID");
		
		
		if(false == bIsReply)
		{
			Discussion DiscussionObj = new Discussion();
			DiscussionObj.setMessage(ContentorReply);
			DiscussionObj.setPosternetid(NetID);
			DiscussionObj.setPosteddate(new Date());
			
			DiscussionDAOObj.InsertDiscussionObject(DiscussionObj);			
		}
		else
		{
			Discussiondetails DiscussiondetailsObj = new Discussiondetails();
			
			DiscussiondetailsObj.setReply(ContentorReply);
			DiscussiondetailsObj.setPosternetid(NetID);
			DiscussiondetailsObj.setParentthreadid(postCommentId);
			DiscussiondetailsObj.setPosteddate(new Date());
			
			DiscussionDAOObj.InsertDiscussionDetails(DiscussiondetailsObj);
		}

		System.out.println("PostCommendIDornewtopic is "+ postCommentId+"  The contentoreply is "+ ContentorReply +" bIsreply  " + bIsReply);

		RequestDispatcher Dispatch = request.getRequestDispatcher("viewdiscussforum.jsp");
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

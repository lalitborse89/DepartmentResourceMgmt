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
import termp.model.*;

/**
 * Servlet implementation class ManageResourceServlet
 */
@WebServlet("/ManageResourceServlet")
public class ManageResourceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private ResourceDAO ResourceDAOObj;	
    
	public ManageResourceServlet() {
        super();
        ResourceDAOObj = new ResourceDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String operation;
		Resource ResourceObj;
		
		operation = request.getParameter("operation");
		
		
		
		if(true == operation.equals("addresource"))
		{
			String category;
			
			category =  request.getParameter("category");
		System.out.println("Category--->>"+category);
			ResourceObj = new Resource();
			
			ResourceObj.setCategory(category);
			
			if(category.equals("projector"))
			{
				
				//System.out.println("Projector--->>>"+);
				
				
				ResourceObj.setName(request.getParameter("projname"));
				ResourceObj.setConfiguration(request.getParameter("projconfiguration"));
				ResourceObj.setCompany(request.getParameter("projcompany"));
				ResourceObj.setDescription(request.getParameter("projdescription"));
				ResourceObj.setMaxviewablesize(request.getParameter("projmaxviewablesize"));
				ResourceObj.setMinimumviewablesize(request.getParameter("projminimumviewablesize"));
				ResourceObj.setDisplaytype(request.getParameter("projdisplaytype"));
				ResourceObj.setInputtype(request.getParameter("projinputtype"));
				ResourceObj.setDimension(request.getParameter("projdimension"));
			}
			else if(category.equals("headphone"))
			{
				ResourceObj.setName(request.getParameter("hpname"));
				ResourceObj.setCompany(request.getParameter("hpcompany"));
				ResourceObj.setDescription(request.getParameter("hpdescription"));
				ResourceObj.setMaxviewablesize(request.getParameter("hpconfiguration"));
			}
			else
			{
			//	String name = request.getParameter("roomname");
				//String capacity = request.getParameter("roomcapacity");
				//String description = request.getParameter("roomdescription");
				ResourceObj.setName(request.getParameter("roomname"));
				ResourceObj.setCompany(request.getParameter("roomcapacity"));
				ResourceObj.setDescription(request.getParameter("roomdescription"));
			}
			
			ResourceDAOObj.InsertResourceDetails(ResourceObj);
			
			
		}
		
		RequestDispatcher Dispatch = request.getRequestDispatcher("ViewResource.jsp");
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

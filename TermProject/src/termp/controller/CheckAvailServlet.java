package termp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import termp.model.*;
import termp.dao.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CheckAvailServlet
 */
@WebServlet("/CheckAvailServlet")
public class CheckAvailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckAvailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	/*	in Controller ---->>>>2016/04/30 22:00/1
		yr/month/day-->>2016/04/30
		15:00/Item-->>22:00/1
	*/	
		javax.servlet.http.HttpSession session = request.getSession();				
		String NetID = (String) session.getAttribute("NetID");
		
		System.out.println("in Controller ---->>>>"+request.getParameter("q"));

	     String BookingDetails = request.getParameter("q");
	
     	   String[] arr= BookingDetails.split(" ");
		   System.out.println("yr/month/day-->>"+arr[0]);
		   System.out.println("15:00/Item-->>"+arr[1]);
			String[] dateasked=arr[0].split("/");
			String[] timeandrid=arr[1].split("/");
			
			String resourceid=timeandrid[1];
			
			String StartTime[] = timeandrid[0].split(":");
			
		//	BookResourceDao dt= new BookResourceDao();
			//dt.BookResource(ReourceID, BookDate, StartTime, NetID)
			
			BookResourceDao BR = new BookResourceDao();
		//	Boolean b= BR.BookResource("1", "2016-04-30","22","as267691");
			String DateStr = dateasked[0]+"-"+dateasked[1]+"-"+dateasked[2];
			System.out.println(resourceid + "  " + DateStr + "  " +StartTime[0] + "  " +NetID);
			Boolean b= BR.BookResource(resourceid, DateStr,StartTime[0], NetID);
			System.out.println(b);
			System.out.println("Entered The Request");
			javax.servlet.http.HttpSession a = request.getSession();
			
			if(!b){
				
			
			a.setAttribute("msgg", "Resource has been Booked");
			
			a.setAttribute("resourceid",resourceid);
			
			request.setAttribute("msgg", "Resource has been Booked");
			
			//RequestDispatcher rd = request.getRequestDispatcher("BookResouce.jsp");
		   
			//rd.include(request, response);
			
			RequestDispatcher Dispatch = request.getRequestDispatcher("BookResouce.jsp");
			Dispatch.forward(request, response);  			
			
			}else{
				request.setAttribute("msgBooked", "Resource is already Booked");
				
				a.setAttribute("resourceid",resourceid);
				RequestDispatcher rd = request.getRequestDispatcher("BookResouce.jsp");
			    rd.include(request, response);
					
				
			}
			
//			Boolean b= BR.BookResource("2", "2016-04-30","22", "as267691");
	//		System.out.println(b);

			
			
			
			//Method to check time for perticular item
		   /*
		    * 
		    * String ReourceID, String BookDate,String StartTime, String NetID
		    * 
		    * 
		    * BookResource
		    * 
		    * 
		    * 
		    * 
		    * 
		    * 
		    * 
		    * 
		    * 
		    * 
		    * List <Resourcebook> Lt= new ArrayList<>();

			BookResourceDao Br = new BookResourceDao();
		    Resourcebook entry=  new Resourcebook();
			Lt=Br.getresourceinfo(arr[0]);
			
		    for(int i=0;i<Lt.size();i++)
		    {
		     entry=Lt.get(i);
		    String from = entry.getFrom();
		    //'2016-04-17 10:00:00'
		    //String to= entry.getTo();
		    
		    String[] str=from.split(" ");
		    //2016-04-17
		    
		    String[] datefromdb=str[0].split("-");
		    
		    if(datefromdb[0]==dateasked[0] && datefromdb[1]==dateasked[1] && datefromdb[2]==dateasked[2] )
		    {
		    //	if()
		    	{
		    		
		    	}
		    	
		    }else{
		    	//insert
		    }
		    
		    
		    }
		    
		    //Show 
			
			
			//allowed insert
			
*/			
	
	}

}

package termp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import termp.util.*;
import termp.model.*;

public class EventDAO {
	private Connection DBHanlde;

	public EventDAO() 
	{
		DBHanlde = DBHandle.getDBHandle();
	}

	public List<Event> GetAllEventInfo()
	{

		List <Event> ListofEventInfo = new ArrayList<>();
		
	    try 
	    {
	        PreparedStatement dbStatement = DBHanlde.prepareStatement
	        				("select * from event");
	        
	        ResultSet Resultset = dbStatement.executeQuery();

	        while (Resultset.next())
	        {
	        
	        	Event EventinfoObject = new Event();
	        	//duscussionreplyid, posternetid, parentthreadid, reply, posteddate
	        
	        	EventinfoObject.setEventid(Resultset.getString("eventid"));
	        	EventinfoObject.setPosternetid(Resultset.getString("posternetid"));
	        	EventinfoObject.setDescription(Resultset.getString("description"));
	        	EventinfoObject.setStartdate(Resultset.getDate("startdate"));
	        	EventinfoObject.setEnddate(Resultset.getDate("enddate"));
	        	EventinfoObject.setPosteddate(Resultset.getDate("posteddate"));	        	
	        	
	        	ListofEventInfo.add(EventinfoObject);
	        	
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return ListofEventInfo;
	}

	
	public boolean Update(Event EventObject, boolean bIsUpdate)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement dbStatement;
	        
	        if(false == bIsUpdate)
	        {
	        	dbStatement = DBHanlde.prepareStatement(
	        			   "insert into event"
	        			   + "(posternetid,description,posteddate,startdate,enddate)"
	        			   + " values (?,?,?,?,?)");
	        
	        }
	        else
	        {
		        dbStatement = 
		    	        DBHanlde.prepareStatement(
		    	        		"update event "
		    	        		+ "set posternetid=?,description=?,posteddate=?,startdate=?,enddate=?"
		    	        		+ " where eventid=?");

	        }

	        dbStatement.setString(1,EventObject.getPosternetid()); 
	        dbStatement.setString(2,EventObject.getDescription()); 
	        dbStatement.setDate(3,new java.sql.Date(EventObject.getPosteddate().getTime()));
	        dbStatement.setDate(4,new java.sql.Date(EventObject.getStartdate().getTime()));
	        dbStatement.setDate(5,new java.sql.Date(EventObject.getEnddate().getTime()));
	        
	        
	        if(true == bIsUpdate)
	        {
	        	dbStatement.setString(6,EventObject.getEventid());	 	        	
	        }
	        
	        rowsAffected = dbStatement.executeUpdate(); 	        
	        
	        if(0 == rowsAffected)
	        {
	        	System.out.println("Zero Rows Affected");
	        	return false;
	        }
	        
	    
	    } catch (Exception AllExceptoin) {
		AllExceptoin.printStackTrace();
	    }
	    
	    return true;
	}

	public boolean DeleteEvent(String EventtID)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement("delete from event where eventid = ?");

	        dbStatement.setString(1, EventtID);
	        
	        rowsAffected = dbStatement.executeUpdate(); 	        
	        
	        if(0 == rowsAffected)
	        {
	        	System.out.println("Zero Rows Affected");
	        	return false;
	        }
	        
	    
	    } catch (Exception AllExceptoin) {
		AllExceptoin.printStackTrace();
	    }
	    
	    return true;
	}	
	
	
	
}

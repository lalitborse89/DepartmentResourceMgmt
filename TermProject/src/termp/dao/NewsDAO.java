package termp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import termp.util.*;
import termp.model.*;

public class NewsDAO {
	private Connection DBHanlde;

	public NewsDAO() 
	{
		DBHanlde = DBHandle.getDBHandle();
	}

	public List<News> GetAllJobInfo()
	{

		List <News> ListNewsInfo = new ArrayList<>();
		
	    try 
	    {
	        PreparedStatement dbStatement = DBHanlde.prepareStatement
	        				("select * from newsinfo");
	        
	        ResultSet Resultset = dbStatement.executeQuery();

	        while (Resultset.next())
	        {
	        
	        	News NewsObject = new News();
	        	//newsid, posternetid, description, posteddate
	        	
	        	NewsObject.setNewsid(Resultset.getString("newsid"));
	        	NewsObject.setPosternetid(Resultset.getString("posternetid"));
	        	NewsObject.setDescription(Resultset.getString("description"));
	        	NewsObject.setPosteddate(Resultset.getDate("posteddate"));	 
	        	
	        	ListNewsInfo.add(NewsObject);	        	
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return ListNewsInfo;
	}

	
	public boolean Update(News JobObject, boolean bIsUpdate)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement dbStatement;
        	//newsid, posternetid, description, posteddate
	        
	        if(false == bIsUpdate)
	        {
	        	dbStatement = DBHanlde.prepareStatement(
	        			   "insert into newsinfo"
	        			   + "(posternetid,description,posteddate)"
	        			   + " values (?,?,?)");
	        
	        }
	        else
	        {
		        dbStatement = 
		    	        DBHanlde.prepareStatement(
		    	        		"update newsinfo "
		    	        		+ "set posternetid=?,description=?,posteddate=?"
		    	        		+ " where newsid=?");

	        }

	        dbStatement.setString(1,JobObject.getPosternetid()); 
	        dbStatement.setString(2,JobObject.getDescription()); 
	        dbStatement.setDate(3,new java.sql.Date(JobObject.getPosteddate().getTime()));
	        
	        if(true == bIsUpdate)
	        {
	        	dbStatement.setString(4,JobObject.getNewsid());	 	        	
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
	
	
	public boolean DeleteNews(String NewsID)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement("delete from newsinfo where newsid = ?");

	        dbStatement.setString(1, NewsID);
	        
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

package termp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import termp.util.*;
import termp.model.*;

public class JobDAO {
	private Connection DBHanlde;

	public JobDAO() 
	{
		DBHanlde = DBHandle.getDBHandle();
	}

	public List<Job> GetAllJobInfo()
	{

		List <Job> ListofJobInfo = new ArrayList<>();
		
	    try 
	    {
	        PreparedStatement dbStatement = DBHanlde.prepareStatement
	        				("select * from jobopportunity");
	        
	        ResultSet Resultset = dbStatement.executeQuery();

	        while (Resultset.next())
	        {
	        
	        	Job JobinfoObject = new Job();
	        	//jobid, posternetid, description, posteddate, emailid, weblink
	        	
	        	JobinfoObject.setJobid(Resultset.getString("jobid"));
	        	JobinfoObject.setPosternetid(Resultset.getString("posternetid"));
	        	JobinfoObject.setDescription(Resultset.getString("description"));
	        	JobinfoObject.setPosteddate(Resultset.getDate("posteddate"));	 
	        	JobinfoObject.setEmailid(Resultset.getString("emailid"));
	        	JobinfoObject.setWeblink(Resultset.getString("weblink"));
	        	
	        	ListofJobInfo.add(JobinfoObject);	        	
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return ListofJobInfo;
	}

	
	public boolean Update(Job JobObject, boolean bIsUpdate)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement dbStatement;
	        
	      //posternetid, description, posteddate, emailid, weblink, jobid 
        	
	        
	        if(false == bIsUpdate)
	        {
	        	dbStatement = DBHanlde.prepareStatement(
	        			   "insert into jobopportunity"
	        			   + "(posternetid,description,posteddate,emailid,weblink)"
	        			   + " values (?,?,?,?,?)");
	        
	        }
	        else
	        {
		        dbStatement = 
		    	        DBHanlde.prepareStatement(
		    	        		"update jobopportunity "
		    	        		+ "set posternetid=?,description=?,posteddate=?,emailid=?,weblink=?"
		    	        		+ " where jobid=?");

	        }

	        dbStatement.setString(1,JobObject.getPosternetid()); 
	        dbStatement.setString(2,JobObject.getDescription()); 
	        dbStatement.setDate(3,new java.sql.Date(JobObject.getPosteddate().getTime()));
	        dbStatement.setString(4,JobObject.getEmailid());
	        dbStatement.setString(5,JobObject.getWeblink());
	        
	        
	        if(true == bIsUpdate)
	        {
	        	dbStatement.setString(6,JobObject.getJobid());	 	        	
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
	
	
	public boolean DeleteJob(String JobID)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement("delete from jobopportunity where jobid = ?");

	        dbStatement.setString(1, JobID);
	        
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

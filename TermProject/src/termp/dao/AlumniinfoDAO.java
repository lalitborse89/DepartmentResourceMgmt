package termp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import termp.util.*;
import termp.model.*;

public class AlumniinfoDAO {

	private Connection DBHanlde;

	public AlumniinfoDAO() 
	{
		DBHanlde = DBHandle.getDBHandle();
	}

	
	public List<Alumniinfo> GetAllAlumniInfo()
	{

		List <Alumniinfo> ListofAlumniInfo = new ArrayList<>();
		
	    try 
	    {
	        PreparedStatement dbStatement = DBHanlde.prepareStatement
	        				("select * from alumniinfo");
	        
	        ResultSet Resultset = dbStatement.executeQuery();

	        while (Resultset.next())
	        {
	        
	        	Alumniinfo AlumniinfoObject = new Alumniinfo();
	        	//duscussionreplyid, posternetid, parentthreadid, reply, posteddate
	        
	        	AlumniinfoObject.setFullname(Resultset.getString("fullname"));
	        	AlumniinfoObject.setPersonallink(Resultset.getString("personallink"));
	        	AlumniinfoObject.setCurrentinfo(Resultset.getString("currentinfo"));
	        		        	
	        	ListofAlumniInfo.add(AlumniinfoObject);
	        	
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return ListofAlumniInfo;
	}

	
	public boolean Update(Alumniinfo AlumniinfoObject, boolean bIsUpdate)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement dbStatement;
	        
	        if(false == bIsUpdate)
	        {
	        	dbStatement = DBHanlde.prepareStatement(
	        			   "insert into alumniinfo"
	        			   + "(currentinfo,personallink,fullname)"
	        			   + " values (?,?,?)");
	        
	        }
	        else
	        {
		        dbStatement = 
		    	        DBHanlde.prepareStatement(
		    	        		"update alumniinfo "
		    	        		+ "set currentinfo=?,personallink=?"
		    	        		+ " where fullname=?");

	        }

	        dbStatement.setString(1,AlumniinfoObject.getCurrentinfo()); 
	        dbStatement.setString(2,AlumniinfoObject.getPersonallink()); 
	        dbStatement.setString(3,AlumniinfoObject.getFullname());
	        
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

package termp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import termp.util.*;
import termp.model.*;

public class ExamDAO {
	private Connection DBHanlde;

	public ExamDAO() 
	{
		DBHanlde = DBHandle.getDBHandle();
	}

	public List<Exam> GetAllExamInfo()
	{

		List <Exam> ListExamInfo = new ArrayList<>();
		
	    try 
	    {
	        PreparedStatement dbStatement = DBHanlde.prepareStatement
	        				("select * from exam");
	        
	        ResultSet Resultset = dbStatement.executeQuery();

	        while (Resultset.next())
	        {
	        
	        	Exam ExamObject = new Exam();
	        	//newsid, posternetid, description, posteddate
	        	
	        	ExamObject.setExamid(Resultset.getString("examid"));
	        	ExamObject.setPosternetid(Resultset.getString("posternetid"));
	        	ExamObject.setDescription(Resultset.getString("description"));
	        	ExamObject.setDateofexam(Resultset.getDate("dateofexam"));	 
	        	ExamObject.setName(Resultset.getString("name"));
	        	
	        	ListExamInfo.add(ExamObject);	        	
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return ListExamInfo;
	}

	
	public boolean Update(Exam ExamObject, boolean bIsUpdate)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement dbStatement;
        	//posternetid, name, dateofexam, description, examid 
	        
	        if(false == bIsUpdate)
	        {
	        	dbStatement = DBHanlde.prepareStatement(
	        			   "insert into exam"
	        			   + "(posternetid,name,dateofexam,description)"
	        			   + " values (?,?,?,?)");
	        
	        }
	        else
	        {
		        dbStatement = 
		    	        DBHanlde.prepareStatement(
		    	        		"update exam "
		    	        		+ "set posternetid=?,name=?,dateofexam=?,description=?"
		    	        		+ " where examid=?");

	        }

	        dbStatement.setString(1,ExamObject.getPosternetid()); 
	        dbStatement.setString(2,ExamObject.getName());
	        dbStatement.setDate(3,new java.sql.Date(ExamObject.getDateofexam().getTime()));
	        dbStatement.setString(4,ExamObject.getDescription());
	        
	        if(true == bIsUpdate)
	        {
	        	dbStatement.setString(5,ExamObject.getExamid());	 	        	
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

	
	public boolean ApplyExam(String NetID, String ExamID)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement dbStatement;
        	//posternetid, name, dateofexam, description, examid 
	      
	        dbStatement = DBHanlde.prepareStatement(
	        			   "insert into registerexam"
	        			   + "(examid,studentnetid)"
	        			   + " values (?,?)");
	        
	        dbStatement.setString(1,ExamID); 
	        dbStatement.setString(2,NetID);
	        
	        rowsAffected = dbStatement.executeUpdate(); 	        
	        
	        if(0 == rowsAffected)
	        {
	        	System.out.println("Zero Rows Affected");
	        	return false;
	        }
	        
	    
	    } catch (Exception AllExceptoin) {
		AllExceptoin.printStackTrace();
		return false;
	    }
	    
	    return true;
	}
	
	
	
	
	
	public List GetStudentExamsList(String StudentID )
	{
		List <String> StudentExamsList = new ArrayList<>();

		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement("select * from registerexam where studentnetid =?");
	        
	        dbStatement.setString(1, StudentID);	        
	        
	        ResultSet Resultset = dbStatement.executeQuery();

	        while (Resultset.next())
	        {
	        
	        	String ExamID = new String();
	        	//newsid, posternetid, description, posteddate
	        	
	        	ExamID = Resultset.getString("examid");
	        	
	        	StudentExamsList.add(ExamID);	        	
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return StudentExamsList;
	}	
	

	public boolean DeleteExam(String ExamID)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement("delete from exam where examid = ?");

	        dbStatement.setString(1, ExamID);
	        
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

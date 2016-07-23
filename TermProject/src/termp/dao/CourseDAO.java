package termp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import termp.util.*;
import termp.model.*;

public class CourseDAO {
	private Connection DBHanlde;

	public CourseDAO() 
	{
		DBHanlde = DBHandle.getDBHandle();
	}

	public List<Course> GetAllCourseInfo()
	{

		List <Course> ListCourseInfo = new ArrayList<>();
		
	    try 
	    {
	        PreparedStatement dbStatement = DBHanlde.prepareStatement
	        				("select * from course");
	        
	        ResultSet Resultset = dbStatement.executeQuery();

	        while (Resultset.next())
	        {
	        
	        	Course CourseObject = new Course();
	        	//courseid, coursename, category, basicsyllabus, credit, isvariablecredit
	        	
	        	CourseObject.setCourseid(Resultset.getString("courseid"));
	        	CourseObject.setCoursename(Resultset.getString("coursename"));
	        	CourseObject.setCategory(Resultset.getString("category"));
	        	CourseObject.setBasicsyllabus(Resultset.getString("basicsyllabus"));
	        	CourseObject.setCredit(Resultset.getInt("credit"));
	        	CourseObject.setIsvariablecredit(Resultset.getString("isvariablecredit"));

	        	
	        	ListCourseInfo.add(CourseObject);	        	
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return ListCourseInfo;
	}

	
	public boolean Update(Course CourseObj, boolean bIsUpdate)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement dbStatement;
        	//coursename, category, basicsyllabus, credit, isvariablecredit, courseid 
	        
	        if(false == bIsUpdate)
	        {
	        	dbStatement = DBHanlde.prepareStatement(
	        			   "insert into course"
	        			   + "(coursename,category,basicsyllabus,credit,isvariablecredit)"
	        			   + " values (?,?,?,?)");
	        
	        }
	        else
	        {
		        dbStatement = 
		    	        DBHanlde.prepareStatement(
		    	        		"update course "
		    	        		+ "set coursename=?,category=?,basicsyllabus=?,credit=?,isvariablecredit=?"
		    	        		+ " where courseid=?");

	        }

	        dbStatement.setString(1,CourseObj.getCoursename()); 
	        dbStatement.setString(2,CourseObj.getCategory());
	        dbStatement.setString(3,CourseObj.getBasicsyllabus());
	        dbStatement.setInt(4,CourseObj.getCredit());
	        dbStatement.setString(5,CourseObj.getIsvariablecredit());
	        
	        if(true == bIsUpdate)
	        {
	        	dbStatement.setString(6,CourseObj.getCourseid());	 	        	
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

	
	public List GetStaffCourseList(String StaffID)
	{
		List <String> StaffCourseList = new ArrayList<>();

		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement("select * from teaches where facultynetid = ?");
	        
	        dbStatement.setString(1, StaffID);	        
	        
	        ResultSet Resultset = dbStatement.executeQuery();

	        while (Resultset.next())
	        {
	        
	        	String CourseID = new String();
	        	//newsid, posternetid, description, posteddate
	        	
	        	CourseID = Resultset.getString("courseid");
	        	
	        	StaffCourseList.add(CourseID);	        	
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return StaffCourseList;
	}	

	
	
	public boolean TeachCourse(String NetID, String CourseID)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement dbStatement;
        	//posternetid, name, dateofexam, description, examid 
	      
	        dbStatement = DBHanlde.prepareStatement(
	        			   "insert into teaches"
	        			   + "(NetID,CourseID)"
	        			   + " values (?,?)");
	        
	        dbStatement.setString(1,NetID); 
	        dbStatement.setString(2,CourseID);
	        
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

	
	public boolean EnrollCourse(String StudentNetID, String TeachesID, int NumberOfcredit)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement dbStatement;
        	//enrollid, teachesid, studentnetd, credit
	      
	        dbStatement = DBHanlde.prepareStatement(
	        			   "insert into enroll"
	        			   + "(teachesid,studentnetd,credit)"
	        			   + " values (?,?,?)");
	        
	        dbStatement.setString(1,TeachesID); 
	        dbStatement.setString(2,StudentNetID);
	        dbStatement.setInt(3,NumberOfcredit);
	        
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
	
	
	public boolean DeleteCourse(String CourseID)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement("delete from course where courseid = ?");

	        dbStatement.setString(1, CourseID);
	        
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

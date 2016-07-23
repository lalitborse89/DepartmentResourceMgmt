package termp.dao;

import termp.util.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.ResultSetMetaData;

//import com.mysql.jdbc.*;
import termp.model.*;
import termp.util.*;

public class registrationDAO
{
	String UserType;
	
	public String GetUserType()
	{
		return UserType;
	}
	
	public boolean RegisterPerson(Person PersonObj)
	{
		String SqlQuery;
		
		boolean retVal = true;
		ProjectConstants projConst;
		
		SqlQuery = "insert into netidrollmapping (netid,role) values (?,?)"; 

	   try 
	    {
			PreparedStatement dbStatement = DBHanlde.prepareStatement(SqlQuery);
			
			dbStatement.setString(1,PersonObj.getNetid());
	
			if(PersonObj instanceof Student)
			{
				projConst = ProjectConstants.STUDENTOBJECT;
				dbStatement.setString(2,"student");
			}
			else if(PersonObj instanceof Faculty)
			{
				projConst = ProjectConstants.FACULTYOBJECT;
				dbStatement.setString(2,"faculty");
			}
			else 
			{
				projConst = ProjectConstants.STAFFOBJECT;
				dbStatement.setString(2,"staff");
			}
			
			System.out.println("The PorjConst value is "+ projConst);
			
			
			switch(projConst)
			{
			case STUDENTOBJECT:
				retVal = InsertStudentObject((Student) PersonObj);			
				break;
					
					
			case FACULTYOBJECT:
				retVal = InsertFacultyObject((Faculty) PersonObj);
				
				break;
					
					
			case STAFFOBJECT:
				retVal = InsertStaffObject((Staff) PersonObj);
				
				break;
			}		
		
	
		   int rowsAffected = dbStatement.executeUpdate(); 	        
	        
	        if(0 == rowsAffected)
	        {
	        	System.out.println("Zero Rows Affected");
	        	return false;
	        }
	    } 
	   catch (Exception AllExceptoin) {
		   AllExceptoin.printStackTrace();
	    }
	    	
	return retVal;	
	}

	
	boolean InsertStaffObject(Staff StaffObj)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement(
	        		"insert into staff"
	        		+ "(netid,firstname,lastname,contact,password,dob,gender,joiningyear,semester,emailid,deptname)"
	        		+ " values (?,?,?,?,?,?,?,?,?,?,?)");

	        dbStatement.setString(1,StaffObj.getNetid()); 
	        dbStatement.setString(2,StaffObj.getFirstname()); 
	        dbStatement.setString(3,StaffObj.getLastname()); 
	        dbStatement.setString(4,StaffObj.getContact()); 
	        dbStatement.setString(5,StaffObj.getPassword()); 
	        dbStatement.setDate(6,  new java.sql.Date(StaffObj.getDob().getTime()));
	        dbStatement.setString(7,StaffObj.getGender()); 
	        dbStatement.setInt(8,StaffObj.getJoiningyear());
	        dbStatement.setString(9,StaffObj.getSemester());
	        dbStatement.setString(10,StaffObj.getEmailid());        
	        dbStatement.setString(11, StaffObj.getDeptname());
	        
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
	
	
	boolean InsertFacultyObject(Faculty FacultyObj)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement(
	        		"insert into faculty"
	        		+ "(netid,firstname,lastname,contact,password,dob,gender,joiningyear,semester,emailid,deptname)"
	        		+ " values (?,?,?,?,?,?,?,?,?,?,?)");

	        dbStatement.setString(1,FacultyObj.getNetid()); 
	        dbStatement.setString(2,FacultyObj.getFirstname()); 
	        dbStatement.setString(3,FacultyObj.getLastname()); 
	        dbStatement.setString(4,FacultyObj.getContact()); 
	        dbStatement.setString(5,FacultyObj.getPassword()); 
	        dbStatement.setDate(6,  new java.sql.Date(FacultyObj.getDob().getTime()));
	        dbStatement.setString(7,FacultyObj.getGender()); 
	        dbStatement.setInt(8,FacultyObj.getJoiningyear());
	        dbStatement.setString(9,FacultyObj.getSemester());
	        dbStatement.setString(10,FacultyObj.getEmailid());        
	        dbStatement.setString(11, FacultyObj.getDeptname());
	        
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
	
	boolean InsertStudentObject(Student StudentObj)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement(
	        		"insert into student"
	        		+ "(netid,firstname,lastname,contact,password,dob,gender,joiningyear,semester,emailid,degreetype,status,candidate,advisorname)"
	        		+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

	        dbStatement.setString(1,StudentObj.getNetid()); 
	        dbStatement.setString(2,StudentObj.getFirstname()); 
	        dbStatement.setString(3,StudentObj.getLastname()); 
	        dbStatement.setString(4,StudentObj.getContact()); 
	        dbStatement.setString(5,StudentObj.getPassword()); 
	        dbStatement.setDate(6,  new java.sql.Date(StudentObj.getDob().getTime()));
	        dbStatement.setString(7,StudentObj.getGender()); 
	        dbStatement.setInt(8,StudentObj.getJoiningyear());
	        dbStatement.setString(9,StudentObj.getSemester());
	        dbStatement.setString(10,StudentObj.getEmailid());        
	        dbStatement.setString(11, StudentObj.getDegreetype() );
	        dbStatement.setString(12, StudentObj.getStatus());
	        dbStatement.setString(13, StudentObj.getCandidate());
	        dbStatement.setString(14, StudentObj.getAdvisorname());
	        
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

	
	public boolean UpdatePerson(Person PersonObj)
	{
		boolean retVal = true;
		ProjectConstants projConst;
		
		if(PersonObj instanceof Student)
		{
			projConst = ProjectConstants.STUDENTOBJECT;
		}
		else if(PersonObj instanceof Faculty)
		{
			projConst = ProjectConstants.FACULTYOBJECT;
		}
		else 
		{
			projConst = ProjectConstants.STAFFOBJECT;
		}
		
		System.out.println("The PorjConst value is "+ projConst);
		
		
		switch(projConst)
		{
		case STUDENTOBJECT:
			retVal = UpdateStudentObject((Student) PersonObj);			
			break;
				
				
		case FACULTYOBJECT:
			retVal = UpdateFacultyObject((Faculty) PersonObj);
			
			break;
				
				
		case STAFFOBJECT:
			retVal = UpdateStaffObject((Staff) PersonObj);
			
			break;
		}
		
	return retVal;	
	}

	
	boolean UpdateStaffObject(Staff StaffObj)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement(
	        		"insert into staff"
	        		+ "(netid,firstname,lastname,contact,password,dob,gender,joiningyear,semester,emailid,deptname)"
	        		+ " values (?,?,?,?,?,?,?,?,?,?,?)");

	        dbStatement.setString(1,StaffObj.getNetid()); 
	        dbStatement.setString(2,StaffObj.getFirstname()); 
	        dbStatement.setString(3,StaffObj.getLastname()); 
	        dbStatement.setString(4,StaffObj.getContact()); 
	        dbStatement.setString(5,StaffObj.getPassword()); 
	        dbStatement.setDate(6,  new java.sql.Date(StaffObj.getDob().getTime()));
	        dbStatement.setString(7,StaffObj.getGender()); 
	        dbStatement.setInt(8,StaffObj.getJoiningyear());
	        dbStatement.setString(9,StaffObj.getSemester());
	        dbStatement.setString(10,StaffObj.getEmailid());        
	        dbStatement.setString(11, StaffObj.getDeptname());
	        
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
	
	
	boolean UpdateFacultyObject(Faculty FacultyObj)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement(
	        		"insert into faculty"
	        		+ "(netid,firstname,lastname,contact,password,dob,gender,joiningyear,semester,emailid,deptname)"
	        		+ " values (?,?,?,?,?,?,?,?,?,?,?)");

	        dbStatement.setString(1,FacultyObj.getNetid()); 
	        dbStatement.setString(2,FacultyObj.getFirstname()); 
	        dbStatement.setString(3,FacultyObj.getLastname()); 
	        dbStatement.setString(4,FacultyObj.getContact()); 
	        dbStatement.setString(5,FacultyObj.getPassword()); 
	        dbStatement.setDate(6,  new java.sql.Date(FacultyObj.getDob().getTime()));
	        dbStatement.setString(7,FacultyObj.getGender()); 
	        dbStatement.setInt(8,FacultyObj.getJoiningyear());
	        dbStatement.setString(9,FacultyObj.getSemester());
	        dbStatement.setString(10,FacultyObj.getEmailid());        
	        dbStatement.setString(11, FacultyObj.getDeptname());
	        
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
	
	boolean UpdateStudentObject(Student StudentObj)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement(
	        		"update student "
	        		+ "set contact=?,emailid=?,status=?,candidate=?,advisorname=?"
	        		+ " where netid=?");

	        dbStatement.setString(1,StudentObj.getContact()); 
	        dbStatement.setString(2,StudentObj.getEmailid()); 
	        dbStatement.setString(3,StudentObj.getStatus()); 
	        dbStatement.setString(4,StudentObj.getCandidate()); 
	        dbStatement.setString(5,StudentObj.getAdvisorname()); 
	        dbStatement.setString(6, StudentObj.getNetid());
	        
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

	public registrationDAO() 
	{
		DBHanlde = DBHandle.getDBHandle();
	}
	
	
	public ProjectConstants CheckValidNetIDandGetType(String netid)
	{
	    try 
	    {
	        PreparedStatement dbStatement = DBHanlde.prepareStatement("select * from netidrollmapping where netid=?");
	        
	        dbStatement.setString(1, netid);
	        
	        ResultSet Resultset = dbStatement.executeQuery();
	
	        Resultset.last();
	        
	        int rowcount = Resultset.getRow();
	        
	        if(0 == rowcount)
	        {
	        	//not found NETID;
	        	return ProjectConstants.USERNOTFOUND;
	        }
	        
	        UserType = Resultset.getString(2);
	        
	        return ProjectConstants.SUCCESS;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	
	    return ProjectConstants.SUCCESS;
	}

private Connection DBHanlde;

public Person GetPersonStudent(String netid)
{
	Student StudentObject;
	
	StudentObject = new Student();
	
    try 
    {
        PreparedStatement dbStatement = DBHanlde.prepareStatement
        								("select * from student"
        								+ " where netid=?");
        
        dbStatement.setString(1, netid);
        
        ResultSet Resultset = dbStatement.executeQuery();

       	//If set is not null then the entry is already present.
        if (Resultset.next())
        {
        	//(fname,lname,password,Address,Contact,Date,verifyUser,Email,verificationCode,gender,dppath,dob)
        	
        	StudentObject.setNetid(Resultset.getString("netid"));
        	StudentObject.setFirstname(Resultset.getString("firstname"));
        	StudentObject.setLastname(Resultset.getString("lastname"));
        	StudentObject.setContact(Resultset.getString("contact"));
        	StudentObject.setPassword(Resultset.getString("password"));
        	StudentObject.setDob(Resultset.getDate("dob"));
        	StudentObject.setGender(Resultset.getString("gender"));
        	StudentObject.setJoiningyear(Resultset.getInt("joiningyear"));
        	StudentObject.setSemester(Resultset.getString("semester"));
        	StudentObject.setEmailid(Resultset.getString("emailid"));
        	StudentObject.setDegreetype(Resultset.getString("degreetype"));
        	StudentObject.setStatus(Resultset.getString("status"));
        	StudentObject.setCandidate(Resultset.getString("candidate"));        	     	
        	
        }
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return StudentObject;

}


public Person GetPersonFaculty(String netid)
{
	Faculty FacultyObject;
	
	FacultyObject = new Faculty();
	
    try 
    {
        PreparedStatement dbStatement = DBHanlde.prepareStatement
        								("select * from faculty"
        								+ " where netid=?");
        
        dbStatement.setString(1, netid);
        
        ResultSet Resultset = dbStatement.executeQuery();

       	//If set is not null then the entry is already present.
        if (Resultset.next())
        {
        	//(fname,lname,password,Address,Contact,Date,verifyUser,Email,verificationCode,gender,dppath,dob)
        	
        	FacultyObject.setNetid(Resultset.getString("netid"));
        	FacultyObject.setFirstname(Resultset.getString("firstname"));
        	FacultyObject.setLastname(Resultset.getString("lastname"));
        	FacultyObject.setContact(Resultset.getString("contact"));
        	FacultyObject.setPassword(Resultset.getString("password"));
        	FacultyObject.setDob(Resultset.getDate("dob"));
        	FacultyObject.setGender(Resultset.getString("gender"));
        	FacultyObject.setJoiningyear(Resultset.getInt("joiningyear"));
        	FacultyObject.setSemester(Resultset.getString("semester"));
        	FacultyObject.setEmailid(Resultset.getString("emailid"));
        	FacultyObject.setDeptname(Resultset.getString("deptname"));
        }
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return FacultyObject;
}



public Person GetPersonStaff(String netid)
{
	Staff StaffObject;
	
	StaffObject = new Staff();
	
    try 
    {
        PreparedStatement dbStatement = DBHanlde.prepareStatement
        								("select * from staff"
        								+ " where netid=?");
        
        dbStatement.setString(1, netid);
        
        ResultSet Resultset = dbStatement.executeQuery();

       	//If set is not null then the entry is already present.
        if (Resultset.next())
        {
        	//(fname,lname,password,Address,Contact,Date,verifyUser,Email,verificationCode,gender,dppath,dob)
        	
        	StaffObject.setNetid(Resultset.getString("netid"));
        	StaffObject.setFirstname(Resultset.getString("firstname"));
        	StaffObject.setLastname(Resultset.getString("lastname"));
        	StaffObject.setContact(Resultset.getString("contact"));
        	StaffObject.setPassword(Resultset.getString("password"));
        	StaffObject.setDob(Resultset.getDate("dob"));
        	StaffObject.setGender(Resultset.getString("gender"));
        	StaffObject.setJoiningyear(Resultset.getInt("joiningyear"));
        	StaffObject.setSemester(Resultset.getString("semester"));
        	StaffObject.setEmailid(Resultset.getString("emailid"));
        	StaffObject.setDeptname(Resultset.getString("deptname"));       	
        }
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return StaffObject;
}


//
//	Factory Patter: Depend on the type of user the object is return.
//
public Person GetPerson(ProjectConstants projConst, String netid) {
	// TODO Auto-generated method stub
	
	
	Person PersonObject = null;
	
	switch(projConst)
	{
	case STUDENTOBJECT:
		PersonObject = GetPersonStudent(netid);
		
		break;
			
			
	case FACULTYOBJECT:
		PersonObject = GetPersonFaculty(netid);
		
		break;
			
			
	case STAFFOBJECT:
		PersonObject = 	GetPersonStaff(netid);
		
		break;
	}
	
	return PersonObject;
}


	//
	//Factory Patter: Depend on the type of user the object is return.
	//
	public Person GetPersonNewObj(ProjectConstants projConst) {
	// TODO Auto-generated method stub
	
	
	Person PersonObject = null;
	
	switch(projConst)
	{
	case STUDENTOBJECT:
		PersonObject = new Student();
		
		break;
			
			
	case FACULTYOBJECT:
		PersonObject = new Faculty();
		
		break;
			
			
	case STAFFOBJECT:
		PersonObject = 	new Staff();
		
		break;
	}
	
	return PersonObject;
}


public List<Student> GetAllPhdStudentList()
{
	List <Student > ListofPhdStudent = new ArrayList<>();
	
    try 
    {
        PreparedStatement dbStatement = DBHanlde.prepareStatement
        								("select * from student"
        								+ " where degreetype=?");
        
        dbStatement.setString(1, "Phd");
        
        ResultSet Resultset = dbStatement.executeQuery();

       	//If set is not null then the entry is already present.
        while (Resultset.next())
        {
        	Student StudentObject = new Student();
        	
        	StudentObject.setNetid(Resultset.getString("netid"));
        	StudentObject.setFirstname(Resultset.getString("firstname"));
        	StudentObject.setLastname(Resultset.getString("lastname"));
        	StudentObject.setContact(Resultset.getString("contact"));
        	StudentObject.setPassword(Resultset.getString("password"));
        	StudentObject.setDob(Resultset.getDate("dob"));
        	StudentObject.setGender(Resultset.getString("gender"));
        	StudentObject.setJoiningyear(Resultset.getInt("joiningyear"));
        	StudentObject.setSemester(Resultset.getString("semester"));
        	StudentObject.setEmailid(Resultset.getString("emailid"));
        	StudentObject.setDegreetype(Resultset.getString("degreetype"));
        	StudentObject.setStatus(Resultset.getString("status"));
        	StudentObject.setCandidate(Resultset.getString("candidate"));   
        	
        	ListofPhdStudent.add(StudentObject);        	
        }
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return ListofPhdStudent;

}
	
	
}

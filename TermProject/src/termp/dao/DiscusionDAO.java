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

public class DiscusionDAO
{
	private Connection DBHanlde;

public DiscusionDAO() 
{
	DBHanlde = DBHandle.getDBHandle();
}


public boolean InsertDiscussionObject(Discussion DiscussionObj)
{
	int rowsAffected;
	
    try 
    {
        PreparedStatement
        dbStatement = 
        DBHanlde.prepareStatement(
        		"insert into discussionboard"
        		+ "(posternetid,message,posteddate)"
        		+ " values (?,?,?)");

        dbStatement.setString(1, DiscussionObj.getPosternetid());
        dbStatement.setString(2, DiscussionObj.getMessage());
        dbStatement.setDate(3, new java.sql.Date(DiscussionObj.getPosteddate().getTime()));
        
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


public boolean DeleteReply(String ReplyID)
{
	int rowsAffected;
	
    try 
    {
        PreparedStatement
        dbStatement = 
        DBHanlde.prepareStatement("delete from discussionboardreply where duscussionreplyid = ?");

        dbStatement.setString(1, ReplyID);
        
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


public boolean InsertDiscussionDetails(Discussiondetails DiscussionDetailsObj)
{
	int rowsAffected;
	
    try 
    {
        PreparedStatement
        dbStatement = 
        DBHanlde.prepareStatement(
        		"insert into discussionboardreply"
        		+ "(posternetid,parentthreadid,reply,posteddate)"
        		+ " values (?,?,?,?)");

        dbStatement.setString(1, DiscussionDetailsObj.getPosternetid());
        dbStatement.setString(2, DiscussionDetailsObj.getParentthreadid());
        dbStatement.setString(3, DiscussionDetailsObj.getReply());
        dbStatement.setDate(4, new java.sql.Date(DiscussionDetailsObj.getPosteddate().getTime()));
        
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




public List<Discussion> GetDiscussion()
{
	List<Discussion> ListofDiscusion = new ArrayList<Discussion>();
	
    try 
    {
        PreparedStatement dbStatement = DBHanlde.prepareStatement
        								("select *from discussionboard order by duscussionid DESC");
    
        ResultSet Resultset = dbStatement.executeQuery();

        while (Resultset.next())
        {
        	Discussion DiscussionObject =new Discussion();

        	DiscussionObject.setDuscussionid(Resultset.getString("duscussionid"));
        	DiscussionObject.setPosternetid(Resultset.getString("posternetid"));
        	DiscussionObject.setMessage(Resultset.getString("message"));
        	DiscussionObject.setPosteddate(Resultset.getDate("posteddate"));        	
        	
        	List<Discussiondetails> DiscussDetailsdList = new ArrayList<Discussiondetails>();
        	
        	PreparedStatement dbStatementchild = DBHanlde.
	                prepareStatement("select *from discussionboardreply where parentthreadid=? order by duscussionreplyid DESC");
	        
	        dbStatementchild.setString(1, Resultset.getString("duscussionid"));
	        
	        ResultSet ResultsetChild = dbStatementchild.executeQuery();
	        Discussiondetails Discusiondetailobject;
	        
	        while (ResultsetChild.next())
	        {
	        	Discusiondetailobject = new Discussiondetails();
	        	//duscussionreplyid, posternetid, parentthreadid, reply, posteddate
	        
	        	Discusiondetailobject.setDuscussionreplyid(ResultsetChild.getString("duscussionreplyid"));
	        	Discusiondetailobject.setPosternetid(ResultsetChild.getString("posternetid"));
	        	Discusiondetailobject.setReply(ResultsetChild.getString("reply"));
	        	Discusiondetailobject.setPosteddate(ResultsetChild.getDate("posteddate"));
        			
	        	DiscussDetailsdList.add(Discusiondetailobject);		
	        }
	        
	        DiscussionObject.setDiscussDetailsdList(DiscussDetailsdList);

            ListofDiscusion.add(DiscussionObject);       	
        	
          }
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return ListofDiscusion;

}


public List<Discussiondetails> GetDiscusDetails(String discusid)
{

	List <Discussiondetails> ListofDiscussiondetails =new ArrayList<>();
	
    try 
    {
        PreparedStatement dbStatement = DBHanlde.prepareStatement
        				("select *from discussionboardreply where parentthreadid=?");
        
        dbStatement.setString(1, discusid);
        
        ResultSet Resultset = dbStatement.executeQuery();

        while (Resultset.next())
        {
        
        	Discussiondetails Discusiondetailobject = new Discussiondetails();
        	//duscussionreplyid, posternetid, parentthreadid, reply, posteddate
        
        	Discusiondetailobject.setDuscussionreplyid(Resultset.getString("duscussionreplyid"));
        	Discusiondetailobject.setPosternetid(Resultset.getString("posternetid"));
        	Discusiondetailobject.setReply(Resultset.getString("reply"));
        	Discusiondetailobject.setPosteddate(Resultset.getDate("posteddate"));
        	
        	ListofDiscussiondetails.add(Discusiondetailobject);
        	
        }
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return ListofDiscussiondetails;
}

}

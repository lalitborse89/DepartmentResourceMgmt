package termp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import termp.util.DBHandle;
import java.util.*;
import termp.util.SendMail;
import termp.model.*;

public class BookResourceDao {
      Resourcebook RB =new Resourcebook();
	private Connection DBHanlde;
	public BookResourceDao() 
	{
		DBHanlde = DBHandle.getDBHandle();
	}
	
	
	public List <Resourcebook> getresourceinfo(String str){
		
		List<Resourcebook> listOfBookings = new ArrayList<>();
		 try 
		    {
		        PreparedStatement dbStatement = DBHanlde.prepareStatement("select * from resoucebook ;");
		        
		        
		        ResultSet Resultset = dbStatement.executeQuery();
		
		       	//If set is not null then the entry is already present.
		        while(Resultset.next())
		        {
		//bookernetid, resourceid, from, to, id        	
		        	RB.setBookernetid(Resultset.getString("bookernetid"));
		      
		        	RB.setResourceid(Resultset.getString("resourceid"));
		        	RB.setFrom(Resultset.getString("from"));	
		        	RB.setTo(Resultset.getString("to"));
		        	RB.setId(Resultset.getString("id"));
		        	
		        	//return listOfBookings;
				       
		        	listOfBookings.add(RB);
		        
		        }
		        
		       
			       
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		 return listOfBookings;
		
	}
	
	//select * from resoucebook;
	//bookernetid, resourceid, from, to, id
	
	public boolean BookResource(String ReourceID, String BookDate,String StartTime, String NetID)
    {
        int rowsAffected;
        
        try 
        {
            
/*        	select * from resoucebook where resourceid = 1 and bookdate = '2016-04-30' and timestart BETWEEN 22 AND 23;
*/
        /*	"select * from resoucebook"
            + "where resourceid = ? and bookdate = ? and timestart BETWEEN ? AND ?"
        */	
        	PreparedStatement
            dbStatement = 
            DBHanlde.prepareStatement(
                    "select * from resoucebook where resourceid = ? and bookdate = ? and timestart BETWEEN ? AND ?");
            
        	int x= Integer.parseInt(StartTime);
            int resource=Integer.parseInt(ReourceID);
        	
            dbStatement.setInt(1, resource);
          dbStatement.setString(2, BookDate);
            //x--;
            dbStatement.setInt(3, x);
            x=x+1;
            dbStatement.setInt(4, x);
            
           System.out.println("Ready");
            
            //ResultSet Result = dbStatement.executeUpdate();             
            ResultSet Resultset = dbStatement.executeQuery();

            if (Resultset.next())
            {
                System.out.println("Already Booked resource");
                
                return false;
                
            }

            dbStatement = 
                    DBHanlde.prepareStatement(
                            "insert into resoucebook"
                            + "(resourceid,bookdate,timestart,bookernetid)"
                            + " values (?,?,?,?)");

                    dbStatement.setString(1, ReourceID);
                    dbStatement.setString(2, BookDate);
                    dbStatement.setString(3, StartTime);
                    dbStatement.setString(4, NetID);

            
            rowsAffected = dbStatement.executeUpdate();             
            
            if(0 == rowsAffected)
            {
                System.out.println("Zero Rows Affected");
                return false;
            }
            
            
        
        } catch (Exception AllExceptoin) {
        AllExceptoin.printStackTrace();
        }
        System.out.println("Ready YG");
        
        return true;
        
    }
	






/*public static void main(String[] args){
	// Resourcebook RB =new Resourcebook();
	
	BookResourceDao BR = new BookResourceDao();
	Boolean b= BR.BookResource("2", "2016-04-30","22", "as267691");
	System.out.println(b);
}*/
}
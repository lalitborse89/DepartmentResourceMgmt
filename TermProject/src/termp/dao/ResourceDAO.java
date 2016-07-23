package termp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import termp.model.Resource;
import termp.model.Discussion;
import termp.model.Discussiondetails;
import termp.util.DBHandle;

public class ResourceDAO {

	
	private Connection DBHanlde;
	
	
	public ResourceDAO() 
	{
		DBHanlde = DBHandle.getDBHandle();
	}

	public boolean InsertResourceDetails(Resource ResourceObj)
	{
		int rowsAffected;
		
	    try 
	    {
	        PreparedStatement
	        dbStatement = 
	        DBHanlde.prepareStatement(
	        		"insert into resource"
	        		+ "(category,name,capacity,configuration,company,description ,maxviewablesize ,minimumviewablesize ,displaytype ,inputtype ,dimension)"
	        		+ " values (?,?,?,?,?,?,?,?,?,?,?)");

	        dbStatement.setString(1, ResourceObj.getCategory());
	        dbStatement.setString(2, ResourceObj.getName());
	        dbStatement.setString(3, ResourceObj.getCapacity());
	        dbStatement.setString(4, ResourceObj.getConfiguration());
	        dbStatement.setString(5, ResourceObj.getCompany());
	        dbStatement.setString(6, ResourceObj.getDescription());
	        dbStatement.setString(7, ResourceObj.getMaxviewablesize());
	        dbStatement.setString(8, ResourceObj.getMinimumviewablesize());
	        dbStatement.setString(9, ResourceObj.getDisplaytype());
	        dbStatement.setString(10, ResourceObj.getInputtype());
	        dbStatement.setString(11, ResourceObj.getDimension());
	        
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
	
	
	public List<Resource> GetAllResource()
	{
		List<Resource> ListofResource = new ArrayList<Resource>();
		
	    try 
	    {
	        PreparedStatement dbStatement = DBHanlde.prepareStatement
	        								("select *from Resource order by category");
	    
	        ResultSet Resultset = dbStatement.executeQuery();

	        while (Resultset.next())
	        {
	        	Resource ResourceObject = new Resource();

	        	ResourceObject.setResourceid(Resultset.getString("resourceid"));
	        	ResourceObject.setCategory(Resultset.getString("category"));
	        	ResourceObject.setName(Resultset.getString("name"));
	        	ResourceObject.setCapacity(Resultset.getString("capacity"));
	        	ResourceObject.setConfiguration(Resultset.getString("configuration"));
	        	ResourceObject.setCompany(Resultset.getString("company"));
	        	ResourceObject.setDescription(Resultset.getString("description"));
	        	ResourceObject.setMaxviewablesize(Resultset.getString("maxviewablesize"));
	        	ResourceObject.setMinimumviewablesize(Resultset.getString("minimumviewablesize"));
	        	ResourceObject.setDisplaytype(Resultset.getString("displaytype"));
	        	ResourceObject.setInputtype(Resultset.getString("inputtype"));
	        	ResourceObject.setDimension(Resultset.getString("dimension"));

	            ListofResource.add(ResourceObject);       	
	        	
	          }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return ListofResource;

	}
}

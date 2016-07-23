package term.testing;

import static org.junit.Assert.*;

import org.junit.Test;

import termp.dao.*;
import termp.util.ProjectConstants;

public class RegistrationTest {

	@Test
	public void TestRegistration() {
		//fail("Not yet implemented");
		
		registrationDAO RegisterDAO = new registrationDAO ();
		
		ProjectConstants ReturnStatus = RegisterDAO.CheckValidNetIDandGetType("as267691");
		
		assertEquals(ProjectConstants.SUCCESS, ReturnStatus);

		
		ReturnStatus = RegisterDAO.CheckValidNetIDandGetType("zz267691");
		
		assertEquals(ProjectConstants.USERNOTFOUND, ReturnStatus);
		
		
		String UserType = RegisterDAO.GetUserType();
		
		System.out.println("The get value is "+ UserType);
		
		//assertEquals("student", UserType);	
		assertEquals("student", UserType);
		
		
	}

}

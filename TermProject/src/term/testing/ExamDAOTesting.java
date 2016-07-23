package term.testing;

import static org.junit.Assert.*;

import org.junit.Test;

import termp.dao.registrationDAO;
import termp.util.ProjectConstants;
import termp.dao.*;

public class ExamDAOTesting {

	@Test
	public void TestRegistration() {
		//fail("Not yet implemented");
		
		ExamDAO ExamDAOObj = new ExamDAO ();
		
		boolean ReturnStatus = ExamDAOObj.ApplyExam("as267691", "3");
		System.out.println("The First return value is "+ ReturnStatus);
		
		assertEquals(false, ReturnStatus);

		
		ReturnStatus = ExamDAOObj.ApplyExam("as267691", "5");
		
		System.out.println("The 2nd return value is "+ ReturnStatus);
		
		assertEquals(true, ReturnStatus);
	
		
	}

}
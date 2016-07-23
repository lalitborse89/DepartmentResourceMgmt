package termp.model;

import termp.model.*;

public class Student extends Person {
	String degreetype;
	String status;
	String candidate;
	String advisorname;
	String major;

	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getAdvisorname() {
		return advisorname;
	}
	public void setAdvisorname(String advisorname) {
		this.advisorname = advisorname;
	}
	public String getDegreetype() {
		return degreetype;
	}
	public void setDegreetype(String degreetype) {
		this.degreetype = degreetype;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCandidate() {
		return candidate;
	}
	public void setCandidate(String candidate) {
		this.candidate = candidate;
	}
	

}

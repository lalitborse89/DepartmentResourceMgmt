package termp.model;

import java.util.Date;
import java.util.List;

import termp.model.*;

public class Discussion {
	String message;
	Date posteddate;
	String duscussionid;
	String posternetid;
	
	public List<Discussiondetails> DiscussDetailsdList;

	public List<Discussiondetails> getDiscussDetailsdList() {
		return DiscussDetailsdList;
	}
	
	public void setDiscussDetailsdList(List<Discussiondetails> DiscussDetailsdList) {
		this.DiscussDetailsdList = DiscussDetailsdList;
	}

	
	public String getDuscussionid() {
		return duscussionid;
	}
	
	public void setDuscussionid(String duscussionid) {
		this.duscussionid = duscussionid;
	}
	
	public String getPosternetid() {
		return posternetid;
	}
	
	public void setPosternetid(String posternetid) {
		this.posternetid = posternetid;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Date getPosteddate() {
		return posteddate;
	}
	
	public void setPosteddate(Date posteddate) {
		this.posteddate = posteddate;
	}

}

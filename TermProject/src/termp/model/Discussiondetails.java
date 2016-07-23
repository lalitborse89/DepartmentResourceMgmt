package termp.model;

import java.util.Date;

public class Discussiondetails {
	String duscussionreplyid;
	String posternetid;
	String parentthreadid;
	String reply;
	Date posteddate;

	
	public String getDuscussionreplyid() {
		return duscussionreplyid;
	}
	
	public void setDuscussionreplyid(String duscussionreplyid) {
		this.duscussionreplyid = duscussionreplyid;
	}
	
	public String getPosternetid() {
		return posternetid;
	}
	
	public void setPosternetid(String posternetid) {
		this.posternetid = posternetid;
	}
	
	public String getParentthreadid() {
		return parentthreadid;
	}
	
	public void setParentthreadid(String parentthreadid) {
		this.parentthreadid = parentthreadid;
	}
	
	public String getReply() {
		return reply;
	}
	
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	public Date getPosteddate() {
		return posteddate;
	}
	
	public void setPosteddate(Date posteddate) {
		this.posteddate = posteddate;
	}

}

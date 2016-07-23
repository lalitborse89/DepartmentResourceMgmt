package termp.model;

import java.util.Date;

public class News {
	String newsid;
	String posternetid;
	String description;
	Date posteddate;
	public String getNewsid() {
		return newsid;
	}
	public void setNewsid(String newsid) {
		this.newsid = newsid;
	}
	public String getPosternetid() {
		return posternetid;
	}
	public void setPosternetid(String posternetid) {
		this.posternetid = posternetid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getPosteddate() {
		return posteddate;
	}
	public void setPosteddate(Date posteddate) {
		this.posteddate = posteddate;
	}

}

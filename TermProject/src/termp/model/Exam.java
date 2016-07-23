package termp.model;

import java.util.Date;

public class Exam {
	String examid;
	String posternetid;
	String name;
	Date dateofexam;
	String description;	
	
	public String getExamid() {
		return examid;
	}
	public void setExamid(String examid) {
		this.examid = examid;
	}
	public String getPosternetid() {
		return posternetid;
	}
	public void setPosternetid(String posternetid) {
		this.posternetid = posternetid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDateofexam() {
		return dateofexam;
	}
	public void setDateofexam(Date dateofexam) {
		this.dateofexam = dateofexam;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}

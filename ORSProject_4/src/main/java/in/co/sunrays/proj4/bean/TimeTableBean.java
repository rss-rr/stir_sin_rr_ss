package in.co.sunrays.proj4.bean;

import java.sql.Timestamp;
import java.util.Date;

/**
 * TimeTable JavaBean encapsulates TimeTable attributes
 * 
 * @author RaviRathore
 * @version 1.0
 * 
 *
 */
public class TimeTableBean extends BaseBean{
	/**
	 * Subject ID 
	 *
	 */
	private int subId;
	/**
	 * Subject Name
	 *
	 */
	private String subName;
	/**
	 * Course ID 
	 *
	 */
	private long courseId;
	/**
	 * Course Name
	 *
	 */
	private String courseName;
	/**
	 * Semester 
	 *
	 */
	private String semester;
	/**
	 * Exam Date 
	 *
	 */
	private Date examDate;
	/**
	 * Exam Time
	 *
	 */
	private String examTime;
	/**
	 * Name of Created By
	 *
	 */
	private String createdBy;
	/**
	 * Accessor 
	 *
	 */
	public int getSubId() {
		return subId;
	}

	public void setSubId(int subId) {
		this.subId = subId;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public long getCourseId() {
		return courseId;
	}

	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public Date getExamDate() {
		return examDate;
	}

	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}

	public String getExamTime() {
		return examTime;
	}

	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}

	
	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Timestamp getCreatedDateTime() {
		return createdDateTime;
	}

	public void setCreatedDateTime(Timestamp createdDateTime) {
		this.createdDateTime = createdDateTime;
	}

	public Timestamp getModifiedDateTime() {
		return modifiedDateTime;
	}

	public void setModifiedDateTime(Timestamp modifiedDateTime) {
		this.modifiedDateTime = modifiedDateTime;
	}

	private String modifiedBy;
	private Timestamp createdDateTime;
	private Timestamp modifiedDateTime;
	
	public String getKey() {
		// TODO Auto-generated method stub
		return id+"";
	}

	public String getValue() {
		// TODO Auto-generated method stub
		return subName;
	}
	
	
	

}

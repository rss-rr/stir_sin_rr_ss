package in.co.sunrays.proj4.bean;

import java.util.Date;

/**
 * Student JavaBean encapsulates Student attributes
 * 
 * @author RaviRathore
 * @version 1.0
 * 
 *
 */

public class StudentBean extends BaseBean {
	/**
	 * First Name of Student
	 *
	 */
 private String  firstName;
 /**
  * Last Name 
  *
  */
 private String lastName;
 /**
  * Date of Birth of Student
  *
  */
  private  Date dob;
  /**
   * Mobile No of Student
   *
   */
  private long mobileNo;
  /**
   * Email of Student
   *
   */
  private String email;
  /**
   * College Id of Student
   *
   */
  private long collegeId;
  /**
   * College Name of Student
   *
   */
  private String collegeName;
  /**
   * Accessor
   *
   */
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
/**
 * Course Id of Student
 *
 */
private long courseId;
/**
 * Course Name of Student
 *
 */
  private String courseName;
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
public Date getDob() {
	return dob;
}
public void setDob(Date dob) {
	this.dob = dob;
}
public long getMobileNo() {
	return mobileNo;
}
public void setMobileNo(long mobileNo) {
	this.mobileNo = mobileNo;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public long getCollegeId() {
	return collegeId;
}
public void setCollegeId(long collegeId) {
	this.collegeId = collegeId;
}
public String getCollegeName() {
	return collegeName;
}
public void setCollegeName(String collegeName) {
	this.collegeName = collegeName;
}
public String getKey() {
	// TODO Auto-generated method stub
	return id+"";
}
public String getValue() {
	// TODO Auto-generated method stub
	return firstName+" "+lastName;
}
}

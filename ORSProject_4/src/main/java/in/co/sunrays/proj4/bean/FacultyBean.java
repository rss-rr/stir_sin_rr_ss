package in.co.sunrays.proj4.bean;

import java.util.Date;

/**
 * Faculty JavaBean encapsulates Faculty attributes
 * 
 * @author Ravirathore
 * @version 1.0
 * 
 *
 */


public class FacultyBean extends BaseBean {
	/**
	 * First Name of Faculty
	 *
	 */
    private String firstName;
    /**
     * Accessor
     *
     */
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getJoiningDate() {
		return joiningDate;
	}

	public void setJoiningDate(Date joiningDate) {
		this.joiningDate = joiningDate;
	}

	public String getQualification() {
		return Qualification;
	}

	public void setQualification(String qualification) {
		Qualification = qualification;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public long getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(long mobileNo) {
		this.mobileNo = mobileNo;
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

	public long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(long subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	/**
	 * Last Name of Faculty
	 *
	 */
	private String lastName;
	/**
	 * Gender of Faculty
	 *
	 */
    private String gender;
    /**
     * Joining date of Faculty
     *
     */
    private Date joiningDate;
    /**
     * Qualification of Faculty
     *
     */
    private String Qualification;
    /**
     * Email ID of Faculty
     *
     */
    private String emailId;
    /**
     * Mobile No of Faculty
     *
     */
    private long mobileNo;
    /**
     * College ID of Faculty
     *
     */
    private long collegeId;
    /**
     * College Name of Faculty
     *
     */
    private String collegeName;
    /**
     * Course Id of Faculty
     *
     */
    private long courseId;
    /**
     * course Name of Faculty
     *
     */
    private String courseName;
    /**
     * subjectId of Faculty
     *
     */
    private long subjectId;
    /**
     * subjectName of Faculty
     *
     */
    private String subjectName;
	
	
	public String getKey() {
		// TODO Auto-generated method stub
		return id+"";
	}

	public String getValue() {
		// TODO Auto-generated method stub
		return firstName+" "+lastName;
	}

}

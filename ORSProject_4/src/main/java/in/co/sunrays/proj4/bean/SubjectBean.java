package in.co.sunrays.proj4.bean;

/**
 * Subject JavaBean encapsulates Subject attributes
 * 
 * @author RaviRathore
 * @version 1.0
 * 
 *
 */

public class SubjectBean extends BaseBean{
	/**
	 * Subject Name 
	 *
	 */
	private String subjectName;
	/**
	 * Accessor 
	 *
	 */
	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getCourseId() {
		return courseId;
	}

	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}

	public long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(long subjectId) {
		this.subjectId = subjectId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	/**
	 * Description
	 *
	 */
	private String description;
	/**
	 * Course Id 
	 *
	 */
	private long courseId;
	/**
	 * Subject Id
	 *
	 */
	private long subjectId;
	/**
	 * Course Name
	 *
	 */
    private String courseName;
	
	public String getKey() {
		// TODO Auto-generated method stub
		return id+"";
	}

	public String getValue() {
		// TODO Auto-generated method stub
		return subjectName;
	}

}

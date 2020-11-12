package in.co.sunrays.proj4.bean;

/**
 * Course JavaBean encapsulates Course attributes
 * 
 * @author RaviRathore
 * @version 1.0
 *
 *
 */

public class CourseBean extends BaseBean{
	/**
	 * Course Name of Course
	 *
	 */
	private String courseName;
	/**
	 * Accessor
	 *
	 */
	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	/**
	 * Description of Course
	 *
	 */
	private String description;
	/**
	 * Duration of Course
	 *
	 */
	private String duration;
	
	
	public String getKey() {
		// TODO Auto-generated method stub
		return id+"";
	}

	public String getValue() {
		// TODO Auto-generated method stub
		return courseName;
	}

}

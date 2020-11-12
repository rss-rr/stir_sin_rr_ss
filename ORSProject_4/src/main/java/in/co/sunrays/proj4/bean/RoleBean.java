package in.co.sunrays.proj4.bean;

/**
 * Role JavaBean encapsulates Role attributes
 *
 * @author RaviRathore
 * @version 1.0
 * 
 */

public class RoleBean extends BaseBean{
	/**
	 * Pre defined Role
	 *
	 */
	public static final int ADMIN=1;
	public static final int STUDENT=2;
	public static final int COLLEGE_SCHOOL=4;
	public static final int KIOSK=3;
	/**
	 * Role Name
	 *
	 */
	private String name;
	/**
	 * Role Description
	 *
	 */
	private  String description;
	/**
	 * Accessor
	 *
	 */
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public static int getAdmin() {
		return ADMIN;
	}
	public static int getStudent() {
		return STUDENT;
	}
	public static int getCollegeSchool() {
		return COLLEGE_SCHOOL;
	}
	public static int getKiosk() {
		return KIOSK;
	}
	public String getKey() {
		// TODO Auto-generated method stub
		return id+"";
	}
	public String getValue() {
		// TODO Auto-generated method stub
		return name;
	}
	
}

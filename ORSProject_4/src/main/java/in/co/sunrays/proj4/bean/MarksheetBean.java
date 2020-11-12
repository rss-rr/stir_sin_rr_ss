package in.co.sunrays.proj4.bean;

/**
 * Marksheet JavaBean encapsulates Marksheet attributes
 * 
 * @author RaviRathore
 * @version 1.0
 * 
 *
 */

public class MarksheetBean extends BaseBean{
	/**
	 * Roll No of Marksheet
	 *
	 */	
private  String rollNo;
/**
 * Student ID of MArksheet
 *
 */
private long studentId ;
/**
 * Name of Student
 *
 */
private String name;
/**
 * Marks of physivs
 *
 */
private int physics;
/**
 * marks of Chemistry
 *
 */
private int chemistry;
/**
 * marks of maths
 *
 */
private int maths;
/**
 * Accessor
 *
 */
public String getRollNo() {
	return rollNo;
}
public void setRollNo(String rollNo) {
	this.rollNo = rollNo;
}
public long getStudentId() {
	return studentId;
}
public void setStudentId(long studentId) {
	this.studentId = studentId;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getPhysics() {
	return physics;
}
public void setPhysics(int physics) {
	this.physics = physics;
}
public int getChemistry() {
	return chemistry;
}
public void setChemistry(int chemistry) {
	this.chemistry = chemistry;
}
public int getMaths() {
	return maths;
}
public void setMaths(int maths) {
	this.maths = maths;
}
public String getKey() {
	// TODO Auto-generated method stub
	return id+"";
}
public String getValue() {
	// TODO Auto-generated method stub
	return rollNo;
}

}

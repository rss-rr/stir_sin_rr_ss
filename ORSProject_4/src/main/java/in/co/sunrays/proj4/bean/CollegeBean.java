package in.co.sunrays.proj4.bean;

/**
 * College JavaBean encapsulates College attributes
 * 
 * @author RaviRathore
 * @version 1.0
 * 
 *
 */

public class CollegeBean extends BaseBean {
	/**
	 * Name of College
	 *
	 */
	private String name;
	/**
	 * Address of College
	 *
	 */
	private  String address;
	/**
	 * State of College
	 *
	 */
	private String state;
	/**
	 * City of College
	 *
	 */
	private String city;
	/**
	 * Phone No of College
	 *
	 */
	private long phoneNo;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public long getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(long phoneNo) {
		this.phoneNo = phoneNo;
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
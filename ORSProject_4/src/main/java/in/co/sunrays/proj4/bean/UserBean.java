package in.co.sunrays.proj4.bean;

import java.sql.Timestamp;
import java.util.Date;
/**
 * User JavaBean encapsulates User attributes
 * 
 * @author RaviRathore
 * @version 1.0
 * 
 * 
 */

public class UserBean extends BaseBean{
 public static final String ACTIVE="Active";
 public static final String INACTIVE="Inactive";
 /**
  * First Name of User
  *
  */
 private String firstName;
 /**
  * lastName of User
  *
  */
 private String lastName;
 /**
  * login of User
  *
  */
 private String login;
 /**
  * password of User
  *
  */
 private String password;
 /**
  * confirmPassword of User
  *
  */
 private String confirmPassword;
 /**
  *  dob of User
  *
  */
 private Date dob;
 /**
  * mobileNo of User
  *
  */
 private  String mobileNo;
 /**
  * rollId of User
  *
  */
 private  long rollId;
 /**
  * gender of User
  *
  */
 private int unSuccessfulLogin;
 /**
  * First Name of User
  *
  */
 private String gender;
 /**
  * lastLogin of User
  *
  */
 private Timestamp lastLogin;
 /**
  *  lock of User
  *
  */
 private String lock;
 /**
  *registeredIp of User
  *
  */
 private  String registeredIp;
 /**
  * lastLoginIp of User
  *
  */
 private String lastLoginIp;
 /**
  * Getter and Setter
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
public String getLogin() {
	return login;
}
public void setLogin(String login) {
	this.login = login;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getConfirmPassword() {
	return confirmPassword;
}
public void setConfirmPassword(String confirmPassword) {
	this.confirmPassword = confirmPassword;
}
public Date getDob() {
	return dob;
}
public void setDob(Date dob) {
	this.dob = dob;
}
public String getMobileNo() {
	return mobileNo;
}
public void setMobileNo(String mobileNo) {
	this.mobileNo = mobileNo;
}
public long getRollId() {
	return rollId;
}
public void setRollId(long rollId) {
	this.rollId = rollId;
}
public int getUnSuccessfulLogin() {
	return unSuccessfulLogin;
}
public void setUnSuccessfulLogin(int unSuccessfulLogin) {
	this.unSuccessfulLogin = unSuccessfulLogin;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public Timestamp getLastLogin() {
	return lastLogin;
}
public void setLastLogin(Timestamp lastLogin) {
	this.lastLogin = lastLogin;
}
public String getLock() {
	return lock;
}
public void setLock(String lock) {
	this.lock = lock;
}
public String getRegisteredIp() {
	return registeredIp;
}
public void setRegisteredIp(String registeredIp) {
	this.registeredIp = registeredIp;
}
public String getLastLoginIp() {
	return lastLoginIp;
}
public void setLastLoginIp(String lastLoginIp) {
	this.lastLoginIp = lastLoginIp;
}
public static String getActive() {
	return ACTIVE;
}
public static String getInactive() {
	return INACTIVE;
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

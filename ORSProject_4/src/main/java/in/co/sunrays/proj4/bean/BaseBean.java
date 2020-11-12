package in.co.sunrays.proj4.bean;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Parent class of all bean classes it contains Generic attribute
 * 
 * @author RaviRathore
 * @version 1.0
 * 
 * 
 *
 */



public abstract class BaseBean implements Serializable,Comparable<BaseBean>,DropDownListBean {
	/**
	 * Non Business primary key
	 *
	 */
	protected long id;
	/**
	 * Contains User Id  who creates this Database record
	 *
	 */
	protected String  createdBy;
	/**
	 * Contains User Id who modifies this Database record
	 *
	 */
	protected String modifiedBy;
	/**
	 * contain created TimeStamp of database record
	 *
	 */
	protected Timestamp createdDatetime;
	/**
	 * contain modified TimeStamp of database record
	 *
	 */
	protected Timestamp modifiedDatetime;
	/**
	 * accessor
	 *
	 */
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
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
	public Timestamp getCreatedDatetime() {
		return createdDatetime;
	}
	public void setCreatedDatetime(Timestamp createdDatetime) {
		this.createdDatetime = createdDatetime;
	}
	public Timestamp getModifiedDatetime() {
		return modifiedDatetime;
	}
	public void setModifiedDatetime(Timestamp modifiedDatetime) {
		this.modifiedDatetime = modifiedDatetime;
	}
	public int compareTo(BaseBean next) {
		
		return getValue().compareTo(next.getValue());
	}
	

}

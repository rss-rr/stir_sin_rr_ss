package in.co.sunrays.proj4.util;

import java.util.Date;
/**
 * This class validates input data
 *
 * @author Ravi Rathore
 * @version 1.0
 * @Copyright (c) RaviOS
 */
public class DataValidator {
	 /**
     * Checks if value is Null
     *
     * @param val
     * @return
     */
	public  static boolean isNull(String val)
	{
		if(val==null||val.trim().length()==0)
		{
			return true;
		}
		else{
		return false;
		}
		
	}
	/**
     * Checks if value is NOT Null
     *
     * @param val
     * @return
     */
	public static  boolean isNotNull(String val)
	{
		return !isNull(val);
		
	}
	public static  boolean isInteger(String val)
	{
		if(isNotNull(val))
		{ try{
			int i=Integer.parseInt(val);
			return true;
		}catch(Exception e)
		{
			return false;
		}
		} 
		else
		{
		return false;
		}
		
	}
	public  static boolean isLong(String val)
	{
		if(isNotNull(val))
		{ try{
			long i=Long.parseLong(val);
			System.out.println(i);
			return true;
		}catch(Exception e)
		{
			return false;
		}
		} 
		else
		{
		return false;
		}
	}
	public static  boolean isEmail(String val)
	{
	  String emailreg = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
     if(isNotNull(val))
     {
    	 try{
    		 return val.matches(emailreg);
    				 
    	 }catch(Exception e)
    	 {
    		return false; 
    	 }
     }
     else{
	  return false;
     }
		
	}
	public static boolean isDate(String val)
	{ 
		Date d=null;
		if(isNotNull(val))
		{
		d=DataUtility.getDate(val);
		}
		return d!=null;

	}
	public static void main(String[] args) {
		System.out.println("not null  "+isNotNull("ABC"));
        System.out.println("not null  "+isNotNull(null));
		System.out.println("not null  "+isNotNull("ABC"));
		System.out.println("not null  "+isInteger("123 "));
		System.out.println("not null  "+isNotNull(""));
	}
	}
	

	



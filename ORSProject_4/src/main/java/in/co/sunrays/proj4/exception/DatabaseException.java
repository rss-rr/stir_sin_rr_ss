package in.co.sunrays.proj4.exception;
/**
 * DatabaseException is propogated by DAO classes when an unhandled Database
 * exception occurred
 *
 * @author RaviOS
 * @version 1.0
 * @Copyright (c) RaviOS
 *
 */
public class DatabaseException extends Exception {
	public DatabaseException()
	{
		
	}
	/**
     * @param msg
     *            : Error message
     */
    public DatabaseException(String msg)
    {
    	
    }
}

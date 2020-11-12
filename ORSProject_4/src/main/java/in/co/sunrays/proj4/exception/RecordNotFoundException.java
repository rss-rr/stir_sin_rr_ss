package in.co.sunrays.proj4.exception;

/**
 * RecordNotFoundException thrown when a record not found occurred
 *
 * @author RaviOS
 * @version 1.0
 * @Copyright (c) RaviOS
 *
 */
public class RecordNotFoundException extends Exception{
	public RecordNotFoundException()
	{
		
	}
	/**
     * @param msg
     *            error message
     */
	public RecordNotFoundException(String msg)
	{
		super(msg);
	}

}

package in.co.sunrays.proj4.exception;
/**
 * DuplicateRecordException thrown when a duplicate record occurred
 *
 * @author RaviOS
 * @version 1.0
 * @Copyright (c) RaviOS
 *
 */
public class DuplicateRecordException extends Exception {
	public DuplicateRecordException()
	{
		
	}
	 /**
     * @param msg
     *            error message
     */
	public DuplicateRecordException(String msg)
	{
		super(msg);
	}

}

package in.co.sunrays.proj4.exception;
/**
 * ApplicationException is propogated from Service classes when an business
 * logic exception occurered.
 *
 * @author RaviOS
 * @version 1.0
 * @Copyright (c) RaviOS
 *
 */
public class ApplicationException extends Exception {
	
	public ApplicationException()
	{
		
	}
	 /**
     * @param msg
     *            : Error message
     */
	public ApplicationException(String msg)
	{
		super(msg);
	}

}

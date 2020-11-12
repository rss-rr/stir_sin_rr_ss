package in.co.sunrays.proj4.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Data Utility class to format data from one format to another
 *
 * @author Ravi Rathore
 * @version 1.0
 * @Copyright (c) RaviOS
 */
public class DataUtility {
	/**
     * Application Date Format
     */
	public static final String APP_DATE_FORMATE = "dd/MM/yyyy";
	public static final String APP_TIME_FORMATE = "dd/MM/yyyy HH:mm:ss";
	/**
     * Date formatter
     */
	private static final SimpleDateFormat formatter = new SimpleDateFormat(APP_DATE_FORMATE);
	private static final SimpleDateFormat timeFormatter = new SimpleDateFormat(APP_TIME_FORMATE);
	/**
     * Trims and trailing and leading spaces of a String
     *
     * @param val
     * @return
     */
	public static String getString(String val) {
		if (DataValidator.isNotNull(val)) {
			return val.trim();
		}
		return"";
	}

	public static String getStringData(Object obj) {
		System.out.println(obj);
		if (obj != null) {
			return obj.toString();
		} else {
			return "";
		}

	}

	public static int getInt(String val) {
		if (DataValidator.isInteger(val)) {
			return Integer.parseInt(val);
		}
		return 0;

	}

	public static long getLong(String val) {
		if (DataValidator.isLong(val)) {
			return Long.parseLong(val);
		}
		return 0;

	}

	public static Date getDate(String val) {
		Date date = null;
		try {
			System.out.println("in date");
			date = formatter.parse(val);
		} catch (Exception e) {
		}
		System.out.println("out date "+date);
		return date;

	}
	public static Date getDate1(String val) {
		Date date = null;
		try {
			System.out.println("in date1");
			date = timeFormatter.parse(val);
		} catch (Exception e) {
		}
		System.out.println("out date1 "+date);
		return date;

	}

	public static String getDateString(Date date) {
		try {
			return formatter.format(date);
		} catch (Exception e) {
		}
		return "";

	}

	public static Date get(Date date, int day) {
		return null;
	}

	public static Timestamp getTimeStamp(String val) {
		Timestamp timeStamp = null;
		try {
			timeStamp = new Timestamp((timeFormatter.parse(val)).getTime());
		} catch (Exception e) {
		}
		return timeStamp;
	}

	public static Timestamp getTimeStamp(long val) {
		Timestamp timeStamp = null;
		try {
			timeStamp = new Timestamp(val);
		} catch (Exception e) {
			return null;
		}
		return timeStamp;

	}

	public static Timestamp getCurrentTimeStamp() {
		Timestamp timeStamp = null;
		try {
			timeStamp = new Timestamp(new Date().getTime());
		} catch (Exception e) {
		}
		return timeStamp;
	}

	public static long getTimeStamp(Timestamp timeStamp) {
		try {
			return timeStamp.getTime();
		} catch (Exception e) {
			return 0;
		}

	}

	public static String longMob(long val) {
		if (val > 0) {

		}
		return null;

	}

	public static void main(String[] args) {

	}

}

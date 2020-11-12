package in.co.sunrays.proj4.util;
/**
 * Contains Email Message
 *
 * @author Ravi Rathore
 * @version 1.0
 * @Copyright (c) RaviOS
 *
 */
public class EmailMessage {
	private String to;
	private String from;
	private String cc;
	private String bcc;
	private String subject;
	private String message;
	private int messageType;
	public static final int HTML_MSG=1;
	public static final int TEXT_MSG=0;
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public String getBcc() {
		return bcc;
	}
	public void setBcc(String bcc) {
		this.bcc = bcc;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getMessageType() {
		return messageType;
	}
	public void setMessageType(int messageType) {
		this.messageType = messageType;
	}
	public static int getHtmlMsg() {
		return HTML_MSG;
	}
	public static int getTextMsg() {
		return TEXT_MSG;
	}
	

}

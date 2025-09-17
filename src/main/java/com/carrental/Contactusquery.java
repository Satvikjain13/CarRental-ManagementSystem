package com.carrental;

public class Contactusquery {
	
	private int id;
	private String name;
	private String EmailId;
	private String ContactNumber;
	private String Message;
	private String PostingDate;
	private String Status;
	
	public Contactusquery() {
		super();
	}
	public Contactusquery(String name, String emailId, String contactNumber, String message, String status) {
		super();
		this.name = name;
		EmailId = emailId;
		ContactNumber = contactNumber;
		Message = message;
		Status = status;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmailId() {
		return EmailId;
	}
	public void setEmailId(String emailId) {
		EmailId = emailId;
	}
	
	public String getContactNumber() {
		return ContactNumber;
	}
	public void setContactNumber(String contactNumber) {
		ContactNumber = contactNumber;
	}
	
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
	
	public String getPostingDate() {
		return PostingDate;
	}
	public void setPostingDate(String postingDate) {
		PostingDate = postingDate;
	}
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	
	@Override
	public String toString() {
		return "Contactusquery [id=" + id + ", name=" + name + ", EmailId=" + EmailId + ", ContactNumber="
				+ ContactNumber + ", Message=" + Message + ", PostingDate=" + PostingDate + ", Status=" + Status + "]";
	}
}

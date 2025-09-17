package com.carrental;

public class Booking {
	
	private int id;
	private int BookingNumber;
	private String userEmail;
	private int VehicleId;
	private String FromDate;
	private String ToDate;
	private String message;
	private String Status;
	private String PostingDate;
	private String LastUpdationDate;
	
	public Booking() {
		super();
	}
	
	public Booking(int bookingNumber, String userEmail, int vehicleId, String fromDate, String toDate, String message,
			String status) {
		super();
		BookingNumber = bookingNumber;
		this.userEmail = userEmail;
		VehicleId = vehicleId;
		FromDate = fromDate;
		ToDate = toDate;
		this.message = message;
		Status = status;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getBookingNumber() {
		return BookingNumber;
	}
	public void setBookingNumber(int bookingNumber) {
		BookingNumber = bookingNumber;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	public int getVehicleId() {
		return VehicleId;
	}	
	public void setVehicleId(int vehicleId) {
		VehicleId = vehicleId;
	}
	
	public String getFromDate() {
		return FromDate;
	}	
	public void setFromDate(String fromDate) {
		FromDate = fromDate;
	}
	
	public String getToDate() {
		return ToDate;
	}
	public void setToDate(String toDate) {
		ToDate = toDate;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	
	public String getPostingDate() {
		return PostingDate;
	}
	public void setPostingDate(String postingDate) {
		PostingDate = postingDate;
	}
	
	public String getLastUpdationDate() {
		return LastUpdationDate;
	}
	public void setLastUpdationDate(String lastUpdationDate) {
		LastUpdationDate = lastUpdationDate;
	}
	
	@Override
	public String toString() {
		return "Booking [id=" + id + ", BookingNumber=" + BookingNumber + ", userEmail=" + userEmail + ", VehicleId="
				+ VehicleId + ", FromDate=" + FromDate + ", ToDate=" + ToDate + ", message=" + message + ", Status="
				+ Status + ", PostingDate=" + PostingDate + ", LastUpdationDate=" + LastUpdationDate + "]";
	}
}

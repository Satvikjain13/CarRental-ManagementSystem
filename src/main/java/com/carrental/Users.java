package com.carrental;

public class Users {
	
	private int id;
	private String FullName;
	private String EmailId;
	private String Password;
	private String ContactNo;
	private String dob;
	private String Address;
	private String City;
	private String Country;
	private String RegDate;
	private String UpdationDate;
	
	public Users() {
		super();
	}
	
	public Users(String fullName, String emailId, String password, String contactNo, String dob, String address,
			String city, String country) {
		super();
		FullName = fullName;
		EmailId = emailId;
		Password = password;
		ContactNo = contactNo;
		this.dob = dob;
		Address = address;
		City = city;
		Country = country;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFullName() {
		return FullName;
	}
	public void setFullName(String fullName) {
		FullName = fullName;
	}
	
	public String getEmailId() {
		return EmailId;
	}
	public void setEmailId(String emailId) {
		EmailId = emailId;
	}
	
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	
	public String getContactNo() {
		return ContactNo;
	}
	public void setContactNo(String contactNo) {
		ContactNo = contactNo;
	}
	
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	
	public String getRegDate() {
		return RegDate;
	}
	public void setRegDate(String regDate) {
		RegDate = regDate;
	}
	
	public String getUpdationDate() {
		return UpdationDate;
	}
	public void setUpdationDate(String updationDate) {
		UpdationDate = updationDate;
	}
	
	@Override
	public String toString() {
		return "Users [id=" + id + ", FullName=" + FullName + ", EmailId=" + EmailId + ", Password=" + Password
				+ ", ContactNo=" + ContactNo + ", dob=" + dob + ", Address=" + Address + ", City=" + City + ", Country="
				+ Country + ", RegDate=" + RegDate + ", UpdationDate=" + UpdationDate + "]";
	}
}

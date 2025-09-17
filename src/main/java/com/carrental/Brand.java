package com.carrental;

public class Brand {
	
	private int id;
	private String BrandName;
	private String CreationDate;
	private String UpdationDate;
	
	public Brand() {
		super();
	}
	
	public Brand(String brandName) {
		super();
		BrandName = brandName;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getBrandName() {
		return BrandName;
	}
	public void setBrandName(String brandName) {
		BrandName = brandName;
	}
	
	public String getCreationDate() {
		return CreationDate;
	}
	public void setCreationDate(String creationDate) {
		CreationDate = creationDate;
	}
	
	public String getUpdationDate() {
		return UpdationDate;
	}
	public void setUpdationDate(String updationDate) {
		UpdationDate = updationDate;
	}
	
	@Override
	public String toString() {
		return "Brand [id=" + id + ", BrandName=" + BrandName + ", CreationDate=" + CreationDate + ", UpdationDate="
				+ UpdationDate + "]";
	}
}

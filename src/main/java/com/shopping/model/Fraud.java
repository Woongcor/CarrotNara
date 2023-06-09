package com.shopping.model;

public class Fraud {
	private int no ;
	private String id ;
	private String mid;
	private String name ;
	private String phone;
	private String fraud ;
	private String frauddetail ;
	private String regdate ;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFraud() {
		return fraud;
	}
	public void setFraud(String fraud) {
		this.fraud = fraud;
	}
	public String getFrauddetail() {
		return frauddetail;
	}
	public void setFrauddetail(String frauddetail) {
		this.frauddetail = frauddetail;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	
	@Override
	public String toString() {
		return "Fraud [no=" + no + ", id=" + id + ", mid=" + mid + ", name=" + name + ", phone=" + phone + ", fraud="
				+ fraud + ", frauddetail=" + frauddetail + ", regdate=" + regdate + "]";
	}
	public Fraud() { }

	public Fraud(int no, String id, String mid, String name, String phone, String fraud, String frauddetail,
			String regdate) {
		super();
		this.no = no;
		this.id = id;
		this.mid = mid;
		this.name = name;
		this.phone = phone;
		this.fraud = fraud;
		this.frauddetail = frauddetail;
		this.regdate = regdate;
	}

	
	
}

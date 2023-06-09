package com.shopping.model;

public class Category {
	private String engname ; // 영문 이름
	private String korname ; // 한글 이름
	
	public Category() {
		
	}
	

	@Override
	public String toString() {
		return "Category [engname=" + engname + ", korname=" + korname + "]";
	}

	public String getEngname() {
		return engname;
	}

	public void setEngname(String engname) {
		this.engname = engname;
	}

	public String getKorname() {
		return korname;
	}

	public void setKorname(String korname) {
		this.korname = korname;
	}
	
	
}

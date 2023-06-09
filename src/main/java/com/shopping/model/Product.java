package com.shopping.model;

public class Product {
	private int num;
	private String writer;
	private String name;
	private String comments;
	private String image01;
	private String image02;
	private String image03;
	private int price;
	private String category;
	private String inputdate;
	private String cate;
	private String address;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Product [num=" + num + ", writer=" + writer + ", name=" + name + ", comments=" + comments + ", image01="
				+ image01 + ", image02=" + image02 + ", image03=" + image03 + ", price=" + price + ", category="
				+ category + ", inputdate=" + inputdate + ", cate=" + cate + ", address=" + address + "]";
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getImage01() {
		return image01;
	}

	public void setImage01(String image01) {
		this.image01 = image01;
	}

	public String getImage02() {
		return image02;
	}

	public void setImage02(String image02) {
		this.image02 = image02;
	}

	public String getImage03() {
		return image03;
	}

	public void setImage03(String image03) {
		this.image03 = image03;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	

}
package com.shopping.model;

// 나의 wishList 품목 1개를 의미하는 bean 클래스
public class ShoppingBasket {	
	private String mid ;
	private int pnum ;
	
	public ShoppingBasket() {}

	@Override
	public String toString() {
		return "ShoppingBasket [mid=" + mid + ", pnum=" + pnum + "]";
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	
	
}
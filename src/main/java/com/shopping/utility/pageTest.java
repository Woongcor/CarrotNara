package com.shopping.utility;

public class pageTest {
	public static void main(String[] args) {
		String _pageNumber = "25" ;
		String _pageSize = "10" ;
		int totalCount = 280;
		String url = "boList" ;
		String mode = "";
		String keyword = "";
		boolean isGrid = false ;
		
		Paging pageInfo = new Paging(_pageNumber, _pageSize, totalCount, url, mode, keyword, isGrid);
		System.out.println(pageInfo);
		System.out.println();
		
		System.out.println(pageInfo.getPagingHtml());
	}
}




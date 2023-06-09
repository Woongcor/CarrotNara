package com.shopping.controller.board;

import java.io.IOException;  
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.dao.FraudDao;
import com.shopping.model.Fraud;
import com.shopping.utility.Paging;

public class BoardListController6 extends SuperClass {
	@Override // 게시물 목록을 조회합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response); 
		
		String pageNumber = request.getParameter("pageNumber") ;
		String pageSize = request.getParameter("pageSize") ;
		String mode = request.getParameter("mode") ;
		String keyword = request.getParameter("keyword") ;
		
		if(mode==null) {mode="all";}
		if(keyword==null) {keyword="";}
		
		FraudDao dao = new FraudDao() ;
		List<Fraud> lists = null ;
		boolean isGrid = false ;
		
		try {
			int totalCount = dao.GetTotalRecordCount(mode, keyword) ;
			String url = super.getUrlInfo("boList6");
			
			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);			
			
			// lists = dao.SelectAll(); // 이전 버전			
			lists = dao.SelectAll(pageInfo);
			
			request.setAttribute("datalist", lists);
			request.setAttribute("pageInfo", pageInfo); // 페이징 정보를 바인딩
			
			String gotopage = "board/boList6.jsp" ;			
			super.GotoPage(gotopage);
			
		} catch (Exception e) {			
			e.printStackTrace();
		}
	}
}


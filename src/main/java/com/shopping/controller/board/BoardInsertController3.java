package com.shopping.controller.board;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.dao.REVIEWDao;
import com.shopping.model.REVIEW;

public class BoardInsertController3 extends SuperClass{
	private final String PREFIX = "board/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response); 
		String gotopage = PREFIX + "boInsertForm3.jsp" ; 
		
		super.GotoPage(gotopage);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		String writer = request.getParameter("writer") ;
		String subject = request.getParameter("subject") ;
		String content = request.getParameter("content") ;
		String regdate = request.getParameter("regdate") ;		
		String remark = request.getParameter("remark") ;
		String image01 = request.getParameter("image01") ;
		String image02 = request.getParameter("image02") ;
		
		REVIEW bean = new REVIEW() ;
		
		bean.setWriter(writer);
		bean.setSubject(subject);
		bean.setContent(content);
		bean.setRegdate(regdate);
		bean.setRemark(remark);
		bean.setImage01(image01);
		bean.setImage02(image02);
		
		REVIEWDao dao = new REVIEWDao();
		
		int cnt = -1 ;// 가정) -1은 실패 
		try {
			cnt = dao.InsertData(bean);
			
			if(cnt == -1) { // 실패
				new BoardInsertController3().doGet(request, response);
				
			}else { // 성공
				new BoardListController3().doGet(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
			new BoardInsertController3().doGet(request, response);
		}
	}
}

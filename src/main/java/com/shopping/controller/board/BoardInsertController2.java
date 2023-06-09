package com.shopping.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.dao.QnaDao;
import com.shopping.model.Qna;

public class BoardInsertController2 extends SuperClass{
	private final String PREFIX = "board/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response); 
		String gotopage = PREFIX + "boInsertForm1112.jsp" ; 
		
		super.GotoPage(gotopage);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		String writer = request.getParameter("writer") ;
		String subject = request.getParameter("subject") ;
		String content = request.getParameter("content") ;
		String regdate = request.getParameter("regdate") ;		
		
		
		Qna bean = new Qna() ;
		
		bean.setWriter(writer);
		bean.setSubject(subject);
		bean.setContent(content);
		bean.setRegdate(regdate);
		
		
		QnaDao dao = new QnaDao();
		
		int cnt = -1 ;// 가정) -1은 실패 
		try {
			cnt = dao.InsertData(bean);
			
			if(cnt == -1) { // 실패
				new BoardInsertController2().doGet(request, response);
				
			}else { // 성공
				new BoardListController2().doGet(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
			new BoardInsertController2().doGet(request, response);
		}
	}
}

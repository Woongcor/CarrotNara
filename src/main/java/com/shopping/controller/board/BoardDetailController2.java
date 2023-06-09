package com.shopping.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.dao.QnaDao;
import com.shopping.model.Qna;

public class BoardDetailController2 extends SuperClass{
	@Override // 회원의 아이디를 이용하여 회원 상세 정보를 조회합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		super.doGet(request, response);
		
		int no = Integer.parseInt(request.getParameter("no")) ;		
		QnaDao dao = new QnaDao() ;		
		Qna bean = null ;
		int cnt = -1 ;
		
		try {
			bean = dao.GetDataByPk(no);	
			
			if(loginfo.getId().equals(bean.getWriter()) == false) {
				// 조회수 업데이트 하기
				cnt = dao.UpdateReadhit(no);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(bean==null){
			super.setAlertMessage("잘못된 게시물 정보입니다.");
			super.GotoPage("common/home.jsp");
		}else {
			request.setAttribute("bean", bean) ;
			super.GotoPage("board/boDetail2.jsp"); 
		}
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
}

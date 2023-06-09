package com.shopping.controller.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;

import com.shopping.controller.board.BoardDetailController2;
import com.shopping.dao.QnaCommentDao;


public class CommentDeleteController2 extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		super.doGet(request, response);
		
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		QnaCommentDao dao = new QnaCommentDao() ;
		int cnt = -1 ;

		try {
			cnt = dao.DeleteData(cnum) ;
			
			new BoardDetailController2().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

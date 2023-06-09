package com.shopping.controller.comment;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;

import com.shopping.controller.board.BoardDetailController2;
import com.shopping.dao.QnaCommentDao;

import com.shopping.model.QnaComment;

public class CommentInsertController2 extends SuperClass {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		super.doPost(request, response);
		
		QnaComment bean = new QnaComment() ;
		bean.setNo(Integer.parseInt(request.getParameter("no")));
		bean.setContent(request.getParameter("content"));
		bean.setWriter(request.getParameter("writer"));
		QnaCommentDao dao = new QnaCommentDao() ;
		int cnt = -1 ; 
		
		try {
			cnt = dao.InsertData(bean) ;
			
			new BoardDetailController2().doPost(request, response); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

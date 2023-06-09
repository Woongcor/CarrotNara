package com.shopping.controller.comment;

import java.io.IOException;  

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.board.BoardDetailController3;
import com.shopping.dao.ReviewCommentDao;
import com.shopping.model.ReviewComment;

public class CommentInsertController3 extends SuperClass{

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	
		ReviewComment bean = new ReviewComment();
		
		bean.setNo(Integer.parseInt(request.getParameter("no")));
		bean.setWriter(request.getParameter("writer"));
		bean.setContent(request.getParameter("content"));
	
		ReviewCommentDao dao = new ReviewCommentDao();
		int cnt = -1;
		
		
		try {
			cnt = dao.InsertData(bean);
			
			new BoardDetailController3().doPost(request, response);
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
}

package com.shopping.controller.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.dao.REVIEWDao;
import com.shopping.dao.ReviewCommentDao;

public class CommentUpdateController3 extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		String content = String.valueOf(request.getParameter("content"));
		
		
		ReviewCommentDao dao = new ReviewCommentDao() ;
		int cnt = -1 ;
		
		try {
			cnt = dao.UpdateData3(cnum,content) ;
			super.GotoPage("board/boDetail3.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}


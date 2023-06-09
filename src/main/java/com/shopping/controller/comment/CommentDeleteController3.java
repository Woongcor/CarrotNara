package com.shopping.controller.comment;

import java.io.IOException;   

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.board.BoardDetailController3;
import com.shopping.dao.ReviewCommentDao;

public class CommentDeleteController3 extends SuperClass{
 @Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	super.doGet(request, response);
	
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	ReviewCommentDao dao = new ReviewCommentDao();
	int cnt = -1;
	
	try {
		cnt=dao.DeleteData(cnum);
		new BoardDetailController3().doGet(request, response);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}
}

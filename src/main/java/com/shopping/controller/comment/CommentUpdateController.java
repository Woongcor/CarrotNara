package com.shopping.controller.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.product.ProductDetailController;
import com.shopping.dao.CommentDao;
import com.shopping.model.Comment;

public class CommentUpdateController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		String ct =String.valueOf(request.getParameter("content"));
		
		CommentDao dao = new CommentDao();
		
		int cnt = -1 ;
		
		try {
			cnt = dao.UpdateData(cnum, ct) ;
			
			super.GotoPage("product/prDetail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

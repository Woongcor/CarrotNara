package com.shopping.controller.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.product.ProductDetailController;
import com.shopping.dao.CommentDao;
import com.shopping.model.Comment;

public class CommentInsertController extends SuperClass{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		Comment bean = new Comment();
		
		
		bean.setNo(Integer.parseInt(request.getParameter("no")));
		bean.setContent(request.getParameter("content"));
		bean.setWriter(request.getParameter("writer"));
		
		CommentDao dao = new CommentDao();
		int cnt = -1 ;
		
		try {
			cnt = dao.InsertData(bean);
			
			super.GotoPage("product/prDetail.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}

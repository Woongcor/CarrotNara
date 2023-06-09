package com.shopping.controller.mall;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;

public class MallInsertController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		
		if(super.loginfo==null) {
			super.youNeededLogin();
			return ;
		}

		int num = Integer.parseInt(request.getParameter("num")) ; // 상품 번호
		super.mycart.AddCart(num) ;
		super.session.setAttribute("mycart", mycart) ;
		new MallListController().doGet(request, response) ;
	}
}
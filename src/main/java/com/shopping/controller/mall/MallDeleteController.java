package com.shopping.controller.mall;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.dao.MallDao;

public class MallDeleteController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		super.doGet(request, response);
		
		if(super.loginfo==null) {
			super.youNeededLogin();
			return ;
		}
		
		MallDao dao = new MallDao();
		int cnt = -1;
		
		try {
			int pnum = Integer.parseInt(request.getParameter("pnum"));
			
			cnt = dao.DeleteData(pnum);
			super.mycart.DeleteCart(pnum);
			
			new MallListController().doGet(request, response) ;
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
}
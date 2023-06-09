package com.shopping.controller.board;

import java.io.IOException;  


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;

import com.shopping.dao.FraudDao;
import com.shopping.model.Fraud;


public class BoardInsertController6 extends SuperClass{
	private final String PREFIX = "board/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		

			
			String gotopage = PREFIX + "boInsertForm6.jsp";
			super.GotoPage(gotopage);
			

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		
		String id = request.getParameter("id");
		String mid = request.getParameter("mid");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String fraud = request.getParameter("fraud");
		String frauddetail = request.getParameter("frauddetail");
		String regdate = request.getParameter("regdate");
		
		
		Fraud bean = new Fraud();
		
		
		bean.setId(id);
		bean.setMid(mid);
		bean.setName(name);
		bean.setPhone(phone);
		bean.setFraud(fraud);
		bean.setFrauddetail(frauddetail);
		bean.setRegdate(regdate);
		
		FraudDao dao = new FraudDao();
		
		int cnt = -1;
		
		try {
			cnt= dao.InsertData(bean);
			
			if(cnt == -1) {  //등록 실패
				new BoardInsertController6().doGet(request, response);  
				
			}else {   //등록 성공
				new BoardListController6().doGet(request, response);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			new BoardInsertController6().doGet(request, response);  
		}
		
		
		
	}
	
	
}

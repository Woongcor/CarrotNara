package com.shopping.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.dao.FraudDao;




public class BoardDeleteController6 extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);

		FraudDao dao = new FraudDao();
	
	int cnt = -1;
	try {
		int no = Integer.parseInt(request.getParameter("no"));
		 cnt = dao.DeleteData(no);
		 
		 
		 
		 new BoardListController6().doGet(request, response);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	}

}

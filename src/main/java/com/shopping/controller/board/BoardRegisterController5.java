package com.shopping.controller.board;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.dao.NoticeDao;
import com.shopping.model.Notice;

public class BoardRegisterController5 extends SuperClass{
	private final String PREFIX = "board/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response); 
		String gotopage = PREFIX + "boInsertForm5.jsp" ; 
		
		super.GotoPage(gotopage);
	}
	

}

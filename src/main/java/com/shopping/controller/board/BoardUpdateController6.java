package com.shopping.controller.board;

import java.io.IOException;   

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.dao.FraudDao;
import com.shopping.model.Fraud;

public class BoardUpdateController6 extends SuperClass{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int no = 0;
		FraudDao dao = null ;
		Fraud bean = null ;
		
		try {
			dao = new FraudDao() ;			
			no = Integer.parseInt(request.getParameter("no")) ;
			
			bean = dao.GetDataByPk(no) ;
			if(bean!=null) {
				request.setAttribute("bean", bean);
			}
			super.GotoPage("board/boUpdateForm6.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			super.GotoPage("board/boList6.jsp");
		}
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);

		int no = Integer.parseInt(request.getParameter("no")) ;

		String id = request.getParameter("id") ;
		String name = request.getParameter("name") ;
		String fraud = request.getParameter("fraud") ;
		String frauddetail = request.getParameter("frauddetail") ;		
		String regdate = request.getParameter("regdate") ;
		
		Fraud bean = new Fraud() ;
		 
		bean.setNo(no);
		bean.setId(id);
		bean.setName(name);
		bean.setFraud(fraud);
		bean.setFrauddetail(frauddetail);	
		bean.setRegdate(regdate);

		
		FraudDao dao = new FraudDao();
		
		int cnt = -1 ;// 가정) -1은 실패 
		try {
			cnt = dao.UpdateData(bean);
			
			if(cnt == -1) { // 실패
				new BoardUpdateController6().doGet(request, response);
				
			}else { // 성공
				String gotopage = super.getUrlInfo("boList6");
				gotopage += "&pageNumber=" + request.getParameter("pageNumber");
				gotopage += "&pageSize=" + request.getParameter("pageSize");
				gotopage += "&mode=" + request.getParameter("mode");
				gotopage += "&keyword=" + request.getParameter("keyword");

				response.sendRedirect(gotopage);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
			new BoardUpdateController6().doGet(request, response);
		}
	}
}

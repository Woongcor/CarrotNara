package com.shopping.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.dao.MemberDao;
import com.shopping.model.Member;

public class MemberDetailController extends SuperClass{
	
	@Override // 회원의 아이디를 이용하여 회원 상세 정보를 조회합니다.	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String id = request.getParameter("id");
		
		MemberDao dao = new MemberDao() ;
		
		Member bean =null;
		try {
			bean = dao.getDataByPk(id);
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		
		if(bean==null) {
			super.setAlertMessage("잘못된 회원 정보 입니다.");
			super.GotoPage("common/home.jsp");
		}else {
			request.setAttribute("bean", bean);
			super.GotoPage("member/meDetail.jsp");
			
		}
	}
}

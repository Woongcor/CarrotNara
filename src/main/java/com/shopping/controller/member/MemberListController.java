package com.shopping.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.dao.MemberDao;
import com.shopping.model.Member;
import com.shopping.utility.Paging;

public class MemberListController extends SuperClass{
	
	@Override  // 회원목록을 조회합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
		super.doGet(request, response);
		
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
	
		MemberDao dao = new MemberDao();
		List<Member> lists = null;
		boolean isGrid = false ;
		
		try {
			int totalCount = dao.GetTotalRecordCount(mode, keyword) ;
			
			String url = request.getContextPath() + "/ShopMall?command=meList" ;
			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			
			lists = dao.SelectAll(pageInfo);
			
			request.setAttribute("datalist", lists);
			
			request.setAttribute("pageInfo", pageInfo);
			
			String gotopage ="member/meList.jsp"; 
			super.GotoPage(gotopage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

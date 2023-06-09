package com.shopping.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.dao.ProductDao;
import com.shopping.model.Product;
import com.shopping.utility.Paging;

public class ProductDetailController extends SuperClass{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		if(loginfo==null) {
			super.setAlertMessage("로그인이 필요한 정보입니다.");
			super.GotoPage("member/meLoginForm.jsp"); 
			return ;
		}
		
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		if(mode==null) {mode="all";}
		if(keyword==null) {keyword="";}
		
		int num =Integer.parseInt(request.getParameter("num")); 

		ProductDao dao = new ProductDao();
		List<Product> lists = null;
		boolean isGrid = true ;
		
		try {
			int totalCount = dao.GetTotalRecordCount(mode, keyword) ;
			String url = request.getContextPath() + "/ShopMall?command=prList" ;
			
			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			Product bean = dao.GetDataByPk(num);
			lists = dao.SelectAll(pageInfo);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("bean", bean);
			super.GotoPage("product/prDetail.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
}

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

public class ProductListElectronicsController extends SuperClass{
	String electronics = "'electronics'";
	String Electronics = "Electronics";
	String title = "가전 제품";
	@Override // 상품 목록을 조회합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		super.doGet(request, response);
		
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		if(mode==null) {mode="all";}
		if(keyword==null) {keyword="";}
		
		ProductDao dao = new ProductDao();
		List<Product> lists = null;
		boolean isGrid = true;
		
		try {
			int totalCount = dao.GetTotalRecordCountCategory(mode, keyword, electronics);
			String url = request.getContextPath() + "/ShopMall?command=prListElectronics";
			
			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			
			lists = dao.SelectAll2(electronics, pageInfo) ;
			
			request.setAttribute("PAGENAME", Electronics);
			request.setAttribute("title", title);
			request.setAttribute("datalist", lists);
			
			request.setAttribute("pageInfo", pageInfo);
			
			super.GotoPage("product/prList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

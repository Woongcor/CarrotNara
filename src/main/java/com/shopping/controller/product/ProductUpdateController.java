package com.shopping.controller.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.dao.ProductDao;
import com.shopping.model.Product;

public class ProductUpdateController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int num = 0 ;
		ProductDao dao = null ;
		Product bean = null ;
		

		try {
			dao = new ProductDao() ;
			num = Integer.parseInt(request.getParameter("num")); // 수정할 상품 번호
			
			bean = dao.GetDataByPk(num) ;
			if(bean!=null) {
				request.setAttribute("bean", bean);
			}
			super.GotoPage("product/prUpdateForm.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			super.GotoPage("product/prList.jsp");
		}
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		
		Product bean = new Product();
		
		// 상품 등록과는 다르게 수정은 상품 번호를 챙겨야 합니다.
		bean.setNum(getNumberData(mr.getParameter("num")));
		
		bean.setWriter(mr.getParameter("writer"));
		bean.setName(mr.getParameter("name"));
		bean.setComments(mr.getParameter("comments"));
		bean.setCategory(mr.getParameter("category"));
		bean.setInputdate(mr.getParameter("inputdate"));
		
		bean.setImage01(mr.getFilesystemName("image01"));
		bean.setImage02(mr.getFilesystemName("image02"));
		bean.setImage03(mr.getFilesystemName("image03"));
		
		bean.setPrice(getNumberData(mr.getParameter("price")));
		bean.setCate(mr.getParameter("cate"));
		bean.setAddress(mr.getParameter("address"));
		
		ProductDao dao = new ProductDao();
		int cnt = -1 ;
		try {
			cnt = dao.UpdateData(bean);
			
			if(cnt==-1) {
				super.GotoPage("product/prUpdateForm.jsp");
				
			}else {
				String gotopage = super.getUrlInfo("prList");
				gotopage += "&pageNumber=" + mr.getParameter("pageNumber");
				gotopage += "&pageSize=" + mr.getParameter("pageSize");
				gotopage += "&mode=all";
				gotopage += "&keyword=";
				
				response.sendRedirect(gotopage);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private int getNumberData(String parameter) {
		boolean flag = false ;
		
		flag = parameter==null || parameter.equals("") || parameter.equals("null");
		
		System.out.println(this.getClass() + "getNumberData method called");
		
		return !flag ? Integer.parseInt(parameter) : 0;
		
	}
}

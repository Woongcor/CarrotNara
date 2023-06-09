package com.shopping.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.dao.CategoryDao;
import com.shopping.dao.ProductDao;
import com.shopping.model.Category;
import com.shopping.model.Product;

public class ProductInsertController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		// 상품 등록 화면이 보이기 전에 category 목록 테이블을 읽어서 콤보 박스에 채워 넣기
		CategoryDao dao = new CategoryDao();
		List<Category> categories = null;
		try {
			categories = dao.GetCategoryList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("categories", categories);
		
		String gotopage = "product/prInsertForm.jsp";
		super.GotoPage(gotopage);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		
		Product bean = new Product();
		// 상품 등록시 상품 번호는 시퀀스가 알아서 처리해주므로 신경 쓸 필요가 없습니다.
		//bean.setNum(getNumberData(mr.getParameter("num")));
		
		bean.setWriter(mr.getParameter("writer"));
		bean.setName(mr.getParameter("name"));
		bean.setComments(mr.getParameter("comments"));
		bean.setCategory(mr.getParameter("category"));
		bean.setCate(mr.getParameter("cate"));
		bean.setInputdate(mr.getParameter("inputdate"));
		bean.setAddress(mr.getParameter("address"));
		bean.setImage01(mr.getFilesystemName("image01"));
		bean.setImage02(mr.getFilesystemName("image02"));
		bean.setImage03(mr.getFilesystemName("image03"));
		
		bean.setPrice(getNumberData(mr.getParameter("price")));
		
		
		ProductDao dao = new ProductDao();
		int cnt = -1 ;
		try {
			cnt = dao.InsertData(bean);
			
			if(cnt==-1) {
				super.GotoPage("product/prInsertForm.jsp");
				
			}else {
				new ProductListController().doGet(request, response);
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







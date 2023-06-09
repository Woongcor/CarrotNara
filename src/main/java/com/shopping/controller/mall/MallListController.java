package com.shopping.controller.mall;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.product.ProductListController;
import com.shopping.dao.ProductDao;
import com.shopping.model.CartItem;
import com.shopping.model.Product;

// 나의 카트 목록을 보여 주는 페이지로 이동합니다.
public class MallListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);

		String message = null ;
		
		if(super.loginfo==null) {
			message = "로그인이 필요한 서비스입니다." ;
			super.setAlertMessage(message);
			super.GotoPage("member/meLoginForm.jsp"); 
			return ;
		}
		
		if(mycart.GetCartSize()==0) { // 카트가 비어 있으면
			message = "카트 목록이 없어서 상품 목록 페이지로 이동합니다." ;
			super.setAlertMessage(message);
			new ProductListController().doGet(request, response);
			
		}else {
			// cartList는 내 카트의 품목 내역 정보입니다.
			List<Integer> cartList = mycart.GetAllCartList();
			
			// 내가 구매하고자 하는 모든 상품 리스트
			List<CartItem> orderList = new ArrayList<CartItem>();
			
			try {
				
				for(Integer pnum : cartList) { // pnum : 상품 번호										
					ProductDao pdao = new ProductDao() ;					
					CartItem item = pdao.getCartItem(pnum);

					orderList.add(item) ;
				}
				
				// 세션 영역에 정보들을 바인딩합니다.
				super.session.setAttribute("orderList", orderList);
				
				System.out.println("주문 상품 개수 : " + orderList.size());
				
				super.GotoPage("mall/maList.jsp");
				
			} catch (Exception e) {
				e.printStackTrace() ;
			}
		}
	}
}

package com.shopping.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.product.ProductListController;
import com.shopping.dao.MallDao;
import com.shopping.dao.MemberDao;
import com.shopping.model.Member;
import com.shopping.model.ShoppingBasket;

public class MemberLoginController extends SuperClass{
   private final String PREFIX = "member/";
   @Override // 사용자가 common.jsp 파일에서 [로그인] 링크를 클릭했습니다.
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      super.doGet(request, response);
      
      // meLoginForm.jsp 파일로 이동하면 됩니다.
      String gotopage = PREFIX + "meLoginForm.jsp";
      
      super.GotoPage(gotopage);
   }
   
   @Override // 사용자가 로그인 폼에서 전송 버튼을 클릭하면 여기로 옵니다.
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      super.doPost(request, response);
      
      String id = request.getParameter("id");
      String password = request.getParameter("password");
      
      //System.out.println(id + "/" + password);
      
      MemberDao dao = new MemberDao();
      
      Member bean = null ;
      try {
         bean = dao.SelectData(id, password);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      String gotopage = PREFIX + "meLoginForm.jsp";
      
      if(bean==null) {
         // 사용자에게 로그인 실패임을 알려 주고, 로그인 페이지로 이동합니다.
         String message = "로그인 정보가 잘못 되었습니다." ;
         super.setAlertMessage(message);
         super.GotoPage(gotopage);
         
      }else {
         // 세션에 나의 로그인 정보를 저장하고, 메인 홈 페이지로 이동하겠습니다.
         super.session.setAttribute("loginfo", bean);
         
         // 현재 로그인하고 있는 사람의 
         // ShoppingBaskets 테이블에 저장되어 있는 wishList를 읽어 와서, 세션에 바인딩합니다.         
         MallDao madao = new MallDao() ;
         try {
            List<ShoppingBasket> myWishList = madao.GetShoppingBasket(bean.getId());
            
            for(ShoppingBasket item : myWishList) {
               super.mycart.AddCart(item.getPnum()); 
            } 
            super.session.setAttribute("mycart", super.mycart);
            
         } catch (Exception e) {            
            e.printStackTrace();
         }
         
         new ProductListController().doGet(request, response);
      }
   }
}
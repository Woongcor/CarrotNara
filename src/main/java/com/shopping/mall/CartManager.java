package com.shopping.mall;

import java.util.ArrayList;
import java.util.List;

public class CartManager{
   private List<Integer> carts = null ;
   
   public CartManager() {
      this.carts = new ArrayList<Integer>();
   }
   
   // 카트에 상품을 추가합니다.
   public void AddCart(int pnum) {
      if(this.carts.indexOf(pnum) == -1) {
         this.carts.add(pnum);
      }else {
         this.DeleteCart(pnum);
         this.carts.add(pnum);
      }
   }
   
   // 카트의 특정 상품을 삭제합니다.
   public void DeleteCart(int pnum) {
      for (Integer bean : this.carts) {
         if (bean.equals(pnum)) {
            this.carts.remove(bean);
            break;
            }
        }
   }
   
   // 결제시 카트 내역을 모두 비웁니다.
   public void RemoveAllCart() {
      this.carts.clear();
   }
   
   // 카트 내역 정보를 반환해 줍니다.
   public List<Integer> GetAllCartList(){
      return this.carts ;
   }
   
   // 카트 내의 품목 개수를 반환해 줍니다.
   public int GetCartSize() {
      return this.carts.size() ;
   }
}
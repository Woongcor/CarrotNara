package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.CartItem;
import com.shopping.model.Member;
import com.shopping.model.Product;
import com.shopping.model.ShoppingBasket;
import com.shopping.utility.MyUtility;

public class MallDao extends SuperDao{
	public int DeleteData(int pnum) throws Exception{
		// 회원이 찜목록에서 목록을 삭제하려고 합니다.
		System.out.println("삭제할 상품 번호 : " + pnum);
		int cnt = -1 ;
		
		String sql = " delete from ShoppingBaskets where pnum = ? " ;
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;		
		if(conn==null) {conn=super.getConnection();}		
		conn.setAutoCommit(false);
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setInt(1, pnum);
		
		cnt = pstmt.executeUpdate() ;
		conn.commit();		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}		
		return cnt ;
	}
	
	
	private CartItem makeCartItemBean(ResultSet rs) throws Exception {
		CartItem bean = new CartItem() ; 
		
		bean.setImage01(rs.getString("image01"));
		bean.setPname(rs.getString("pname"));
		bean.setPnum(rs.getInt("pnum"));
		bean.setPrice(rs.getInt("price"));
		
		return bean ;
		
	}
	
	public List<ShoppingBasket> GetShoppingBasket(String id) throws Exception {
		// 나의 wishList 목록을 읽어 옵니다.
		System.out.println("카트 주인 : " + id);
		String sql = " select * from ShoppingBaskets where mid = ? " ; 
		
		List<ShoppingBasket> lists = new ArrayList<ShoppingBasket>() ;
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		if(conn==null){conn=super.getConnection();}
		pstmt = conn.prepareStatement(sql);		
		pstmt.setString(1, id);
		rs = pstmt.executeQuery() ;
		
		while(rs.next()) {
			lists.add(this.makeBean(rs)) ;
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return lists;
	}	
	
	private ShoppingBasket makeBean(ResultSet rs) throws Exception {
		ShoppingBasket bean = new ShoppingBasket();
		
		bean.setMid(rs.getString("mid"));
		bean.setPnum(rs.getInt("pnum"));
		
		return bean ;
	}

	public int InsertShoppingBasket(String id, List<Integer> cartList) throws Exception {
		// 로그인 한 사람의 카트 목록(wishList)을 임시 테이블에 저장합니다.
		System.out.println("카트 주인 : " + id);
		
		// 회원에 대한 1건(bean 객체) 데이터를 데이터 베이스에 추가합니다.
		int cnt = -1 ;

		Connection conn = null ;
		PreparedStatement pstmt = null ;
		
		if(conn==null) {conn=super.getConnection();}
		
		conn.setAutoCommit(false); 
		
		// step01 : 혹시 남아 있을 지 모르는 나의 이전 내역을 삭제합니다.
		String sql = "" ;
		sql += " delete from ShoppingBaskets where mid = ? " ;
		
		System.out.println(sql);
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id) ;
		cnt = pstmt.executeUpdate() ;
		
		if(pstmt != null) {pstmt.close();}
		
		
		// step02 : 반복문을 사용하여 테이블에 인서트 합니다.
		System.out.println("상품 개수 : " + cartList.size() );

		sql = " insert into ShoppingBaskets(mid, pnum)" ; 
		sql += " values(?, ?)" ; 

		for(Integer pnum : cartList) {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id) ;
			pstmt.setInt(2, pnum) ;
			
			cnt = pstmt.executeUpdate() ;			
			if(pstmt != null) {pstmt.close();}
		}
		
		conn.commit(); 
		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt ;
	}

}
package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.CartItem;
import com.shopping.model.Product;
import com.shopping.utility.Paging;

public class ProductDao extends SuperDao {
	public CartItem getCartItem(Integer pnum) throws Exception{
	      // 해당 상품 번호에 대한 Product 정보를 CartItem 객체에 대입하고 반환해 줍니다. 
	      Product bean = this.GetDataByPk(pnum) ;
	      CartItem item = new CartItem() ;
	      
	      item.setImage01(bean.getImage01()) ;
	      item.setMid(null) ; // 임시 저장용 테이블과 관련 있음.
	      item.setPname(bean.getName()) ;
	      item.setPnum(pnum);
	      item.setPrice(bean.getPrice()) ;
	      
	      return item;
	   }   
	
	public int DeleteData(int num) throws Exception{
		System.out.println("삭제할 상품 번호 : " + num);
		int cnt = -1 ;
		String sql = "" ;
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;		
		if(conn==null) {conn=super.getConnection();}		
		conn.setAutoCommit(false);
		
		sql = " delete from products where num = ? " ;
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);		
		cnt = pstmt.executeUpdate() ;	
		
		conn.commit();		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}		
		return cnt ;
	}
	
	public Product GetDataByPk(int num) throws Exception{
		// 해당 상품 번호를 이용하여 상품 bean 객체를 반환해 줍니다.
		System.out.println("찾고자 하는 상품 번호 : " + num);
		
		// 아이디와 비번을 이용하여 로그인 가능한지 판단합니다.
		String sql = " select * from products" ;
		sql += " where num = ? " ;
		// ?는 placeholder이라고 하며, 치환될 대상입니다.

		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		Connection conn = null ;
		
		if(conn==null ) {conn = super.getConnection() ;}
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		Product bean = null ;
		
		if(rs.next()) {
			bean = this.makebean(rs);
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return bean ;
	}
	
	public int GetTotalRecordCount(String mode, String keyword) throws Exception {
		System.out.println("검색할 필드명 : " + mode);
		System.out.print(", 검색할 키워드 : " + keyword);
		
		String sql = " select count(*) as cnt from products" ;
		
		if(mode.equals("all")== false) {
			sql += " where " + mode + " like '%" + keyword + "%'" ;
		}		
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		Connection conn = null ;
		int cnt = -1 ;
		
		if(conn==null ) {conn = super.getConnection() ;}
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt ;	
		}
	
	public int GetTotalRecordCountCategory(String mode, String keyword, String category) throws Exception{
	      System.out.println("검색할 필드명 : " + mode);
	      System.out.print(", 검색할 키워드 : " + keyword);
	      
	      String sql = "";
	      
			if(mode.equals("all")== false) {
				sql = " select count(*) as cnt ";
				sql += " from (select * from products where category = " + category + ")";
				sql += " where " + mode + " like '%" + keyword + "%'";
			}else {
			      sql = " select count(*) as cnt from products ";
			      sql += " where category = " + category ;
			}
	      
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Connection conn = null;
	      int cnt = -1;
	      
	      if(conn == null) {conn = super.getConnection();}
	      pstmt = conn.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      
	      if(rs.next()) {
	         cnt = rs.getInt("cnt");
	      }
	      
	      if(rs != null) {rs.close();}
	      if(pstmt != null) {pstmt.close();}
	      if(conn != null) {conn.close();}
	            
	      return cnt;
	   }
	
	public int InsertData(Product bean) throws Exception{
		// bean 객체 1개를 등록합니다.
		System.out.println(bean);
		int cnt = -1 ;
		
		String sql = " insert into products(num, writer, name, comments, image01, image02, image03, price, category, inputdate, cate, address)" ;
		sql += " values(myproduct.nextval, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)" ;
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		
		if(conn==null) {conn=super.getConnection();}
		
		conn.setAutoCommit(false);
		
		pstmt=conn.prepareStatement(sql);
		
		
		pstmt.setString(1, bean.getWriter());
		pstmt.setString(2, bean.getName());
		pstmt.setString(3, bean.getComments());
		pstmt.setString(4, bean.getImage01());
		pstmt.setString(5, bean.getImage02());
		pstmt.setString(6, bean.getImage03());
		pstmt.setInt(7, bean.getPrice());
		pstmt.setString(8, bean.getCategory());
		pstmt.setString(9, bean.getInputdate());
		pstmt.setString(10, bean.getCate());
		pstmt.setString(11, bean.getAddress());
		cnt = pstmt.executeUpdate();
		
		conn.commit();
		
		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt;
		
	}
	
	public List<Product> SelectAll() throws Exception{
		// 상품 목록을 조회하여 반환해 줍니다.
		String sql = " select * from products order by num desc";
		
		List<Product> lists = new ArrayList<Product>();
		
		Connection conn = null ;
		PreparedStatement pstmt = null;
		ResultSet rs = null ;
		
		if(conn==null) {conn=super.getConnection();}
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while (rs.next()) {
			lists.add(this.makebean(rs));
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return lists;
	}
	
	public List<Product> SelectAll2(String category, Paging pageInfo) throws Exception{
		// 상품 목록을 조회하여 반환해 줍니다.
		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();
		String sql = "";
		if(mode.equals("all")== false) {
			sql = " select num, writer, name, comments, image01, image02, image03, price, category, inputdate, cate, address";
			sql += " from (select num, writer, name, comments, image01, image02, image03, price, category, inputdate, cate, address,";
			sql += " rank() over(order by num desc) as ranking";
			sql += " from (select num, writer, name, comments, image01, image02, image03, price, category, inputdate, cate, address";
			sql += " from products where category = " + category + ")";
			sql += " where " + mode + " like '%" + keyword + "%')" + " where ranking between ? and ?";
			
		}else {
			sql = " select num, writer, name, comments, image01, image02, image03, price, category, inputdate, cate, address";
			sql += " from (select num, writer, name, comments, image01, image02, image03, price, category, inputdate, cate, address,";
			sql += " rank() over(order by num desc) as ranking ";
			sql += " from products where category = " + category + ")";
			sql += " where ranking between ? and ?";
		}
		
		List<Product> lists = new ArrayList<Product>();
		
		Connection conn = null ;
		PreparedStatement pstmt = null;
		ResultSet rs = null ;
		
		if(conn==null) {conn=super.getConnection();}
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, pageInfo.getBeginRow());
	    pstmt.setInt(2, pageInfo.getEndRow());
		
		rs=pstmt.executeQuery();
		
		while (rs.next()) {
			lists.add(this.makebean(rs));
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return lists;
	}
	
	
	
	private Product makebean(ResultSet rs) throws Exception {
		Product bean = new Product();
		
		bean.setNum(rs.getInt("num"));
		bean.setWriter(rs.getString("writer"));
		bean.setName(rs.getString("name"));
		bean.setComments(rs.getString("comments"));
		bean.setImage01(rs.getString("image01"));
		bean.setImage02(rs.getString("image02"));
		bean.setImage03(rs.getString("image03"));
		bean.setPrice(rs.getInt("price"));
		bean.setCategory(rs.getString("category"));
		bean.setInputdate(String.valueOf(rs.getString("inputdate")));
		bean.setCate(rs.getString("cate"));
		bean.setAddress(rs.getString("address"));
		return bean;
	}
	
	public List<Product> SelectAll(Paging pageInfo)throws Exception {
		String sql = " select num, writer, name, comments, image01, image02, image03, price, category, inputdate, cate, address";
		sql += " from (select num, writer, name, comments, image01, image02, image03, price, category, inputdate, cate, address,";
		sql += " rank() over(order by num desc) as ranking ";
		sql += " from products";
		
		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();
		
		if(mode.equals("all")== false) {
			sql += " where " + mode + " like '%" + keyword + "%'" ;
		}	
		
		sql += " )";
		sql += " where ranking between ? and ?";
	      
	      List<Product> lists = new ArrayList<Product>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      if(conn == null) {conn=super.getConnection();}
	      pstmt = conn.prepareStatement(sql);
	      
	      pstmt.setInt(1, pageInfo.getBeginRow());
	      pstmt.setInt(2, pageInfo.getEndRow());
	      
	      rs = pstmt.executeQuery();
	      
	      while(rs.next()) {
	         lists.add(this.makebean(rs)) ;
	      }
	      
	      if(rs!=null) {rs.close();}
	      if(pstmt!=null) {pstmt.close();}
	      if(conn!=null) {conn.close();}		
		
		return lists;
	}

	public int UpdateData(Product bean) throws Exception{
		int cnt = -1 ;
		
		String sql = " update products set ";
		sql += " writer = ?, name = ?, comments = ?, image01 = ?, image02 = ?, ";
		sql += " image03 = ?, price = ?, ";
		sql += " category = ?, inputdate = ?, cate = ?, address = ?" ;
		sql += " where num = ?";
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		if(conn==null) {conn=super.getConnection();}
		conn.setAutoCommit(false);
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, bean.getWriter());
		pstmt.setString(2, bean.getName());
		pstmt.setString(3, bean.getComments());
		pstmt.setString(4, bean.getImage01());
		pstmt.setString(5, bean.getImage02());
		pstmt.setString(6, bean.getImage03());
		pstmt.setInt(7, bean.getPrice());
		pstmt.setString(8, bean.getCategory());
		pstmt.setString(9, bean.getInputdate());
		pstmt.setString(10, bean.getCate());
		pstmt.setString(11, bean.getAddress());
		pstmt.setInt(12, bean.getNum());
		
		cnt = pstmt.executeUpdate();
		
		conn.commit();
		
		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt;
	}

}






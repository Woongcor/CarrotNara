package com.shopping.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.Fraud;
import com.shopping.utility.Paging;

public class FraudDao extends SuperDao{
	
	
	
	
	
	
	
	public int InsertData(Fraud bean) throws Exception{
		System.out.println(bean);
		
		// bean 객체 1건의 데이터를 데이터 베이스에 추가합니다.
		int cnt = -1 ;
		
		String sql = " insert into fraudboard(no, id, mid, name, phone,  fraud, frauddetail ,regdate)" ;
		sql += " values(myfraudboard.nextval, ?,?, ?, ?, ?, ?, ?)" ;
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		
		if(conn==null) {conn=super.getConnection();}
		
		conn.setAutoCommit(false); 
		
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, bean.getId()) ;
		pstmt.setString(2, bean.getMid()) ;
		pstmt.setString(3, bean.getName()) ;
		pstmt.setString(4, bean.getPhone()) ;		
		pstmt.setString(5, bean.getFraud()) ;
		pstmt.setString(6, bean.getFrauddetail()) ;
		pstmt.setString(7, bean.getRegdate()) ;
		
		cnt = pstmt.executeUpdate() ;
		
		conn.commit();
		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt ;		
	}
	
	
	
	
	public List<Fraud> SelectAll(Paging pageInfo) throws Exception{
		// TopN 구문을 이용하여 페이징 처리된 목록을 반환해 줍니다.
		String sql = " select no, id, mid, name, phone,fraud, frauddetail ,regdate ";
		sql += " from (select no, id, mid, name,phone, fraud, frauddetail ,regdate, ";
		
		 sql += " rank() over(order by no desc) as ranking "; // 답글 구현 이전 코딩

		
		sql += " from fraudboard";
		
		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();
		
		if(mode.equals("all")== false) {  //전체보기 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'" ;
		}		
		
		sql += " )";
		sql += " where ranking between ? and ? ";
		//? : place holder 이라고 함.. 치환 필요/ 실행전에 바꿔줘야 함
		
		List<Fraud> lists = new ArrayList<Fraud>() ;
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		if(conn==null){conn=super.getConnection();}
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
		
		rs = pstmt.executeQuery() ;
		
		while(rs.next()) {
			lists.add(this.makeBean(rs)) ;
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return lists;
	}	

	public List<Fraud> SelectAll() throws Exception{
		// 전체 회원 목록을 리스트 컬렉션에 저장시키고 반환해 줍니다.
		String sql = " select * from fraudboard order by no desc" ;
		
		List<Fraud> lists = new ArrayList<Fraud>() ;
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		if(conn==null){conn=super.getConnection();}
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery() ;
		
		while(rs.next()) {
			lists.add(this.makeBean(rs)) ;
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return lists;
	}

	private Fraud makeBean(ResultSet rs) throws Exception {
		Fraud bean = new Fraud() ;
		bean.setNo(rs.getInt("no"));
		bean.setId(rs.getString("id"));
		bean.setMid(rs.getString("mid"));
		bean.setName(rs.getString("name"));
		bean.setPhone(rs.getString("phone"));
		bean.setFraud(rs.getString("fraud"));		
		bean.setFrauddetail(rs.getString("frauddetail"));
		//System.out.println("날짜");		
		//System.out.println(String.valueOf(rs.getDate("regdate")));
		bean.setRegdate(String.valueOf(rs.getDate("regdate")));
		
		
		return bean;
	}



	public Fraud getDataByPk(int no) throws Exception {
		System.out.println("찾고자 하는 글번호: " + no);
		
		String sql = " select * from fraudboard" ;
		sql += " where no = ? " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs= null ;
		Connection conn = null ;
		
		if(conn==null) {conn = super.getConnection() ;}		
		pstmt = conn.prepareStatement(sql);		
		pstmt.setInt(1, no);		
		rs = pstmt.executeQuery();
		
		Fraud bean = null ;		
		if(rs.next()) {
			bean = this.makeBean(rs) ;
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return bean;
	}

	public int UpdateData(Fraud bean) throws Exception{
		// 게시물 작성자가 게시글을 수정합니다.
		System.out.println(bean);
		int cnt = -1 ;
		
		// remark 컬럼은 관리자가 상품 삭제시 자동으로 업데이트 됩니다.
		String sql = " update fraudboard set ";
		sql += " id = ?, mid = ?, name = ?, phone = ?, fraud = ?, frauddetail = ?, regdate = ? ";
		sql += " where no = ?" ; 

		
		Connection conn = null ;
		PreparedStatement pstmt = null ;		
		if(conn==null) {conn=super.getConnection();}		
		conn.setAutoCommit(false); 		
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, bean.getId()) ;
		pstmt.setString(2, bean.getMid()) ;
		pstmt.setString(3, bean.getName()) ;
		pstmt.setString(4, bean.getPhone()) ;
		pstmt.setString(5, bean.getFraud()) ;
		pstmt.setString(6, bean.getFrauddetail()) ;
		pstmt.setString(7, bean.getRegdate()) ;
		pstmt.setInt(8, bean.getNo()) ;
		
		cnt = pstmt.executeUpdate() ;		
		conn.commit();		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}		
		return cnt ;
	}

	public Fraud GetDataByPk(int no) throws Exception{
		// 해당 기본 키를 이용하여 bean 객체를 반환해 줍니다.
		System.out.println("게시물 번호: " + no);
		
		String sql = " select * from fraudboard" ;
		sql += " where no = ? " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs= null ;
		Connection conn = null ;
		
		if(conn==null) {conn = super.getConnection() ;}		
		pstmt = conn.prepareStatement(sql);		
		pstmt.setInt(1, no);		
		rs = pstmt.executeQuery();
		
		Fraud bean = null ;		
		if(rs.next()) {
			bean = this.makeBean(rs) ;
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return bean;
	}

	public int GetTotalRecordCount(String mode, String keyword) throws Exception {
		System.out.print("검색할 필드명 : " + mode);
		System.out.print(", 검색할 키워드 : " + keyword + "\n");
		
		String sql = " select count(*) as cnt from fraudboard " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs= null ;
		Connection conn = null ;
		int cnt = -1 ;
		
		if(conn==null) {conn = super.getConnection() ;}		
		pstmt = conn.prepareStatement(sql);					
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt("cnt") ;
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return cnt ;
	}




	public int DeleteData(int no) throws Exception{
	System.out.println("삭제할 글번호 : " +no);
		
		// bean 객체 1건의 데이터를 데이터 베이스에 추가합니다.
		int cnt = -1 ;
		
		String sql = " delete from fraudboard where no = ? " ;
		
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		
		if(conn==null) {conn=super.getConnection();}
		
		conn.setAutoCommit(false); 
		
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setInt(1, no) ;

		
		cnt = pstmt.executeUpdate() ;
		
		conn.commit();
		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt ;	
	}











}
package com.shopping.dao;

import java.sql.Connection;  
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.ReviewComment;


public class ReviewCommentDao extends SuperDao{

	public List<ReviewComment> getDataByPk(int no) throws Exception{
		//해당 게시물 번호에 달려있는 댓글 목록을 가장 오래된 글부터 정렬하여 반환해 줍니다.
		String sql = " select * from reviewcomments ";
		sql += " where no = ? order by cnum asc ";
		
		List<ReviewComment> lists = new ArrayList<ReviewComment>();
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if(conn==null) {conn=super.getConnection();}
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, no);
		
		rs=pstmt.executeQuery();
		
		
		while(rs.next()) {
			lists.add(this.makeBean(rs));
		}
		
		
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return lists;
	
	}

	private ReviewComment makeBean(ResultSet rs) throws Exception{
		ReviewComment bean = new ReviewComment();
		
		bean.setCnum(rs.getInt("cnum"));
		bean.setContent(rs.getString("content"));
		bean.setNo(rs.getInt("no"));
		bean.setRegdate(rs.getString("regdate"));
		bean.setWriter(rs.getString("writer"));
		
		return bean;
	}

	public int DeleteData(int cnum) throws Exception{
		System.out.println("삭제될 코멘트 번호 : " +cnum);
		
		// 회원에 대한 1건(bean 객체) 데이터를 데이터 베이스에 추가합니다.
		int cnt = -1;
		
		String sql = " delete from reviewcomments where cnum = ?" ;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		if(conn==null) {conn=super.getConnection();}
		
		conn.setAutoCommit(false);
		
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setInt(1, cnum);
		
		cnt =pstmt.executeUpdate();
		
		conn.commit();
		
		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt;
	}
	
	public int InsertData(ReviewComment bean) throws Exception{
		//객체를 출력한다는 것은 toString 메소드를 호출한다는 의미
		System.out.println(bean);
		
		// 회원에 대한 1건(bean 객체) 데이터를 데이터 베이스에 추가합니다.
		int cnt = -1;
		
		String sql = " insert into reviewcomments(cnum,no,writer,content,regdate)" ;
		sql += " values(myreview.nextval,?,?,?,sysdate)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		if(conn==null) {conn=super.getConnection();}
		
		conn.setAutoCommit(false);
		
		pstmt=conn.prepareStatement(sql);
		
		
		pstmt.setInt(1, bean.getNo());
		pstmt.setString(2, bean.getWriter());
		pstmt.setString(3, bean.getContent());
		
		
		
		cnt =pstmt.executeUpdate();
		
		conn.commit();
		
		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt;
	}	
	
	public int UpdateData(ReviewComment bean) throws Exception{
		// 게시물 작성자가 게시글을 수정합니다.
	
		int cnt = -1 ;
		
		// remark 컬럼은 관리자가 상품 삭제시 자동으로 업데이트 됩니다.
		String sql = " update reviewcomments set ";
		sql += "  content=?, regdate =? ";	
		sql += " where num = ?" ;


		
		Connection conn = null ;
		PreparedStatement pstmt = null ;		
		if(conn==null) {conn=super.getConnection();}		
		conn.setAutoCommit(false); 		
		pstmt=conn.prepareStatement(sql);
		
		
		pstmt.setString(1, bean.getContent()) ;
		pstmt.setString(2, bean.getRegdate()) ;
		pstmt.setInt(3, bean.getCnum()) ;
		
		cnt = pstmt.executeUpdate() ;		
		conn.commit();		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}		
		return cnt ;
	}


		public int UpdateData3(int cnum, String content) throws Exception {
		      System.out.println("업데이트 될 댓글번호 : " + cnum);
		      System.out.println("업데이트 될 댓글내용 : " + content);
		      int cnt = -1 ;
		      
		      String sql = " update reviewcomments set content = ?" ;
		      sql += " where cnum = ?" ; 
		      
		      Connection conn = null ;
		      PreparedStatement pstmt = null ;
		      
		      if(conn==null) {conn=super.getConnection();}
		      
		      conn.setAutoCommit(false); 
		      
		      pstmt=conn.prepareStatement(sql);
		      
		      pstmt.setString(1,content);
		      pstmt.setInt(2,cnum);
		      cnt = pstmt.executeUpdate() ;
		      
		      conn.commit();
		      
		      if(pstmt!=null) {pstmt.close();}
		      if(conn!=null) {conn.close();}
		      
		      return cnt ;

		   }
	
}

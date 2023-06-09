package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.Qna;
import com.shopping.model.QnaComment;

public class QnaCommentDao  extends SuperDao{

	private int cnt;

	public List<QnaComment> GetDataByPk(int no) throws Exception{
		// 해당 게시물 번호에 달여 있는 댓글 목록을 가장 오래된 글부터 정렬하여 반환해 줍니다.
				String sql = " select * from qnacomments" ;
				sql += " where no = ? order by cnum asc " ; 
				
				List<QnaComment> lists = new ArrayList<QnaComment>() ;
				
				Connection conn = null ;
				PreparedStatement pstmt = null ;
				ResultSet rs = null ;
				
				if(conn==null){conn=super.getConnection();}
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, no);
				
				rs = pstmt.executeQuery() ;
				
				while(rs.next()) {
					lists.add(this.makeBean(rs)) ;
				}
				
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(conn!=null){conn.close();}
				
				return lists;
			}

	private QnaComment makeBean(ResultSet rs) throws Exception{
		QnaComment bean = new QnaComment() ;
		
		bean.setCnum(rs.getInt("cnum"));
		bean.setContent(rs.getString("content"));
		bean.setNo(rs.getInt("no"));
		bean.setRegdate(rs.getString("regdate"));
		bean.setWriter(rs.getString("writer"));
		
		return bean ;
	}

	public int InsertData(QnaComment bean) throws Exception {
		System.out.println(bean);
		
		int cnt = -1 ;
		
		String sql = " insert into qnacomments(cnum, no, writer, content, regdate)" ; 
		sql += " values(myQNA.nextval, ?, ?, ?, sysdate)" ; 
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		
		if(conn==null) {conn=super.getConnection();}
		
		conn.setAutoCommit(false); 
		
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setInt(1, bean.getNo()) ;
		pstmt.setString(2, bean.getWriter()) ;
		pstmt.setString(3, bean.getContent()) ; 
		
		cnt = pstmt.executeUpdate() ;
		
		conn.commit();
		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt ;

	}

	public int DeleteData(int cnum) throws Exception{
		System.out.println("삭제될 코멘트 번호 :" + cnum);
		
		int cnt = -1 ;
		
		String sql = " delete from qnacomments where cnum = ?" ; 
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		
		if(conn==null) {conn=super.getConnection();}
		
		conn.setAutoCommit(false); 
		
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setInt(1, cnum);
		
		cnt = pstmt.executeUpdate() ;
		
		conn.commit();
		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt ;

	}
	

	public int UpdateData2 (int cnum, String content) throws Exception {
		System.out.println("업데이트 될 댓글번호 : " + cnum);
		System.out.println("업데이트 될 댓글내용 : " + content);
		int cnt = -1 ;
		
		String sql = " update qnacomments set content = ?" ;
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

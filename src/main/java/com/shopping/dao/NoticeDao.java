package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.Notice;
import com.shopping.utility.Paging;

public class NoticeDao extends SuperDao{
	public int GetReplyCount(int groupno) throws Exception{
		// 해당 원글에 대한 답글 개수를 반환해 줍니다.
		System.out.println("검색할 groupno : " + groupno);
		
		String sql = " select count(*) as cnt from notice where groupno = ?" ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs= null ;
		Connection conn = null ;
		int cnt = -1 ;
		
		if(conn==null) {conn = super.getConnection() ;}		
		pstmt = conn.prepareStatement(sql);	
		pstmt.setInt(1, groupno);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt("cnt") ;
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return cnt ;
	}
	
	
	public int GetTotalRecordCount(String mode, String keyword) throws Exception {
		System.out.print("검색할 필드명 : " + mode);
		System.out.print(", 검색할 키워드 : " + keyword + "\n");
		
		String sql = " select count(*) as cnt from notice " ;
		
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
	
	public int ReplyData(Notice bean, int orderno) throws Exception{
		System.out.println(bean);
		
		int cnt = -1 ;
		Connection conn = null ;
		PreparedStatement pstmt = null ;		
		if(conn==null) {conn=super.getConnection();}		
		conn.setAutoCommit(false); 		
		
		// update 구문) 동일한 그룹 번호에 대하여 orderno 컬럼의 숫자를 1씩 증가시켜야 합니다.
		String sql1 = " update notice set orderno = orderno + 1" ;
		sql1 += " where groupno = ? and orderno > ? " ;
		
		pstmt=conn.prepareStatement(sql1);
		
		pstmt.setInt(1, bean.getGroupno());
		pstmt.setInt(2, orderno);
		
		cnt = pstmt.executeUpdate() ;
		
		// insert 구문) 해당 bean 객체를 이용하여 답글을 작성합니다.
		pstmt = null ;
		
		String sql2 = " insert into notice(no, writer, subject, content, regdate, groupno, orderno, depth)" ;
		sql2 += " values(mynotice.nextval, ?, ?, ?, ?, ?, ?, ?)" ;
				
		pstmt=conn.prepareStatement(sql2);

		pstmt.setString(1, bean.getWriter()) ;
		pstmt.setString(2, bean.getSubject()) ;
		pstmt.setString(3, bean.getContent()) ;
		pstmt.setString(4, bean.getRegdate()) ;
		pstmt.setInt(5, bean.getGroupno()) ;
		pstmt.setInt(6, bean.getOrderno()) ;
		pstmt.setInt(7, bean.getDepth()) ;
		
		cnt = pstmt.executeUpdate() ;
		
		conn.commit();
		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt ;
	}
	
	public int InsertData(Notice bean) throws Exception{
		System.out.println(bean);
		
		// bean 객체 1건의 데이터를 데이터 베이스에 추가합니다.
		int cnt = -1 ;
		
		String sql = " insert into notice(no, writer, subject, content, regdate, readhit, remark, groupno, orderno, depth)" ;
		sql += " values(mynotice.nextval, ?, ?, ?, ?, default, ?, mynotice.currval, default, default)" ;
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		
		if(conn==null) {conn=super.getConnection();}
		
		conn.setAutoCommit(false); 
		
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, bean.getWriter()) ;
		pstmt.setString(2, bean.getSubject()) ;
		pstmt.setString(3, bean.getContent()) ;
		pstmt.setString(4, bean.getRegdate()) ;
		pstmt.setString(5, bean.getRemark()) ;
		
		cnt = pstmt.executeUpdate() ;
		
		conn.commit();
		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt ;		
	}
	
	
	
	// 게시물 1건 
	public Notice getDataByPk01(int no) {
		return new Notice(10, "hong", "자바 프로그램", "잼있어요", "2002/08/15", 1234, "비고란", 111, 222, 2);		
	} 
	
	public List<Notice> getDataList(){
		List<Notice> datalist = new ArrayList<Notice>();
		
		datalist.add(new Notice(10, "hong", "자바 프로그램", "잼있어요", "2002/08/15", 30, "비고란", 111, 222, 1));
		datalist.add(new Notice(20, "hong", "파이썬 프로그램", "잼있어요", "2002/08/15", 40, "비고란", 111, 222, 1));
		datalist.add(new Notice(30, "hong", "database", "잼있어요", "2002/08/15", 50, "비고란", 111, 222, 1));
		datalist.add(new Notice(40, "park", "자바 프로그램", "잼있어요", "2002/08/15", 60, "비고란", 111, 222, 2));
		datalist.add(new Notice(50, "park", "자바 프로그램", "잼있어요", "2002/08/15", 70, "비고란", 111, 222, 2));
		
		
		return datalist ; 
	}
	
	public List<Notice> SelectAll(Paging pageInfo) throws Exception{
		// TopN 구문을 이용하여 페이징 처리된 목록을 반환해 줍니다.
		String sql = " select no, writer, subject, content, regdate, readhit, remark, groupno, orderno, depth ";
		sql += " from (select no, writer, subject, content, regdate, readhit, remark, groupno, orderno, depth, ";
		
		// sql += " rank() over(order by no desc) as ranking "; // 답글 구현 이전 코딩
		sql += " rank() over(order by groupno desc, orderno asc) as ranking "; // for 답글 기능	
		
		sql += " from notice)";
		sql += " where ranking between ? and ? ";
		
		List<Notice> lists = new ArrayList<Notice>() ;
		
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

	public List<Notice> SelectAll() throws Exception{
		// 전체 회원 목록을 리스트 컬렉션에 저장시키고 반환해 줍니다.
		String sql = " select * from notice order by no desc" ;
		
		List<Notice> lists = new ArrayList<Notice>() ;
		
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

	private Notice makeBean(ResultSet rs) throws Exception {
		Notice bean = new Notice() ;
		bean.setNo(rs.getInt("no"));
		bean.setWriter(rs.getString("writer"));
		bean.setSubject(rs.getString("subject"));
		bean.setContent(rs.getString("content"));		
		//System.out.println("날짜");		
		//System.out.println(String.valueOf(rs.getDate("regdate")));
		bean.setRegdate(String.valueOf(rs.getDate("regdate")));
		
		bean.setReadhit(rs.getInt("readhit"));
		bean.setRemark(rs.getString("remark"));
		bean.setGroupno(rs.getInt("groupno"));
		bean.setOrderno(rs.getInt("orderno"));
		bean.setDepth(rs.getInt("depth"));
		
		return bean;
	}



	public Notice getDataByPk(int no) throws Exception {
		System.out.println("찾고자 하는 글번호: " + no);
		
		String sql = " select * from notice" ;
		sql += " where no = ? " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs= null ;
		Connection conn = null ;
		
		if(conn==null) {conn = super.getConnection() ;}		
		pstmt = conn.prepareStatement(sql);		
		pstmt.setInt(1, no);		
		rs = pstmt.executeQuery();
		
		Notice bean = null ;		
		if(rs.next()) {
			bean = this.makeBean(rs) ;
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return bean;
	}

	public int UpdateData(Notice bean) throws Exception{
		// 게시물 작성자가 게시글을 수정합니다.
		System.out.println(bean);
		int cnt = -1 ;
		
		// remark 컬럼은 관리자가 상품 삭제시 자동으로 업데이트 됩니다.
		String sql = " update notice set ";
		sql += " writer = ?, subject = ?, content = ?, regdate = ?, ";
		sql += " readhit = ?, groupno = ?, orderno = ?, depth = ? "; 	
		sql += " where no = ?" ; 

		
		Connection conn = null ;
		PreparedStatement pstmt = null ;		
		if(conn==null) {conn=super.getConnection();}		
		conn.setAutoCommit(false); 		
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, bean.getWriter()) ;		
		pstmt.setString(2, bean.getSubject()) ;
		pstmt.setString(3, bean.getContent()) ;
		pstmt.setString(4, bean.getRegdate()) ;
		pstmt.setInt(5, bean.getReadhit()) ;
		pstmt.setInt(6, bean.getGroupno()) ;
		pstmt.setInt(7, bean.getOrderno()) ;
		pstmt.setInt(8, bean.getDepth()) ;
		pstmt.setInt(9, bean.getNo()) ;
		
		cnt = pstmt.executeUpdate() ;		
		conn.commit();		
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}		
		return cnt ;
	}

	public Notice GetDataByPk(int no) throws Exception{
		// 해당 기본 키를 이용하여 bean 객체를 반환해 줍니다.
		System.out.println("게시물 번호: " + no);
		
		String sql = " select * from notice" ;
		sql += " where no = ? " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs= null ;
		Connection conn = null ;
		
		if(conn==null) {conn = super.getConnection() ;}		
		pstmt = conn.prepareStatement(sql);		
		pstmt.setInt(1, no);		
		rs = pstmt.executeQuery();
		
		Notice bean = null ;		
		if(rs.next()) {
			bean = this.makeBean(rs) ;
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		
		return bean;
	}


	public int UpdateReadhit(int no) throws Exception{
		// 게시물 작성자가 게시글을 수정합니다.
		int cnt = -1 ;
		
		// remark 컬럼은 관리자가 상품 삭제시 자동으로 업데이트 됩니다.
		String sql = " update notice set readhit = readhit + 1 where no = ?" ; 

		
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


	public int DeleteData(int no) throws Exception{
		System.out.println("삭제할 글번호 : " +no);
		
		// bean 객체 1건의 데이터를 데이터 베이스에 추가합니다.
		int cnt = -1 ;
		
		String sql = " delete from notice where no = ? " ;
		
		
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
package com.shopping.controller.comment;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shopping.controller.SuperClass;
import com.shopping.dao.QnaCommentDao;
import com.shopping.model.QnaComment;


public class CommentListController2 extends SuperClass{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int no = Integer.parseInt(request.getParameter("no")) ;
		QnaCommentDao dao = new QnaCommentDao();
		List<QnaComment> comments = null ;
		
		try {
			comments = dao.GetDataByPk(no) ;
			System.out.println("댓글 개수 : " + comments.size());
			
			JSONArray jsArr = new JSONArray() ;
			for(QnaComment comm : comments) {
				JSONObject jsobj = new JSONObject() ;
				jsobj.put("cnum", comm.getCnum());
				jsobj.put("writer", comm.getWriter());
				jsobj.put("content", comm.getContent());
				jsobj.put("regdate", comm.getRegdate());
				jsArr.add(jsobj) ;
		}
			request.setAttribute("jsArr", jsArr);
			super.GotoPage("comment/cmList2.jsp"); 
	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

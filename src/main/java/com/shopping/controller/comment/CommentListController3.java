package com.shopping.controller.comment;

import java.io.IOException;   
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shopping.controller.SuperClass;
import com.shopping.dao.ReviewCommentDao;
import com.shopping.model.ReviewComment;


public class CommentListController3 extends SuperClass{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int no = Integer.parseInt(request.getParameter("no"));
		ReviewCommentDao dao = new ReviewCommentDao();
		List<ReviewComment> comments = null;
		
		
		try {
			comments = dao.getDataByPk(no);
			System.out.println("댓글 개수 : "+comments.size());
			
			JSONArray jsArr = new JSONArray() ;
			for(ReviewComment comm : comments) {
				JSONObject jsobj = new JSONObject() ;
				jsobj.put("cnum", comm.getCnum());
				jsobj.put("writer", comm.getWriter());
				jsobj.put("content", comm.getContent());
				jsobj.put("regdate", comm.getRegdate());
				jsArr.add(jsobj) ;
			}	
			
			request.setAttribute("jsArr", jsArr);
			super.GotoPage("comment/cmList3.jsp");
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
}

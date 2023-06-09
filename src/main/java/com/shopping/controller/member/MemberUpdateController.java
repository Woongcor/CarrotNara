package com.shopping.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.dao.MemberDao;
import com.shopping.model.Member;

public class MemberUpdateController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
	
	
		String id = request.getParameter("id");
		
	MemberDao dao = null ;
	Member bean = null ;
	
	try {
		dao = new MemberDao() ;			
		
		bean = dao.GetDataByPk(id) ;
		if(bean!=null) {
			request.setAttribute("bean", bean);
		}
		super.GotoPage("member/meUpdate.jsp");
		
	} catch (Exception e) {
		e.printStackTrace();
		super.GotoPage("common/home.jsp");
	}
}
	
	   @Override
	   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      super.doPost(request, response);
	      
	      int age = Integer.parseInt(request.getParameter("age")) ;
	      
	         
	      String id = request.getParameter("id") ;
	      String name = request.getParameter("name") ;
	      String password = request.getParameter("password") ;
	      String address = request.getParameter("address") ;   
	      String phone = request.getParameter("phone") ;
	      String gender = request.getParameter("gender") ;
	      
	      String hobby ="";
	      String[]hobbies = request.getParameterValues("hobby");
	      if(hobbies==null) {
	         hobby="";
	      }else {
	         for(int i=0;i<hobbies.length;i++) {
	            hobby += hobbies[i] + ",";
	         }
	         hobby=hobby.substring(0,hobby.length()-1);
	      }
	      
	      String hiredate = request.getParameter("hiredate") ;
	      String remark = request.getParameter("remark") ;
	      
	      Member bean = new Member() ;
	      
	      bean.setAge(age);
	      bean.setAddress(address);
	      bean.setGender(gender);
	      bean.setHiredate(hiredate);
	      bean.setHobby(hobby);
	     
	      bean.setId(id);
	      bean.setName(name);
	      bean.setPassword(password);
	      bean.setPhone(phone);
	      bean.setRemark(remark);

	      MemberDao dao = new MemberDao();
	      
	      int cnt = -1 ;// 가정) -1은 실패 
	      try {
	         cnt = dao.UpdateData(bean);
	         
	         if(cnt == -1) { // 실패
	            new MemberUpdateController().doGet(request, response);
	            
	         }else { // 성공
	            String gotopage = super.getUrlInfo("meLogin");
	            gotopage += "&pageNumber=" + request.getParameter("pageNumber");
	            gotopage += "&pageSize=" + request.getParameter("pageSize");
	            gotopage += "&mode=" + request.getParameter("mode");
	            gotopage += "&keyword=" + request.getParameter("keyword");

	            response.sendRedirect(gotopage);
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         
	         new MemberUpdateController().doGet(request, response);
	      }
	   }
	}
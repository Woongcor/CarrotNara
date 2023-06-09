package com.shopping.myservlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.model.Human;


@WebServlet(urlPatterns= {"/hihihi"})

public class ServletTest04 extends HttpServlet {
	@Override
	public void init(ServletConfig config) throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get 메소드 호출됨");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		String ageg = request.getParameter("ageg");
		
		Human bean = new Human();
		bean.setId(id);
		bean.setPassword(password);
		bean.setName(name);
		bean.setGender(gender);
		bean.setAge(age);
		bean.setEmail(email);
		bean.setAgeg(ageg);
		
		request.setAttribute("qwer", bean);
		
		String gotopage ="example/servletResult04.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotopage);
		dispatcher.forward(request, response);
	}
	
}

   

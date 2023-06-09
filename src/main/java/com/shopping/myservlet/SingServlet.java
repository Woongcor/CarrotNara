package com.shopping.myservlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.model.Person04;

@WebServlet(urlPatterns= {"/hahaha"}, initParams = {
		@WebInitParam(name = "company", value = "kosmo 정보 통신"),
		@WebInitParam(name = "address", value = "금천구 가산동")
		})
public class SingServlet extends HttpServlet{
	private String company =null;
	private String address =null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("서블릿이 초기화 됩니다.");
		this.company = config.getInitParameter("company");
		this.address = config.getInitParameter("address");
		
		ServletContext application = config.getServletContext();
		
		application.setAttribute("hello", "안녕하세요.");		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get 메소드 호출됨");
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		String sing = request.getParameter("sing");
		String group = request.getParameter("group");
		
		Person04 bean = new Person04();
		bean.setGroup(group);
		bean.setName(name);
		bean.setNo(no);
		bean.setSing(sing);
		
		request.setAttribute("abcd", bean);
		
		// 초기화 파마리터는 session 영역에 저장하고 싶습니다.
		HttpSession session = request.getSession();
		
		session.setAttribute("company", this.company);
		session.setAttribute("address", this.address);
		
		String gotopage = "example/servletResult01.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotopage);
		dispatcher.forward(request, response);
	}
}








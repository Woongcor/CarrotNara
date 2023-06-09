package com.shopping.myservlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.model.Person03;



@WebServlet(urlPatterns = {"/world"})
public class WorldController extends HttpServlet {
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("서블릿이 초기화 됩니다.");		
	
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String method = request.getMethod();
		System.out.println("요청 메소드 : " + method);
		if(method.equalsIgnoreCase("post")) {
			doPost(request, response);
		}else {
			doGet(request, response);
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass() + "doGet()");
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass() + "doPost()");
		
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] jobes = request.getParameterValues("job");
		
		String job = "";
		
		if(jobes==null) {
			job= "";
		}else {
			for(int i=0 ; i<jobes.length ; i++) {
				job +=jobes[i] +",";
			}
			job = job.substring(0, job.length() -1);
		}
		
		Person03 bean = new Person03(name, gender, job);

		request.setAttribute("asdf", bean);

		//  리다이렉션 방식은 request 객체를 새로 만들기 때문에 데이터가 휘발됩니다.
	
		//response.sendRedirect("to02.jsp");
	
		// 포워딩 방식을 사용하면 문제 없음
		String gotopage = "example/to03.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotopage);
		dispatcher.forward(request, response);
	}
}

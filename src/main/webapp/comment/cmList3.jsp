<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//object 타입이라 강등시키는 거고 리퀘스트에서 jsArr 적어준것이 커멘트리스트 컨트롤러에서 셋어트리뷰트한 값과 동일해야 함
	JSONArray jsArr = (JSONArray)request.getAttribute("jsArr");
%>


<%=jsArr.toString()%>
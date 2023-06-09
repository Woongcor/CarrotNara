<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>파라미터 결과</h3>
	아이디 : ${requestScope.qwer.id}<br/>
	비밀번호 : ${requestScope.qwer.password}<br/>
	이름 : ${requestScope.qwer.name}<br/>
	성별 : ${requestScope.qwer.gender}<br/>
	나이 : ${requestScope.qwer.age}<br/>
	이메일 : ${requestScope.qwer.email}<br/>
	연령대 : <c:if test="${requestScope.qwer.age <=35}">청년</c:if>
			<c:if test="${requestScope.qwer.age >=36 && requestScope.qwer.age <=60}">중년</c:if>
			<c:if test="${requestScope.qwer.age >=61}">노년</c:if>
</body>
</html>
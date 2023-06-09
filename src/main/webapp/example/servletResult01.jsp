<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>request 영역의 정보</h3>
	번호 : ${requestScope.abcd.no}<br/>
	이름 : ${requestScope.abcd.name}<br/>
	노래 : ${requestScope.abcd.sing}<br/>
	그룹 : ${requestScope.abcd.group}<br/>
	
	<h3>session 영역의 정보</h3>
	회사명 : ${sessionScope.company}<br/>
	주소 : ${sessionScope.address}<br/>
	
	<h3>application 영역의 정보</h3>
	인사말 : ${applicationScope.hello}<br/>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	대표 : ${applicationScope.map['ceo']}<br/>
	회사명 : ${applicationScope.map['company']}<br/>
	전화번호 : ${applicationScope.map['phone']}<br/>
	이메일 : ${applicationScope.map['email']}<br/>	
</body>
</html>
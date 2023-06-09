<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		String contextPath = request.getContextPath();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="<%=contextPath%>/hihihi" method="post">
		아이디 : <input name="id" type="text" value="yusin"><br>
		비밀번호 : <input name="password" type="password" value="1234"><br>
		이름 : <input name="name" type="text" value="김유신"><br>
		성별 : 
		<input name="gender" type="radio" value="1" checked="checked">남자
		<input name="gender" type="radio" value="2">여자
		<br>
		나이 : <input name="age" type="text" value="20"><br>
		이메일주소 : <input name="email" type="text" value="asdf@naver.com"><br>

		<br><br>
		
		<input type="submit" value="전송">
	</form>
</body>
</html>
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
	<form action="<%=contextPath%>/hello" method="post">
	
		아이디 : <input type="text" name="id" value="hong"><br/>
		이름 : <input type="text" name="name" value="홍길동"><br/>
		나이 : <input type="text" name="age" value="20"><br/>
		취미 : 
		<input type="checkbox" name="hobby" value="탁구">탁구
		<input type="checkbox" name="hobby" value="축구" checked="checked">축구
		<input type="checkbox" name="hobby" value="농구">농구
		<br/>
		<input type="submit" value="전송">
		
	</form>
	
</body>
</html>
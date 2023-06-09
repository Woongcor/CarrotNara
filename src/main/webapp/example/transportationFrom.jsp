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
	<h3>교통 수단</h3>
	<form action="<%=contextPath%>/Traffic" method="post">
		<select name="command">
			<option value="-">--선택해 주세요.
			<option value="airplane">비행기
			<option value="car">자동차
			<option value="horse">마차
		</select>
		<br/>
		<input type="submit" value="전송">
	</form>
</body>
</html>
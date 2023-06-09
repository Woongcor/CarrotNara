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
	<h3>설문 조사</h3>
	<form action="<%=contextPath%>/hahaha" method="post">
		번호 : <input name="no" type="text" value="123456"><br>
		이름 : <input name="name" type="text" value="홍길동"><br>
		조아하는 노래 :
			<input name="sing" type="radio" value="롤린">롤린
			<input name="sing" type="radio" value="뻔한 남자">뻔한 남자
			<input name="sing" type="radio" value="Dynamite" checked="checked">Dynamite
		<br>
		조아하는 그룹 :
		<select name="group">
			<option value="마마무">마마무
			<option value="BTS" selected="selected">BTS
			<option value="브레이브 걸스">브레이브 걸스
		</select>	
		<br><br>
		<input type="submit" value="전송"> 
		</form>
</body>
</html>
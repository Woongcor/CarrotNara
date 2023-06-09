<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>request scope에 저장된 나의 정보</h3>
	
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>${requestScope.asdf.id}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${requestScope.asdf.name}</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>${requestScope.asdf.age}</td>
		</tr>
		<tr>
			<td>취미</td>
			<td>${requestScope.asdf.hobby}</td>
		</tr>
	</table>

</body>
</html>





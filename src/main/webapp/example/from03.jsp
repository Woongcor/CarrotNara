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
	<form action="<%=contextPath%>/world" method="post">
	
		
		이름 : <input type="text" name="name" value="홍길동"><br/>
		성별 : <input type="text" name="gender" value="남자"><br/>
		직업 : 		
		<input type="checkbox" name="job" value="의사">의사
		<input type="checkbox" name="job" value="판사" checked="checked">판사
		<input type="checkbox" name="job" value="검사">검사
		<br/>
		
		<input type="submit" value="전송">
	</form>
	
</body>
</html>
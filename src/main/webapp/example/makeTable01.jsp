<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>테이블 만들기</title>
	<style type="text/css">
		
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	</script>
</head>
<body>
	<h3>표 만들기</h3>
	<table border="1">
	<tr align="center">
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
	</tr>
	<tr>
		<td align="center">김유신</td>
		<td align="right">40</td>
		<td align="right">50</td>
		<td align="right">60</td>
	</tr>
	<tr>
		<td align="center">유관순</td>
		<td align="right">45</td>
		<td align="right">55</td>
		<td align="right">65</td>
	</tr>
	</table>
</body>


<body>
	<h3>표 만들기</h3>
	<table border="1">
	<tr align="center">
		<th >이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
	</tr>
	<tr>
		<td rowspan="2">김유신</td>
		<td align="right">40</td>
		<td align="right">50</td>
		<td align="right">60</td>
	</tr>
	<tr align="center">
		<td colspan="3">150</td>
	</tr>
	</table>
</body>
</html>
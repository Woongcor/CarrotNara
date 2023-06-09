<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
	
<!DOCTYPE html>
<html>
<head>
	<title>Bootstrap Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<div class="container mt-3">
		<h2>회원 목록</h2>
		<p>회원 목록을 보여 주는 페이지</p>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>가입 일자</th>
					<th>적립 포인트</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center">hong</td>
					<td>홍길동</td>
					<td>2023/02/10</td>
					<td>10</td>
					<td>착한 회원</td>
				</tr>
				<tr>
					<td align="center">park</td>
					<td>박영희</td>
					<td>2023/02/10</td>
					<td>10</td>
					<td>머찐 회원</td>
				</tr>
				<tr>
					<td align="center">kim</td>
					<td>김철수</td>
					<td>2023/02/10</td>
					<td>10</td>
					<td>그냥 회원</td>
				</tr>
			</tbody>
		</table>

		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item active"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item disabled"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</div>
</body>
</html>

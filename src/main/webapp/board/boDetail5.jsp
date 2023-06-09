<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<title>Bootstrap Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<style type="text/css">
		#backButton{margin:auto;}
			body, html {font-family: 'Noto Sans KR', sans-serif;}}
	
		.rounded-pill{opacity:0.8;}
		#noUnderLine{text-decoration-line: none;}
		.container  h2{font-size:32px; font-weight:600;;}
		.container  > .sbu_txt  {font-size:17px; font-weight:400; color:#5f5f5f;}
		.table thead tr th { border-top:2px solid #222;  color: #787878; font-weight: 500; font-size: 14px;   padding: 15px 0;   line-height: 1;  text-align:center;}
		.table  tr td {vertical-align: middle; text-align:center;}
		.dff_table tr td:fist-child {color:#9f9f9f; font-weight:800; font-size:18px;}
		.border_title {text-algin: left;}
		.border_title a {font-size: 25px; font-weight:600; color:#222; line-height: 165%; margin-bottom: 14px; transition: all .3s ease-in-out;}
   	 	.border_title > a p {font-size: 16px; color: #676767; font-weight:400; transition: all .3s ease-in-out}
  	 	.border_title a:hover {color:#116AEF; }
		.border_title a:hover  p {color:#116AEF;}
    	.btm_wrap {display: flex;  ustify-content: center; justify-content: space-between;}
    	.btm_wrap > div {display: flex;}
    	.btm_wrap .btn {background:#9a9a9a; color:#fff; margin:0 4px; border:0;}
    	.btm_wrap .btn.btn-primary {background:#116AEF; color:#fff;}
	</style>
</head>
<body>

	<div class="container mt-3">
		<h2>글번호 ${requestScope.bean.no}의 게시물 정보</h2>

		<table class="table table-hover">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td align="center">작성자</td>
					<td>${bean.writer}</td>
				</tr>
				<tr>
					<td align="center">글제목</td>
					<td>${bean.subject}</td>
				</tr>
				<tr>
					<td align="center">글내용</td>
					<td>${bean.content}</td>
				</tr>
				<tr>
					<td align="center">작성 일자</td>
					<td>${bean.regdate}</td>
				</tr>
				<tr>
					<td align="center">조회수</td>
					<td>${bean.readhit}</td>
				</tr>			
			</tbody>
		</table>
		<div id="backButton">
			<button type="button" class="btn btn-primary" onclick="history.back();">
				돌아 가기
			</button>
		</div>
	</div>
</body>
</html>
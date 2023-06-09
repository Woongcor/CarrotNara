<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
#backButton {
	margin: auto;
}
</style>


<style type="text/css">
body, html {
	font-family: 'Noto Sans KR', sans-serif;
}

}
.rounded-pill {
	opacity: 0.8;
}

#noUnderLine {
	text-decoration-line: none;
}

.container  h2 {
	font-size: 32px;
	font-weight: 600;;
}

.container>.sbu_txt {
	font-size: 17px;
	font-weight: 400;
	color: #5f5f5f;
}

.table thead tr th {
	border-top: 2px solid #222;
	color: #787878;
	font-weight: 500;
	font-size: 14px;
	padding: 15px 0;
	line-height: 1;
	text-align: center;
}

.table  tr td {
	vertical-align: middle;
	text-align: center;
}

.dff_table tr td:fist-child {
	color: #9f9f9f;
	font-weight: 800;
	font-size: 18px;
}

.border_title {
	text-algin: left;
}

.border_title a {
	font-size: 25px;
	font-weight: 600;
	color: #222;
	line-height: 165%;
	margin-bottom: 14px;
	transition: all .3s ease-in-out;
}

.border_title>a p {
	font-size: 16px;
	color: #676767;
	font-weight: 400;
	transition: all .3s ease-in-out
}

.border_title a:hover {
	color: #116AEF;
}

.border_title a:hover  p {
	color: #116AEF;
}

.btm_wrap {
	display: flex;
	ustify-content: center;
	justify-content: space-between;
}

.btm_wrap>div {
	display: flex;
}

.btm_wrap .btn {
	background: #9a9a9a;
	color: #fff;
	margin: 0 4px;
	border: 0;
}

.btm_wrap .btn.btn-primary {
	background: #116AEF;
	color: #fff;
}
</style>

<style type="text/css">
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<body>

	<div class="container mt-3">
		<h2>${requestScope.bean.name}님의회원 정보</h2>

		<p>회원 상세 정보를 보여 주는 페이지</p>

		<table class="table table-striped">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td align="center">아이디</td>
					<td>${bean.id}</td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td>${bean.name}</td>
				</tr>
				<tr>
					<td align="center">나이</td>
					<td>${bean.age}</td>
				</tr>
				<tr>
					<td align="center">핸드폰번호</td>
					<td>${bean.phone}</td>
				</tr>
				<tr>
					<td align="center">주소</td>
					<td>${bean.address}</td>
				</tr>
				<tr>
					<td align="center">성별</td>
					<td>${bean.gender}</td>
				</tr>
				<tr>
					<td align="center">취미</td>
					<td>${bean.hobby}</td>
				</tr>
				<tr>
					<td align="center">가입 일자</td>
					<td>${bean.hiredate}</td>
				</tr>

			</tbody>
		</table>
		<div id="backButton">
			<button type="button" class="btn btn-primary"
				onclick="history.back();">돌아가기</button>
				<c:if
				test="${sessionScope.loginfo.id==bean.id}">
				<button type="button" class="btn btn-primary" value="삭제"
					onclick="if(confirm('탈퇴하시면 복구할 수 없습니다. \n 정말로 탈퇴하시겠습니까?')==true){
								location.href='<%=notWithFormTag%>meDelete&id=${sessionScope.loginfo.id}' ;}
							else{return false}"/>탈퇴하기
								
							</c:if>
		</div>
		
	</div>
</body>
</html>

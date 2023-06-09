<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* box model 공부할 것 */
.input-group {
	margin: 7px;
}

.input-group-text {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

#buttonset {
	margin-top: 15px;
}

.radio_gender, .chk_hobby {
	font-size: 1.1rem;
} /* 주위 글꼴의 1.1배 */
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<link rel="stylesheet" href="/resources/demos/style.css">

<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	Kakao.init('8890a67c089173194979845f9389950d'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
	}
	//카카오로그아웃  
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					console.log(response)
				},
				fail : function(error) {
					console.log(error)
				},
			})
			Kakao.Auth.setAccessToken(undefined)
		}
	}
</script>

<script type="text/javascript">
	$(document).ready(
			function() {
				/* $('#hiredate').datepicker(); */
				$('#hiredate').datepicker({
					dateFormat : "yy/mm/dd"
				});

				var tooltipTriggerList = [].slice.call(document
						.querySelectorAll('[data-bs-toggle="tooltip"]'))
				var tooltipList = tooltipTriggerList.map(function(
						tooltipTriggerEl) {
					return new bootstrap.Tooltip(tooltipTriggerEl)
				});
			});
</script>
</head>
<body>
	<div class="container mt-3 col-md-5">
		<h2>로그인 페이지</h2>
		<p>로그인을 위한 페이지</p>

		<form action="loginProc.jsp" method="post">
			<div class="mb-3 mt-3">
				<label for="email" class="form-label">아이디 : </label> <input
					type="text" class="form-control" id="id"
					placeholder="아이디를 입력해 주세요." name="id" data-bs-toggle="tooltip"
					title="아이디는 최소 3글자 이상 10글자 이하로 입력해 주세요." data-bs-placement="left">
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">비밀 번호 : </label> <input
					type="password" class="form-control" id="password"
					placeholder="비밀 번호를 입력해 주세요." name="password">
			</div>

			<button type="submit" class="btn btn-primary">로그인</button>
			<a type="button" href="bsMemberInsert.jsp" class="btn btn-info">
				회원 가입</a>
			
			<a type="button" class="btn btn-warning" onclick="kakaoLogin();"  href="javascript:void(0)">
				카카오로그인</a>
			<a type="button" class="btn btn-warning" onclick="kakaoLogout();" href="javascript:void(0)">
				카카오로그아웃</a>

		</form>
	</div>
</body>
</html>
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
<script type="text/javascript">
	$(document).ready(function() {
		/* $('#hiredate').datepicker(); */
		$('#hiredate').datepicker({
			dateFormat : "yy/mm/dd"
		});
		
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
			return new bootstrap.Tooltip(tooltipTriggerEl)
		});		
	});
	

</script>
</head>
<body>
	<div class="container mt-3 col-md-5">
		<h2>로그인 페이지</h2>
		<p>로그인을 위한 페이지</p>

		<form action="">
			<div class="mb-3 mt-3">
				<label for="email" class="form-label">아이디 : </label> 
				<input type="text" class="form-control" id="id"
					placeholder="아이디를 입력해 주세요." name="id"
					data-bs-toggle="tooltip" title="아이디는 최소 3글자 이상 10글자 이하로 입력해 주세요."
					data-bs-placement="left">
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">비밀 번호 : </label> <input
					type="password" class="form-control" id="password"
					placeholder="비밀 번호를 입력해 주세요." name="password">
			</div>

			<button type="submit" class="btn btn-primary">로그인</button>
			<a type="button" href="bsMemberInsert.jsp" class="btn btn-info">회원 가입</a>
		</form>
	</div>
</body>
</html>
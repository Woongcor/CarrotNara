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

	#buttonset {margin-top: 15px;}
	.radio_gender, .chk_hobby{font-size:1.1.re;} /*주위 글꼴 1.1배*/
</style>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

	<link rel="stylesheet" href="/resources/demos/style.css">

	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script type="text/javascript">
	 $(document).ready(function(){
			$('#hiredate').datepicker({dateFormat:"yy/mm/dd"});  	
	 });
	</script>
</head>
<body>
		<div class="container mt-3 col-md-5">
		<h2>회원 등록</h2>
		<p>회원을 등록해 주는 페이지</p>

		<form>
			<div class="input-group">
				<span class="input-group-text col-md-2">아이디</span> <input id="id"
					name="id" type="text" class="form-control" placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이름</span> <input id="name"
					name="name" type="text" class="form-control" placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">비밀번호</span> <input
					id="password" name="password" type="password" class="form-control"
					placeholder="">
			</div>
			<div class="input-group" >
				<span class="input-group-text col-md-2 ">성별</span> 
				<div class="form-control">
					<label class="radio-inline radio-gender">
						<input type="radio" name="gender" value="male">남자 
					</label>
					&nbsp;
					<label class="radio-inline radio-gender">
						&nbsp;<input type="radio" name="gender" value="female">여자 
					</label>
				</div>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">취미</span> 
				<div class="form-control">
					<label class="checkbox-inline chk-hobby">
					<input type="checkbox" name="hobby" value="탁구">탁구
					</label>
					&nbsp;
  					<label class="checkbox-inline chk-hobby">
						&nbsp;<input type="checkbox" name="hobby" value="농구">농구
					</label>
  					&nbsp;
  					<label class="checkbox-inline chk-hobby">
						&nbsp;<input type="checkbox" name="hobby" value="야구">야구
					</label>
  						&nbsp;
  					<label class="checkbox-inline chk-hobby">
						&nbsp;<input type="checkbox" name="hobby" value="당구">당구
					</label>
  					&nbsp;
  					<label class="checkbox-inline chk-hobby">
						&nbsp;<input type="checkbox" name="hobby" value="축구">축구
					</label>
				</div>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">등록일자</span> <input
					id="hiredate" name="hiredate" type="datetime"
					class="form-control" placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">포인트</span> <input id="point"
					name="point" type="number" class="form-control" placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">비고</span> <input id="remark"
					name="remark" type="text" class="form-control" placeholder="">
			</div>
			<div class="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg">등록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>

</body>
</html>
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
	 
	 /* validCheck 유효선 검사 */
	 function validCheck(){
		 	/* alert('반환 값이 false이면 이벤트 전파가 되지 않습니다.') */
		 	var id = $('#id').val();
		 	if(id.length < 4 || id.length > 10){
		 		swal('아이디는 4자리 이상 10자리 이하로 입력해주세요.');
		 		$('#id').focus();
		 		return false ;
		}

	 
	 	var name = $('#name').val();
	 	if(name.length < 4 || name.length > 10){
	 		swal('이름은 4자리 이상 10자리 이하로 입력해주세요.');
	 		$('#name').focus();
	 		return false ;
	 	}
	 	
	 	var password = $('#password').val();
	 	if(password.length < 5 || password.length > 12){
	 		swal('비밀번호는 5자리 이상 12자리 이하로 입력해주세요.');
	 		$('#password').focus();
	 		return false ;
	 	}
	 	
	 	var regex = /^[a-z]\S{4,11}$/ ; /* 메타 문자 / 정규 표현식 */
	 	
	 	var result = regex.test(password);
	 
	 	if(result == false){
	 		swal('비밀번호 첫 글자는 반드시 소문자로 작성되어야 합니다.');
	 		return false;
	 	}
	 	
	 	if(password.indexOf("@") <= 0 && password.indexOf("#") <= 0 && password.indexOf("$") <= 0 ){
	 		swal('특수 문자 @#$ 중에서 최소 1개 이상이 필요합니다.');
	 		return false ;
	 	}
	 	
	 	var radioList = $("input[type='radio']:checked")
		if(radioList.length == 0){
			swal('성별을 선택해 주세요.');
			return false ;
		}
	 	
	 	var checklist = $("input[type='checkbox']:checked");
	 	if(checklist.length < 2){
	 		swal('취미는 2개 이상 선택해야 합니다.');
	 		return false ;
	 	}
	 	
	 	var hiredate = $('#hiredate').val();
			
			var regex = /^\d{4}\/[01]\d{1}\/[0123]\d{1}$/ ;
			var result = regex.test(hiredate) ;
			
			if(result == false){
				alert('날짜 형식은 반드시 yyyy/mm/dd 형식으로 작성해 주세요.');
				$('#hiredate').focus();
				return false;
			}
	 	/* alert(id +'/'); */
	 	
	 	
	 	return false ;
		}
	 
	</script>
</head>
<body>
		<div class="container mt-3 col-md-5">
		<h2>회원 등록</h2>
		<p>회원을 등록해 주는 페이지</p>

		<form action="bsMemberInsert2To.jsp">
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
				<span class="input-group-text col-md-2">적립 포인트</span> 
				<input id="mpoint" name="fakempoint" type="number" disabled="disabled"  class="form-control" placeholder="">
				<input type="hidden" name="mpoint" >
			</div>
			
			<div class="input-group">
				<span class="input-group-text col-md-2">비고</span>
				<input id="remark" name="fakeremark" type="text" disabled="disabled" class="form-control" placeholder="">
				<input type="hidden" name="remark" value="0">
			</div>
			
			<div class="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg" onclick="return validCheck();">
					등록
				</button>
				
				&nbsp;&nbsp;&nbsp;
				
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>

</body>
</html>
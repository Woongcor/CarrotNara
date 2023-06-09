<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>html 공부</title>
	<!-- jquery = javascript + css + etc 등을 사용하는 라이브러리입니다. -->
	<!-- jquery.min.js 파일 내부에 여러 가지 함수들이 정의되어 있습니다. -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
	/* function은 동작으로 해석 */
	$(document).ready(function(){ /* 현재 이 문서가 완전히 로딩되었을 때 여기를 실행해 주세요. */
		  /* alert('문서가 로딩되었습니다.'); */ /* alter() 함수는 일방적으로 띄워 주는 대화 상자 */
		  /* $('#myform').hide() ; */ /* id 속성이 myform인 항목을 숨겨 주세요. */
			
			var a = 5; /* 자바 스크립트에서 변수 정의시 var를 사용 */
		  	var b = 10;
		  	var c = a + b;
		  	/*alert(c);*/
		  	
		  	/* 모든 라벨의 갯수 구하기 */
		  	var label_count = $('label').length;
		  	
		  	$('#label_cnt').html(label_count);
		  	
		  	/* 모든 label을 찾아서 label_style이라는 클래스 속성을 추가해 주세요. */
		  	$('label').addClass('label_style');
		  	
		  	$('#age').removeClass('label_style');
		  	
		  	/* css 함수를 이용하여 스타일을 지정합니다. */
		  	/* 메소드를 연속적으로 명시하는 것을 메소드 체이닝이라고 합니다. */
		  	$('#hobby').css('color', 'blue').css('background-color', 'red');
		  	
		  	/* 기본값으로 다시 설정 */
		  	$('#hobby').css('color', '');
		  	
		    var label_string ='';
		    
		    /* 변수 label_string에 모든 label의 텍스트를 문자열로 결합하여 저장합니다. */
		  	
		    $('label').each(function(){
		    	label_string += $(this).text() + ' ';
		    });
		  	
		  	$('#label_text').html(label_string); 
		  	
		  	$('#check01').click(function(){
		  		/* alert('1번 눌러짐'); */
		  		var checklist = $(':checkbox'); /* type 속성이 checkbox인 항목들 */
		  		/* alert(checklist.length); */
		  		
				var result='';
				for(var i=0 ; i<checklist.length ; i++){
		  			if(checklist[i].checked){
		  				result += checklist[i].value + ' ' ;	
		  			}
		  		}
		  		
		  		$('#check_result_01').html(result) ;
		  	});
		 
		  	$('#check02').click(function(){
		  		/* input 태그 중에서 type 속성이 checkbox인 항목 중에서 선택이 된것들 */
		  		var checklist = $("input[type='checkbox']:checked"); 
		  		
		  		var result = '' ;
		  		for(var i=0 ; i<checklist.length ; i++){
		  			if(checklist[i].checked){
		  				result += checklist[i].value + ' ' ;	
		  			}
		  		}
		  		$('#check_result_02').html(result) ;
		  	});
		  	
		  	
		  	$('#radio01').click(function(){
		  		var list = $(':radio'); /* type 속성이 radio인 항목들*/
		  		
		  		var result='';
				for(var i=0 ; i<list.length ; i++){
		  			if(list[i].checked){
		  				result += list[i].value + '' ;	
		  			}
		  		}
		  		
		  		$('#radio_result_01').html(result) ;
			});  	
		});
	</script>
	
	<style type="text/css">
		.label_style{background-color:yellow;font-size:30px;}
	</style>
</head>
<body>
	<h1>폼 양식</h1>
	<!-- action 속성에 submit할 때 이동할 곳 명시 -->
	
	<form id="myform" name="myform" action="formExam02To.jsp">
	
		<label>이름</label> :
		<input type="text" name="name"></input>
		<br/> <!-- br은 엔터키 효과 -->
		
		<label id="age">나이</label> :
		<input type="text" name="age"></input>
		<br/>
		
		<label class="mytarget">이미지</label> :
		<input type="file" name="image"></input>
		<br/>
		
		<label>숨김 파라미터</label> :
		<input type="hidden" name="money" value="1200000"></input>
		<br/>
		
		<label class="mytarget">성별</label> :
		<input type="radio" name="gender" value="1" checked="checked">남자
		<input type="radio" name="gender" value="2">여자
		<br/>
		
		<label id="hobby">취미</label> :
		<input type="checkbox" name="hobby" value="당구">당구
		<input type="checkbox" name="hobby" value="축구">축구
		<input type="checkbox" name="hobby" value="야구" checked>야구
		<input type="checkbox" name="hobby" value="농구" checked="checked">농구
		<br/>
		
		<label class="yourtarget">직업</label> :
		<select name="job" >
			<option>-- 선택해 주세요.
			<option value="의사">의사
			<option value="판사" selected="selected">판사
			<option value="변호사">변호사
			<option value="검사">검사
		</select>
		<br/>
		
		<label class="mytarget yourtarget">코멘트</label> :
		<textarea name="comment" rows="10" cols="50"></textarea>
		
		<br/>
		<input type="submit" value="전송">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value="초기화">
	</form>
	
	라벨 갯수 : <span id="label_cnt"></span><br/>
	라벨 문구 : <span id="label_text"></span><br/><br/><br/>
	
	<button id="check01">체크 요소 확인 01</button><br/>
	
	<button id="check02">체크 요소 확인 02</button><br/>
	
	<button id="radio01">라디오 요소 확인 01</button><br/>
	
	체크 결과 01 : <span id="check_result_01"></span><br/>
	체크 결과 02 : <span id="check_result_02"></span><br/>
	
	라디오 결과 01 : <span id="radio_result_01"></span><br/>
	
	
</body>
</html>
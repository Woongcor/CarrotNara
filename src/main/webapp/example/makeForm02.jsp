<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>양식을 이쁘게 꾸며볼게요 양꾸~</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var a = 4;
		var b = 10;
		var c = a+b;
		
		var label_count=$('label').length
		
		$('#label_cnt').html(label_count);
		
		$('#hobby').css('color', 'blue').css('background-color', 'red');
		
		$('#rap01').click(function(){
			var raplist =$(':checkbox');
			
			var result='';
			for(var i=0; i<raplist.length; i++){
				if(raplist[i].checked){
					result +=raplist[i].value+' ';
				}
			}
			
			$('#rap_result_01').html(result);
		});
		
		$('#radio01').click(function(){
			var list = $('input[name="gender"]');
			
			var result='';
			for(var i=0; i<list.length; ++i){
				if(list[i].checked){
					result +=list[i].value +'';
				}
			}
			$('#radio_result_01').html(result);
		});
		
		$('#radio02').click(function(){
			var list = $('input[name="marriage"]');
			
			var result='';
			for(var i=0; i<list.length; ++i){
				if(list[i].checked){
					result +=list[i].value +'';
				}
			}
			$('#radio_result_02').html(result);
		});
		
		$('[href$=".com/"]').css('background-color', 'green');
		
	});
	
	
	
	
	</script>
	<style type="text/css">
	
	label{font-size:30px;}
	
	#id{color:orange;font-size:20px;background-color:black;}
	
	.love{color:pink;font-size:20px;background-color:black;}
	
	#birth, #marriage{color:green;font-size:20px;background-color:black;}
	
	#formform #name{font-size:20px;color:blue;background-color:black;}
	
	.hate{font-size:20px;color:brown;background-color:black;}
	
	label#salary{font-size:20px;color:red;background-color:black;}
	
	</style>	
</head>
<body>
	<h1>회원 가입 양식</h1>
	
	<form id="formform" name="formform" action="formExam01To.jsp">
	
	<label id="id">아이디 :</label>
	<input type="text" name="id"></input>
	<br/>
	
	<label id="name">이름 :</label>
	<input type="text" name="name"></input>
	<br/>
	
	<label class="love">비밀번호 :</label>
	<input type="text" name="password"></input>
	<br/>
	
	<label class="love">성별 :</label>
	<input type="radio" name="gender" value="1" checked="checked">남자
	<input type="radio" name="gender" value="2">여자
	<br/>
	
	<label id="birth">생일 :</label>
	<input type="text" name="birth"></input>
	<br/>	
	
	<label id="marriage">결혼 여부 :</label>
	<input type="radio" name="marriage" value="1">결혼
	<input type="radio" name="marriage" value="2" checked="checked">미혼
	<input type="radio" name="marriage" value="3">이혼
	<br/>
	
	<label id="salary">급여 :</label>
	<input type="text" name="salary"></input>
	<br/>	
	
	<label class="hate">주소 :</label>
	<input type="text" name="address"></input>
	<br/>	
	
	<label class="hate">매니저 :</label>
	<input type="text" name="manager"></input>
	<br/>	
	
	<label class="hate">이미지 :</label>
	<input type="file" name="image"></input>
	<br/>
	
	<label id="hobby">취미 :</label>
	<input type="checkbox" name="hobby" value="탁구">탁구
    <input type="checkbox" name="hobby" value="야구"checked>야구
    <input type="checkbox" name="hobby" value="축구"checked="checked">축구
    <br/>
    
	<label id="country">가고싶은 국가 :</label>
	<select name = "country">
		<option>--- 국가를 선택하세요 ---
		<option value="대한민국">대한민국
		<option value="미국"selected="selected">미국
		<option value="일본">일본
		<option value="중국">중국
		<option value="베트남">베트남	
	</select>
	<br/>
	
	<label id="comment" >코멘트 :</label>
	<textarea name="comment" rows="5" cols="30" ></textarea>
	<br/>
	<br/>
	
	<input type="reset" value="초기화">
	<input type="submit" value="가입하기">
	
	</form>
	라벨 갯수 :<span id="label_cnt"></span><br/>
	
	<button id="rap01">체크 요소 확인01</button><br/>
	<button id="radio01">라디오 요소 확인 01</button><br/>	
	<button id="radio02">라디오 요소 확인 02</button><br/>
	
	체크 결과01 : <span id ="rap_result_01"></span><br/>
	
	라디오 결과 01 : <span id="radio_result_01"></span><br/>
	라디오 결과 02 : <span id="radio_result_02"></span><br/>
	
	
	<h3>떡볶이 만드는 방법</h3>
	<ol>
	<li>떡을 물에 뿔린다.</li>
	<li>간장 고추장 케찹을 섞는다.</li>
	<li>후라이펜에 떡과 오뎅을 넣는다.</li>
	<li>양념을 넣고 끓여준다.</li>
	<li>삶은계란을 넣고 먹는다.</li>
	</ol>
	
	<h3>이번엔 무엇을 만들어볼까?</h3>
	<ul>
		<li><a href="https://www.bibibi.com/">bibibi</a></li>
		<li><a href="https://www.iiii.com/">iiii</a></li>
		<li><a href="https://www.aaaa.com/">aaaa</a></li>
	</ul>
	
</body>
</html>
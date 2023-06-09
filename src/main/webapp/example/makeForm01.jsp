<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 가입 양식</h1>
	<form action="formExam01To.jsp">
	
	<label>아이디 :</label>
	<input type="text" name="id"></input>
	<br/>
	
	<label>이름 :</label>
	<input type="text" name="name"></input>
	<br/>
	
	<label>비밀번호 :</label>
	<input type="text" name="password"></input>
	<br/>
	
	<label>성별 :</label>
	<input type="radio" name="gender" value="1">남자
	<input type="radio" name="gender" value="2">여자
	<br/>
	
	<label>생일 :</label>
	<input type="text" name="birth"></input>
	<br/>	
	
	<label>결혼 여부 :</label>
	<input type="radio" name="marriage" value="1">결혼
	<input type="radio" name="marriage" value="2">미혼
	<input type="radio" name="marriage" value="2">이혼
	<br/>
	
	<label>급여 :</label>
	<input type="text" name="salary"></input>
	<br/>	
	
	<label>주소 :</label>
	<input type="text" name="address"></input>
	<br/>	
	
	<label>매니저 :</label>
	<input type="text" name="manager"></input>
	<br/>	
	
	<label>이미지 :</label>
	<input type="file" name="image"></input>
	<br/>
	
	<label>취미 :</label>
	<input type="checkbox" name="hobby" value="탁구">탁구
    <input type="checkbox" name="hobby" value="야구">야구
    <input type="checkbox" name="hobby" value="축구">축구
    <br/>
    
	<label>가고싶은 국가 :</label>
	<select name = "country">
		<option>--- 국가를 선택하세요 ---
		<option value="대한민국">대한민국
		<option value="미국">미국
		<option value="일본">일본
		<option value="중국">중국
		<option value="베트남">베트남	
	</select>
	<br/>
	
	<label>코멘트 :</label>
	<textarea name="comment" rows="5" cols="30"></textarea>
	<br/>
	<br/>
	
	<input type="reset" value="초기화">
	<input type="submit" value="가입하기">
	
	</form>
</body>
</html>
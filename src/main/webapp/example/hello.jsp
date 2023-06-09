<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		/* CSS(Cascading Style Sheet)*/
		/* html 요소(element)에 스타일을 저장하는 문법입니다.*/
		li{font-size:30px;}
		h1{color:green;font-size:50px;}
	</style>
	
	<script type="text/javascript">
	/* JavaScript */
	/* html 요소에 대한 읽기/쓰기/조작 등을 하기 위한 프로그래밍 언어 */
		function welcome(){
			alert('어서오세요~~');
		}
	</script>
</head>

<body>
	<!-- 나는 html 주석이야... -->
	<!-- 
		여는 꺽쇠로 시작하는 항목을 tag 또는 element 라고 합니다. 
		tag 내에 속성이름="값"을 속성(attribute)이라고 합니다.
		html은 웹 페이지 내부에 들어가는 content를 만드는 문법입니다.
	--> 
	
	<!-- 중요 태그 : form(양식), table(표), 앵커(a 태그) -->>
	
	<!-- 검색시 hn으로 검색하기 -->
	<h1>큰 글씨</h1>
	<h1>Heading 1</h1>
	<h2>Heading 2</h2>
	<h3>Heading 3</h3>
	<h4>Heading 4</h4>
	<h5>Heading 5</h5>
	<h6>Heading 6</h6>
	
	<button onclick="welcome();">click me</button>
	
	안녕하세요~~<font color="blue"><b>홍길동</b></font>님
	
	~~방가워요^^
	<br/>
	<hr/>
	<!--  hr horizontal ruler -->
	
	<ul>
		<li>사과</li>
		<li>배</li>
		<li>감</li>
		<li>포도</li>
	</ul>
	<hr/>
	<a href="http://www.naver.com">네이버</a>
	<br/>
	<a href="http://www.daum.net">다음</a>
	<br/>
</body>
</html>
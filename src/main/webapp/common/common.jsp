<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%-- java.util 패키지는 여러 군데서 사용할 것이므로 공용 파일에 둡니다. --%>	
<%@ page import="java.util.*" %>

<%
	//모든 문서에서 사용될 애플리케이션 이름(컨텍스트)
	String contextPath = request.getContextPath();
	String urlPatterns = "/ShopMall" ; // inFrontController.java file
	
	// form 태그를 사용할 떄 필요한 변수
	String withFormTag = contextPath + urlPatterns;
	
	// form 태그가 아닌 경우에 사용할 변수
	String notWithFormTag = contextPath + urlPatterns + "?command=";
	
/* 	out.print("contextPath=" + contextPath + "<br/>");
	out.print("notWithFormTag=" + notWithFormTag + "<br/>"); */
	
%>
<%--
	JSTL : Jsp Standard Tag Library
	Jsp 코딩을 지원하기 위한 표준 태그 라이브러리
	준비물) jstl-1.2.jar , standard.jar
	taglib 지시어를 명시해 주어야 합니다.
	필요한 태그 라이브러리를 적절히 사용하면 됩니다.
	 --%>
	<%--jstl core 라비르러리 --%>
	<%--uri는 unique한 값, prefix는 접두사(네임스페이스)--%>
	<%--네임스페이스는 서로 다른 영역을 식별하기 위한 별칭과 같은 개념 --%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<%-- 세션 영역에 loginfo 라는 이름으로 로그인 정보가 바인딩되어 있습니다. --%>
	<%-- 변수 whologin : 0(미로그인) 1(일반사용자) 2(관리자) --%>
	<c:set var="whologin" value="0"/>
	<c:if test="${not empty sessionScope.loginfo}">
		<c:if test="${sessionScope.loginfo.id == 'admin'}">
			<c:set var="whologin" value="2"/>
		</c:if>
		<c:if test="${sessionScope.loginfo.id != 'admin'}">
			<c:set var="whologin" value="1"/>
		</c:if>
	</c:if>
	
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	 
	<!-- for sweet alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark ">
	<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script> 
    <lottie-player src="https://lottie.host/f609b5cf-4478-4010-a40d-87e2b6d56ace/V3ihpMWTPI.json" background="transparent" speed="1" style="width: 300px; height: 105px;" loop autoplay></lottie-player>
		<div class="container-fluid">
			<a class="navbar-brand" href="<%=notWithFormTag%>home"></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
				
					
					<li class="nav-item">
					<c:if test="${whologin == 0}">
						<a class="nav-link" href="">미로그인</a>
					</c:if>
					<c:if test="${whologin != 0}">
						<a class="nav-link" href="<%=notWithFormTag%>home">${sessionScope.loginfo.id}님</a>
					</c:if>
					</li>
					
					
					<!--  회원 section -->
					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button"	data-bs-toggle="dropdown">회원</a>
						<ul class="dropdown-menu">
							<c:if test="${whologin == 0}">
								<ul><li><a class="dropdown-item" href="<%=notWithFormTag%>meInsert">회원 가입</a></li></ul>
								<ul><li><a class="dropdown-item" href="<%=notWithFormTag%>meLogin">로그인</a></li></ul>
							</c:if>
							<c:if test="${whologin != 0}">
								<ul><li><a class="dropdown-item" href="<%=notWithFormTag%>meLogout">로그 아웃</a></li></ul>
								<ul><li><a class="dropdown-item" href="<%=notWithFormTag%>meUpdate">정보 수정</a></li></ul>
								<ul><li><a class="dropdown-item" href="<%=notWithFormTag%>maList">찜 목록</a></li></ul>    
								<ul><li><a class="dropdown-item" href="<%=notWithFormTag%>meDetail&id=${sessionScope.loginfo.id}">상세보기</a></li></ul>	
									
							</c:if>
							<c:if test="${whologin == 2}">
								<ul><li><a class="dropdown-item" href="<%=notWithFormTag%>meList">회원 목록 보기</a></li>	</ul>	
							</c:if>
						</ul>
					</li>
						
					
					  <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button"   data-bs-toggle="dropdown">판매</a>
                  <ul class="dropdown-menu">
                     <c:if test="${whologin != 0}">
                        <li><a class="dropdown-item" href="<%=notWithFormTag%>prInsert">상품 판매 등록</a></li>
                     </c:if>
                     <li><a class="dropdown-item" href="<%=notWithFormTag%>prList">상품 목록</a></li>
                        <ul>
                           <li><a class="dropdown-item" href="<%=notWithFormTag%>prListCar">자동차</a></li>
                           <li><a class="dropdown-item" href="<%=notWithFormTag%>prListFurniture">가구</a></li>
                           <li><a class="dropdown-item" href="<%=notWithFormTag%>prListAcc">악세사리</a></li>
                           <li><a class="dropdown-item" href="<%=notWithFormTag%>prListElectronics">가전제품</a></li>
                           <li><a class="dropdown-item" href="<%=notWithFormTag%>prListClothing">의류</a></li>                        
                        </ul>
                  </ul>
               </li>
               
					
										<!--  쇼핑몰 section -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">커뮤니티</a>
						<ul class="dropdown-menu">
							<ul>
							
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>boList5">공지사항</a></li>
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>boList4">이용정책</a></li>																	
								<c:if test="${whologin != 0}">

									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>boList2">Q&A</a></li>
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>boList3">거래후기</a></li>
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>boList6">사기이력 조회</a></li>

								</c:if>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<%-- 사용자에게 주의/경고/오류 등을 알려주기 위한 alert box --%>
	<c:if test="${not empty sessionScope.alertMsg}">
		<div class="alert alert-danger alert-dismissible">
	 		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	    	${sessionScope.alertMsg}
		</div>
    </c:if>
    <%--session 영역의 변수 alertMsg를 빈 문자열로 셋팅합니다. --%>
    <c:set var="alertMsg" value="" scope="session"/>
    <%--session 영역의 변수 alertMsg를 제거합니다. --%>
    <c:remove var="alertMsg" scope="session"/>
</body>
</html>
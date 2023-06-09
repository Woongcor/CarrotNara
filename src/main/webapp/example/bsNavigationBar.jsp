<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="">쇼핑몰</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">미로그인</a>
        </li>
        
        <!-- 회원 section -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">회원</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">회원가입</a></li>
            <li><a class="dropdown-item" href="#">로그인</a></li>
            <li><a class="dropdown-item" href="#">로그 아웃</a></li>
            <li><a class="dropdown-item" href="#">정보 수정</a></li>
          </ul>
          </li>
          
        <!-- 게시물 section --> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">게시물</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">게시물 등록</a></li>
            <li><a class="dropdown-item" href="#">목록 보기</a></li>
          </ul>
        </li>
      
        <!-- 상품 section --> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">상품</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">상품 등록</a></li>
            <li><a class="dropdown-item" href="#">상품 보기</a></li>
          </ul>
        </li>
      
        <!-- 쇼핑몰 section --> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">쇼핑몰</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">내역 보기</a></li>
            <li><a class="dropdown-item" href="#">장바구니</a></li>
          </ul>
        </li>
      
      </ul>
    </div>
  </div>
</nav>
<div class="container-fluid mt-3">
  <h3>Navbar With Dropdown</h3>
  <p>This example adds a dropdown menu in the navbar.</p>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
   <title>사기이력 상세정보</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   
   <!-- Bootstrap에서 제공하는 CSS 파일 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta2/css/bootstrap.min.css">
   
   <!-- 사이트 전체 스타일 파일 -->
   <link rel="stylesheet" href="../css/style.css">

   <style type="text/css">
      #backButton{margin:auto;}
      .table th, .table td{
         vertical-align: middle;
      }
   </style>
</head>
<body>

   <div class="container mt-3">
      <h2 class="mb-4">${requestScope.bean.mid}의 사기이력</h2>

      <table class="table table-hover">
         <thead>
         </thead>
         <tbody>
            <tr>
               <th scope="row" class="text-center">아이디</th>
               <td>${bean.mid}</td>
            </tr>
            <tr>
               <th scope="row" class="text-center">이름</th>
               <td>${bean.name}</td>
            </tr>
            <tr>
               <th scope="row" class="text-center">전화번호</th>
               <td>${bean.phone}</td>
            </tr>
            <tr>
               <th scope="row" class="text-center">사기이력</th>
               <td>${bean.fraud}</td>
            </tr>
            <tr>
               <th scope="row" class="text-center">사기이력 세부사항</th>
               <td>${bean.frauddetail}</td>
            </tr>
            <tr>
               <th scope="row" class="text-center">작성일자</th>
               <td>${bean.regdate}</td>
            </tr>         
         </tbody>
      </table>
      
      <div id="backButton">
         <button type="button" class="btn btn-outline-secondary" onclick="history.back();">
            돌아 가기
         </button>
      </div>
   </div>
   
   <!-- Bootstrap에서 제공하는 JS 파일 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta2/js/bootstrap.min.js"></script>
   
</body>
</html>
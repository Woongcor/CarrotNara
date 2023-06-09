<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="style.css">
   
   <title>Insert title here</title>
   <style type="text/css">
      body, html {font-family: 'Noto Sans KR', sans-serif;}}
      /* table 셀의 수평 가운데 정렬 */
      a {text-decoration: none;}
      .container  h2{font-size:32px; font-weight:600;;}
      .container  > .sbu_txt  {font-size:17px; font-weight:400; color:#5f5f5f;}
      .table thead tr th { border-top:2px solid #222;  color: #787878; font-weight: 500; font-size: 14px;   padding: 15px 0;   line-height: 1;  text-align:center;}
      .table  tr td {vertical-align: middle; text-align:center;}
      #goingAnchor, #deleteAnchor{opacity:0.8;}
   </style>
   <style type="text/css">
        .heart {
        height: 10px;
        width: 10px;
        background: red;
        position: relative;
        transform: rotate(-45deg);
        box-shadow: -10px 10px 90px red;
        animation: heart 0.6s linear infinite;
        }

      @keyframes heart {
        0% {
        transform: rotate(-45deg) scale(1.00);
        }
        80% {
        transform: rotate(-45deg) scale(0.90);
        }
        100% {
        transform: rotate(-45deg) scale(0.80);
        }
        }

        .heart::before {
        content: "";
        position: absolute;
        height: 10px;
        width: 10px;
        background: red;
        top: -55%;
        border-radius: 50px;
        box-shadow: -10px 10px 90px red;
        }

        .heart::after {
        content: "";
        position: absolute;
        height: 10px;
        width: 10px;
        background: red;
        right: -55%;
        border-radius: 50px;
        box-shadow: -10px 10px 90px red;
        }


        heart {
        height: 10px;
        width: 10px;
        background: red;
        position: relative;
        transform: rotate(-45deg);
        box-shadow: -10px 10px 90px red;
        animation: heart 0.6s linear infinite;
        }

      @keyframes heart {
        0% {
        transform: rotate(-45deg) scale(1.00);
        }
        80% {
        transform: rotate(-45deg) scale(0.90);
        }
        100% {
        transform: rotate(-45deg) scale(0.80);
        }
        }
   </style>
</head>
<body>
   <div class="container mt-3">
      <div class="heart"></div><h2>찜 목록</h2>
      
      <table class="table">
         <thead>
            <tr>
               <td>이미지</td>
               <td>상품</td>
               <td>금액</td>
               <td>삭제</td>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="bean" items="${sessionScope.orderList}">     
            <tr>
               <td align="center" valign="middle">
                  <a href="<%=notWithFormTag%>prDetail&num=${bean.pnum}">
                  <img alt="${bean.pname}" width="160" height="160" class="rounded" 
                     src="<%=contextPath%>/image/${bean.image01}">
                  </a>
               </td>
               <td align="center" valign="middle">
                  <a href="<%=notWithFormTag%>prDetail&num=${bean.pnum}">
                     ${bean.pname}
                  </a>
               </td>
               <td align="center" class="price_${bean.pnum}" data="${bean.price}" valign="middle">
                  <fmt:formatNumber value="${bean.price}" pattern="###,###"/> 원
               </td>               
               <td id= "delete" align="center" valign="middle">
                  <a onclick="return confirm('삭제 하시겠습니까?');" id="deleteAnchor" class="btn btn-outline-danger" href="<%=notWithFormTag%>maDelete&pnum=${bean.pnum}">
                     삭제
                  </a>            
               </td>
            </tr>      
            </c:forEach>
            <tr>
               <td></td>
               <td></td>
               <td></td>
               <td colspan="3">
                  <a href="<%=notWithFormTag%>prList" id="goingAnchor" class="btn btn-outline-primary">
                     쇼핑 더 하기
                  </a>                  
               </td>            
            </tr>          
         </tbody>
      </table>
   </div>   
</body>
</html>
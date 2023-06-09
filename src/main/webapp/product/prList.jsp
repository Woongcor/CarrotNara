<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
   <title>Bootstrap Example</title>
   <meta charset="utf-8">
   <link href='https://fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'>
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <style type="text/css">
      .card{margin-left:auto;margin-right:auto;}
      .card-img-top{width:286px;height:300px;}
      .card-img-tap-blur{width:286px;height:300px;filter: blur(4px);}
      .cart{background-color:white;border:1px solid red;}
      a {text-decoration: none;color: black;}
      .card-title{color: black;}
      .card-text{color: navy;margin-top:1em;margin-bottom: 1em;margin-left: 0;margin-right: 0}
      #updateAnchor, #deleteAnchor{opacity:0.8;}
      #won{font-size: 28px;font-weight: 500;color: #F47A00;}
   </style>
   <style type="text/css">
      body, html {font-family: 'Noto Sans KR', sans-serif;}
      .container  h2{font-size:32px; font-weight:600;;}
      .container  > .sbu_txt  {font-size:17px; font-weight:400; color:#5f5f5f;}
      .table thead tr th { border-top:2px solid #222;  color: #787878; font-weight: 500; font-size: 14px;   padding: 15px 0;   line-height: 1;  text-align:center;}
      .table  tr td {vertical-align: middle; text-align:center;}
      #cate{color:orange;font-size: 16px;font-weight:bolder;}
      .main_image {position: relative;}
      .main_image_text {
       position: absolute;
       top: 50%;
       left: 50%;
       transform: translate( -50%, -50% );
       color: red;
       font-size: 35px;
       font-weight: 550;
     }
     #bg{
      position: absolute;
       top: 2%;
       left: 4%;
     }
   </style>
</head>
<body>
   <div class="container mt-3">
      <h2>${requestScope.title}</h2>

      <table class="table table-borderless ">
         <thead>
         </thead>
         <tbody>
            <tr>
              <td colspan="6" align="center">
                  ${requestScope.pageInfo.pagingStatus}
               </td>
          </tr>
            <tr>
            <td colspan="6">         
               <form name="myform" action="<%=withFormTag%>" method="get">
                  <div class="row">
                     <input type="hidden" name="command" value="prList${requestScope.PAGENAME}">
                     
                     <div class="col" >                     
                        <select style="position: absolute;right:535px;width:106px;top: 140px;" class="form-control" id="mode" name="mode">
                           <option value="all" selected="selected">- 선택사항 -
                           <option value="name">제목
                           <option value="comments">내용
                           <option value="address">지역
                        </select>
                  
                        <input style="position: absolute;right:330px;width:200px;top: 140px;" class="form-control" type="text" name="keyword" id="keyword"
                           placeholder="키워드를 입력해 주세요.">
               
                        <button style="position: absolute;right:270px;top: 140px;" type="submit" class="btn btn-warning" onclick="">검색</button>
                     
                        <button style="position: absolute;right:180px;top: 140px;" type="button" class="btn btn-warning" onclick="searchAll();">전체보기</button>
                     </div>
                  </div>
               </form>
            </td>
         </tr>      
               <c:set var="colsu" value="${applicationScope.map['product_column_size']}"/>
               <c:forEach var="bean" items="${requestScope.datalist}" varStatus="status">
                     <c:if test="${status.index mod colsu == 0}">
                        <tr>
                     </c:if>
                     <td>
                        <div class="card" style="width: 18rem;">
                           <a href="<%=notWithFormTag%>prDetail&num=${bean.num}">
                           <c:if test="${bean.cate == '거래중'}">
                             <img src="<%=contextPath%>/image/${bean.image01}" class="card-img-top" alt="${bean.name}">
                           </c:if>
                           <c:if test="${bean.cate == '예약중'}">
                             <img src="<%=contextPath%>/image/${bean.image01}" class="card-img-top" alt="${bean.name}" >
                             <span id="bg" class="badge bg-success">예약중</span>
                           </c:if>
                           <c:if test="${bean.cate == '거래완료'}">
                           <div class="main_image">
                             <img src="<%=contextPath%>/image/${bean.image01}" class="card-img-tap-blur" alt="${bean.name}">
                             <h1 class="main_image_text">거래완료</h1>
                            </div>
                           </c:if>
                                <div class="card-body">
                                   <c:if test="${fn:length(bean.name) >= 13}">
                                        <h5 class="card-title">${fn:substring(bean.name, 0, 13)}...</h5>
                                  </c:if>
                                  <c:if test="${fn:length(bean.name) < 13}">
                                        <h5 class="card-title">${bean.name}</h5>
                                  </c:if>
                                  <p class="card-text" align="right">
                                       <span data-bs-content="${bean.writer}">
                                       
                                       
                                           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                           <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                           <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                           </svg>
                                           ${bean.writer}
                                          
                                           <br>
                               
                                           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                           <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
                                            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>
                                           </svg>
                                           <fmt:parseDate value="${bean.inputdate}" var="parseDateValue" pattern="yyyy-MM-dd"/>
                                           <fmt:formatDate value="${parseDateValue}" pattern="yyyy-MM-dd"/>
                                        
                                           <br>
                                        
                                           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                                   <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                   <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                 </svg>
                                 ${bean.address}
                                        
                                        
                                           <dd id = "won" align="right"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${bean.price}"/></dd>
                                        </span>
                                  </p>
                            
                                  <hr>
                            
                                  <form class="form-inline" align="right">
                                       <c:if test="${sessionScope.loginfo.id == bean.writer || sessionScope.loginfo.id == 'admin'}">
                                        <a onclick="return confirm('수정 하시겠습니까?');" id="updateAnchor" class="btn btn-outline-primary" href="<%=notWithFormTag%>prUpdate&num=${bean.num}${requestScope.pageInfo.flowParameter}">수정</a>
                                        <a onclick="return confirm('삭제 하시겠습니까?');" id="deleteAnchor" class="btn btn-outline-danger" href="<%=notWithFormTag%>prDelete&num=${bean.num}${requestScope.pageInfo.flowParameter}">삭제</a>
                                        </c:if>
                                        <c:if test="${bean.cate == '거래중' || bean.cate == '예약중'}">
                                 <a onclick="return confirm('찜 목록에 등록 하시겠습니까?');" type="submit" class="btn btn-outline-danger cart" href="<%=notWithFormTag%>maInsert&num=${bean.num}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                                       <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"></path>
                                    </svg>
                                    찜
                                 </a>
                                  </c:if>
                               
                              </a>
                               <c:if test="${bean.cate == '거래완료'}">
                                  <button type="button" class="btn btn-outline-secondary">찜불가</button>
                               </c:if>
                                   </form>
                             </div>
                        </div>
                        
                     </td>
                  <c:if test="${status.index mod colsu == (colsu-1)}">
                     <tr>
                  </c:if>
               </c:forEach>
            </tbody>
      </table>
      ${requestScope.pageInfo.pagingHtml}
   </div>
   <script type="text/javascript">
      /* 필드 검색시 입력 했던 콤보 박스(mode)의 내용과 키워드(keyword) 입력 상자에 있던 내용은 보존되어야 합니다. */
      $(document).ready(function(){ 
         var myoptions = $('#mode option');
         
         for(var i=0 ; i<myoptions.length ; i++){
            if(myoptions[i].value == '${requestScope.pageInfo.mode}'){
               myoptions[i].selected = true ; 
            }
         }
         
         $('#keyword').val('${requestScope.pageInfo.keyword}') ;
      });
      
      function searchAll(){ /* 전체 검색 */
         location.href = "<%=notWithFormTag%>prList${requestScope.PAGENAME}";
      }
   </script>
</body>
</html>
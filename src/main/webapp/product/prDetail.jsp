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
      .card{margin-left:auto;margin-right:auto;}
      .leftside{margin-left:0px;}
      .card_borderless{border:0px;}
      .small_image{width:100px;height:100px;margin:2px;border-radius:5px;}
      #won{font-size: 28px;font-weight: 600;color: #F47A00;}
      img {width: 310px;height:310px;object-fit: fill;}
   </style>
   <style type="text/css">
      .container h2{font-size:32px; font-weight:600;}
      
      .main_image {position: relative;}
        .main_image_text {
         position: absolute;
         top: 50%;
         left: 50%;
         transform: translate( -50%, -50% );
         color: red;
         font-size: 35px;
         font-weight: 550;
      
   </style>
   <style type="text/css">
      ul { list-style: none; }
      #container { padding: 30px 20px; }
      #insertComment {
         padding: 20px 15px;
         border-bottom: 1px solid #7BAEB5;
      }
      #cate{color:red;font-size: 20px;font-weight:bolder;}

      #insertComment label {
         display: inline-block;
         width: 80px;
         font-size: 14px;
         font-weight: bold;
         margin-bottom: 10px;
      }

      #insertComment input[type='text'], #insertComment textarea {
         border: 1px solid #ccc;
         vertical-align: middle;
         padding: 3px 10px;
         font-size: 12px;
         line-height: 150%;
      }

      #insertComment textarea {
         width: 450px;
         height: 120px ;
      }
     
      .commentItem {
         font-size: 13px;
         color: #333;
         padding: 15px;
         border-bottom: 1px dotted #ccc;
         line-height: 150%;
      }

      .commentItem .writer {
         color: #555;
         line-height: 200%;
      }

      .commentItem .writer input {
         vertical-align: middle;
      }

      .commentItem .writer .name {
         color: #222;
         font-weight: bold;
         font-size: 14px;
      }
      .form-control {
         height: 25px;
      }
      #comment_list textarea{
       width: 450px;
         height: 120px ;
     }
     #bg{
      position: absolute;
       top: 2%;
       left: 4%;
     }
     
   </style>
   
   <script src="<%=contextPath%>/myjavascript/jquery.imagezoom.js"></script>
   <script type="text/javascript">
   
      function OnloadImg(url){
        var img=new Image();
        img.src=url;
        var img_width=img.width;
        var win_width=img.width+25;
        var height=img.height+30;
        var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+height+', menubars=no, scrollbars=auto');
        OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
   }
   
      $(document).ready(function(){
         var price = '${bean.price}';
         $('.small_image').click(function(){
            $('.active_image').attr('src', $(this).attr('src'));   
         });
      });
      
      //사용자 및 버튼 생성함수
       function addNewItem(cnum, writer, content, regdate){
            /* 댓글 1개를 추가해 주는 함수 */
            var litag = $('<li>'); /* 새 댓글이 추가될 li 태그 */
            litag.addClass('commentItem');
            
            var ptag = $('<p>'); /* 작성자 정보가 들어갈 p 태그 */
            ptag.addClass('writer');
            
            var spantag = $('<span>'); /* 작성자 이름이 들어가 span 태그 */
            spantag.addClass('name');
            spantag.html(writer+'님');
            
            var spandate = $('<span>'); /* 작성 일시가 들어갈 span 태그 */
            spandate.html('&nbsp;&nbsp;/&nbsp;&nbsp;' + regdate + ' ');
            
            if(writer == '${sessionScope.loginfo.id}' || '${sessionScope.loginfo.id}' == 'admin'){
               var inputtag = $('<input>'); /* 삭제하기 버튼 생성 */
               var attrlist = {'id':writer, 'class':'btn btn-outline-danger', 'type':'button', 'value':'삭제', 'pmkey':cnum};
               inputtag.attr(attrlist);
               inputtag.addClass('delete_btn');
            }else{
               var inputtag =  '';
            }
            
            if(writer == '${sessionScope.loginfo.id}' || '${sessionScope.loginfo.id}' == 'admin'){
               var inputtag2 = $('<input>'); /* 수정하기 버튼 생성 */
               var attrlist2 = {'id':writer, 'class':'btn btn-outline-primary', 'type':'button', 'value': '수정', 'pmkey':cnum, 'content':content};
               inputtag2.attr(attrlist2);
               inputtag2.addClass('update_btn');
            }else{
               var inputtag2 =  '';
            }
            
            var content_p = $('<p>'); /* 작성한 댓글 내용 생성 */
            var content_p2 = {'id': "test_"+cnum};
            content_p.attr(content_p2);
            content_p.html(content) ;
            
            // 조립하기
            ptag.append(spantag).append(spandate).append(inputtag).append('&nbsp;&nbsp;').append(inputtag2) ;
            litag.append(ptag).append(content_p);
            
            //html에 추가
            $('#comment_list').append(litag) ;
          
         }
       
         function getListComment(){
            $('#comment_list').empty();
            $.ajax({
               url : '<%=notWithFormTag%>cmList',
               data : 'no=' + '${bean.num}',
               type : 'get',
               dataType : 'json',
               success : function(result, status){
                  /* result : 넘어온 결과 값 */
                  $.each(result, function(idx){
                     var cnum = result[idx].cnum ;
                     var writer = result[idx].writer ;
                     var content = result[idx].content ;   
                     var regdate = result[idx].regdate ;
                     addNewItem(cnum, writer, content, regdate);
                  })
               }
            });
         }
         $(document).on('click', '.delete_btn', function(){
            if(confirm('선택하신 항목을 삭제하시겠습니까?')){
               $.ajax({
                  url : '<%=notWithFormTag%>cmDelete',
                  data : 'cnum=' + $(this).attr('pmkey') + "&no=" + '${bean.num}',
                  type : 'get',
                  dataType : 'text',
                  success : function(result, status){
                     /* 댓글 삭제 성공시 */
                     getListComment();
                  }
               });
            }
         });
         
         //수정버튼 클릭시
         $(document).on('click', '.update_btn', function(){
            // pmkey변수 설정
            var cnum = $(this).attr('pmkey');
            var content = $(this).attr('content');
            console.log(content);
            
            //textarea 태그로 변경
             $("#test_"+cnum).html("<textarea id='testArea_" + cnum + "'>"+content+"</textarea>");
            
            //수정완료 클릭 버튼으로 text 변경
             $(this).attr('value', '수정완료');
             $(this).addClass('update_btn_ok');
             $(this).removeClass('update_btn');
         });
         
         //수정완료 버튼 클릭시
         $(document).on('click', '.update_btn_ok', function(e){
            //변수 설정
            var cnum = $(this).attr('pmkey');
            
            // 수정할 content 변수 설정
            var content = $("#testArea_"+cnum).val();
             
            if(confirm('선택하신 항목을 수정하시겠습니까?')){
               $.ajax({
                  url : '<%=notWithFormTag%>cmUpdate',
                  data : 'cnum=' + cnum + "&no=" + '${bean.num}' + "&content=" +content,
                  type : 'get',
                  dataType : 'text',
                  success : function(result, status){ /* 댓글 수정 성공시 */
                     getListComment();
                  }
               });
            }
             
         });
       
         $(document).ready(function(){
            getListComment(); /* 문서가 모두 읽힌 다음, 코멘트 목록 가져 오기 */
               /** 댓글 내용 저장 이벤트 */
               $("#comment_form").submit(function(){
                  // 작성자 이름에 대한 입력 여부 검사
                  if (!$("#writer").val()) {
                     alert("이름을 입력하세요.");
                     $("#writer").focus();
                     return false;
                  }
         
                  // 내용에 대한 입력 여부 검사
                  if (!$("#content").val()) {
                     alert("내용을 입력하세요.");
                     $("#content").focus();
                     return false;
                  }      
                  var url = '<%=notWithFormTag%>cmInsert' ;
                  var parameter = $('#comment_form').serialize() ;
                  $.post(url, parameter, function( data ) {
                     /* alert( '댓글이 작성되었읍니다.' ) ; */
                     getListComment() ; /* 목록 갱신 */
                     $("#writer").val('') ;
                     $("#content").val('') ;
                     
                  }).fail(function() {
                     alert("댓글 작성에 실패했습니다. 잠시 후에 다시 시도해 주세요.");
                     return false ;
                  });
                  return true ;
               });         
            
          });
   </script>
</head>
<body>
   <div class="container mt-3">
      <h2>상품 상세</h2>

      <table class="table table-borderless ">
         <tbody>
            <tr>
               <td class="col-lg-5">
                  <c:if test="${bean.cate == '거래중'}">
                     <div class="card" style="width: 30rem;">
                          <img src="<%=contextPath%>/image/${bean.image01}" class="card-img-top active_image zoom" alt="${bean.name}" onclick="OnloadImg(this.src)">
                       </div>
                    </c:if>
                    
                    <c:if test="${bean.cate == '예약중'}">
                     <div class="card" style="width: 30rem;">
                          <img src="<%=contextPath%>/image/${bean.image01}" class="card-img-top active_image zoom" alt="${bean.name}" onclick="OnloadImg(this.src)">
                          <span id="bg" class="badge bg-success">예약중</span>
                       </div>
                    </c:if>
                    
                    <c:if test="${bean.cate == '거래완료'}">
                       <div class="main_image">
                          <div class="card" style="width: 30rem;filter: blur(4px);">
                           <img src="<%=contextPath%>/image/${bean.image01}" class="card-img-top active_image zoom" alt="${bean.name}" onclick="OnloadImg(this.src)">
                          </div>
                       <h1 class="main_image_text">거래완료</h1>
                       </div>
                    </c:if>
               </td>
               <td class="col-lg-1">
                  <img src="<%=contextPath%>/image/${bean.image01}" class="card-img-top small_image" alt="${bean.name}" >
                  
                  <c:if test="${not empty bean.image02}">
                     <img src="<%=contextPath%>/image/${bean.image02}" class="card-img-top small_image" alt="${bean.name}">
                  </c:if>
                  
                  <c:if test="${not empty bean.image03}">
                     <img src="<%=contextPath%>/image/${bean.image03}" class="card-img-top small_image" alt="${bean.name}">
                  </c:if>
               </td>
               <td class="col-lg-6">
                  <div class="card leftside card_borderless" style="width: 18rem;">
                     <p style="font-size:20px;font-weight:600;" class="card-title">상품설명 : <br>${bean.name}</p>
                     <p style="font-size:20px;font-weight:600;" class="card-text">${bean.comments}</p>
                     <dd id ="won"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${bean.price}"/></dd>
                     <br/>
                     <form action="<%=withFormTag%>" method="post">
                            <input type="hidden" name="command" value="maInsert">
                           <input type="hidden" name="num" value="${bean.num}">
                           <p style="font-size:15px;font-weight:600;" class="card-title">거래지역 : ${bean.address} 인근</p>
                        <hr>
                           <c:if test="${sessionScope.loginfo.id == bean.writer || sessionScope.loginfo.id == 'admin'}">
                        <a onclick="return confirm('수정 하시겠습니까?');" id="updateAnchor" class="btn btn-outline-primary" href="<%=notWithFormTag%>prUpdate&num=${bean.num}${requestScope.pageInfo.flowParameter}">수정</a>
                        <a onclick="return confirm('삭제 하시겠습니까?');" id="deleteAnchor" class="btn btn-outline-danger" href="<%=notWithFormTag%>prDelete&num=${bean.num}${requestScope.pageInfo.flowParameter}">삭제</a>
                     </c:if>
                      <c:if test="${bean.cate == '거래중' || bean.cate == '예약중'}">
                          
                     <button onclick="return confirm('찜 목록에 등록 하시겠습니까?');" type="submit" class="btn btn-outline-danger cart">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                           <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"></path>
                        </svg>
                        찜
                     </button>
                     </c:if>
                        
                        <c:if test="${bean.cate == '거래완료'}">
                            <button type="button" class="btn btn-outline-secondary">찜불가</button>
                        </c:if>
                     </form>
                  </div>                  
               </td>               
            </tr>            
         </tbody>
      </table>
      <div>
      <div>
         <!-- 댓글 영역 -->
         <div class="col-sm-12">               
            <ul id="comment_list">
               <!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
            </ul>
            <div id="insertComment">
               <form id="comment_form" method="post" role="form" class="form-horizontal" >
                  <table class="table">
                      
                      <tbody>
                        <tr>
                          <td>
                             <label for="content" class="col-xs-3 col-lg-3 control-label">작성자</label>              
                          </td>
                          <td>
                           <input type="hidden" name="no" value="${bean.num}" />
                           <input type="text" name="fakewriter" id="fakewriter" class="form-control" size="10" 
                              disabled="disabled" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님">                           
                           <input type="hidden" name="writer" id="writer" value="${sessionScope.loginfo.id}">
                          </td>
                        </tr>
                        <tr>
                          <td>
                             <label for="content" class="col-xs-3 col-lg-3 control-label">댓글 내용</label>
                          </td>
                          <td>
                             <textarea name="content" rows="3" cols="50" id="content" ></textarea>
                          </td>
                        </tr>
                       <tr>
                        <td colspan="2">
                            <button type="button" class="btn btn-outline-danger" onclick="location.href='<%=notWithFormTag%>prList'">돌아가기</button>
                              <button type="submit" class="btn btn-outline-primary" onclick="return confirm('댓글을 저장 하시겠습니까?');">저장하기</button> 
                         </td>
                       </tr>
                      </tbody>
                  </table>
               </form>   
            </div>
         </div>   
      </div>
   </div>
</body>
</html>
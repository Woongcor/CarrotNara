<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
   <title>Bootstrap Example</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){
       
           
           });

</script>
<style type="text/css">
   .rounded-pill{opacity:0.8;}
   
   #backButton{margin: auto;}
   
      body, html {font-family: 'Noto Sans KR', sans-serif;}}
   
      .rounded-pill{opacity:0.8;}
      #noUnderLine{text-decoration-line: none;}
      .container  h2{font-size:32px; font-weight:600;;}
      .container  > .sbu_txt  {font-size:17px; font-weight:400; color:#5f5f5f;}
      .table thead tr th { border-top:2px solid #222;  color: #787878; font-weight: 500; font-size: 14px;   padding: 15px 0;   line-height: 1;  text-align:center;}
      .dff_table tr td:fist-child {color:#9f9f9f; font-weight:800; font-size:18px;}
      .border_title {text-algin: left;}
      .border_title a {font-size: 25px; font-weight:600; color:#222; line-height: 165%; margin-bottom: 14px; transition: all .3s ease-in-out;}
          .border_title > a p {font-size: 16px; color: #676767; font-weight:400; transition: all .3s ease-in-out}
         .border_title a:hover {color:#116AEF; }
      .border_title a:hover  p {color:#116AEF;}
       .btm_wrap {display: flex;  ustify-content: center; justify-content: space-between;}
       .btm_wrap > div {display: flex;}
       .btm_wrap .btn {background:#9a9a9a; color:#fff; margin:0 4px; border:0;}
       .btm_wrap .btn.btn-primary {background:#116AEF; color:#fff;}
   
</style>

   <style type="text/css">
      /* 댓글들을 위한 스타일 지정 */
      * {
         padding: 0;
         margin: 0;
         color: #333;
      }
      ul { list-style: none; }
      #container { padding: 30px 20px; }
      #insertComment {
         padding: 20px 15px;
         border-bottom: 1px solid #7BAEB5;
      }

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
      
      .form-group {
         margin-bottom: 3px;
      }
      
      .form-control {
         height: 25px;
      }
      .btn-primary{opacity: 0.8;}
             #comment_list textarea{
                   width: 450px;
         height: 120px ;
     }
   </style>   
   <script type="text/javascript">
function addNewItem(cnum,writer,content,regdate){
   /*댓글 1개를 추가해 주는 함수*/
   var litag = $('<li>');  /*새 댓글이 추가될 li 태그*/
   litag.addClass('commentItem');
   
   var ptag = $('<p>');  /*작성자 정보가 들어갈 p 태그*/
   ptag.addClass('writer');
   
   var spantag = $('<span>'); /*작성자 이름이 들어갈 span 태그*/
   spantag.addClass('name');
   spantag.html(writer+'님');
   
   var spandate = $('<span>'); /*작성 일시가 들어갈 span 태그*/
   spandate.html('&nbsp;&nbsp;/&nbsp;&nbsp;'+regdate+' ');
   
   if(writer == '${sessionScope.loginfo.id}'){
      var inputtag = $('<input>'); /*삭제하기 버튼*/
      var attrlist = {'id':writer, 'class':'btn btn-outline-danger','type':'button','value':'삭제','pmkey':cnum};
      inputtag.attr(attrlist);
      inputtag.addClass('delete_btn');
      
   }else{
      var inputtag = ''; 
   }
   
    if(writer == '${sessionScope.loginfo.id}'){
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
      ptag.append(spantag).append(spandate).append(inputtag2).append('&nbsp;&nbsp;').append(inputtag) ;
      litag.append(ptag).append(content_p);
      
      //html에 추가
      $('#comment_list').append(litag) ;
    
 }


function getListComment(){
   $('#comment_list').empty();
   $.ajax({
      url : '<%=notWithFormTag%>cmList3',
      data : 'no=' + '${bean.no}',
      type : 'get',
      dataType : 'json',
      success : function(result,status){
         /*result : 넘어온 결과 값*/
         $.each(result,function(idx){
            var cnum = result[idx].cnum;
            var writer = result[idx].writer;
            var content = result[idx].content;
            var regdate = result[idx].regdate;
            addNewItem(cnum,writer,content,regdate);
         })
         
      }
      
   });
}
   /* [삭제] 버튼 클릭*/
   /* data 영역의 'pmkey'는 임의의 이름으로 내가 지정한 코멘트의 기본 키입니다. */
   /* on() 메소드는 선택된 요소에 이벤트 핸들러 함수를 연결 시켜 줍니다.*/
   /* 이전 페이지로 복원시 no 파라미터가 반드시 필요합니다.*/
   $(document).on('click','.delete_btn',function(){
      if(confirm('선택하신 항목을 삭제하시겠습니까?')){
         $.ajax({
            url : '<%=notWithFormTag%>cmDelete3',
            data : 'cnum=' + $(this).attr('pmkey')+ "&no="+'${bean.no}',
            type : 'get',
            dataType : 'text',
            success : function(result,status){ /*댓글 삭제 성공시*/
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
               url : '<%=notWithFormTag%>cmUpdate3',
               data : 'cnum=' + cnum + "&no=" + '${bean.no}' + "&content=" +content,
               type : 'get',
               dataType : 'text',
               success : function(result, status){ /* 댓글 수정 성공시 */
                  getListComment();
               }
            });
         }
          
      });

$(document).ready(function(){
       getListComment();  /*문서가 모두 읽힌 다음, 코멘트 목록 가져 오기 */
       
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
           
           var url = '<%=notWithFormTag%>cmInsert3' ;
           var parameter = $('#comment_form').serialize() ;
           $.post(url, parameter, function( data ) {
              /* alert( '댓글이 작성되었습니다.' ) ; */
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
   
   <style type="text/css">
      #backButton{margin:auto;}
   </style>
   
</head>
<body>

   <div class="container mt-3">
      <h2>글번호 ${requestScope.bean.no}의 게시물 정보</h2>

      <table class="table table-hover">
         <thead>
         </thead>
         <tbody>
            <tr>
               <td align="center">작성자</td>
               <td>${bean.writer}</td>
            </tr>
            <tr>
               <td align="center">글제목</td>
               <td>${bean.subject}</td>
            </tr>
            <tr>
               <td align="center">글내용</td>
               <td>${bean.content}</td>
            </tr>
            <tr>   
               <td align="center">사진</td>
               <td><img src="<%=contextPath%>/image/${bean.image01}" style="width:300px;height: 300px;"   class="card-img-top small_image" alt="사진이 없습니다">
               <img src="<%=contextPath%>/image/${bean.image02}" style="width:300px;height: 300px;"  class="card-img-top small_image" alt="사진이 없습니다"></td>
            </tr>
            <tr>
               <td align="center">작성 일자</td>
               <td>${bean.regdate}</td>
            </tr>
            <tr>
               <td align="center">조회수</td>
               <td>${bean.readhit}</td>
            </tr>         
         </tbody>
      </table>
      
      
  <div>
         <!-- 댓글 영역 -->
         <div class="col-sm-12">               
            <ul id="comment_list">
               <!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
            </ul>
            <div id="insertComment">
               <form id="comment_form" method="post" role="form" class="form-horizontal" >
                  <table class="table">
                      <thead>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                             <label for="content" class="col-xs-3 col-lg-3 control-label">작성자</label>              
                          </td>
                          <td>
                           <input type="hidden" name="no" value="${bean.no}" />
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
                             <button type="button" class="btn btn-outline-danger" onclick="history.back();">돌아가기</button>
                             <button type="submit" class="btn btn-outline-primary">저장하기</button> 
                        </td>
                        </tr>
                      </tbody>
                  </table>
               </form>   
            </div>
         </div>   
      </div>

         </body>      
      
   </div>
</body>
</html>
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
   /* box model 공부할 것 */
   .input-group{margin: 7px;}
   
   .input-group-text{
      display:block;
      margin-left:auto;
      margin-right:auto;
   }
   .btn{
   padding: 15px 30px;
   border-radius: 15px;
}
</style>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
   
     <link rel="stylesheet" href="/resources/demos/style.css">
          
     <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
     <script type="text/javascript">
        $(document).ready(function(){
             /* $('#inputdate').datepicker(); */
             $('#inputdate').datepicker({dateFormat: "yy/mm/dd"}); 
             
             /* 카테고리 확인 */
             var category ='${requestScope.bean.category}';
          $("input[value='${requestScope.bean.cate}']").attr('checked', true);
             
             var optionlist = $('.myoption');
             optionlist.each(function(){
                if($(this).val() == category){
                   $("option[value='" + category + "']").attr('selected', true);
                }
             })
        });
        
        function validCheck(){/* 폼 유효성 검사 */
           var name = $('#name').val();
           if(name.length < 1 || name.length > 50){
              alert('상품명은 1글자 이상 50글자 이하이어야 합니다.');
              $('#name').focus();
              return false;
           }
           
           var comments = $('#comments').val();
           if(comments.length < 1 || comments.length > 100){
              alert('상품에 대한 설명은 10글자 이상 100글자 이하이어야 합니다.');
              $('#comments').focus();
              return false;
           }
           
           var image01 = $('#image01').val();
           if(image01==''){
              alert('대표 이미지는 필수 사항입니다.');
              $('#image01').focus();
              return false;
           }
           
           var isCheck = false ; /* 확장자 체크에 충족하면 true가 됩니다. */
           const imgCheck = ['.png','.jpg'] ;/* 확장자 체크용 배열 */
           for(var i=0; i < imgCheck.length; i++){
              if(image01.endsWith(imgCheck[i])){
               isCheck = true;
               break;
              }
           }
           if(isCheck == false){
              alert('이미지의 확장자는 png 또는 jpg 형식이어야 합니다.');
              return false;   
           }
           
           const NumberMsg = ' 은(는) 숫자 형식이어야 합니다.' ;
           
           var price = $('#price').val();
           if(price == ''||isNaN(price)==true){
              alert('가격' + NumberMsg);
              $('#price').focus();
              return false;   
           }else{
              var numPrice = Number(price);
              if(numPrice < 1 || numPrice > 100000000){
                 alert('가격은 100원 이상 100000000원 이하이어야 합니다.');
                   $('#price').focus();
                   return false;
              }   
           }
           
           var cateogory = $('#cateogory').val();
           if(cateogory == '-'){/* 코딩할 때 option의 value 속성을 하이픈으로 설정했습니다. */
              alert('카테고리를 선택해 주세요.');
              $('#cateogory').focus();
              return false;
           }
           
           
         var inputdate = $('#inputdate').val();
           
           var regex = /^\d{4}\/[01]\d{1}\/[0123]\d{1}$/;
           var result = regex.test(inputdate);
           
           if(result == false){
              alert('날짜 형식은 반드시 yyyy/mm/dd 형식으로 작성해 주세요.');
              $('#inputdate').focus();
              return false;
           }
           
           var address = $('#address').val();
           if(address.length < 1 || address.length > 100){
              alert('거래지역을 입력해 주세요.');
              $('#address').focus();
              return false;
           }
           
           var cate = $('#cate').val();
           if(cate == '-'){
              alert('거래현황을 선택해 주세요.');
              $('#cate').focus();
              return false;
           }
           
        }
        
     </script>
      <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
   


   <script>
   /** 우편번호 찾기 */
   function execDaumPostcode() {
       daum.postcode.load(function(){
           new daum.Postcode({
               oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                 $("#postcode").val(data.zonecode);
                 $("#address").val(data.roadAddress);
               }
           }).open();
       });
   }
   </script>
</head>
<body>
   <div class="container mt-3 col-md-5">
      <h2>상품 수정</h2>
      <p>내가 등록한 상품을 수정하는 페이지입니다.</p>
      
      <form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
      
         <input type="hidden" name="command" value="prUpdate">
         <input type="hidden" name="pageNumber" value="<%=request.getParameter("pageNumber")%>">
         <input type="hidden" name="pageSize" value="<%=request.getParameter("pageSize")%>">
         <input type="hidden" name="mode" value="<%=request.getParameter("mode")%>">
         <input type="hidden" name="keyword" value="<%=request.getParameter("keyword")%>">
         
         <div class="input-group">
            <span  class="input-group-text col-md-2">상품 번호</span> 
            <input id="fakenum" name="fakenum" type="number" disabled="disabled" class="form-control" placeholder="" value="${requestScope.bean.num}">
            <input id="num" name="num" type="hidden" value="${requestScope.bean.num}">
         </div>
         <div class="input-group">
            <span class="input-group-text col-md-2">작성자</span> 
            <input id="fakewriter" name="fakewriter" disabled="disabled" type="text" class="form-control" placeholder="" value="${requestScope.bean.writer}">
            <input type="hidden" id="writer" name="writer" value="${requestScope.bean.writer}">
         </div> 
         <div class="input-group">
            <span class="input-group-text col-md-2">상품명</span> 
            <input id="name" name="name" type="text" class="form-control" placeholder="" value="${requestScope.bean.name}">
         </div>
         <div class="input-group">
            <span class="input-group-text col-md-2">상품설명</span> 
            <input id="comments" name="comments" type="text" class="form-control" placeholder="" value="${requestScope.bean.comments}">
         </div>
         <div class="input-group">
            <input type="hidden" name="deleteImage01" value="${requestScope.bean.image01}">
            <span class="input-group-text col-md-2">이미지01</span> 
            <input id="image01" name="image01" type="file" class="form-control" placeholder="">
         </div>
         <div class="input-group">
            <input type="hidden" name="deleteImage02" value="${requestScope.bean.image02}">
            <span class="input-group-text col-md-2">이미지02</span> 
            <input id="image02" name="image02" type="file" class="form-control" placeholder="">
         </div>
         <div class="input-group">
            <input type="hidden" name="deleteImage03" value="${requestScope.bean.image03}">
            <span class="input-group-text col-md-2">이미지03</span> 
            <input id="image03" name="image03" type="file" class="form-control" placeholder="">
         </div>
         <div class="input-group">
            <span class="input-group-text col-md-2">가격</span> 
            <input id="price" name="price" type="number" class="form-control" placeholder="" value="${requestScope.bean.price}">
         </div>         
         <div class="input-group">
            <span class="input-group-text col-md-2">카테고리</span> 
            <select id="category" name="category" class="form-select form-select">
                 <option class="myoption" value="-">-- 항목을 선택해 주세요.</option>
               <option class="myoption" value="car">자동차</option>
                 <option class="myoption" value="furniture">가구</option>
                 <option class="myoption" value="acc">악세서리</option>
                 <option class="myoption" value="electronics">가전제품</option>
                 <option class="myoption" value="clothing">의류</option>
            </select>
         </div>
         <div class="input-group">
            <span class="input-group-text col-md-2">거래현황</span> 
            <div class= "form-control radio_gender">
               <label class="radio-inline"> <input id="cate" name="cate" type="radio" value="거래중">거래가능</label>
               <label class="radio-inline"> <input id="cate" name="cate" type="radio" value="거래완료">거래완료</label>
               <label class="radio-inline"> <input id="cate" name="cate" type="radio" value="예약중">예약중</label>
            </div>
         </div>
         
        <div class="input-group">
            <span class="input-group-text col-md-2">거래지역</span>
            <input id="address" name="address" class="form-control" value="${requestScope.bean.address}" type="text" class="btn btn-info m-btn--air"
             onclick="execDaumPostcode()">
            </div>
            
         <div class="input-group">
            <span class="input-group-text col-md-2">수정일자</span> 
            <input id="inputdate" name="inputdate" type="datetime" class="form-control" placeholder="" value="${requestScope.bean.inputdate}">
         </div>
         <div id="buttonset2" class="container mt-3">
            <button type="submit" class="btn btn-outline-primary" onclick="return validCheck();">수정</button>
            &nbsp;&nbsp;
            <button type="reset" class="btn btn-outline-danger">초기화</button>
         </div>
      </form>
   </div>
</body>
</html>
<!-- html 주석입니다. -->
<%-- jsp 주석입니다.  --%>
<%-- 골뱅이로 시작하는 항목은 지시어입니다.  --%>

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
   .input-group {
      margin: 7px;
   }
   
   .input-group-text {
      display: block;
      margin-left: auto;
      margin-right: auto;
   }

   #buttonset {margin-top: 15px;}
   .radio_gender, .chk_hobby{font-size:1.1.re;} /*주위 글꼴 1.1배*/
</style>

<style type="text/css">
	body, html {font-family: 'Noto Sans KR', sans-serif;}}
	
		.rounded-pill{opacity:0.8;}
		#noUnderLine{text-decoration-line: none;}
		.container  h2{font-size:32px; font-weight:600;;}
		.container  > .sbu_txt  {font-size:17px; font-weight:400; color:#5f5f5f;}
		.table thead tr th { border-top:2px solid #222;  color: #787878; font-weight: 500; font-size: 14px;   padding: 15px 0;   line-height: 1;  text-align:center;}
		.table  tr td {vertical-align: middle; text-align:center;}
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

   <link rel="stylesheet" href="/resources/demos/style.css">

   <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
   <script type="text/javascript">
   
    $(document).ready(function(){
      /* $('#hiredate').datepicker(); */  
         $('#hiredate').datepicker({dateFormat:"yy/mm/dd"});     
      
         /* value 속성의 값이 일치하는 항목에 대하여 체크 on 시킵니다. attr은 속성이라는 뜻 */
         $("input[value='${sessionScope.loginfo.gender}']").attr('checked', true);
         
         var hobbyCheck ='${sessionScope.loginfo.hobby}'; /*과거 선택했던 Checkbox 목록 */
         var checkHobbies = $("input[name='hobby']");
      
         /* alert(checkHobbies.length); */
         
         for(var i=0 ; i<checkHobbies.length ; i++){
            var idx = hobbyCheck.indexOf(checkHobbies[i].value);
            if(idx >= 0){ /*해당 종목이 문자열에 포함 되어 있으면 반환 값이 0이상입니다.*/
               checkHobbies[i].checked = true ;
            }
         }   
      });
    </script>
    
    <!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
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
    
    
      /* validCheck 유효성 검사 */
      function validCheck(){
          /* alert('반환 값이 false이면 이벤트 전파가 되지 않습니다.') */
          var id = $('#id').val();
          if(id.length < 3 || id.length > 10){
             swal('아이디는 3자리 이상 10자리 이하로 입력해주세요.');
             $('#id').focus();
             return false ;
      }

    
       var name = $('#name').val();
       if(name.length < 3 || name.length > 10){
          swal('이름은 3자리 이상 10자리 이하로 입력해주세요.');
          $('#name').focus();
          return false ;
       }
       
       var password = $('#password').val();
       if(password.length < 5 || password.length > 12){
          swal('비밀번호는 5자리 이상 12자리 이하로 입력해주세요.');
          $('#password').focus();
          return false ;
       }
       
       var regex = /^[a-z]\S{4,11}$/ ; /* 메타 문자 / 정규 표현식 */
       
       var result = regex.test(password);
    
       if(result == false){
          swal('비밀번호 첫 글자는 반드시 소문자로 작성되어야 합니다.');
          return false;
       }
       
       if(password.indexOf("@") <= 0 && password.indexOf("#") <= 0 && password.indexOf("$") <= 0 ){
          swal('특수 문자 @#$ 중에서 최소 1개 이상이 필요합니다.');
          return false ;
       }
       var age = $('#age').val();
       if (age.length < 1 || age.length > 4) {
           swal('나이를 입력해주세요')
           $('#age').focus();
           return false;
       }
       
    
       var phone = $('#phone').val();
       if (phone.length < 11 || phone.length > 11) {
          swal('핸드폰번호는 11 자리로 입력해 주세요.')
          $('#phone').focus();
          return false;
       }
       
      
     	
       
       var radioList = $("input[type='radio']:checked")
      if(radioList.length == 0){
         swal('성별을 선택해 주세요.');
         return false ;
      }
       
       var checklist = $("input[type='checkbox']:checked");
       if(checklist.length < 2){
          swal('취미는 2개 이상 선택해야 합니다.');
          return false ;
       }
       
       var hiredate = $('#hiredate').val();
        
        var regex = /^\d{4}[\/-][01]\d{1}[\/-][0123]\d{1}$/ ;
        var result = regex.test(hiredate) ;
        
        if(result == false){
           alert('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
           $('#hiredate').focus() ;
           return false ;
        }
       /* alert(id +'/'); */
       
       
       return true ;
      }
    
   </script>
</head>
<body>
      <div class="container mt-3 col-md-5">
      <h2>회원 정보 수정</h2>
      <p>나의 정보를 수정하는 페이지입니다.</p>

      <form action="<%=withFormTag%>" method="post">
         <input type="hidden" name="command" value="meUpdate">
         

                 
         <div class="input-group">
            <span class="input-group-text col-md-2">아이디</span> 
            <input id="fakeid" name="fakeid" type="text" disabled="disabled" class="form-control" placeholder="" value="${sessionScope.loginfo.id}">
            <input id ="id" name="id" type="hidden" value="${sessionScope.loginfo.id}">
         </div>
         <div class="input-group">
            <span class="input-group-text col-md-2">비밀번호</span> <input
               id="password" name="password" type="password" class="form-control"
               placeholder="" >
         </div>
         <div class="input-group">
            <span class="input-group-text col-md-2">이름</span> <input id="name"
               name="name" type="text" class="form-control" placeholder="" value="${sessionScope.loginfo.name}">
         </div>
         
         
         <div class="input-group">
            <span class="input-group-text col-md-2">나이</span> <input id="age"
               name="age" type="number" class="form-control" placeholder="" value="${sessionScope.loginfo.age}">
         </div>
         
         <div class="input-group">
            <span class="input-group-text col-md-2">핸드폰번호</span> <input id="phone"
               name="phone" type="text" class="form-control" placeholder="" value="${sessionScope.loginfo.phone}">
         </div>
         
         <div class="input-group">
            <span class="input-group-text col-md-2">주소</span> <input
               id="address" name="address" type="text" class="form-control"
               placeholder="" value="${sessionScope.loginfo.address}">
            <input type="button" class="btn btn-info m-btn--air"
                     onclick="execDaumPostcode()"value="우편번호 찾기"/>
                                       
            <div class="input-group">
               <label class="col-md-2 offset-md-3 col-form-label">
                  <span class="m--font-orange vertical-middle"></span>

               
            </div>
         
         
         <div class="input-group" >
            <span class="input-group-text col-md-2 ">성별</span> 
            <div class="form-control">
               <label class="radio-inline radio-gender">
                  &nbsp;<input type="radio" name="gender" value="남자">남자 
               </label>
               &nbsp;
               <label class="radio-inline radio-gender">
                  &nbsp;<input type="radio" name="gender" value="여자">여자 
               </label>
            </div>
         </div>
         <div class="input-group">
            <span class="input-group-text col-md-2">취미</span> 
            <div class="form-control">
               <label class="checkbox-inline chk-hobby">
               <input type="checkbox" name="hobby" value="탁구">탁구
               </label>
               &nbsp;
                 <label class="checkbox-inline chk-hobby">
                  &nbsp;<input type="checkbox" name="hobby" value="농구">농구
               </label>
                 &nbsp;
                 <label class="checkbox-inline chk-hobby">
                  &nbsp;<input type="checkbox" name="hobby" value="야구">야구
               </label>
                    &nbsp;
                 <label class="checkbox-inline chk-hobby">
                  &nbsp;<input type="checkbox" name="hobby" value="당구">당구
               </label>
                 &nbsp;
                 <label class="checkbox-inline chk-hobby">
                  &nbsp;<input type="checkbox" name="hobby" value="축구">축구
               </label>
            </div>
         </div>
         <div class="input-group">
            <span class="input-group-text col-md-2">가입 일자</span> <input
               id="hiredate" name="hiredate" type="datetime"
               class="form-control" placeholder="" value="${sessionScope.loginfo.hiredate}">
         </div>
         
         <div class="input-group">
            <span class="input-group-text col-md-2">비고</span>
            <input id="remark" name="fakeremark" type="text" disabled="disabled" class="form-control" placeholder="" value="${sessionScope.loginfo.remark}">
            <input type="hidden" name="remark"  value="${sessionScope.loginfo.remark}">
         </div>
         
         <div class="buttonset" class="input-group">
            <button type="submit" class="btn btn-outline-primary" onclick="return validCheck();">
               수정
            </button>
           
            
            <button type="reset" class="btn btn-outline-danger">초기화</button>
         </div>
      </form>
   </div>

</body>
</html>
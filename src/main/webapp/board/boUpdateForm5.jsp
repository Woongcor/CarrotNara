<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
body, html {font-family: 'Noto Sans KR', sans-serif;}}
	/* box model 공부할 것 */
	.input-group{margin: 7px;}
	
	.input-group-text{
		display:block;
		margin-left:auto;
		margin-right:auto;
		
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
		
	}
	#buttonset{margin-top:15px;}
</style>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">	
  	<link rel="stylesheet" href="/resources/demos/style.css">  	  	
  	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  	
  	<script type="text/javascript">
  		$(document).ready(function(){
  	  		/* $('#regdate').datepicker(); */
  	  		$('#regdate').datepicker({dateFormat: "yy/mm/dd"});  	  	 
  		});
  		
  		function validCheck(){/* 폼 유효성 검사 */
  			var subject = $('#subject').val();
  			if(subject.length < 5 || subject.length > 20){
  				alert('글 제목은 5글자 이상 20글자 이하이어야 합니다.');
  				$('#subject').focus() ;
  				return false ;
  			}
  			
  			var content = $('#content').val();
  			if(content.length < 5 || content.length > 30){
  				alert('글 내용은 5글자 이상 30글자 이하이어야 합니다.');
  				$('#content').focus() ;
  				return false ;
  			}
  			
  			var regdate = $('#regdate').val();
  			
  			var regex = /^\d{4}[\/-][01]\d{1}[\/-][0123]\d{1}$/ ;
  			var result = regex.test(regdate) ;
  			
  			if(result == false){
  				alert('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
  				$('#regdate').focus() ;
  				return false ;
  			}
  			
  			return true ;
  		}
  		
 		 function confirmEdit() {
   		    if (confirm("수정하시겠습니까?")) {
   		      return validCheck();
   		    } else {
   		      return false;
   		    }
   		  }
  	</script>
</head>
<body>
	<div class="container mt-3 col-md-5">
		<h2>공지사항 수정</h2>
		<p>관리자가 공지사항을 수정하는 페이지입니다.</p>
		
		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="boUpdate5">
			
			<input type="hidden" name="pageNumber" value="<%=request.getParameter("pageNumber")%>">
			<input type="hidden" name="pageSize" value="<%=request.getParameter("pageSize")%>">
			<input type="hidden" name="mode" value="<%=request.getParameter("mode")%>">
			<input type="hidden" name="keyword" value="<%=request.getParameter("keyword")%>">
			
			<input type="hidden" name="readhit" value="${bean.readhit}">
			<input type="hidden" name="groupno" value="${bean.groupno}">
			<input type="hidden" name="orderno" value="${bean.orderno}">
			<input type="hidden" name="depth" value="${bean.depth}"> 	
			
			<div class="input-group">
				<span class="input-group-text col-md-2">게시물 번호</span> 
				<input id="fakeno" name="fakeno" disabled="disabled" type="number" class="form-control" placeholder="" value="${bean.no}">
				<input type="hidden" id="no" name="no" value="${bean.no}">
			</div> 
			<div class="input-group">
				<span class="input-group-text col-md-2">작성자</span> 
				<input id="fakewriter" name="fakewriter" disabled="disabled" type="text" class="form-control" placeholder="" value="${bean.writer}">
				<input type="hidden" id="writer" name="writer" value="${bean.writer}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글제목</span> 
				<input id="subject" name="subject" type="text" class="form-control" placeholder="" value="${bean.subject}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글내용</span> 
				<input id="content" name="content" type="text" class="form-control" placeholder="" value="${bean.content}">
			</div>  
			<div class="input-group">
				<span class="input-group-text col-md-2">등록 일자</span>
				
				<input id="regdate" name="regdate" type="datetime" 
					class="form-control" placeholder="" value="${bean.regdate}">
			</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg"
					onclick="return confirmEdit();">
					수정
				</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>
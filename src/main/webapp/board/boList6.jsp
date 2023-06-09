<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
	
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
			
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
			return new bootstrap.Tooltip(tooltipTriggerEl)
		});		
			
		function searchAll(){ /* 전체 검색 */
			location.href = '<%=notWithFormTag%>boList6' ;
		}
		
		function writeForm(){ /* 글쓰기 */
			location.href = '<%=notWithFormTag%>boInsert6' ;
			
			
		}
		

		
		

	</script>
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
</head>
<body>
	<div class="container mt-3">
		<h2>사기이력조회</h2>
		<p>사기이력을 조회해보시고, 세부사항을 꼭 확인해보세요</p>

		<table class="table">
			<thead>
				<tr>
					<th>글번호</th>
					
					<th>아이디</th>
					<th>이름</th>
					
					<th>사기이력</th>
					<th>작성일자</th>
					<th>수정</th>
					<th>삭제</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="7" align="center">			
					
						<form name="myform" action="<%=withFormTag%>" method="get">
							<div class="row">
							<input type="hidden" name="command" value="boList6">
								
							<div class="col">							
								<select class="form-control" id="mode" name="mode">
									<option value="all" selected="selected">--- 선택해 주세요 ---
									<option value="mid">아이디
									<option value="name">이름
									<option name="phone" value="phone" data-bs-toggle="tooltip" title="전화번호는 - 없이 입력해주세요."
					data-bs-placement="left">전화번호								
														
								</select>
							</div>
							<div class="col">
								<input class="form-control" type="text" name="keyword" id="keyword"
									placeholder="키워드를 입력해 주세요.">
																
												</div>							
							<div class="col">
								<button type="submit" class="btn btn-warning" onclick="">검색</button>
		
								<button type="button" class="btn btn-warning" onclick="searchAll();">전체보기</button>
							</div>
							
							<c:if test="${whologin==2}">
							<div class="col">
								<button type="button" class="btn btn-info" onclick="writeForm();">글 쓰기</button>
							</div>
							</c:if>
							
							<div class="col">
								
							</div>
							</div>
						</form>
						
						
					</td>
				</tr>				
				<c:forEach var="bean" items="${datalist}"> 
				<tr>
					<td align="center">${bean.no}</td>
					
					<td>${bean.mid}</td>
					<td>${bean.name}	</td>
					
					<td>
					
					<a id="noUnderLine" href="<%=notWithFormTag%>boDetail6&no=${bean.no}${requestScope.pageInfo.flowParameter}">
					${bean.fraud}</a></td>
					<td>${bean.regdate}</td>
	
					<td>
					<c:if test="${whologin==2}">
							<a href="<%=notWithFormTag%>boUpdate6&no=${bean.no}${requestScope.pageInfo.flowParameter}">
								<input type="button" value="수정">
							</a>
					</c:if>
					</td>
					<td>
					<c:if test="${whologin==2}">  
				
							<button type="button" value="삭제" 
							onclick="if(confirm('삭제하시면 복구할 수 없습니다. \n 정말로 삭제하시겠습니까?')==true){
								location.href = '<%=notWithFormTag%>boDelete6&no=${bean.no}${requestScope.pageInfo.flowParameter}' ;}
							else{return false}"/>삭제
								
							</c:if>
				
					</td>				
				</tr>
				</c:forEach>	
									<tr>
					<td colspan="9" align="center">
						${requestScope.pageInfo.pagingStatus}
					</td>
				</tr>		 					 
			</tbody>
		</table>
		
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
	</script>	
</body>
</html>










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
		<h2>Q&A</h2>
		<p>궁금한거 물어보세요!</p>

		<table class="table">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>글제목</th>
					<th>글내용</th>
					<th>작성 일자</th>
					<th>조회수</th>
					<th>수정</th>
					<th>삭제</th>
				
				</tr>
			</thead>
			<tbody>
							
				<c:forEach var="bean" items="${datalist}"> 
				<tr>
					<td align="center">${bean.no}</td>
					<td>${bean.writer}</td>
					<td>
						<a id="noUnderLine" href="<%=notWithFormTag%>boDetail2&no=${bean.no}${requestScope.pageInfo.flowParameter}">						
							<c:forEach begin="1" end="${bean.depth}">
								<span class="badge rounded-pill bg-secondary">re</span>							
							</c:forEach>
							${bean.subject}							
						</a>
					</td>
					<td>${bean.content}</td>
					<td>${bean.regdate}</td>
					<td>
						<c:if test="${bean.readhit >= 50}">
							<span class="badge rounded-pill bg-primary">${bean.readhit}</span>
						</c:if>												
						<c:if test="${bean.readhit < 50}">
							<span class="badge rounded-pill bg-danger">${bean.readhit}</span>
						</c:if>
					</td>
					<td>
						<c:if test="${sessionScope.loginfo.id==bean.writer}">
							<a href="<%=notWithFormTag%>boUpdate2&no=${bean.no}${requestScope.pageInfo.flowParameter}">
								<input type="button" value="수정">
							</a>
						</c:if>
					</td>
					<td>
						<c:if test="${sessionScope.loginfo.id==bean.writer or whologin==2}">
							<button type="button" value="삭제" 
							onclick="if(confirm('삭제하시면 복구할 수 없습니다. \n 정말로 삭제하시겠습니까?')==true){
								location.href = '<%=notWithFormTag%>boDelete2&no=${bean.no}${requestScope.pageInfo.flowParameter}' ;}
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
		${requestScope.pageInfo.pagingHtml}
		
								<div id="buttonset"  class="input-group">
						<a href="<%=notWithFormTag%>boRegister2">
				<button type="submit" class="btn btn-primary btn-lg"
					onclick="return validCheck();"> 
					글등록
				</button></a>	
	</div>
</body>
</html>

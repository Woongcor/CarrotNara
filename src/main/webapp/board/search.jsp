<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">


#B {
  background-color: white;
  width: 600px;
  border: 7px solid blue;
  margin: 20px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container mt-3">
		<h2>사기 이력 조회</h2>
		<p>◆아이디 or 이름으로 조회해보세요◆</p>
		
		<div>

			<br>
			<br>
				
				
				<div class="input-group">※거래대상 사이버 사기피해 신고여부 확인※
				<br>
				<br>
				</div>
		<div id="A">
		
	<legend>필수입력항목</legend>	
		<p class="input_box1">
					<select name="fraud">
			<option selected="selected">-- 선택해 주세요.
			<option value="아이디">아이디
			<option value="이름" >이름
			
		</select>
		
		<input type="text" name="number" value="" placeholder="아이디 or 이름을 입력해주세요."></input>
		
		
				
					


			<div id="buttonset" class="input-group">
			<a href="<%=notWithFormTag%>boInsert5">
				<button type="submit" class="btn btn-primary btn-lg"
					onclick="return validCheck();">
					조회하기
				</button></a>
				&nbsp;&nbsp;&nbsp;
			
			</div>
			</div>	
</div>
</div>
<br><br>
<p class="fraud_box" id="search_result"><span class="f_13 mgnl10">&nbsp;&nbsp;&nbsp;조회 버튼을 클릭하시면,<br>&nbsp;&nbsp;&nbsp;최근 3개월 동안 3회 이상 사이버범죄 신고시스템에 신고 접수된 번호들과 비교합니다.</span></p>

<script type="text/javascript">
						    function setMessage(msg){
			                	msg = msg.replace(/&lt;/gi,"<").replace(/&gt;/gi,">");
						
						    	$('#search_result').html(msg);
						    }
					
					        $(function() {
						        $(document).ready(function() {
						        	var status = ""
						        	  ;
						        	if (status != "") {
						        		status = status.replace(/&lt;/gi,"<").replace(/&gt;/gi,">");
						        		$("#search_result").html(status);
						        	}
						        });
					        	
					            $("#getXmlSearch").live('click', function() {
					                if ( checkValidationXml() ) {
					                    callAjaxData("3");
					                }
					            });
					        });
					
					        function checkValidationXml() {
					            if(! $(':input[name = "keyword"]').val()){
					                alert('번호를 입력해주세요.');
					                $("input[name = 'keyword']").focus();
					                return false;
					            }
					            return true;
					        }
					
					        function callAjaxData(accessType) {
					        	var $field = $('#cyc_field option:selected').val()
					              , $keyword 	= $(':input[name = "keyword"]').val();
					            //var cybercopUrl = "https://net-durumi.cyber.go.kr/getMessage.do";
					            //var cybercopUrl = "https://net-durumi.cyber.go.kr/countFraud.do";
					            
					            var cybercopUrl = "https://net-durumi.cyber.go.kr/countFraud.do";
					            
					            $.ajax({
					                type: "POST"
					                ,url: cybercopUrl
					                ,dataType : "jsonp"
					                ,jsonp : "callback"
					                ,data : "fieldType="+$field+"&keyword="+$keyword+"&accessType="+accessType
					                ,contentType : "application/x-www-form-urlencoded; charset=utf-8"
					                ,error : function (request, status, error) {
						                $('#search_result').html("오류가 발생 되었습니다.");
					                }
					                ,success: function(response, status, request) {
					                	var msg = response["message"];
					                	msg = msg.replace(/&lt;/gi,"<").replace(/&gt;/gi,">");
								
					                	$("#search_result").html(msg);
					                }
					                ,beforeSend : function() {
					                    $("#search_result").html("신고 여부를 확인 중입니다.");
					                }
					                ,complete : function() {}
					             });
					        }
					    </script>
	<br>
			<br>
				
		<ul id="B" class="basic_list">
		<legend>■인터넷 사기예방 5계명</legend>	
		
							<li>1. 인터넷거래는 가능한 신용카드를 이용한다.</li>
							<li>2. 신뢰 할 수 있는 쇼핑물 등을 이용한다.</li>
							<li>3. 대형 오픈마켓이라고 하더라도 사업자정보를 확인하는 등 주의를 게을리 하지 않는다.</li>
							<li>4. 턱 없이 싼 가격을 제시하며 직거래를 제안하는 사람은 주의한다.</li>
							<li>5. 직거래를 하는 경우 가능한 직접 만나서 물품을 받는다.</li>
						</ul>
						
						
</body>
</html>
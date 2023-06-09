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
		#totalprice{color:red;font-size: 20px;font-weight:bolder;}
		.cart{background-color:black;border:1px solid black;} /* 속성 표기법 */
		.rightnow{background-color:red;border:1px solid red;}
		#qty{margin:-10px;border:0px;font-size:0.7rem;}	
		.plus, .minus{font-size:1.1rem;}
	</style>
	<style type="text/css">
		#backButton{margin:auto;}
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
      #ing{color:red;font-size:30px;font-weight:bolder;}
      .btn-primary{opacity: 0.8;}
   </style>
	<script src="<%=contextPath%>/myjavascript/jquery.imagezoom.js"></script>
	<script type="text/javascript">
		/* var price = 10000 ; */ /* 단가 */
		
		/* const 키워드는 읽기 전용(자바의 final과 동일 개념)*/
		const maxPurchaseSize = 5 ; /* 최대 구매 가능 개수 */
	
		$(document).ready(function(){
			/* alert('단가 : ${bean.price}원'); */
			
			var price = '${bean.price}';
			
			$('#qty').innerWidth($('.minus').innerWidth() - 3) ;
			
			$('#totalprice').text('0') ; /* 최초 시작시 금액 0으로 셋팅 */
			
			/* attr() 함수는 속성(attribute)을 읽거나 쓰기 위한 함수 */
			$('.small_image').click(function(){
				$('.active_image').attr('src', $(this).attr('src'));	
			});
			
			$('.plus').click(function(){ /* 사용자가 + 버튼을 클릭함 */
				var qty = $('#qty').val();
				if(qty == maxPurchaseSize){
					/* swal('최대 5개까지만 주문이 가능합니다.'); */
					swal('최대 ' + maxPurchaseSize + '개까지만 주문이 가능합니다.'); 
					return ; /* return 구문으로 함수 더이상 실행 않하도록 함*/
				}
				/* Number는 Integer.parseInt()와 동일한 효과 */
				var newQty = Number(qty) + 1;
				if(qty == ''){
					$('#qty').val('1');
				}else{
					$('#qty').val(newQty);
				}
				var amount = newQty*price ;
				$('#totalprice').text(amount.toLocaleString());
			});
			
	  		$('.minus').click(function(){ /* 사용자가 - 버튼을 클릭함 */
	  			var qty = $('#qty').val() ;
	  			if(qty == '0'){
	  				swal('최소 1개 이상 구매 가능합니다.');
	  				return ;
	  			}

	  			var newQty = Number(qty) - 1 ;
	  			if(qty == ''){
	  				$('#qty').val('0');
	  				$('#totalprice').text(0);
	  			}else{
	  				$('#qty').val(newQty);
	  				var amount = newQty*price ;
					$('#totalprice').text(amount.toLocaleString());
	  			}
	  		});
			
			/* blur 이벤트는 포커스를 잃어 버릴때 반응합니다. */
			$('#qty').blur(function(){
				var qty = $('#qty').val() ;
				
				/* isNaN() 함수는 숫자가 아니면 true를 반환해 줍니다. */
				if(qty == '' || isNaN(qty) == true){
					swal('0이상 ' + maxPurchaseSize + '이하의 숫자만 가능합니다.') ;
					$('#qty').val('0') ;
					$('#qty').focus();
					return ;
				}
				
				if(isNaN(qty) == false){ /* 숫자 형식으로 입력된 경우 */
					var newQty = Number(qty) ;
					if(newQty < 0 || newQty > maxPurchaseSize){
						swal('0이상 ' + maxPurchaseSize + '이하의 숫자만 가능합니다.') ;
						$('#qty').val('0') ;
						$('#qty').focus();
						return ;	
					}
				}
				
			});
			
			
			$('.cart').click(function(){
				var qty = $('#qty').val() ;
				if(qty < 1 || qty > 5){
					swal('최소 1개 이상 카트에 담을 수 있습니다.') ;
					return ;
				}
				
			});
			
			$('.rightnow').click(function(){
				var qty = $('#qty').val() ;
				if(qty < 1 || qty > 5){
					swal('즉시 구매는 최소 1개 이상 가능합니다.') ;
					return ;
				}
			});			
		});
		
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
			   
			   if(writer == '${sessionScope.loginfo.id}'){
				   var inputtag = $('<input>'); /* 삭제하기 버튼 */
				   var attrlist = {'id':writer, 'class':'btn btn-outline-primary', 'type':'button', 'value':'삭제하기', 'pmkey':cnum};
				   inputtag.attr(attrlist);
				   inputtag.addClass('delete_btn');
			   }else{
				   var inputtag =  '';
			   }
			   
			   var content_p = $('<p>'); /* 작성한 댓글 내용 */
			   content_p.html(content) ;
			   
			   // 조립하기
			   ptag.append(spantag).append(spandate).append(inputtag) ;
			   litag.append(ptag).append(content_p);
			   
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
		   /* [삭제] 버튼 클릭 */
		   /* data 영역의 'pmkey'는 임의의 이름으로 내가 지정한 코멘트의 기본 키입니다. */
		   /* on() 메소드는 선택된 요소에 이벤트 핸들러 함수를 연결 시켜 줍니다. */
		   /* 이전 페이지로 복원시 no 파라미터가 반드시 필요합니다. */
		   $(document).on('click', '.delete_btn', function(){
			   if(confirm('선택하신 항목을 삭제하시겠습니까?')){
				   $.ajax({
					   url : '<%=notWithFormTag%>cmDelete',
					   data : 'cnum=' + $(this).attr('pmkey') + "&no=" + '${bean.num}',
					   type : 'get',
					   dataType : 'text',
					   success : function(result, status){ /* 댓글 삭제 성공시 */
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
		<h2>상품 목록</h2>
		<p>고객들이 구매할 상품 목록을 보여 주는 페이지</p>

		<table class="table table-borderless ">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td class="col-lg-5">
						<div class="card" style="width: 30rem;">
  							<img src="<%=contextPath%>/image/${bean.image01}" class="card-img-top active_image zoom" alt="애기신발">
						</div>
					</td>
					<td class="col-lg-1">
						<img src="<%=contextPath%>/image/${bean.image01}" class="card-img-top small_image" alt="${bean.name}">
						
						<c:if test="${not empty bean.image02}">
							<img src="<%=contextPath%>/image/${bean.image02}" class="card-img-top small_image" alt="${bean.name}">
						</c:if>
						
						<c:if test="${not empty bean.image03}">
							<img src="<%=contextPath%>/image/${bean.image03}" class="card-img-top small_image" alt="${bean.name}">
						</c:if>
					</td>
					<td class="col-lg-6">
						<div class="card leftside card_borderless" style="width: 18rem;">
							<h5 class="card-title">${bean.name}</h5>
							
							<p class="card-text">상품 번호 : ${bean.num}</p>
						
	    					<p class="card-text">
	    						단가 :<fmt:formatNumber value="${bean.price}" pattern="###,###"/>원  
	    					</p>
	    					<p class="card-text">${bean.comments}</p>
	    					
	    					<p class="card-text">합계 : <span id="totalprice">0</span>원</p>
	    					
	    					<ul class="pagination">
								<li class="page-item"><a class="page-link minus" href="#"> - </a></li>
								<li class="page-item"><a class="page-link" href="#">
									<input type="text" id="qty" value="0">
								</a></li>
								<li class="page-item"><a class="page-link plus" href="#"> + </a></li>
							</ul>
	    					
	    					
	    					<div class="btn-group">
								<button type="button" class="btn btn-primary cart">장바구니</button>
								<button type="button" class="btn btn-primary rightnow">바로 구매</button>								
							</div>
							
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							
					
							
							
						</div>						
					</td>					
				</tr>				
			</tbody>
		</table>
		<div id="backButton">
			<button type="button" class="btn btn-primary" onclick="history.back();">
				돌아 가기
			</button>
		</div>
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
                      <thead>
                      </thead>
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
                             <button type="submit" class="btn btn-info">저장하기</button> 
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
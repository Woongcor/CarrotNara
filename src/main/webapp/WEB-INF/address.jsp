<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

<script>
	/** 우편번호 찾기 */
	function execDaumPostcode() {
		daum.postcode.load(function() {
			new daum.Postcode({
				oncomplete : function(data) {
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

	<div class="form-group m-form__group row">
		<label class="col-md-2 offset-md-3 col-form-label">
			주&nbsp;&nbsp;소&nbsp;&nbsp;<span
			class="m--font-orange vertical-middle">*</span>
		</label>
		<div class="col-md-2">
			<input type="text" class="form-control m-input" name="postcode"
				id="postcode" placeholder="우편번호" readonly />
		</div>
		<div class="col-md-2 postcode-btn">
			<button type="button" class="btn btn-info m-btn--air"
				onclick="execDaumPostcode()">우편번호 찾기</button>
		</div>
		<div class="col-md-4 offset-md-5">
			<input type="text" class="form-control m-input m--margin-top-10"
				name="address" id="address" placeholder="도로명 주소" readonly />
		</div>
		<div class="col-md-4 offset-md-5">
			<input type="text" class="form-control m-input m--margin-top-10"
				name="detailAddress" placeholder="상세 주소" required />
		</div>
	</div>

</body>
</html>
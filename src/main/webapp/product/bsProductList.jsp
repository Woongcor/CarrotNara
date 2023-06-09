<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp"%>


<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

	
	<style type="text/css">
	/* table 셀의 수평 가운데 정렬*/
	.card{margin-left:auto;margin-right:auto;}
	</style>

</head>
<body>
	<div class="container mt-3">
		<h2>상품 목록</h2>
		<p>고객들이 구매할 상품 목록을 보여주는 페이지</p>

		<table class="table table-boarderless">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="card" style="width: 18rem;">
							<a href="http://www.naver.com">
								<img src="./../image/child2.jpg" class="card-img-top" alt="애기신발">
								<div class="card-body">
									<h5 class="card-title">상품01</h5>
									<p class="card-text">이 상품은 좋아요</p>
								</div>
							</a>
						</div>
					</td>
					<td>
						<div class="card" style="width: 18rem;">
							<a href="http://www.daum.net">
							<img src="./../image/child3.jpg" class="card-img-top" alt="애기신발">
							<div class="card-body">
								<h5 class="card-title">상품01</h5>
								<p class="card-text">이 상품은 좋아요</p>
							</div>
							</a>
						</div>
					</td>
					<td>
						<div class="card" style="width: 18rem;">
						<a href="http://www.naver.com">
							<img src="./../image/child4.jpg" class="card-img-top" alt="애기신발">
							<div class="card-body">
								<h5 class="card-title">상품01</h5>
								<p class="card-text">이 상품은 좋아요</p>
							</div>
						</a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="card" style="width: 18rem;">
						<a href="http://www.imbc.com">
							<img src="./../image/child5.jpg" class="card-img-top" alt="애기신발">
							<div class="card-body">
								<h5 class="card-title">상품01</h5>
								<p class="card-text">이 상품은 좋아요</p>
							</div>
						</a>
						</div>
					</td>
					<td>
						<div class="card" style="width: 18rem;">
							<a href="http://www.imbc.com">
							<img src="./../image/child6.jpg" class="card-img-top" alt="애기신발">
							<div class="card-body">
								<h5 class="card-title">상품01</h5>
								<p class="card-text">이 상품은 좋아요</p>
							</div>
							</a>
						</div>
					</td>
					<td>
						<div class="card" style="width: 18rem;">
							<a href="http://www.imbc.com">
							<img src="./../image/child7.jpg" class="card-img-top" alt="애기신발">
							<div class="card-body">
								<h5 class="card-title">상품01</h5>
								<p class="card-text">이 상품은 좋아요</p>
							</div>
							</a>
						</div>
					</td>
				</tr>
			</tbody>
		</table>

		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item active"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item disabled"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</div>
</body>
</html>

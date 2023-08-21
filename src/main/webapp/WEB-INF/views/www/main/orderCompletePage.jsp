<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link href="../../resources/css/orderComplete.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Document</title>
</head>
<body>
	<jsp:include page="../../include/fundingHeader.jsp" />

	<div class="bg">
		<div class="container">
			<div class="row">
				<div class="col"></div>
				<div class="col-cart">
					<div class="cart-ma">
						<div class="row">
							<div class="col-title">주문완료</div>
						</div>
						<div class="row">
							<div class="col-text1">상품 주문이 완료 되었습니다.</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="prsInf">받는사람 정보</div>
								<table class="recipient-table">									
									<tr>
										<td class="recipient-td1">받는사람</td>
										<td class="pname-td2">${recipient.name} / ${recipient.phone}</td>
									</tr>

									<tr>
										<td class="recipient-td1">받는주소</td>
										<td class="pcount-td2">(${recipient.address_post}) ${recipient.address_default} ${recipient.address_detail}</td>
									</tr>

									<tr>
										<td class="recipient-td1">배송요청사항</td>
										<td class="pcount-td2">${recipient.request_message}</td>
									</tr>
								</table>

							</div>
						</div>
						
						<div class ="row">
							<div class="col">
							<div class="last_btn">
							 <a href="./orderListPage" class="go-order btn btn-primary">주문 목록보기</a>
							 <a href="./storePage" class="go-store btn btn-secondary">쇼핑 홈 가기</a>
							</div>
							</div>
						</div>

					</div>
					<div class="col"></div>
				</div>
			</div>
		</div>
	</div>

	<script>
	
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	
<link href="../../resources/css/orderdetailPage.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/user_my.css" rel="stylesheet"
	type="text/css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../../include/fundingHeader.jsp" />
	
	<div id="topBg"></div>
	<div class="section zIndex">
		<div class="myPage">
			<div class="fakeSection">
				<ul id="myPageTab">
					<li class="click"><a class="click" href="">서포터</a><i
						class="bi bi-caret-down-fill click"></i></li>
					<li><a href="">창작자</a><i class="bi bi-caret-down-fill"></i></li>
				</ul>
			</div>

			<div id="myPageSection">
				<div id="profile">
					<ul id="first">
						<li id="profileIcon"><span></span></li>
						<li id="makerName">${sessionUser.name }님</li>
						<li id="logoutUser">로그아웃</li>
					</ul>
					<dl>
						<dt>나의 쇼핑 내역</dt>
						<!--중분류명 넣으면 됩니다-->
						<dd class="click">
							<a class="click" href="./orderListPage">주문목록</a><i
								class="bi bi-caret-right-fill click"></i>
						</dd>
						<!--여기에 메뉴 넣으세요!-->
						<dd class="click">
							<a href="./readQnaPage">문의내역</a><i
								class="bi bi-caret-right-fill"></i>
						</dd>
						<!--여기에 메뉴 넣으세요!-->
						<dd class="click">
							<a href="./cartPage">장바구니</a><i
								class="bi bi-caret-right-fill"></i>
						</dd>
						<!--여기에 메뉴 넣으세요!-->
					</dl>

					<dl>
						<dt>나의 펀딩 내역</dt>
						<dd>
							<a href="">후원한 프로젝트</a><i class="bi bi-caret-right-fill"></i>
						</dd>
						<dd>
							<a href="">프로젝트 후기</a><i class="bi bi-caret-right-fill"></i>
						</dd>
					</dl>
				</div>
				<div id="contents">
					<div id="leftBorder">
						<div id="subTitle">
							<h5>주문상세</h5>
						</div>
						<div id="list">
							<!--리스트 영역-->

							<div class="row">
						<div class="col p-0">
							<div class="middle-contents">
								<div class="product-List">		

									<div class="row">
										<div class="col">
											<fmt:formatDate value="${list[0].created_at}"
												pattern="yyyy-MM-dd" />
											<span>주문번호 ${list[0].product_order_id }</span>
											<c:forEach items="${list}" var="item">
												<div class="middlebox">
													<table>
														<colgroup>
															<col width="600">
															<col width="">
														</colgroup>
														<tr>
															<td class="pa">${item.order_status_name }
																<div class="img-title">
																	<div class="img">
																		<img src="../../resources/img/parkhyunmin/thumbnail/${item.thumbnail_name}"
																			style="width: 64px; height: 64px;">
																	</div>
																	<div class="npc">
																		<span>${item.product_name }</span>
																		<div class="price-count">
																			<span><fmt:formatNumber
																					value="${item.price_sale }" pattern="#,###원" /></span> <span>${item.count }개</span>
																		</div>
																	</div>
																</div>
															</td>
															<td class="td-btn">
																<div class="btn-box">
																	<button class="btn-review" type="button" onclick="location.href='./productReviewPage?id=${item.product_order_item_id }' ">리뷰 작성하기</button>
																</div>
															</td>
														</tr>
													</table>
												</div>
											</c:forEach>
										</div>
									</div>

									<div class="row">
										<div class="col">
											<div class="rcpInf">
											<span class="sp-text">받는사람 정보</span>
											<table class="re-table">
												<tr>
													<td class="recipient-td1">받는사람</td>
													<td class="pname-td2 td2">${list[0].recipient_name}</td>
													<td></td>
												</tr>
												
												<tr>
													<td class="recipient-td1">연락처</td>
													<td class="pname-td2 td2">${list[0].recipient_phone}</td>
													<td></td>
												</tr>
			
												<tr>
													<td class="recipient-td1">받는주소</td>
													<td class="pcount-td2 td2">(${list[0].address_post}) ${list[0].address_default} ${list[0].address_detail}</td>
													<td></td>
												</tr>
			
												<tr>
													<td class="recipient-message">배송요청사항</td>
													<td class="recipient-message">${list[0].request_message}</td>
													<td></td>
												</tr>
											</table>
											</div>
										</div>
									</div>

								</div>

							</div>
						</div>
					</div>
						</div>

					</div>
				</div>

			</div>
		</div>

	</div>

	<script src="../../resources/js/user_my.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>

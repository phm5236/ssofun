<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link href="../../resources/css/user_my.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/orderListPage.css" rel="stylesheet"
	type="text/css">

</head>
<body>


	<jsp:include page="../../include/fundingHeader.jsp" />
	<div id="topBg"></div>
	<div class="section" id="height">
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
						<dd><a href="../user/userMyFundingOrderListPage">후원한 프로젝트</a><i class="bi bi-caret-right-fill"></i></dd>
                        <dd><a href="../user/userMyFundingLikeListPage">찜한 프로젝트</a><i class="bi bi-caret-right-fill"></i></dd>
					</dl>
				</div>
				<div id="contents">
					<div id="leftBorder">
						<div id="subTitle">
							<h5>주문목록</h5>
						</div>
						<div id="list">
							<!--리스트 영역-->

							<div class="row">
								<div class="col p-0">
									<div class="middle-contents">
										<div class="row">
											<div class="col">
												<c:forEach items="${list}" var="item" varStatus="status">
													<c:if
														test="${status.index == 0 || item.product_order_id != list[status.index - 1].product_order_id}">
														<div class="bigbox">
															<div class="order-title">
																<div class="create-date">
																	<fmt:formatDate value="${item.created_at}"
																		pattern="yyyy-MM-dd" />
																	주문
																</div>

																<div class="order-detail">
																	<a class="order-detail"
																		href="./orderdetailPage?id=${item.product_order_id }">주문
																		상세보기</a>
																</div>
															</div>
															<c:forEach items="${list}" var="innerItem">
																<c:if
																	test="${item.product_order_id eq innerItem.product_order_id}">
																	<div class="middlebox">
																		<table>
																			<colgroup>
																				<col width="600">
																				<col width="">
																			</colgroup>
																			<tr>
																				<td class="pa">${innerItem.order_status_name }
																					<div class="img-title">
																						<div class="img">
																							<img src="../../resources/img/parkhyunmin/thumbnail/${innerItem.thumbnail_name}"
																								style="width: 64px; height: 64px;">																								
																						</div>
																						<div class="npc">
																							<a 	href="./productPage?id=${innerItem.product_id }"><span>${innerItem.product_name }</span></a>
																							<div class="price-count">
																								<span><fmt:formatNumber
																										value="${innerItem.price_sale }"
																										pattern="#,###원" /></span> <span>${innerItem.count }개</span>
																							</div>
																						</div>
																					</div>
																				</td>
																				<td class="td-btn">
																					<div class="btn-box">
																						<c:set var="hasReview" value="false" />
																						<c:forEach items="${review}" var="reviewItem">
																							<c:if
																								test="${reviewItem.product_order_item_id eq innerItem.product_order_item_id}">
																								<c:set var="hasReview" value="true" />
																							</c:if>
																						</c:forEach>
																						<c:choose>
																							<c:when test="${hasReview}">
																								<!-- Show "리뷰 수정하기" button if a review exists -->
																								<button class="btn-review" type="button"
																									onclick="location.href='./productReviewPage?id=${innerItem.product_order_item_id }' ">리뷰
																									수정하기</button>
																							</c:when>
																							<c:otherwise>
																								<!-- Show "리뷰 작성하기" button if no review exists -->
																								<button class="btn-review" type="button"
																									onclick="location.href='./productReviewPage?id=${innerItem.product_order_item_id }' ">리뷰
																									작성하기</button>
																							</c:otherwise>
																						</c:choose>
																						<button class="btn-qna" type="button"
																									onclick="location.href='./productQnaPage?id=${innerItem.product_order_item_id }' ">
																									문의하기</button>

																					</div>

																				</td>
																			</tr>
																		</table>
																	</div>
																</c:if>
															</c:forEach>
														</div>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>

									<!-- 페이지네이션 부분 수정 -->
									<div class="pagination jOhOoP">
										<c:choose>
											<c:when test="${currentPage > 1}">
												<a href="?page=${currentPage - 1}" class="previous-button">이전</a>
											</c:when>
											<c:otherwise>
												<span class="previous-button">이전</span>
											</c:otherwise>
										</c:choose>


										<c:choose>
											<c:when test="${currentPage < pageCount}">
												<a href="?page=${currentPage + 1}" class="next-button">다음</a>
											</c:when>
											<c:otherwise>
												<span class="next-button">다음</span>
											</c:otherwise>
										</c:choose>
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
</body>
</html>
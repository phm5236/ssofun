<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의내역</title>
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
<link href="../../resources/css/readQnaPage.css" rel="stylesheet"
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
							<a href="./orderListPage">주문목록</a><i
								class="bi bi-caret-right-fill"></i>
						</dd>
						<!--여기에 메뉴 넣으세요!-->
						<dd class="click">
							<a class="click" href="./readQnaPage">문의내역</a><i
								class="bi bi-caret-right-fill click"></i>
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
							<a href="../user/userMyFundingOrderListPage">후원한 프로젝트</a><i
								class="bi bi-caret-right-fill"></i>
						</dd>
						<dd>
							<a href="../user/userMyFundingLikeListPage">찜한 프로젝트</a><i
								class="bi bi-caret-right-fill"></i>
						</dd>
					</dl>
				</div>
				<div id="contents">
					<div id="leftBorder">
						<div id="subTitle">
							<h5>문의내역</h5>
						</div>
						<div id="list">
							<!--리스트 영역-->

							<div class="row">
								<div class="col p-0">
									<div class="middle-contents">
										<div class="row">
											<div class="col p-0">
												<div class="Qna-list">
													<table class="Qna-table">
														<thead>
															<tr class="qnahead">
																<th class="qna-th1">답변상태</th>
																<th class="qna-th2">제목</th>
																<th class="qna-th1">작성일</th>
															</tr>
														</thead>

														<tobody> <c:forEach items="${qnalist}" var="list">
															<tr class="qa-list">
																<c:if test="${empty list.answer_contents}">
																	<td class="qa-th1">미답변</td>
																	<td class="qa-th2">${list.title}</td>
																	<td class="qa-th1"><fmt:formatDate
																			value="${list.created_at}" pattern="yyyy-MM-dd" /></td>
																</c:if>
																<c:if test="${!empty list.answer_contents}">
																	<td class="qa-th1">답변완료</td>
																	<td class="qa-th2">
																		 <a class="qna-title" data-toggle="collapse" data-target="#collapse_${list.qna_id}" aria-expanded="false" aria-controls="collapse_${list.qna_id}">
													                        ${list.title}
													                    </a>
																	</td>
																	<td class="qa-th1"><fmt:formatDate
																			value="${list.created_at}" pattern="yyyy-MM-dd" /></td>
																</c:if>
															</tr>
															<tr class="collapse" id="collapse_${list.qna_id}">

															
																	<td class="qa-th1">답변내용</td>
																	<td class="qa-th2">${list.answer_contents}</td>
																	<td class="qa-th1"><fmt:formatDate
																			value="${list.created_at}" pattern="yyyy-MM-dd" /></td>
																

															</tr>
														</c:forEach> 
														</tobody>
													</table>
												</div>
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
	<!-- 필요한 부트스트랩 자바스크립트 라이브러리 (CDN) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="../../resources/js/user_my.js"></script>
</body>
</html>
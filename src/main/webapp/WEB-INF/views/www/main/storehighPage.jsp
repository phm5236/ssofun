<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page import="java.util.List"%>
<%
// Jackson ObjectMapper를 사용하여 Java 객체를 JSON 형태로 변환합니다.
ObjectMapper objectMapper = new ObjectMapper();
String jsonPctList = objectMapper.writeValueAsString(request.getAttribute("list"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>

<link href="../../resources/css/main.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/productOrder.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/cartPage.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="../../include/fundingHeader.jsp" />

	<div class="category-head">
		<div class="search-header-content">
			<div class="category-box">
				<div class="category-btn">
					<i class="bi bi-list"></i> <a href="javascript:;">카테고리</a>
					<div class="categories">
						<ul class="shopping-menu-list">
							<c:forEach items="${pctlist}" var="category">
								<c:if test="${category.this_parent_id eq 0}">
									<li class="li-list"
										value="${category.product_category_type_id}">
										${category.name} <!-- Subcategories -->
										<div class="subcategories">
											<ul>
												<c:forEach items="${pctlist}" var="subcategory">
													<c:if
														test="${subcategory.this_parent_id eq category.product_category_type_id}">
														<li>${subcategory.name}<!-- Subsubcategories -->
															<div class="subsubcategories">
																<ul>
																	<c:forEach items="${pctlist}" var="subsubcategory">
																		<c:if
																			test="${subsubcategory.this_parent_id eq subcategory.product_category_type_id}">
																			<li><a
																				href="./categories?pct=${subsubcategory.product_category_type_id }">${subsubcategory.name}</a></li>
																		</c:if>
																	</c:forEach>
																</ul>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="menu-box">
				<ul class="menu-list">
					<li class="li-best">베스트👑</li>
					<li class="li-best">MD추천👍</li>
					<li class="li-best">여름 특가⛱️</li>
					<li class="li-todaty">2시전 당일출고🚚</li>
					<li class="search-size">
						  <div class="container-fluid ">
						    <form class="d-flex" role="search">
						      <input class="form-control me-2" type="search" placeholder="상품을 검색해보세요!!" aria-label="Search">
						      <button class="btn btn-outline-success bnt-size" type="submit">검색</button>
						    </form>
						  </div>
					</li>
				</ul>
			</div>
		</div>
	</div>



	

	<div class="container ">
		<div class="row">
			<div class="col">
				<img class="banner-img" src="../../resources/img/mega-butty.jpg">
			</div>
			<div class="col">


				<div class="row">
					<div class="col-ca">
						<div class="ca-name">최신상품</div>
						<div class="araay-box">
							<ul class="option-box">
								<li class="option-li"><a href="./storePage">최신등록순</a></li>
								<li class="option-li"><a href="./storelowPage">낮은 가격순</a></li>
								<li class="option-li"><a href="./storehighPage">높은 가격순</a></li>
								<li></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- 여기서 반복문 -->
				<div class="row">
					<c:forEach items="${list }" var="product">
						<div class="col-a Image ">
							<a class="baby-product-link"
								href="./productPage?id=${product.product_id }">
								<div class="row">
									<div class="col text-center">
										<img  src="../../resources/img/parkhyunmin/thumbnail/${product.thumbnail_name}"
											style="width: 280px; height: 280px;" class="img-rounded">
									</div>
								</div>
								<div class="row r1">
									<div class="row">
										<div class="col-name">
											<p style="font-size: 14px">${product.category_type_name }</p>
										</div>
									</div>
									<div class="row r2">
										<div class="col-ex">${product.product_name }</div>
									</div>
									<div class="row">
										<div class="col">
											<div class="row r3">
												<div class="col-mwon1">
													<span class="discount">${Math.floor((product.price - product.price_sale) / product.price * 100).intValue()}%</span>
													<b><fmt:formatNumber value="${product.price_sale }"
															pattern="#,###원" /></b>

													<del class="price">
														<fmt:formatNumber value="${product.price }"
															pattern="#,###원" />
													</del>
												</div>

											</div>
										</div>
									</div>
								</div>

							</a>
							<div class="col-heart-review">
								<i class="bi bi-suit-heart"></i>
								<c:forEach items="${Likecount }" var="count">
									<c:if test="${product.product_id eq count.product_id }">
											 ${count.count }
										</c:if>
								</c:forEach>
								
								<i class="bi bi-chat-right"></i>
								<c:forEach items="${Recount }" var="Recount">
									<c:if test="${product.product_id eq Recount.product_id }">
											${Recount.count }
										</c:if>
								</c:forEach>

							</div>
							<!-- <hr> -->

						</div>
					</c:forEach>
				</div>


				<div class="row">
					<div class="col">
						<!-- 페이지네이션 부분 추가 -->
						<div class="pagination jOhOoP">
							<c:choose>
								<c:when test="${currentPage > 1}">
									<a href="?page=${currentPage - 1}" class="previous-button">이전</a>
								</c:when>
								<c:otherwise>
									<span class="previous-button">이전</span>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="1" end="${pageCount}" var="pageNum">
								<c:url value="storePage" var="pageUrl">
									<c:param name="page" value="${pageNum}" />
								</c:url>
								<c:choose>
									<c:when test="${pageNum eq currentPage}">
										<span class="current-page">${pageNum}</span>
									</c:when>
									<c:otherwise>
										<a href="${pageUrl}" class="page-link">${pageNum}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
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
			<div class="col"></div>
		</div>
	</div>


	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp" />

	<script>
		//카테고리
		$(document).ready(function() {
			// Show/hide the categories on hover for both the category button and menu items
			$(".category-box").hover(function() {
				$(".categories").css("display", "block");
			}, function() {
				$(".categories").css("display", "none");
			});

			$(".shopping-menu-list li").hover(function() {
				$(this).find(".subcategories").css("display", "block");
			}, function() {
				$(this).find(".subcategories").css("display", "none");
			});

			$(".subcategories li").hover(function() {
				$(this).find(".subsubcategories").css("display", "block");
			}, function() {
				$(this).find(".subsubcategories").css("display", "none");
			});
		});
		
		// 링크 이동후 글자 굵게
		document.addEventListener("DOMContentLoaded", function() {
        // Retrieve the clicked link's ID from local storage (if any)
        const clickedLinkId = localStorage.getItem("clickedLinkId");
        if (clickedLinkId) {
            // Add the "clicked" class to the previously clicked link
            const link = document.getElementById(clickedLinkId);
            link.classList.add("clicked");

            // Navigate to the target page after a short delay (to allow the class to take effect)
            setTimeout(() => {
                window.location.href = link.getAttribute("href");
            }, 300); // Adjust the delay (in milliseconds) as needed
        }

        // Add a click event listener to each link
        const links = document.querySelectorAll(".option-li a");
        links.forEach(link => {
            link.addEventListener("click", function(event) {
                // Prevent the default link behavior to handle the click manually
                event.preventDefault();

                // Remove the "clicked" class from all links
                links.forEach(link => link.classList.remove("clicked"));

                // Add the "clicked" class to the clicked link
                this.classList.add("clicked");

                // Save the clicked link's ID to local storage
                localStorage.setItem("clickedLinkId", this.id);

                // Navigate to the target page after a short delay (to allow the class to take effect)
                setTimeout(() => {
                    window.location.href = this.getAttribute("href");
                }, 300); // Adjust the delay (in milliseconds) as needed
            });
        });
    });
		var subCategories =
	<%=jsonPctList%>
		;
		console.log(subCategories)
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>
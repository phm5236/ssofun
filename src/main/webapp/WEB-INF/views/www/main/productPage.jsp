<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<!-- Google Fonts를 통해 Material Icons 라이브러리를 불러옵니다. -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link href="../../resources/css/productPage.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script>
const ProductId = new URLSearchParams(location.search).get("id");
//좋아요 관련
function ajaxTemplete(){
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..
			}
		}
		
		//get
		xhr.open("get", "요청 url?파라메터=값");
		xhr.send();
		
		//post
		xhr.open("post", "요청 url");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
		xhr.send("파라메터=값");
	}

let mySessionId = null;

  function getSessionId() {
	    const xhr = new XMLHttpRequest();
	    
	    xhr.onreadystatechange = function() {
	      if (xhr.readyState == 4 && xhr.status == 200) {
	        const response = JSON.parse(xhr.responseText);
	        // 응답으로부터 받은 세션 ID를 설정합니다.
	        if (response.result == "success") {
	          mySessionId = response.id;
	        }
	      }
	    }

	    // 서버에 세션 ID를 요청하는 Ajax 요청을 보냅니다.
	    xhr.open("GET", "/store/getCustomerId", false); // 동기식 호출을 위해 false 설정
	    xhr.send();
	  }
function refreshTotalLikeCount(){
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			const totalLikeCountBox = document.getElementById("totalLikeCount");
			totalLikeCountBox.innerText = response.count;
		}
	}
	
	//get
	xhr.open("get", "./getTotalLikeCount?ProductId=" + ProductId);
	xhr.send();		
}

function toggleLike(){
	if(mySessionId == null){
		if(confirm("로그인을 하셔야 이용하실 수 있습니다. 로그인 하시겠습니까?")){
			location.href = "../user/userLoginPage";
		}
		return;
	}
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 작업..
			refreshTotalLikeCount();
			refreshMyHeart();
		}
	}
	
	//get
	xhr.open("get", "./toggleLike?product_id=" + ProductId);
	xhr.send();
	
}

function refreshMyHeart(){
	
	if(mySessionId == null) return;
	
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			// js 렌더링... 작업..
			const heartBox = document.getElementById("heartBox");
			
			if(response.isLiked){
				heartBox.classList.remove("bi-suit-heart");
				heartBox.classList.add("bi-suit-heart-fill");
			}else{
				heartBox.classList.remove("bi-suit-heart-fill");
				heartBox.classList.add("bi-suit-heart");
			}
		}
	}
	
	//get
	xhr.open("get", "./isLiked?product_id=" + ProductId);
	xhr.send();
	
}
window.onload = function() {
    getSessionId();
    // 좋아요와 관련된 작업을 수행합니다.
    refreshTotalLikeCount();
    refreshMyHeart();
  };
</script>



<%-- 전체 리뷰 개수와 총 별점 합계를 초기화합니다. --%>
<c:set var="totalReviewCount" value="0" />
<c:set var="totalRatingSum" value="0" />

<c:forEach items="${relist}" var="review">
	<%-- 리뷰 개수와 총 별점 합계를 업데이트합니다. --%>
	<c:set var="totalReviewCount" value="${totalReviewCount + 1}" />
	<c:set var="totalRatingSum" value="${totalRatingSum + review.rate}" />
</c:forEach>

<%-- 평균 별점을 계산합니다. 만약 전체 리뷰 개수가 0인 경우, 평균 별점은 0으로 처리합니다. --%>
<c:set var="averageRating"
	value="${totalReviewCount > 0 ?  totalRatingSum /  totalReviewCount : 0}" />

<c:if test="${not empty relist}">
	<c:set var="averageRatingFormatted"
		value="${String.format('%.1f', averageRating)}" />
</c:if>


<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../include/fundingHeader.jsp" />

	<div class="con">
		<div class="container " id="section">
			<div class="row">
				<div class="col">
					<div class="prod-image">
						<div class="prod-image__items">
							<c:forEach items="${detail }" var="list">
								<div class="row">
									<div class="col">
										
										<img src="../../resources/img/parkhyunmin/thumbnail/${list.thumbnail_name}"
											alt="thumb image" class="thumbnail-img"
											style="width: 65px; height: 65px;">
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="zoomed-image-container">
							<img src="" alt="zoomed image" class="zoomed-img">
						</div>
					</div>
				</div>

				<div class="col">
					<c:if test="${not empty detail}">
						<div class="row">
							<div class="col">${detail[0].biz_name}</div>
						</div>

						<div class="row">
							<div class="col">${detail[0].product_name}</div>
						</div>

						<div class="row">
							<div class="col-won2">
								<del>
									<fmt:formatNumber value="${detail[0].price}" pattern="#,###원" />
								</del>
							</div>
						</div>
						<div class="row">
							<div class="col-dicount">${Math.floor((detail[0].price - detail[0].price_sale) / detail[0].price * 100).intValue()}%</div>
							<div class="col-won1">
								<fmt:formatNumber value="${detail[0].price_sale}"
									pattern="#,###원" />
							</div>
							<div class="col-heart">
								<i id="heartBox" onclick="toggleLike()"
									class="text-danger bi bi-suit-heart"></i>
									<span id="totalLikeCount"></span>
							</div>
						</div>

						<div class="row">
							<div class="col-ship">
								<div class="row">
									<div class="col-charge">배송비</div>
									<div class="col-free">무료</div>
								</div>
								<div class="row">
									<div class="col-time">배송예정시간</div>
									<div class="col-day">3일 내 배송</div>
								</div>
							</div>
						</div>

						<div class="row-box">
							<div class="col-Shipping">
								<div class="col-text">
									<img src="../../resources/img/delivery.png"> 배송 과정 중 도로교통
									상황에 따라 부득이하게 지연 배송이 발생될 수 있습니다.
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-pyment">결제금액</div>
							<div class="col"></div>
							<div class="col-last">
								<div class="row">
									<div class="col-pay">
										<span id="amount-display"></span>
									</div>
									<div class="col-but">
										<div class="button">
											<div class="button_quantity">
												<span class="custom-element">
													<button class="prod-quantity__plus"
														onclick="changeQuantity('+')">+</button> <input
													type="text" id="prod-quantity" value="1"
													class="prod-quantity__input" min="1" maxlength="6"
													autocomplete="off" oninput="changeQuantity(this.value)">
													<button class="prod-quantity__minus"
														onclick="changeQuantity('-')">-</button>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</c:if>
					<div class="row">
						<div class="col">
							<button class="prod-cart-btn" id="cart_btn">
								<i class="bi bi-cart3"></i> 장바구니
							</button>
						</div>

						<div class="col">
							<form action="./productProcess" method="post">
								<input type="hidden" name="id" id="productId" value="" /> <input
									type="hidden" name="amount" id="productAmount" value="" /> <input
									type="hidden" name="count" id="productCount" value="" /> <input
									type="hidden" name="user_id" id="userId"
									value="${user.user_id }" readonly />
								<button class="prod-buy-btn" onclick="setProductValues()">바로구매</button>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col"></div>
			</div>


			<!-- HTML 코드 -->
			<div class="box">
				<div class="col-tab">
					<ul class="nav">
						<li><button id="scroll1Btn" class="scroll_move"
								onclick="scrollToSection('scroll1')">상품정보</button></li>
						<li><button id="scroll2Btn" class="scroll_move"
								onclick="scrollToSection('scroll2')">상세설명</button></li>
						<li><button id="scroll3Btn" class="scroll_move"
								onclick="scrollToSection('scroll3')">리뷰</button></li>
						<li><button id="scroll4Btn" class="scroll_move"
								onclick="scrollToSection('scroll4')">배송,교환,반품 안내</button></li>
					</ul>
				</div>
			</div>




			<div class="listbox">
				<div class="scroll1" id="scroll1">
					<p class="table-title">필수 표기정보</p>
					<table class="prdc_detail_table">
						<tbody>

							<tr>
								<th scope="row">상품상태</th>
								<td>상품 상세설명 참조</td>
								<th scope="row">상품번호</th>
								<td>상품 상세설명 참조</td>
							</tr>
							<tr>
								<th scope="row">배송방법</th>
								<td>택배</td>
								<th scope="row">배송가능지역</th>
								<td>전국</td>
							</tr>
							<tr>
								<th scope="row">영수증발행</th>
								<td>상품 상세설명 참조</td>

							</tr>
							<tr>
								<th scope="row">제조일자/유효기간</th>
								<td colspan="3">상품 상세설명 참조</td>
							</tr>
							<tr>
								<th scope="row">A/S안내</th>
								<td colspan="3">상품 상세설명 참조</td>
							</tr>
							<tr>
								<th scope="row">상품무게</th>
								<td colspan="3">상품 상세설명 참조</td>
							</tr>
							<tr>
								<th scope="row">브랜드</th>
								<td colspan="3">상품 상세설명 참조</td>
							</tr>

						</tbody>

					</table>
				</div>

				<div class="scroll2" id="scroll2">
					<div class="detail-img">
					<c:forEach items="${deimglist }" var="deimglist">
							<img src="../../resources/img/parkhyunmin/detailImage/${deimglist.name}"
								style="width: 870px;">
					</c:forEach>
					</div>
				</div>
				<button id="showMoreBtn" onclick="showAllImages()">상품 정보 더보기</button>

				<div class="scroll3" id="scroll3">
					<h3>상품리뷰</h3>
					<div class="product_review_rate">
						<div class="preview1">
							<div class="product_review_rate1">
								<strong class="guide">구매 만족도</strong>
							</div>

							<div class="average_rating">
								<p class="average_Rate">${averageRatingFormatted}</p>
								<div class="star_rating">
									<script>
						                // JavaScript로 평균 별점을 받아옴 (여기에서는 3.7을 직접 지정함)
						                const averageRating = ${averageRatingFormatted};
						
						                // 전체 별과 반 별의 개수를 계산
						                const fullStars = Math.floor(averageRating);
						                const hasHalfStar = averageRating - fullStars >= 0.5;
						                const emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);
						
						                // Font Awesome 아이콘을 사용하여 별점을 출력
						                let starsHtml = '';
						                for (let i = 0; i < fullStars; i++) {
						                    starsHtml += '<i class="star_icon material-icons">star</i>';
						                }
						                if (hasHalfStar) {
						                    starsHtml += '<i class="star_icon material-icons">star_half</i>';
						                }
						                for (let i = 0; i < emptyStars; i++) {
						                    starsHtml += '<i class="star_icon material-icons">star_border</i>';
						                }
						
						                // 별점을 표시할 요소에 HTML 추가
						                document.write(starsHtml);
						            </script>
								</div>
							</div>
							<div class="review_count">${totalReviewCount}건</div>
						</div>

						<!-- 상품 리뷰 별점 개수 표시 -->
						<div class="preview2">
							<c:set var="starCounts" value="${fn:length(relist)}" />
							<c:forEach var="star" begin="1" end="5">
								<c:set var="starCount" value="0" />
								<c:forEach items="${relist}" var="review">
									<c:if test="${review.rate == star}">
										<c:set var="starCount" value="${starCount + 1}" />
									</c:if>
								</c:forEach>
								<div class="product_rate">
									<span>${star}점</span>
									<div class="graph">
										<span class="graph-num"
											style="background-color: #FFD700; width: ${starCount * 10}%;">
											<!--${starCount}-->
										</span>
									</div>
									<span class="star_num">${starCount}</span>
								</div>
							</c:forEach>
						</div>

					</div>

					<div class="product_review_title">
						<div class="review-head">
							<h3>전체리뷰</h3>
						</div>
						<div class="product_review_list">

							<c:forEach items="${relist }" var="review">
								<div class="review_list_element">
									<div class="list-elment-box">
										<div class="product_reviewer"></div>

										<div class="name-star-box">
											<div class="review_name">${review.uname }</div>
											<div class="rate">

												<c:choose>
													<c:when test="${review.rate == 1}">
														<div class="star-rating">
															<span class="star">★</span><span class="star-empty">★★★★</span>
															<span class="start-num"> <fmt:formatDate
																	value="${review.created_at}" pattern="yyyy. MM. dd" /></span>
														</div>
													</c:when>
													<c:when test="${review.rate == 2}">
														<div class="star-rating">
															<span class="star">★★</span><span class="star-empty">★★★</span>
															<span class="start-num"> <fmt:formatDate
																	value="${review.created_at}" pattern="yyyy. MM. dd" /></span>
														</div>
													</c:when>
													<c:when test="${review.rate == 3}">
														<div class="star-rating">
															<span class="star">★★★</span><span class="star-empty">★★</span>
															<span class="start-num"> <fmt:formatDate
																	value="${review.created_at}" pattern="yyyy. MM. dd" /></span>
														</div>
													</c:when>
													<c:when test="${review.rate == 4}">
														<div class="star-rating">
															<span class="star">★★★★</span><span class="star-empty">★</span>
															<span class="start-num"> <fmt:formatDate
																	value="${review.created_at}" pattern="yyyy. MM. dd" /></span>
														</div>
													</c:when>
													<c:when test="${review.rate == 5}">
														<div class="star-rating">
															<span class="star">★★★★★</span><span class="star-empty"></span>
															<span class="start-num"><fmt:formatDate
																	value="${review.created_at}" /></span>
														</div>
													</c:when>
													<c:otherwise>
								                    (별점 없음)
								             </c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="col-product-name">${detail[0].product_name}</div>
									</div>
									<div class="img-list">
										<c:forEach items="${reimgList }" var="reimg">
											<c:if
												test="${review.product_review_id eq reimg.product_review_id }">
												<div class="p-img">
													<img src="../../resources/img/parkhyunmin/thumbnail/${reimg.url}"
														style="width: 65px; height: 65px;">
												</div>
											</c:if>
										</c:forEach>
									</div>
									<div class="list-elment-box2">
										<div class="review_contents">${review.contents }</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>


				<div class="scroll4" id="scroll4">
					<div class="delivery-title">배송 정보</div>
					<table class="prdc_delivery_table">
						<tbody>

							<tr>
								<th scope="row">배송방법</th>
								<td style="width: 330px">택배</td>
								<th rowspan="2">배송비</th>
								<td rowspan="2">무료배송<br>- 배송 상품 중 19,800원 이상 구매 시 무료배송<br>
									-도서산간 지역 추가비용 없음
								</td>
							</tr>

							<tr>
								<th scope="row">묶음배송 여부</th>
								<td>가능</td>
							</tr>

							<tr>
								<th>배송기간</th>
								<td colspan="3">
									<ul>
										<li class="prod-delivery-period-contents etc-pdd-info"><span>ㆍSsofun
												도심 지역 : 주문 및 결제 완료 후, 1-2일 이내 도착</span></li>
										<li class="prod-delivery-period-contents">ㆍSsofun 시골 지역 :
											주문 및 결제 완료 후, 2-3일 이내 도착
											<p class="prod-delivery-period__notice">- 도서 산간 지역 등은 하루가
												더 소요될 수 있습니다. 곧 고객님께도 쿠팡친구가 찾아갈 수 있도록 노력하겠습니다</p>
										</li>
										<li class="prod-delivery-period-contents">ㆍ천재지변, 물량 수급 변동
											등 예외적인 사유 발생 시, 다소 지연될 수 있는 점 양해 부탁드립니다.</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="delivery-title">교환/반품 안내</div>
				<ul class="prod-delivery-return">
					<li>ㆍ교환/반품에 관한 일반적인 사항은 판매자가 제시사항보다 관계법령이 우선합니다. <br>다만,
						판매자의 제시사항이 관계법령보다 소비자에게 유리한 경우에는 판매자 제시사항이 적용됩니다.
					</li>
				</ul>

				<table class="prdc_delivery_table">
					<colgroup>
						<col width="160px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>교환/반품 비용</th>
							<td>1) [총 주문금액] - [반품 상품금액] = 19,800원 미만인 경우 반품비 5,000원<br>2)
								[총 주문금액] - [반품 상품금액] = 19,800원 이상인 경우 반품비 2,500원
							</td>
						</tr>
						<tr>
							<th>교환/반품 신청 기준일</th>
							<td><span>ㆍ단순변심에 의한 배송 상품의 교환/반품은 제품 수령 후 30일 이내까지,
									교환/반품 제한사항에 해당하지 않는 경우에만 가능 (교환/반품 비용 고객부담)</span>
								<p>
									ㆍ상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알
									수 있었던 날부터<br> <span>30일 이내에 청약철회 가능</span>
								</p></td>
						</tr>
					</tbody>
				</table>

			</div>





		</div>
	</div>


	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp" />

	<script>
	$(document).ready(function() {
	  // 첫 번째 썸네일 이미지의 경로를 가져옵니다.
	  var firstImageUrl = $('.thumbnail-img:first').attr('src');
	  // 확대 이미지 요소의 소스로 설정합니다.
	  $('.zoomed-img').attr('src', firstImageUrl);
	  // 확대 이미지 컨테이너를 보여줍니다.
	  $('.zoomed-image-container').show();
	  $('.thumbnail-img').hover(
		  function() {
		    var imageUrl = $(this).attr('src');
		    $('.zoomed-img').attr('src', imageUrl);
		    $('.zoomed-image-container').show();
		   }
		 );
	});
	

	

	// 결제금액 표시
	function changeQuantity(value) {
	    var inputElement = document.getElementById("prod-quantity");
	    var quantity = parseInt(inputElement.value);
	    
	    if (isNaN(quantity)) {
	      quantity = 1;
	    } else {
	      if (value === '+') {
	        quantity += 1;
	      } else if (value === '-' && quantity > 1) {
	        quantity -= 1;
	      }
	    }
	    
	    inputElement.value = quantity;
	    updateAmount(quantity);
	  }
	  
	  function updateAmount(quantity) {
	    var priceElement = document.querySelector("col-pay");
	    var amountDisplay = document.getElementById("amount-display");
	    var price = parseInt("${detail[0].price_sale}");
	    var totalAmount = price * quantity;
	    
	    amountDisplay.innerText = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(totalAmount).replace(/₩|KRW/g, '') + '원';
	  }
	  
	  // 초기화
	  updateAmount(1);


	// URL에서 id 값을 추출하여 productId input 요소의 value에 설정
	    var url = new URL(window.location.href);
	    var id = url.searchParams.get("id");
	    document.getElementById("productId").value = id;
	
	 // 결제금액, 수량 
	    function setProductValues() {
	        // 결제금액과 수량 값을 가져와서 설정
	        var amountString = document.getElementById("amount-display").innerText;
	        var count = document.getElementById("prod-quantity").value;

	        // amountString을 정수형으로 변환
	        var amount = parseInt(amountString.replace(/[^0-9]/g, "")); // 숫자 이외의 문자 제거 후 정수형으로 변환

	        // 각 hidden input 요소에 값을 설정
	        document.getElementById("productAmount").value = amount;
	        document.getElementById("productCount").value = count;
	    }
	 
	  // 장바구니
		$(document).ready(function(){
			$("#cart_btn").on('click', function() {
				cart();
			})
		});

		function cart(){
			const userId = $("#userId").val();
			const productId = $("#productId").val();
			const count = document.getElementById("prod-quantity").value;
		    $.ajax({
		        url: "cartProcess",
		        method: "POST",
		        data: {
		        	user_id : userId,
		        	product_id : productId,
		        	count : count
		        },
		        success: function(res){
		        	if(res==1){
		        		location.href = 'cartPage'
		        	}
		        	else{
		        		alert("실패");
		        	}
		        },
		        error: function(){
		        	 if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?") == true){ 
		        		   //true는 확인버튼을 눌렀을 때 코드 작성
		        		    location.href = '../user/userLoginPage'
		        		   console.log("완료되었습니다.");
		        		 }else{
		        		   // false는 취소버튼을 눌렀을 때, 취소됨
		        		   console.log("취소되었습니다");
		        		 }
		           
		        }
		  	});
		}
		

		
		
		function scrollToSection(sectionId) {
			  const targetSection = document.getElementById(sectionId);
			  const targetOffsetTop = targetSection.offsetTop - 70; // 70px 위로 이동
			  window.scrollTo({
			    top: targetOffsetTop,
			    behavior: "smooth"
			  });

			  const buttonIds = ['scroll1Btn', 'scroll2Btn', 'scroll3Btn', 'scroll4Btn'];
		        for (const buttonId of buttonIds) {
		            const button = document.getElementById(buttonId);
		            if (buttonId === sectionId + 'Btn') {
		                button.classList.add('active');
		            } else {
		                button.classList.remove('active');
		            }
		        }
			}

		// 상세 이미지 줄이기 버튼 추가
		function showAllImages() {
			  const gallery = document.getElementById('scroll2');
			  const button = document.getElementById('showMoreBtn');

			  // 이미지 갤러리의 높이를 이미지 전체를 보여주는 높이로 조정
			  gallery.style.maxHeight = gallery.scrollHeight + 'px';

			  // 더 이상 "더보기" 버튼을 표시하지 않음
			  button.style.display = 'none';
			}

</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>
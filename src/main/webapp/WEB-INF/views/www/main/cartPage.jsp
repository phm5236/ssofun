<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
window.onload = function() {
    toggleAllChecks(); // 페이지 로드 후 자동으로 체크 표시
};
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link href="../../resources/css/cartPage.css" rel="stylesheet"
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
					<div class="col-title">장바구니</div>
				</div>
				<div class="row">
					<div class="col-contents">					
						<div class="row">
							<div class="col-customer">
								<table class="customer-table">
									<tr>
										<td class="all-event-check"><input type="checkbox"
											id="allCheck" onclick="toggleAllChecks()"></td>
										<td class="td-image"></td>
										<td class="td-productInfo">상품정보</td>
										<td class="td-price">판매가</td>
										<td class="td-quantity">수량</td>
										<td class="td-shipping">배송비</td>
										<td class="td-total">합계</td>
										<td class="td-delete"></td>
									</tr>
									<c:forEach items="${list}" var="item" varStatus="status">
										<c:set var="subtotal" value="${item.price * item.total_count}"></c:set>
										<tr>
											<td class="event-check"><input type="checkbox"
												class="itemCheck" onclick="toggleItemCheck()"></td>
											<td class="td-image"><img
												src="../../resources/img/parkhyunmin/thumbnail/${item.thumbnail_name}"
												style="width: 75px; height: 75px;"></td>											
											<td class="td-productInfo">
												<div class="product-name">${item.product_name}</div>
												<div class="cart-price">
													<div class="option-select">
														<div class="button_quantity">
															<span class="custom-element">
																<button class="prod-quantity__plus"
																	onclick="changeQuantity('+', 'prod-quantity-${status.index}', ${status.index})">+</button>
																<input type="text" id="prod-quantity-${status.index}"
																value="${item.total_count}" class="prod-quantity__input"
																min="1" maxlength="6" autocomplete="off"
																oninput="updateQuantity(${status.index}, this.value); updateAmount(${status.index})">
																<button class="prod-quantity__minus"
																	onclick="changeQuantity('-', 'prod-quantity-${status.index}', ${status.index})">-</button>
															</span>
														</div>
													</div>	
												</div>
											</td>

											<td class="td-price"><span class="price-${status.index}">
													<fmt:formatNumber value="${item.price}" type="number"
														pattern="#,###원" />
											</span></td>

											<td class="td-quantity">
											<span id="quantity-${status.index}">${item.total_count}</span>
											</td>
												
											<td class="td-shipping">무료</td>
											
											<td class="td-total">
												 <span id="display-price-${status.index}"></span> 																						
											</td>
													
											<td class="td-delete"><a
												href="./deleteCartProcess?user_id=${item.user_id}&product_id=${item.product_id}">
													<i class="bi bi-x-square" style="font-size: 1rem;"></i>
											</a></td>
										</tr>
									</c:forEach>

									<tr>
										<td colspan="8">
											<div class="cart-total-price">
												<div class="row">
													<div class="center">
													
													<div class="col-price">										
													<span class="s-price">총 상품가격</span>
													<em id="total-price" class="e-price"></em>
													</div>
													
													<div class="col-plus"><i class="bi bi-plus-square"></i></div>
													
													<div class="col-shipping">
													<span class="s-shipping">배송비</span>
													<em class="e-shipping">0원</em>
													</div>
													
													<div class="col-minus"><i class="bi bi-dash-square"></i></div>
													
													<div class="col-sale">
													<span class="s-sale">할인금액</span>
													<em class="e-sale">0원</em>
													</div>
													
													<div class="col-equal"><img src="../../resources/img/img_equals.gif"></div>
													<div class="col-total">
													<span class="s-total">주문금액</span>
													<em id="final-order-price" class="e-total">0원</em>
													</div>
													
													</div>
												</div>											
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-buy-btn">
						<form action="./cartOrderPage" method="post">													
							    <!-- 필요한 다른 상품 정보들도 함께 전송 -->
							    <input type="hidden" name="amount" id="productAmount"  value="" />
							    <button class="prod-buy-btn" onclick="setProductValues()">구매하기</button>
						 </form>
					</div>
				</div>
				
			</div>
			<div class="col"></div>
			</div>
		</div>
	</div>
	</div>
	<script>
	// 올체크표시
	function toggleAllChecks() {
	    console.log('toggleAllChecks() 함수가 실행되었습니다.');
	    var allCheck = document.getElementById('allCheck');
	    var itemChecks = document.getElementsByClassName('itemCheck');

	    for (var i = 0; i < itemChecks.length; i++) {
	        itemChecks[i].checked = allCheck.checked;
	    }
	}
	
	// 각각 체크 표시
	function toggleItemCheck() {
	    var allCheck = document.getElementById('allCheck');
	    var itemChecks = document.getElementsByClassName('itemCheck');

	    var isAnyUnchecked = false;

	    for (var i = 0; i < itemChecks.length; i++) {
	        if (!itemChecks[i].checked) {
	            isAnyUnchecked = true;
	            break;
	        }
	    }

	    allCheck.checked = !isAnyUnchecked;
	}
		
        // 버튼으로 수량 변경
        function changeQuantity(operation, inputId, index) {
            var input = document.getElementById(inputId);
            var value = parseInt(input.value);

            
            if (isNaN(value)) {
            	value = 1;
      	    } else {
      	      if (operation === '+') {
      	    	value += 1;
      	      } else if (operation === '-' && value > 1) {
      	    	value -= 1;
      	      }
      	    }

            if (value < 1) {
                alert("1개 이상부터 구매하실 수 있습니다.");
                value = 1;
            }

            input.value = value;
            updateQuantity(index);
            updateAmount(index);
        }
		
        // 수량 표시
        function updateQuantity(index) {
            var quantitySpan = document.getElementById('quantity-' + index);
            var inputId = 'prod-quantity-' + index;
            var quantityInput = document.getElementById(inputId);
            quantitySpan.innerText = quantityInput.value;
        }
		
        // 합계 표시
        function updateAmount(index) {
            var amountDisplay = document.getElementById('display-price-' + index);
            var priceElement = document.querySelector('.price-' + index);
            var price = parseInt(priceElement.textContent.replace(/[^0-9]/g, ''));
            var quantityElement = document.getElementById('quantity-' + index);
            var quantity = parseInt(quantityElement.textContent);
            
            var totalAmount = price * quantity;
            
            amountDisplay.innerText = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(totalAmount).replace(/₩|KRW/g, '') + '원';
              
            
            calculateTotalAmount(); // 총 가격도 업데이트
        }

        // 초기화
        var displayPriceElements = document.querySelectorAll('[id^="display-price-"]');
		for (var i = 0; i < displayPriceElements.length; i++) {
		    updateAmount(i);
		}
		
		// 총 상품 가격 표시
		function calculateTotalAmount() {
		  var totalPrice = 0;

		  var itemChecks = document.getElementsByClassName('itemCheck');
		  var displayPriceElements = document.querySelectorAll('[id^="display-price-"]');
		  
		  for (var i = 0; i < itemChecks.length; i++) {
		    if (itemChecks[i].checked) {
		      var priceText = displayPriceElements[i].textContent;
		      var price = parseInt(priceText.replace(/[^0-9]/g, ''));
		      totalPrice += price;
		    }
		  }

		  var totalPriceElement = document.getElementById('total-price');
		  totalPriceElement.textContent = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(totalPrice).replace(/₩|KRW/g, '') + '원';

		  // 주문금액
		  var finalOrderPriceElement = document.getElementById('final-order-price');
		  finalOrderPriceElement.textContent = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(totalPrice).replace(/₩|KRW/g, '') + '원';
		}
		
		// 결제금액, 수량 
	    function setProductValues() {
	        // 결제금액과 수량 값을 가져와서 설정
	        var amountString = document.getElementById("final-order-price").innerText;

	        // amountString을 정수형으로 변환
	        var amount = parseInt(amountString.replace(/[^0-9]/g, "")); // 숫자 이외의 문자 제거 후 정수형으로 변환

	        // 각 hidden input 요소에 값을 설정
	        document.getElementById("productAmount").value = amount;
	    }

		// 전체 체크박스 선택/해제 시 합계 업데이트
		function updateTotalAmountOnToggleAllChecks() {
		  var allCheck = document.getElementById('allCheck');
		  var itemChecks = document.getElementsByClassName('itemCheck');

		  for (var i = 0; i < itemChecks.length; i++) {
		    itemChecks[i].checked = allCheck.checked;
		  }

		  calculateTotalAmount();
		}

		// 체크박스 클릭 시 합계 업데이트
		function updateTotalAmount() {
		  calculateTotalAmount();
		}

		// 체크박스 이벤트 리스너 등록
		var allCheck = document.getElementById('allCheck');
		allCheck.addEventListener('click', updateTotalAmountOnToggleAllChecks);

		var itemChecks = document.getElementsByClassName('itemCheck');
		for (var i = 0; i < itemChecks.length; i++) {
		  itemChecks[i].addEventListener('click', updateTotalAmount);
		}

		// 페이지 로드 시 합계 초기화
		window.onload = function() {
		  calculateTotalAmount();
		};


			
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>

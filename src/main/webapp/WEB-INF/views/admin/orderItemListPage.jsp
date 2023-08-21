<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="">
<style>

.logo_box{
    margin-left: 20px;
    font-size: 20px;
    font-weight: 750;
}

.home{
    margin-left: 20px;
    font-size: 20px;
    font-weight: 600;
}

.login_box{
    font-size: 14px;
    font-weight: 600;
}

.title_box{
    margin-left: 10px;
    font-size: 20px;
    font-weight: 600;
    text-align: left;
}

.td_No{
	font-weight: 600;
}

/* 주문상태에 따른 글자 색상변화 */
.order-status {
  /* 기본 스타일 */
  color: black; /* 기본 글자색 (예시로 검정색) */
}

/* 주문 상태 ID에 따라 다른 클래스 정의 */
.status-pending {
  color: orange; /* 주문 상태가 "pending" 일 때 글자색 (예시로 주황색) */
}

.status-confirmed {
  color: blue; /* 주문 상태가 "confirmed" 일 때 글자색 (예시로 파란색) */
}

.status-shipped {
  color: green; /* 주문 상태가 "shipped" 일 때 글자색 (예시로 초록색) */
}

.status-delivered {
  color: purple; /* 주문 상태가 "delivered" 일 때 글자색 (예시로 보라색) */
}

.current-page{
    position: relative;
    display: block;
    padding: 0.5rem 0.75rem;
    margin-left: -1px;
    line-height: 1.25;
    color: #8b5cf6;
    background-color: #dee2e6;
    border: 1px solid #dee2e6;
}

.pagination{
    justify-content: center;
}

.orderStatusClass{
	font-weight: 700;
}

/* 테이블 간격 */
.table_th{
	font-size: 16px;
}

.c0{
	width: 70px;
	font-size: 16px;
}

.c1{
	width: 110px;
	font-size: 16px;
}

.c2{
	width: 140px;
	font-size: 16px;
}

.c3{
	width: 140px;
	font-size: 16px;
}

.c4{
	width: 140px;
	font-size: 16px;
}

.c5{
	font-size: 16px;
}

.c6{
	width: 140px;
	font-size: 16px;
}

.c7{
	width: 140px;
	font-size: 16px;
}

.c8{
	width: 140px;
	font-size: 16px;
}
</style>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Dashboard v1 | Gull Admin Template</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet" />
    <link href="../resources/dist-assets/css/themes/lite-purple.css" rel="stylesheet" />
    <link href="../resources/dist-assets/css/plugins/perfect-scrollbar.css" rel="stylesheet" />
</head>

<body class="text-left">
    <div class="app-admin-wrap layout-sidebar-large">
        <div class="main-header">
            <div class="row">
	            <div class="d-flex col p-0">
	                <div class="col-1 logo_box"><a href="./adminMainPage" id="logo" class="fs-3 fw-bold">SSOFUN</a></div>
	            </div>
	        </div>
            <div class="menu-toggle">
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div class="d-flex align-items-center">
                <!-- Mega menu -->
                <!-- / Mega menu -->
                <div class="search-bar">
                    <input type="text" placeholder="Search">
                    <i class="search-icon text-muted i-Magnifi-Glass1"></i>
                </div>
	            <div class="d-flex col p-0">
	                <div class="col-1 home"><a href="./adminMainPage" id="logo" class="fs-3 fw-bold">Home</a></div>
	        	</div>
            </div>
            <div style="margin: auto"></div>
            <div class="header-part-right">
                <!-- Full screen toggle -->
							<c:if test="${empty shopAdmin }">
								<ul class="nav justify-content-end">
									<li class="nav-item login_box"><a class="nav-link" href="/systemadmin/login/adminLoginPage">로그인</a></li>
									<li class="nav-item login_box"><a class="nav-link" href="#">문의하기</a></li>
								</ul>
							</c:if>
							<c:if test="${!empty shopAdmin }">
								<ul class="nav justify-content-end">
									<li class="nav-item login_box"><a class="nav-link" href="#">안녕하세요.&nbsp;${shopAdmin.admin_nickname }님</a></li>
									<li class="nav-item login_box"><a class="nav-link" href="./logoutProcess">로그아웃</a></li>
									<li class="nav-item login_box"><a class="nav-link" href="#">문의하기</a></li>
								</ul>
							</c:if>
                <i class="i-Full-Screen header-icon d-none d-sm-inline-block" data-fullscreen></i>
                <!-- Grid menu Dropdown -->
                <div class="dropdown">
                    <i class="i-Safe-Box text-muted header-icon" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <div class="menu-icon-grid">
                            <a href="#"><i class="i-Shop-4"></i> Home</a>
                            <a href="#"><i class="i-Library"></i> UI Kits</a>
                            <a href="#"><i class="i-Drop"></i> Apps</a>
                            <a href="#"><i class="i-File-Clipboard-File--Text"></i> Forms</a>
                            <a href="#"><i class="i-Checked-User"></i> Sessions</a>
                            <a href="#"><i class="i-Ambulance"></i> Support</a>
                        </div>
                    </div>
                </div>
                <!-- Notificaiton -->
                <div class="dropdown">
                    <div class="badge-top-container" role="button" id="dropdownNotification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="badge badge-primary">3</span>
                        <i class="i-Bell text-muted header-icon"></i>
                    </div>
                    <!-- Notification dropdown -->
                    <div class="dropdown-menu dropdown-menu-right notification-dropdown rtl-ps-none" aria-labelledby="dropdownNotification" data-perfect-scrollbar data-suppress-scroll-x="true">
                        <div class="dropdown-item d-flex">
                            <div class="notification-icon">
                                <i class="i-Speach-Bubble-6 text-primary mr-1"></i>
                            </div>
                            <div class="notification-details flex-grow-1">
                                <p class="m-0 d-flex align-items-center">
                                    <span>New message</span>
                                    <span class="badge badge-pill badge-primary ml-1 mr-1">new</span>
                                    <span class="flex-grow-1"></span>
                                    <span class="text-small text-muted ml-auto">10 sec ago</span>
                                </p>
                                <p class="text-small text-muted m-0">James: Hey! are you busy?</p>
                            </div>
                        </div>
                        <div class="dropdown-item d-flex">
                            <div class="notification-icon">
                                <i class="i-Receipt-3 text-success mr-1"></i>
                            </div>
                            <div class="notification-details flex-grow-1">
                                <p class="m-0 d-flex align-items-center">
                                    <span>New order received</span>
                                    <span class="badge badge-pill badge-success ml-1 mr-1">new</span>
                                    <span class="flex-grow-1"></span>
                                    <span class="text-small text-muted ml-auto">2 hours ago</span>
                                </p>
                                <p class="text-small text-muted m-0">1 Headphone, 3 iPhone x</p>
                            </div>
                        </div>
                        <div class="dropdown-item d-flex">
                            <div class="notification-icon">
                                <i class="i-Empty-Box text-danger mr-1"></i>
                            </div>
                            <div class="notification-details flex-grow-1">
                                <p class="m-0 d-flex align-items-center">
                                    <span>Product out of stock</span>
                                    <span class="badge badge-pill badge-danger ml-1 mr-1">3</span>
                                    <span class="flex-grow-1"></span>
                                    <span class="text-small text-muted ml-auto">10 hours ago</span>
                                </p>
                                <p class="text-small text-muted m-0">Headphone E67, R98, XL90, Q77</p>
                            </div>
                        </div>
                        <div class="dropdown-item d-flex">
                            <div class="notification-icon">
                                <i class="i-Data-Power text-success mr-1"></i>
                            </div>
                            <div class="notification-details flex-grow-1">
                                <p class="m-0 d-flex align-items-center">
                                    <span>Server Up!</span>
                                    <span class="badge badge-pill badge-success ml-1 mr-1">3</span>
                                    <span class="flex-grow-1"></span>
                                    <span class="text-small text-muted ml-auto">14 hours ago</span>
                                </p>
                                <p class="text-small text-muted m-0">Server rebooted successfully</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Notificaiton End -->
                <!-- User avatar dropdown -->
                <div class="dropdown">
                    <div class="user col align-self-end">
                        <img src="../../resources/img/admin1.jpg" id="userDropdown" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <div class="dropdown-header">
                                <i class="i-Lock-User mr-1"></i> Timothy Carlson
                            </div>
                            <a class="dropdown-item">Account settings</a>
                            <a class="dropdown-item">Billing history</a>
                            <a class="dropdown-item" href="signin.html">Sign out</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="side-content-wrap">
            <div class="sidebar-left open rtl-ps-none" data-perfect-scrollbar="" data-suppress-scroll-x="true">
                <ul class="navigation-left">
                    <li class="nav-item" data-item="dashboard"><a class="nav-item-hold" href="#"><i class="nav-icon i-Bar-Chart"></i><span class="nav-text">Dashboard</span></a>
                        <div class="triangle"></div>
                    </li>
                    <li class="nav-item" data-item="uikits"><a class="nav-item-hold" href="#"><i class="nav-icon i-Library"></i><span class="nav-text">Product</span></a>
                        <div class="triangle"></div>
                    </li>
                    <li class="nav-item" data-item="extrakits"><a class="nav-item-hold" href="#"><i class="nav-icon i-Suitcase"></i><span class="nav-text">Order</span></a>
                        <div class="triangle"></div>
                    </li>
                    <li class="nav-item" data-item="charts"><a class="nav-item-hold" href="#"><i class="nav-icon i-File-Clipboard-File--Text"></i><span class="nav-text">Review</span></a>
                        <div class="triangle"></div>
                    </li>
                    <li class="nav-item" data-item="sessions"><a class="nav-item-hold" href="#"><i class="nav-icon i-Administrator"></i><span class="nav-text">Q & A</span></a>
                        <div class="triangle"></div>
                    </li>
                </ul>
            </div>
            <div class="sidebar-left-secondary rtl-ps-none" data-perfect-scrollbar="" data-suppress-scroll-x="true">
                <!-- Product -->
                <ul class="childNav" data-parent="dashboard">
                    <li class="nav-item"><a href="./adminMainPage"><i class="nav-icon i-Clock-3"></i><span class="item-name">메인페이지</span></a></li>
                </ul>
                <ul class="childNav" data-parent="uikits">
                   <li class="nav-item"><a href="./productInsertPage"><i class="nav-icon i-Split-Horizontal-2-Window"></i><span class="item-name">상품등록페이지</span></a></li>
                   <li class="nav-item"><a href="./productListPage"><i class="nav-icon i-Split-Horizontal-2-Window"></i><span class="item-name">상품리스트페이지</span></a></li>
                   <li class="nav-item"><a href="./productCategoryTypeInsertPage"><i class="nav-icon i-Split-Horizontal-2-Window"></i><span class="item-name">카테고리타입등록페이지</span></a></li>
                </ul>
                <!-- Order -->
                <ul class="childNav" data-parent="extrakits">
                    <li class="nav-item"><a href="./orderItemListPage"><i class="nav-icon i-File-Clipboard-Text--Image"></i><span class="item-name">주문리스트페이지</span></a></li>
          		</ul>
          		<!-- Review-->
                <ul class="childNav" data-parent="charts">
                    <li class="nav-item"><a href="./productReviewListPage"><i class="nav-icon i-File-Clipboard-Text--Image"></i><span class="item-name">상품(리뷰,평점)리스트페이지</span></a></li>
                </ul>
                <ul class="childNav" data-parent="sessions">
                    <li class="nav-item"><a href="./qnaContentListPage"><i class="nav-icon i-Checked-User"></i><span class="item-name">문의리스트페이지</span></a></li>          
                </ul>
            <div class="sidebar-overlay"></div>
        	</div>
        </div>
        <!-- =============== Left side End ================-->
        <div class="main-content-wrap sidenav-open d-flex flex-column">
            <!-- ============ Body content start ============= -->
                <div class="row mb-4">
                    <div class="col mb-3">
                        <div class="card text-left">
                            <div class="card-body">
                                <div class="d-flex row p-0">
					                <div class="col title_box pt-3"><a href="./adminMainPage">주문리스트</a></div>
					            </div>
                                <ul class="nav justify-content-end">
									<li class="nav-item">
									    <a class="nav-link table_th" href="./orderItemCategoryListPage?product_order_status_id=3">결제완료</a>
									</li>
									<li class="nav-item">
										<a class="nav-link table_th" href="./orderItemCategoryListPage?product_order_status_id=4">판매자확인완료</a>
									</li>
									<li class="nav-item">
										<a class="nav-link table_th" href="./orderItemCategoryListPage?product_order_status_id=5">배송중</a>
									</li>
									<li class="nav-item">
										<a class="nav-link table_th" href="./orderItemCategoryListPage?product_order_status_id=6">배송완료</a>
									</li>
									<li class="nav-item">
										<a class="nav-link table_th" href="./orderItemCategoryListPage?product_order_status_id=7">구매확정</a>
									</li>
								</ul>
								<div class="table-responsive">
								    <table class="table table-striped">
								        <thead>
								            <tr>
								                <th class="table_th" scope="col">#</th>
								                <th class="table_th" scope="col">NO</th>
								                <th class="table_th" scope="col">주문일</th>
								                <th class="table_th" scope="col">고객명</th>
								                <th class="table_th" scope="col">진행상태</th>
								                <th class="table_th" scope="col">상품명</th>
								                <th class="table_th" scope="col">수량</th>
								                <th class="table_th" scope="col">가격</th>
								                <th class="table_th" scope="col">할인가</th>
								            </tr>
								        </thead>
								        <tbody id="order_item_list">
								     	</tbody>
								     </table>									 
								  </div>
								</div> 
								<!-- 페이지네이션 부분 추가 -->
								<div class="pagination">
								    <c:choose>
								        <c:when test="${currentPage > 1}">
								            <a href="?page=1" class="page-link">처음</a>
								            <a href="?page=${currentPage - 1}" class="page-link">이전</a>
								        </c:when>
								        <c:otherwise>
								            <span class="page-link">처음</span>
								            <span class="page-link">이전</span>
								        </c:otherwise>
								    </c:choose>
								    <c:forEach begin="1" end="${pageCount}" var="pageNum">
								        <c:url value="orderItemListPage" var="pageUrl">
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
								            <a href="?page=${currentPage + 1}" class="page-link">다음</a>
								            <a href="?page=${pageCount}" class="page-link">마지막</a>
								        </c:when>
								        <c:otherwise>
								            <span class="page-link">다음</span>
								            <span class="page-link">마지막</span>
								        </c:otherwise>
								    </c:choose>
								</div>
           
                <!-- end of row-->
                <!-- end of main-content -->
            </div><!-- Footer Start -->
            <div class="flex-grow-1"></div>
        </div>
    </div><!-- ============ Search UI Start ============= -->
    <div class="search-ui">
        <div class="search-header">
            <img src="../resources/dist-assets/images/logo.png" alt="" class="logo">
            <button class="search-close btn btn-icon bg-transparent float-right mt-2">
                <i class="i-Close-Window text-22 text-muted"></i>
            </button>
        </div>
        <input type="text" placeholder="Type here" class="search-input" autofocus>
        <div class="search-title">
            <span class="text-muted">Search results</span>
        </div>
        <div class="search-results list-horizontal">
            <div class="list-item col-md-12 p-0">
                <div class="card o-hidden flex-row mb-4 d-flex">
                    <div class="list-thumb d-flex">
                        <!-- TUMBNAIL -->
                        <img src="../resources/dist-assets/images/products/headphone-1.jpg" alt="">
                    </div>
                    <div class="flex-grow-1 pl-2 d-flex">
                        <div class="card-body align-self-center d-flex flex-column justify-content-between align-items-lg-center flex-lg-row">
                            <!-- OTHER DATA -->
                            <a href="" class="w-40 w-sm-100">
                                <div class="item-title">Headphone 1</div>
                            </a>
                            <p class="m-0 text-muted text-small w-15 w-sm-100">Gadget</p>
                            <p class="m-0 text-muted text-small w-15 w-sm-100">$300
                                <del class="text-secondary">$400</del>
                            </p>
                            <p class="m-0 text-muted text-small w-15 w-sm-100 d-none d-lg-block item-badges">
                                <span class="badge badge-danger">Sale</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        <!-- PAGINATION CONTROL -->
        <div class="col-md-12 mt-5 text-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination d-inline-flex">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- ============ Search UI End ============= -->
    <script src="../resources/dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
    <script src="../resources/dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
    <script src="../resources/dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="../resources/dist-assets/js/scripts/script.min.js"></script>
    <script src="../resources/dist-assets/js/scripts/sidebar.large.script.min.js"></script>
</body>
<script>
//숫자 형식화 함수
function formatNumber(number) {
    return new Intl.NumberFormat().format(number);
}

// 오더리스트
$(document).ready(function() {
    $.ajax({
        type: "POST",
        url: "orderItemListProcess",
        success: function(orderItemList) {
            let res = "";
            for (let i = 0; i < orderItemList.length; i++) {
            	  let orderStatusClass = "";
            	  if (orderItemList[i].order_status_name === "판매자확인완료" ||
            	      orderItemList[i].order_status_name === "배송중" ||
            	      orderItemList[i].order_status_name === "배송완료" ||
            	      orderItemList[i].order_status_name === "구매확정") {
            	    orderStatusClass = "text-success"; // 상태가 3, 4, 5, 6, 7인 경우 텍스트 색상을 빨간색으로 설정
            	  } else {
            	    orderStatusClass = "text-danger"; // 기타 상태인 경우 텍스트 색상을 초록색으로 설정
            	  }             	
                res += "<tr>" +
                    "<th class='c0' scope='row'>" +
                    "<label class='checkbox checkbox-outline-info'>" +
                    "<input type='checkbox' checked=''><span class='checkmark'></span>" +
                    "</label>" +
                    "</th>" +
                    "<td class='td_No c1'>No. " + orderItemList[i].product_order_item_id + "</td>" +
                    "<td class='td_No c2'>" + orderItemList[i].created_at + "</td>" +
                    "<td class='td_No c3'>" + orderItemList[i].recipient_name + " 님</td>" +
                    "<td class='td_No c4 " + orderStatusClass + "'>" + orderItemList[i].order_status_name + "</td>" +
                    "<td class='td_No c5'><a href='orderItemDetailPage?product_order_item_id=" + orderItemList[i].product_order_item_id + "'>" + orderItemList[i].product_name + "</a></td>" +
                    "<td class='td_No c6'>" + orderItemList[i].count + " 개</td>" +
                    "<td class='td_No c7'>" + formatNumber(orderItemList[i].price) + " 원</td>" +
                    "<td class='td_No c8'>" + formatNumber(orderItemList[i].price_sale) + " 원</td>" +
                    "</tr>";
            }
            $('#order_item_list').append(res);
        },
        error: function() {
            // 에러 처리
            $('#order_item_list').append("<tr><td colspan='9'>주문 상품을 불러오는데 오류가 발생했습니다.</td></tr>");
        }
    });
});


/*     function submitForm() {
        var form = document.getElementById("myForm");
        form.submit();
    }

    document.addEventListener("DOMContentLoaded", function() {
        var selectElement = document.querySelector("select[name='product_order_status_id']");
        selectElement.addEventListener("change", function() {
            var submitButton = document.getElementById("submitButton");
            if (selectElement.value !== "") {
                submitButton.style.display = "block"; // 버튼을 보이게 설정
            } else {
                submitButton.style.display = "none"; // 버튼을 숨김으로 설정
            }
        });
    }); */
    
/*     function getOrderStatusColor(orderStatusId) {
    	  switch (orderStatusId) {
    	    case 3:
    	      return "status-pending"; // 주문 상태 ID가 3일 때 CSS 클래스 이름 반환
    	    case 4:
    	      return "status-confirmed"; // 주문 상태 ID가 4일 때 CSS 클래스 이름 반환
    	    case 5:
    	      return "status-shipped"; // 주문 상태 ID가 5일 때 CSS 클래스 이름 반환
    	    case 6:
    	      return "status-delivered"; // 주문 상태 ID가 6일 때 CSS 클래스 이름 반환
    	    default:
    	      return ""; // 기본 클래스 이름 반환 (기본 글자색이 적용되도록)
    	  }
    	} */

</script>
</html>
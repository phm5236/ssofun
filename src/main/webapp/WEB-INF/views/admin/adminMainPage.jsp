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
    font-size: 14px;
    font-weight: 600;
    text-align: left;
    margin-bottom: 10px;
}

.List_td{
	font-size: 12px;
	font-weight: 700;
	height: 35px;
}

.List_th{	
	font-size: 10px;
	font-weight: 750;
	height: 35px;
}

/* 폰트 크기와 줄 간격을 조절하여 한 줄로 나오도록 합니다. */
.List_productname {
    font-size: 12px;
    font-weight: 700;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    overflow: hidden;
    text-overflow: ellipsis;
    /* 부모 요소의 높이를 설정해주세요. 예시로 16px로 설정하겠습니다. */
    height: 35px;
}



.td_No{
	font-weight: 700;
}

.list_bottom{
	text-align: right;
	font-weight: 600;
	font-size: 12px;
	margin-bottom: 10px;
}

/* .list_body_size{
	width: 425.06px;
	height: 458.41px;
} */

.col_1{
	width: 70px;
}

.col_3{
	width: 55px;
}

.col_4{
	width: 70px;
}

/* 대시보드 */
#content_style{
	margin: 0 20px 0 65px;
	max-width: 126px;
	font-weight: 650;
}

.dash_title{
	font-size: 16px;
	font-weight: 800;
}

.card-title{
	font-size: 16px;
	font-weight: 800;
}

/* 상품리스트 UI */
.product_list0{
	width: 75px;
}

.product_list1{

}

.product_list2{
	width: 110px;
}

.product_list3{
	width: 100px;
}

/* 주문리스트 UI */
.review_list0{
	width: 80px;
}

.review_list1{
	width: 110px;
}

.review_list2{
	width: 120px;
}

.review_list3{
	width: 100px;
}

/* 리뷰,평점리스트 UI */
.order_list0{
	width: 75px;
}

.order_list1{

}

.order_list2{
	width: 75px;
}

.order_list3{
	width: 70px;
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
            <div class="main-content">
                <div class="breadcrumb">
                    <h1 class="mr-2">ssofun</h1>
                    <ul>
                        <li><a href="">ShopAdmin</a></li>
                    </ul>
                </div>
                <div class="separator-breadcrumb border-top"></div>
                <div class="row">
                    <!-- ICON BG-->
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4">
                            <div class="card-body text-center"><i class="i-Money-2"></i>
								<div id="content_style" class="content">
								    <p class="text-muted mt-2 mb-1 dash_title">총 매출</p>
								    <p id="totalProductPrice" class="text-primary text-16 line-height-1 mb-2">로그인을 하세요...</p>
								</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4">
                            <div class="card-body text-center"><i class="i-Checkout-Basket"></i>
                                <div id="content_style" class="content">
                                    <p class="text-muted mt-2 mb-1 dash_title">총 상품수</p>
                                    <p id="totalProductCount" class="text-primary text-16 line-height-1 mb-2">로그인을 하세요...</p>
                                </div>
                            </div>
                        </div>
                    </div>                    
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4">
                            <div class="card-body text-center"><i class="i-Data-Upload"></i>
                                <div id="content_style" class="content">
                                    <p class="text-muted mt-2 mb-0 dash_title">총 리뷰수</p>
                                    <p id="totalProductReviewCount" class="text-primary text-16 line-height-1 mb-2">로그인을 하세요...</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4">
                            <div class="card-body text-center"><i class="i-Financial"></i>
                                <div id="content_style" class="content">
                                    <p class="text-muted mt-2 mb-1 dash_title">총 평점</p>
                                    <p id="productReviewAvgScore" class="text-primary text-16 line-height-1 mb-2">로그인을 하세요...</p>
                                </div>
                            </div>
                        </div>
                    </div>                    
                </div>
               	<div>
                <div class="row">
                    <div class="col-lg-8 col-md-12">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="card-title">월별 매출</div>
                                <div id="echartBar22" style="height: 300px;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="card-title">연령별 구매자수</div>
                                <div id="echartPie1" style="height: 300px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 리스트 시작 -->
                <!-- 상품리스트 -->
                <div class="row">
              		<div class="col-4 mb-3 list_box">
                        <div class="card text-left">
                            <div class="card-body list_body_size">
                                <div class="d-flex row p-0">
					                <div class="col title_box"><a href="./adminMainPage">상품 리스트</a></div>
					            </div>
								<div class="table-responsive">
								    <table class="table table-striped">
								        <thead>
								            <tr>
								                <th class="List_th" scope="col">상품번호</th>
								                <th class="List_th" scope="col">상품명</th>
								                <th id="product_list_price" class="List_th" scope="col">가격</th>
								                <th class="List_th" scope="col">등록일</th>
								            </tr>
								        </thead>
								        <tbody id="dashboard_product_list">
								     	</tbody>
								     </table>
	                                <div class="d-flex row">
						                <div class="col list_bottom"><a href="./productListPage">더보기</a></div>
						            </div>								 
								  </div>
								</div>
                			</div>
            			</div>
            		<!-- 주문리스트 -->
              		<div class="col-4 mb-3 list_box">
                        <div class="card text-left">
                            <div class="card-body list_body_size">
                                <div class="d-flex row p-0">
					                <div class="col title_box"><a href="./adminMainPage">주문 리스트</a></div>
					            </div>
								<div class="table-responsive">
								    <table class="table table-striped">
								        <thead>
								            <tr>
								                <th class="List_th" scope="col">주문번호</th>
								                <th class="List_th" scope="col">주문일</th>
								                <th class="List_th" scope="col">고객명</th>
								                <th class="List_th" scope="col">상품명</th>
								            </tr>
								        </thead>
								        <tbody id="dashboard_product_orderlist">
								     	</tbody>
								     </table>
	                                <div class="d-flex row">
						                <div class="col list_bottom"><a href="./orderItemListPage">더보기</a></div>
						            </div>								     									 
								  </div>
								</div>
                			</div>
            			</div>
            		<!-- 리뷰,평점리스트 -->
              		<div class="col-4 mb-3 list_box">
                        <div class="card text-left">
                            <div class="card-body list_body_size">
                                <div class="d-flex row p-0">
					                <div class="col title_box"><a href="./adminMainPage">상품(리뷰,평점) 리스트</a></div>
					            </div>
								<div class="table-responsive">
								    <table class="table table-striped">
								        <thead>
								            <tr>
								                <th class="List_th col_1" scope="col">상품번호</th>
								                <th class="List_th col_2" scope="col">상품명</th>
								                <th class="List_th col_3" scope="col">리뷰수</th>
								                <th class="List_th col_4" scope="col">상품평점</th>
								            </tr>
								        </thead>
								        <tbody id="dashboard_product_reviewList">
								     	</tbody>
								     </table>
	                                <div class="d-flex row">
						                <div class="col list_bottom"><a class="a_test" href="./productReviewListPage">더보기</a></div>
						            </div>								     									 
								  </div>
								</div>
                			</div>
            			</div>            			
            		
          <!-- end of row -->
          </div>
          <!-- end of row-->
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
            <div class="list-item col-md-12 p-0">
                <div class="card o-hidden flex-row mb-4 d-flex">
                    <div class="list-thumb d-flex">
                        <!-- TUMBNAIL -->
                        <img src="../resources/dist-assets/images/products/headphone-2.jpg" alt="">
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
                                <span class="badge badge-primary">New</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="list-item col-md-12 p-0">
                <div class="card o-hidden flex-row mb-4 d-flex">
                    <div class="list-thumb d-flex">
                        <!-- TUMBNAIL -->
                        <img src="../resources/dist-assets/images/products/headphone-3.jpg" alt="">
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
                                <span class="badge badge-primary">New</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="list-item col-md-12 p-0">
                <div class="card o-hidden flex-row mb-4 d-flex">
                    <div class="list-thumb d-flex">
                        <!-- TUMBNAIL -->
                        <img src="../resources/dist-assets/images/products/headphone-4.jpg" alt="">
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
                                <span class="badge badge-primary">New</span>
                            </p>
                        </div>
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
    <script src="../resources/dist-assets/js/plugins/echarts.min.js"></script>
    <script src="../resources/dist-assets/js/scripts/echart.options.min.js"></script>
    <script src="../resources/dist-assets/js/scripts/dashboard.v1.script.min.js"></script>
    <script src="../resources/dist-assets/js/scripts/customizer.script.min.js"></script>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

// 대시보드
// 총 매출
  $(document).ready(function() {
    // ${TotalPrice} 변수의 값을 가져옴
    var totalProductPrice = "${TotalPrice}";
    // 3자리마다 콤마가 붙은 형식으로 변환하여 HTML 엘리먼트에 적용
    $("#totalProductPrice").text(numberWithCommas(totalProductPrice)+" 원");
  });

  // 3자리마다 콤마가 붙은 형식으로 변환하는 함수
  function numberWithCommas(x) {
    return x.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

</script>
<script>
// 대시보드그래프
// * 절대 건들지 마시오 *
$(document).ready(function () {
    	
    	$.ajax({
    		type : "get",
    		url : "./getSalesYear?year=2023",
    		success: function(res) {
    
    			let maxValue = 0;
    			
    			const xData = [];
    			for(x of res.prevYearSalesData){
    				xData.push(x.month);
    			}
    			
    			const yCurrent = [];
    			for(x of res.currentYearSalesData){
    				yCurrent.push(x.sales);
    				
    				if(maxValue < x.sales) maxValue = x.sales;
    			}
    			
    			const yPrev = [];
    			for(x of res.prevYearSalesData){
    				yPrev.push(x.sales);
    				if(maxValue < x.sales) maxValue = x.sales;
    			}
				
    			maxValue = maxValue * 1.1;
    			const valueInterval = maxValue/4
    			
    	    	  // Chart in Dashboard version 1
    	    	  let echartElemBar = document.getElementById("echartBar22");
    	    	  if (echartElemBar) {
    	    	    let echartBar = echarts.init(echartElemBar);
    	    	    echartBar.setOption({
    	    	      legend: {
    	    	        borderRadius: 0,
    	    	        orient: "horizontal",
    	    	        x: "right",
    	    	        data: ["Online", "Offline"],
    	    	      },
    	    	      grid: {
    	    	        left: "8px",
    	    	        right: "8px",
    	    	        bottom: "0",
    	    	        containLabel: true,
    	    	      },
    	    	      tooltip: {
    	    	        show: true,
    	    	        backgroundColor: "rgba(0, 0, 0, .8)",
    	    	      },
    	    	      xAxis: [
    	    	        {
    	    	          type: "category",
    	    	          data: xData,
    	    	          axisTick: {
    	    	            alignWithLabel: true,
    	    	          },
    	    	          splitLine: {
    	    	            show: false,
    	    	          },
    	    	          axisLine: {
    	    	            show: true,
    	    	          },
    	    	        },
    	    	      ],
    	    	      yAxis: [
    	    	        {
    	    	          type: "value",
    	    	          axisLabel: {
    	    	            formatter: "${value}",
    	    	          },
    	    	          min: 0,
    	    	          max: maxValue,
    	    	          interval: valueInterval,
    	    	          axisLine: {
    	    	            show: false,
    	    	          },
    	    	          splitLine: {
    	    	            show: true,
    	    	            interval: "auto",
    	    	          },
    	    	        },
    	    	      ],

    	    	      series: [
    	    	        {
    	    	          name: "2023",
    	    	          data: yCurrent,
    	    	          label: {show: false, color: "#0168c1"},
    	    	          type: "bar",
    	    	          barGap: 0,
    	    	          color: "#FF6462",
    	    	          smooth: true,
    	    	          itemStyle: {
    	    	            emphasis: {
    	    	              shadowBlur: 10,
    	    	              shadowOffsetX: 0,
    	    	              shadowOffsetY: -2,
    	    	              shadowColor: "rgba(0, 0, 0, 0.3)",
    	    	            },
    	    	          },
    	    	        },
    	    	        {
    	    	          name: "2022",
    	    	          data: yPrev,
    	    	          label: {show: false, color: "#639"},
    	    	          type: "bar",
    	    	          color: "#ffcac9",
    	    	          smooth: true,
    	    	          itemStyle: {
    	    	            emphasis: {
    	    	              shadowBlur: 10,
    	    	              shadowOffsetX: 0,
    	    	              shadowOffsetY: -2,
    	    	              shadowColor: "rgba(0, 0, 0, 0.3)",
    	    	            },
    	    	          },
    	    	        },
    	    	      ],
    	    	    });
    	    	    $(window).on("resize", function () {
    	    	      setTimeout(() => {
    	    	        echartBar.resize();
    	    	      }, 500);
    	    	    });
    	    	  }

    	    	  // Chart in Dashboard version 1
    	    	  let echartElemPie = document.getElementById("echartPie");
    	    	  if (echartElemPie) {
    	    	    let echartPie = echarts.init(echartElemPie);
    	    	    echartPie.setOption({
    	    	      color: ["#62549c", "#7566b5", "#7d6cbb", "#8877bd", "#9181bd", "#6957af"],
    	    	      tooltip: {
    	    	        show: true,
    	    	        backgroundColor: "rgba(0, 0, 0, .8)",
    	    	      },

    	    	      series: [
    	    	        {
    	    	          name: "Sales by Country",
    	    	          type: "pie",
    	    	          radius: "60%",
    	    	          center: ["50%", "50%"],
    	    	          data: [
    	    	            {value: 535, name: "USA"},
    	    	            {value: 310, name: "Brazil"},
    	    	            {value: 234, name: "France"},
    	    	            {value: 155, name: "BD"},
    	    	            {value: 130, name: "UK"},
    	    	            {value: 348, name: "India"},
    	    	          ],
    	    	          itemStyle: {
    	    	            emphasis: {
    	    	              shadowBlur: 10,
    	    	              shadowOffsetX: 0,
    	    	              shadowColor: "rgba(0, 0, 0, 0.5)",
    	    	            },
    	    	          },
    	    	        },
    	    	      ],
    	    	    });
    	    	    $(window).on("resize", function () {
    	    	      setTimeout(() => {
    	    	        echartPie.resize();
    	    	      }, 500);
    	    	    });
    	    	  }

    	    	  // Chart in Dashboard version 1
    	    	  let echartElem1 = document.getElementById("echart1");
    	    	  if (echartElem1) {
    	    	    let echart1 = echarts.init(echartElem1);
    	    	    echart1.setOption({
    	    	      ...echartOptions.lineFullWidth,
    	    	      ...{
    	    	        series: [
    	    	          {
    	    	            data: [30, 40, 20, 50, 40, 80, 90],
    	    	            ...echartOptions.smoothLine,
    	    	            markArea: {
    	    	              label: {
    	    	                show: true,
    	    	              },
    	    	            },
    	    	            areaStyle: {
    	    	              color: "rgba(102, 51, 153, .2)",
    	    	              origin: "start",
    	    	            },
    	    	            lineStyle: {
    	    	              color: "#8B5CF6",
    	    	            },
    	    	            itemStyle: {
    	    	              color: "#8B5CF6",
    	    	            },
    	    	          },
    	    	        ],
    	    	      },
    	    	    });
    	    	    $(window).on("resize", function () {
    	    	      setTimeout(() => {
    	    	        echart1.resize();
    	    	      }, 500);
    	    	    });
    	    	  }
    	    	  // Chart in Dashboard version 1
    	    	  let echartElem2 = document.getElementById("echart2");
    	    	  if (echartElem2) {
    	    	    let echart2 = echarts.init(echartElem2);
    	    	    echart2.setOption({
    	    	      ...echartOptions.lineFullWidth,
    	    	      ...{
    	    	        series: [
    	    	          {
    	    	            data: [30, 10, 40, 10, 40, 20, 90],
    	    	            ...echartOptions.smoothLine,
    	    	            markArea: {
    	    	              label: {
    	    	                show: true,
    	    	              },
    	    	            },
    	    	            areaStyle: {
    	    	              color: "rgba(255, 193, 7, 0.2)",
    	    	              origin: "start",
    	    	            },
    	    	            lineStyle: {
    	    	              color: "#FFC107",
    	    	            },
    	    	            itemStyle: {
    	    	              color: "#FFC107",
    	    	            },
    	    	          },
    	    	        ],
    	    	      },
    	    	    });
    	    	    $(window).on("resize", function () {
    	    	      setTimeout(() => {
    	    	        echart2.resize();
    	    	      }, 500);
    	    	    });
    	    	  }
    	    	  // Chart in Dashboard version 1
    	    	  let echartElem3 = document.getElementById("echart3");
    	    	  if (echartElem3) {
    	    	    let echart3 = echarts.init(echartElem3);
    	    	    echart3.setOption({
    	    	      ...echartOptions.lineNoAxis,
    	    	      ...{
    	    	        series: [
    	    	          {
    	    	            data: [
    	    	              40,
    	    	              80,
    	    	              20,
    	    	              90,
    	    	              30,
    	    	              80,
    	    	              40,
    	    	              90,
    	    	              20,
    	    	              80,
    	    	              30,
    	    	              45,
    	    	              50,
    	    	              110,
    	    	              90,
    	    	              145,
    	    	              120,
    	    	              135,
    	    	              120,
    	    	              140,
    	    	            ],
    	    	            lineStyle: {
    	    	              color: "rgba(102, 51, 153, 0.8)",
    	    	              width: 3,
    	    	              ...echartOptions.lineShadow,
    	    	            },
    	    	            label: {show: true, color: "#212121"},
    	    	            type: "line",
    	    	            smooth: true,
    	    	            itemStyle: {
    	    	              borderColor: "rgba(102, 51, 153, 1)",
    	    	            },
    	    	          },
    	    	        ],
    	    	      },
    	    	    });
    	    	    $(window).on("resize", function () {
    	    	      setTimeout(() => {
    	    	        echart3.resize();
    	    	      }, 500);
    	    	    });
    	    	  }
    			
    			
    			
    		}		
    	});
    	
    	
    	
    	
    });
    
    
</script>
<script>
/* 차트 */
var echartElemPie = document.getElementById("echartPie1");

if (echartElemPie) {
  var echartPie = echarts.init(echartElemPie);
  echartPie.setOption({
    color: ["#FF6462", "#ff7573", "#ff9896", "#ffa9a8", "#ffbebd", "#ffcac9"],
    tooltip: {
      show: true,
      backgroundColor: "rgba(0, 0, 0, .8)",
    },
    series: [
      {
        name: "연령별 구매자수",
        type: "pie",
        radius: "60%",
        center: ["50%", "50%"],
        data: [
          {
            value: 348,
            name: "10대",
          },
          {
            value: 535,
            name: "20대",
          },
          {
            value: 310,
            name: "30대",
          },
          {
            value: 234,
            name: "40대",
          },
          {
            value: 155,
            name: "50대",
          },
          {
            value: 130,
            name: "60대",
          },
        ],
        itemStyle: {
          emphasis: {
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowColor: "rgba(0, 0, 0, 0.5)",
          },
        },
      },
    ],
  });
  $(window).on("resize", function () {
    setTimeout(function () {
      echartPie.resize();
    }, 500);
  });
}
</script>
<script>
//숫자 형식화 함수
function formatNumber(number) {
    return new Intl.NumberFormat().format(number);
}

// 대시보드
// 총 매출
$(document).ready(function() {
    $.ajax({
        type: "POST",
        url: "totalPriceProcess", // 서버에서 값을 반환하는 요청을 보냅니다.
        success: function(TotalPrice) {
            // 서버에서 반환된 값을 받아와서 해당 HTML 요소에 삽입합니다.
            $("#totalProductPrice").text(formatNumber(TotalPrice) + " 원");
        },
        error: function() {
            $("#totalProductPrice").text("에러발생...");
        }
    });
});
// 총 상품수
$(document).ready(function() {
    $.ajax({
        type: "POST",
        url: "totalProductCountProcess", // 서버에서 값을 반환하는 요청을 보냅니다.
        success: function(TotalProductCount) {
            // 서버에서 반환된 값을 받아와서 해당 HTML 요소에 삽입합니다.
        	$("#totalProductCount").text(TotalProductCount + " 개");
        },
        error: function() {
            $("#totalProductCount").text("에러발생...");
        }
    });
});

// 총 리뷰수
$(document).ready(function() {
    $.ajax({
        type: "POST",
        url: "totalProductReviewCountProcess", // 서버에서 값을 반환하는 요청을 보냅니다.
        success: function(TotalProductReviewCount) {
            // 서버에서 반환된 값을 받아와서 해당 HTML 요소에 삽입합니다.
        	$("#totalProductReviewCount").text(TotalProductReviewCount + " 개");
        },
        error: function() {
            $("#totalProductReviewCount").text("에러발생...");
        }
    });
});
// 평점
$(document).ready(function() {
    $.ajax({
        type: "POST",
        url: "productReviewAvgScoreProcess", // 서버에서 값을 반환하는 요청을 보냅니다.
        success: function(productReviewAvgScore) {
            // 서버에서 반환된 값을 받아와서 해당 HTML 요소에 삽입합니다.
        	$("#productReviewAvgScore").text(productReviewAvgScore + " 점");
        },
        error: function() {
            $("#productReviewAvgScore").text("에러발생...");
        }
    });
});

// 상품리스트
$(document).ready(function() {
    $.ajax({
        type: "POST",
        url: "dashboardProductListProcess",
        success: function(dashboardProductList) {
            let res = "";
            for (let i = 0; i < dashboardProductList.length; i++) {
                res += "<tr>" +
                    "<th scope='row' class='td_No List_td product_list0'>No. " + dashboardProductList[i].product_id + "</th>" +
                    "<td class='List_productname product_list1'>" + dashboardProductList[i].name + "</td>" +
                    "<td class='List_td product_list2'>" + formatNumber(dashboardProductList[i].price) + " 원</td>" +
                    "<td class='List_td product_list3'>" + dashboardProductList[i].created_at + "</td></tr>";
            }
            $('#dashboard_product_list').append(res);
        }
    });
});

// 오더리스트
$(document).ready(function() {
    $.ajax({
        type: "POST",
        url: "dashboardProductOrderListProcess",
        success: function(dashboardProductOrderList) {
            let res = "";
            for (let i = 0; i < dashboardProductOrderList.length; i++) {
                res += "<tr>" +
                	"<th scope='row' class='td_No List_td review_list0'>No. " + dashboardProductOrderList[i].product_order_item_id + "</th>" +
                    "<td class='List_td review_list1'>" + dashboardProductOrderList[i].order_created_at + "</td>" +
                    "<td class='List_td review_list2'>" + dashboardProductOrderList[i].delivery_recipient_name + " 님</td>" +
                    "<td class='List_productname review_list3'>" + dashboardProductOrderList[i].product_name + "</td></tr>";
            }
            $('#dashboard_product_orderlist').append(res);
        }
    });
});
//상품(리뷰,평점)리스트
$(document).ready(function() {
    $.ajax({
        type: "POST",
        url: "HyunMinProductReviewListProcess",
        success: function(dashboardproductReviewList) {
            let res = "";
            for (let i = 0; i < dashboardproductReviewList.length; i++) {
                console.log(dashboardproductReviewList);
                res += "<tr>" +
                	"<th scope='row' class='td_No List_td order_list0'>No. " + dashboardproductReviewList[i].product_id + "</th>" +
                    "<td class='List_productname order_list1'>" + dashboardproductReviewList[i].name + "</td>" +
                    "<td class='List_td order_list2'>" + dashboardproductReviewList[i].review_cnt + " 개</td>" +
                    "<td class='List_td order_list3'>" + dashboardproductReviewList[i].review_avg_score + " 점</td></tr>";
            }
            $('#dashboard_product_reviewList').append(res);
        }
    });
});
</script>
</html>
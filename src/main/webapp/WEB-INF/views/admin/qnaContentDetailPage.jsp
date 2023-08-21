<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="">
<style>

.thumbnailTable {
    width: 100%;
    background-color: transparent;
}

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

.update_btn{
    margin: 0.25rem 0.5rem;
    margin-top: -2rem; /* 버튼을 살짝 위로 올리는 값 조정 */
}

/* .detail_th{
	height: 90px;
} */

.contents_th{
	height: 90px;
}

/* 테이블과 버튼 사이 간격 조정 */
.table-btn-spacing {
	margin-top: 30px;
}

/* 외곽선의 색상을 하얀색으로 설정한 클래스 */
.img-with-border {
  width: 75px;
  height: 75px;
  border-radius: 50%;
  border: 2px solid #ffffff;
  overflow: hidden;
}

.img-with-border img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.contents_box {
    vertical-align: top; /* 텍스트를 위로 정렬합니다. */
  }

.detail_top{
	vertical-align: top;
	width: 80px;
	font-weight: 800;
}

.detail_bottom{
	vertical-align: top;
	font-weight: 700;	
}

.modal_text{
	font-weight: 700;
}

.textarea_style{
	width: 100%;
	height: 150px;
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

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	    
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
					  		<div class="col title_box mb-3 pt-3"><a href="./adminMainPage">문의내용 상세보기</a></div>
					  	</div>
					  	<div class="row">
					  		<div class="col">
 							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
									  	<tr>
									  		<td class="text-black-50 detail_top" scope="row">문의번호</td>
									       	<td class="detail_bottom" scope="col">No.&nbsp;${qnaContentDetail.qna_id}</td>
									  	</tr>
									  	<tr>
									  		<td class="text-black-50 detail_top" scope="row">등록일</td>
									       	<td class="detail_bottom" scope="col"><fmt:formatDate value="${qnaContentDetail.created_at}" pattern="yyyy-MM-dd" /></td>
									  	</tr>
									  	<tr>
									  		<td class="text-black-50 detail_top" scope="row">회사명</td>
									       	<td class="detail_bottom" scope="col">${qnaContentDetail.biz_name}</td>
									  	</tr>																			
									  	<tr>
									  		<td class="text-black-50 detail_top" scope="row">아이디</td>
									       	<td class="detail_bottom" scope="col">${qnaContentDetail.email}</td>
									  	</tr>									  	
									  	<tr>
									  		<td class="text-black-50 detail_top" scope="row">제목</td>
									       	<td class="detail_bottom" scope="col">${qnaContentDetail.title}</td>
									  	</tr>
									  	<tr>
									  		<td class="text-black-50 detail_top contents_box" scope="row">문의내용</td>
									       	<td class="detail_bottom" class="contents_box" scope="col">${qnaContentDetail.contents}</td>
									  	</tr>
									  	<c:if test="${!empty qnaContentDetail.answer_contents}">
									  	<tr>
									  		<td class="text-black-50 detail_top contents_box" scope="row">답변내용</td>
									       	<td class="detail_bottom" class="contents_box" scope="col">${qnaContentDetail.answer_contents}</td>
									  	</tr>
									  	<tr>
									  		<td></td>
									  		<td></td>
									  	</tr>
									  	</c:if>
									</thead>
								</table>
									<c:if test="${empty qnaContentDetail.answer_contents}">								
										<div class="d-flex justify-content-between align-items-center">
										    <div class="card-title"></div>
										    <button class="btn btn-primary ml-auto" type="button" data-toggle="modal" data-target="#exampleModalCenter">
										        답변등록하기
										    </button>
										</div>
									</c:if>
		                <!--  Modal -->
						<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle-2" aria-hidden="true">
						    <div class="modal-dialog modal-dialog-centered" role="document">
						        <div class="modal-content">
						            <div class="modal-header">
						                <h5 class="modal-title modal_text" id="exampleModalCenterTitle-2">답변작성</h5>
						                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						            </div>
						            <div class="modal-body">
						                <!-- 폼 태그를 모달 외부로 이동 -->
						                <form action="answerContentsInsertProcess" method="POST">
						                    <div class="input-group">
						                    	<input type="hidden" value="${qnaContentDetail.qna_id}" name="qna_id">
						                        <div class="input-group-prepend modal_text"></div>
						                        <textarea class="textarea_style" name="answer_contents" aria-label="With textarea"></textarea>
						                    </div>
						            </div>
						            <div class="modal-footer">
						                <button class="btn btn-primary ml-2" type="submit">답변등록</button>
						                <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
						            </div>
						             	</form> <!-- 폼 태그 닫기 -->
						        </div>
						    </div>
						</div>
		                <!-- Modal End -->
						</div>					  		
					 </div>
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

<!-- jQuery를 사용하여 Ajax 요청을 보내는 스크립트 -->
<!-- jQuery를 사용하여 Ajax 요청을 보내는 스크립트 -->
<script>
/*     $(document).ready(function() {
        var currentURL = window.location.href;
        var urlParams = new URLSearchParams(window.location.search);
        var product_id = urlParams.get('product_id'); // URL에서 product_id 값을 추출
        $.ajax({
            type: "GET",
            url: "productDetailProcess", // 실제 서버 엔드포인트 주소로 변경해야 합니다.
            data: { productId: product_id }, // 상품 아이디를 서버로 보낼 데이터로 수정해야 합니다.
            success: function(data) {
                // Ajax 요청이 성공했을 때 실행될 콜백 함수
                // 서버로부터 받은 데이터(data)를 이용하여 테이블에 동적으로 내용을 추가합니다.
                $('#product_detail_table th:nth-child(2)').text(data.product_name);
                $('#product_detail_table th:nth-child(4)').text(data.price);
                $('#product_detail_table th:nth-child(6)').text(data.price_sale);
                $('#product_detail_table th:nth-child(8)').text(data.created_at);
                // 나머지 필요한 데이터도 동일한 방식으로 추가해주세요.
            },
            error: function() {
            	console.log(product_id)
                // Ajax 요청이 실패했을 때 실행될 콜백 함수
                console.log("Ajax 요청이 실패했습니다.");
            }
        });
    }); */
</script>

</html>
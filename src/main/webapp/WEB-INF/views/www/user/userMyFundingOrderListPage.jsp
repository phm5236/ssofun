<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="../../resources/css/user_myFundingOrderList.css"> 
</head>
<body>

    <!--헤더 영역-->
   	<jsp:include page="../../include/fundingHeader.jsp"/>
	
    <div id="topBg"></div>
    <div class="section" id="height">
        <div class="myPage">
            <div class="fakeSection">
                <ul id="myPageTab">
                    <li class="click"><a class="click" href="">서포터</a><i class="bi bi-caret-down-fill click"></i></li>
                    <li><a>창작자</a><i class="bi bi-caret-down-fill"></i></li>
                </ul>
            </div>
            
            <div id="myPageSection">
                <div id="profile">
                    <ul id="first">
                        <li id="profileIcon"><span></span></li>
                        <li id="makerName"></li>
                        <li id="logout">로그아웃</li>
                    </ul>
                    <dl>
                        <dt>나의 쇼핑 내역</dt><!--중분류명 넣으면 됩니다-->
                        <dd><a href="../store/orderListPage">주문목록</a><i class="bi bi-caret-right-fill "></i></dd><!--여기에 메뉴 넣으세요!-->
                        <dd><a href="../store/readQnaPage">문의내역</a><i class="bi bi-caret-right-fill"></i></dd><!--여기에 메뉴 넣으세요!-->
                        <dd><a href="../store/cartPage">장바구니</a><i class="bi bi-caret-right-fill"></i></dd><!--여기에 메뉴 넣으세요!-->
                    </dl>  
                    <dl>
                        <dt>나의 펀딩 내역</dt>
                        <dd class="click"><a class="click" href="../user/userMyFundingOrderListPage">후원한 프로젝트</a><i class="bi bi-caret-right-fill click"></i></dd>
                        <dd><a href="../user/userMyFundingLikeListPage">찜한 프로젝트</a><i class="bi bi-caret-right-fill"></i></dd>
                    </dl>                  
                </div>
                <div id="contents">
                    <div id="leftBorder">
                        <div id="subTitle">
                            <h5>후원한 프로젝트</h5>
                        </div>
                        <ul id="deliveryStatus">
                            <li class="click">전체</li>
                            <li>배송중</li>
                            <li>배송완료</li>
                            <li>구매확정</li>
                            <li>취소/교환/반품</li>
                        </ul>
                        <div id="list"> 
                            <!-- <div class="funding">
                                <span class="paymentDate">23.05.16</span>
                                <a href="">
                                    <dl>
                                        <dt><img src="" alt=""></dt>
                                        <dd class="title">펀딩 제목</dd>
                                        <dd class="rewardList">
                                            <span class="reward">리워드명</span>
                                            <span class="reward">리워드명</span>
                                        </dd>
                                        <dd class="deliveryDate"><span>2023.08.20</span> 배송 예정</dd>
                                        <dd class="totalPrice"><span>27,300원</span> 결제 완료</dd>
                                    </dl>
                                </a>
                                <ul class="btnSection">
                                    <li class="orderDetail">주문상세 <i class="bi bi-chevron-right"></i></li>
                                    <li class="deliveryStatusBtn">주문취소</li>
                                </ul>
                            </div> -->

                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>
    <!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>

    <script src="../../resources/js/user_myFundingOrderList.js"></script>
</body>
</html>
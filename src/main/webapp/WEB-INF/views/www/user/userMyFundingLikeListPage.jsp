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

<link rel="stylesheet" href="../../resources/css/user_myFundingLikeList.css"> 
</head>
<body>

    <!--헤더 영역-->
   	<jsp:include page="../../include/fundingHeader.jsp"/>
	
    <div id="topBg"></div>
    <div class="section" id="height">
        <div class="myPage">
            <div class="fakeSection">
                <ul id="myPageTab">
                    <li class="click"><a class="click">서포터</a><i class="bi bi-caret-down-fill click"></i></li>
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
                        <dd><a href="../user/userMyFundingOrderListPage">후원한 프로젝트</a><i class="bi bi-caret-right-fill"></i></dd>
                        <dd class="click"><a class="click" href="../user/userMyFundingLikeListPage">찜한 프로젝트</a><i class="bi bi-caret-right-fill click"></i></dd>
                    </dl>                  
                </div>
                <div id="contents">
                    <div id="leftBorder">
                        <div id="subTitle">
                            <h5>찜한 프로젝트</h5>
                        </div>
                        <div id="list"> 
                            <!-- <a href="../funding/fundingDetailPage?funding_id=">
                                <ul class="p-0">
                                    <li class="thumbnail"><img src="" alt=""></li>
                                    <li>카테고리</li>
                                    <li>상품 제목이 3줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                                    <li>상품의 설명입니다. 이것도 최대 2줄까지만 지원을 하는것으로 하겠습니다</li>
                                    <li><b class="text-danger">152% 달성</b> 20,000,000원 <span class="float-end">12일 남음</span></li>
                                    <li><span></span></li>
                                </ul>
                            </a> -->



                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>
    <!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>

    <script src="../../resources/js/user_myFundingLikeList.js"></script>
</body>
</html>
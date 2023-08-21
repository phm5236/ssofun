<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 리스트</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="../../resources/css/funding_Main.css">

</head>
<body>
    <div class="container text-center">
    
        <!--헤더 영역-->
    	<jsp:include page="../../include/fundingHeader.jsp"/>
    	<div class="section bannerSection">
            <div class="gradient"></div>
            <div class="gradient right"></div>
            <ul id="bannerList">
                <li><a href="">
                    <ul class="bannerText">
                        <li class="icon">NEW</li>
                        <li class="firstText">덕질가방,</li>
                        <li class="lastText">이젠 크로스백으로!</li>
                    </ul>
                    <img src="../../resources/img/kimdaseul/main/덕질가방_메인.png" alt="">
                </a></li>
                <li><a href="">
                    <ul class="bannerText">
                        <li class="icon">HOT</li>
                        <li class="firstText">그리므아 시리즈2</li>
                        <li class="lastText">솔로몬의 열쇠</li>
                    </ul>
                    <img src="../../resources/img/kimdaseul/main/그라므아_메인.png" alt="">
                </a></li>         
                <li><a href="">
                    <ul class="bannerText">
                        <li class="iconWhite">NEW</li>
                        <li class="firstTextWhite">원석 마법 도감</li>
                        <li class="lastTextWhite">누구나 마법이 필요한 순간이 있다</li>
                    </ul>
                    <img src="../../resources/img/kimdaseul/main/원석마법도감_메인.png" alt="">
                </a></li>         
                <li><a href="">
                    <ul class="bannerText">
                        <li class="iconWhite">HOT</li>
                        <li class="firstTextWhite">내 이야기에 살인 사건이!</li>
                        <li class="lastTextWhite">범죄수사물 자료집</li>
                    </ul>
                    <img src="../../resources/img/kimdaseul/main/범죄수사물_메인.png" alt="">
                </a></li>         
                <li><a href="">
                    <ul class="bannerText">
                        <li class="icon">NEW</li>
                        <li class="firstText">당신에게 위로를</li>
                        <li class="lastText">행운의 늘복이 머그잔</li>
                    </ul>
                    <img src="../../resources/img/kimdaseul/main/늘복이_메인.png" alt="">
                </a></li>         
                <li><a href="">
                    <ul class="bannerText">
                        <li class="iconWhite">NEW</li>
                        <li class="firstTextWhite">바다거북수프 조선 실화판</li>
                        <li class="lastTextWhite">조선 검시관의 사건일지</li>
                    </ul>
                    <img src="../../resources/img/kimdaseul/main/조선검시관_메인.png" alt="">
                </a></li>         
                <li><a href="">
                    <ul class="bannerText">
                        <li class="icon">NEW</li>
                        <li class="firstText">시험인증원단</li>
                        <li class="lastText">시원한 압박 손목 보호대</li>
                    </ul>
                    <img src="../../resources/img/kimdaseul/main/압박손목보호대_메인.png" alt="">
                </a></li>         
                <li><a href="">
                    <ul class="bannerText">
                        <li class="iconWhite">NEW</li>
                        <li class="firstTextWhite">돌아온 신 사전 시리즈</li>
                        <li class="lastTextWhite">그리스 로마 신 사전</li>
                    </ul>
                    <img src="../../resources/img/kimdaseul/main/신사전_메인.png" alt="">
                </a></li>         
                <li><a href="">
                    <ul class="bannerText">
                        <li class="icon">NEW</li>
                        <li class="firstText">에로스와 프시케의 사랑을</li>
                        <li class="lastText">담은 아이싱쿠키</li>
                    </ul>
                    <img src="../../resources/img/kimdaseul/main/아이싱쿠키_메인.png" alt="">
                </a></li>             
            </ul>
        </div>

        <div class="section">
            <div class="row section" id="hotZip">
                <div class="col">
                    <h5 class="row p-0">지금 제일 핫한 펀딩 모음집</h5>
    
                    <div class="row p-0 d-flex" id="sList">
                        <!-- <a href="">
                            <ul class="p-0">
                                <li><img src="" alt=""></li>
                                <li class="text-start">카테고리</li>
                                <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                                <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                            </ul>
                        </a> -->
                    </div>
    
                </div>
            </div>
        </div>
	</div>

    <div id="subBanner"><a>
        <ul id="subBannerText">
            <!-- <li>검증된 상품만 모았어요!</li>
            <li>이번주 신상 반짝 혜택</li> -->
        </ul>
        <img src="../../resources/img/kimdaseul/main/메인서브배너2.jpg" alt="">
    </a></div>

    <div class="section">
        <div class="row section" id="newZip">
            <div class="col">
                <h5 class="row p-0">주목하세요! 새로 오픈한 프로젝트</h5>

                <div class="row p-0 d-flex" id="nList">
                    <!-- <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a> -->
                </div>

            </div>
        </div>
    </div>

	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>
	<script src="../../resources/js/funding_main.js"></script>
    
</body>
</html>
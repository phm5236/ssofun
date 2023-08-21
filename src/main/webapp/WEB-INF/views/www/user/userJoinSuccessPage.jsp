<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="../../resources/css/user_joinSuccess.css">
</head>
<body>

    <!--헤더 영역 필요없음-->
    <div class="section">
        <h2 id="logo"><a href="../../www/funding/fundingMainPage">SSOFUN</a></h2>
        
        <div id="welcomeSection">

            <div id="welcome">
                <img src="../../resources/img/kimdaseul/celebration.PNG" alt="" id="leftImg">
                <img src="../../resources/img/kimdaseul/celebration.PNG" alt="" id="rightImg">
                <ul class="notosanskr">
                    <li>000 서포터님</li>
                    <li>쏘펀 가입을 축하드려요</li>
                </ul>
            </div>

            <div id="coupon">
                <p id="couponTitle">Welcome Coupon</p>
                <p id="price">20,000</p>
                <p id="subPrice">신규 회원 전용</p>
                <ol>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ol>
                <ul>
                    <li><span class="circle"></span></li>
                    <li><span class="circle"></span></li>
                </ul>
            </div>


            <input type="button" value="홈 화면으로 바로가기" id="moveMainPageBtn">


        </div>
    </div>
	

	<!-- 푸터 영역 필요없음-->
	
    <script src="../../resources/js/user_joinSuccess.js"></script>
</body>
</html>
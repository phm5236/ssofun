<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../resources/css/funding_header.css">
</head>
<body>
<c:choose>
	<c:when test="${user != null}">
        <div class="row section" id="header">
            <div class="d-flex col p-0">
                <div class="col-1 logobox"><a href="../funding/fundingMainPage" id="logo" class="fs-3 fw-bold">SSOFUN</a></div>
                <div class="col-1"><a href="../funding/fundingListPage">펀딩</a></div>
                <div class="col-1"><a href="../store/storePage">스토어</a></div>
                <div class="col-1 me-auto"><a href="../community/communityMainPage">커뮤니티</a></div>
                <div class="col-1">
                	<a id="logout">로그아웃</a>
               	</div>
                <div class="col-1">
                	<a href="../store/userMyPage">마이페이지</a>
               	</div>
                <div class="col-1"><a href="../faq/faqShippingPage">고객센터</a></div>
            </div>
        </div>
	</c:when>
	<c:otherwise>
        <!--헤더 영역-->
        <div class="row section" id="header">
            <div class="d-flex col p-0">
                <div class="col-1 logobox"><a href="../funding/fundingMainPage" id="logo" class="fs-3 fw-bold">SSOFUN</a></div>
                <div class="col-1"><a href="../funding/fundingListPage">펀딩</a></div>
                <div class="col-1"><a href="../store/storePage">스토어</a></div>
                <div class="col-1 me-auto"><a href="../community/communityMainPage">커뮤니티</a></div>
                <div class="col-1"><a href="../user/userLoginPage">로그인</a></div>
                <div class="col-1"><a href="../faq/faqShippingPage">고객센터</a></div>
            </div>
        </div>
	</c:otherwise>
</c:choose>




</body>
</html>
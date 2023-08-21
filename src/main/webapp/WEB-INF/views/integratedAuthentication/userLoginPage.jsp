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

<link rel="stylesheet" href="../resources/CSS/funding_list.css">
<script src="../resources/JS/funding_list.js"></script>
</head>
<body>
    <div class="container">
    
        <!--헤더 영역-->
    	<jsp:include page="../include/fundingHeader.jsp"/>

		<div class="row">
			<div class="col-6 mx-auto">
				<form action="./loginProcess" method="post">
				<div class="row">
					<div class="col text-center fw-bold fs-1">사용자 로그인</div>
				</div>
				<div class="row my-1">
					<div class="col">
						<input type="text" class="form-control" placeholder="아이디" name="email">
					</div>
				</div>
				<div class="row my-1">
					<div class="col">
						<input type="password" class="form-control" placeholder="패스워드" name="password">
					</div>
				</div>
				<div class="row my-2">
					<div class="col d-grid">
						<button class="btn btn-primary">로그인</button>
					</div>
				</div>
				<div class="row">
					<div class="col">회원가입 | 아이디 찾기 | 비밀번호 찾기</div>
				</div>
				</form>
			</div>
		</div>


	</div>    

	<!-- 푸터 영역 -->
	<jsp:include page="../include/fundingFooter.jsp"/>

</body>
</html>
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

<link rel="stylesheet" href="../../resources/css/user_join.css">

</head>
<body>

    <!--헤더 영역 필요없음-->
    <div class="section">
        <h2 id="logo"><a href="../../www/funding/fundingMainPage">SSOFUN</a></h2>
        
        <div id="joinSection">
            <div id="snsJoin">
                <h5>간편가입</h5>
                <ul>
                    <li id="kakao"></li>
                    <li id="naver"></li>
                    <li id="google"></li>
                </ul>
            </div>

            <div id="emailJoin">
                <h5>이메일 간편가입</h5>
                <ul>
                    <li>이메일<span><input type="text" id="email" placeholder="이메일 계정"></span></li>
                    <li>이름<span><input type="text" id="name" placeholder="이름 입력"></span></li>
                    <li>
                        비밀번호
                        <span><input type="password" id="password" placeholder="비밀번호 입력"></span>
                        <span><input type="password" id="passwordCheck" placeholder="비밀번호 확인"></span>
                    </li>
                    <li>생년월일<span><input type="date" id="birth"></span></li>
                    <li>닉네임<span><input type="text" id="nickname"></span></li>
                    <li>성별(선택)
                        <span>
                            <input type="button" class="gender" value="남자">
                            <input type="button" class="gender" value="여자">
                        </span>
                    </li>
                    <li>
                        <input type="checkbox" id="agree_sms" value="1">
                        <span>
                            <b>전체동의</b>
                            회원·서비스(필수), 스타트업찾기 서비스 (선택), 이벤트·혜택알림 동의(선택), 만 14세 이상(필수)
                        </span>
                    </li>
                    <li><input type="button" value="완료" id="userJoinSubmitBtn"></li>
                </ul>
            </div>

        </div>
    </div>
	

	<!-- 푸터 영역 필요없음-->
	<script src="../../resources/js/user_join.js"></script>

</body>
</html>
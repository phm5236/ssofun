<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자 페이지</h1>
<a href="./mainPage">스토어페이지</a><br>
<c:if test="${!empty sessionUser }">
<a href="./thumbnail">썸네일 등록</a><br>
<a href="./type">상품 타입 등록</a><br>
<a href="./protuctRegist">상품등록</a><br>
</c:if>


</body>
</html>
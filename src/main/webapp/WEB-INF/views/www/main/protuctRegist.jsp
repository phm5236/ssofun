<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>상품등록</h1>
<form action="./protuctProcess" method="post">
	상품이름 : <input type="text" name="name"><br>
	상품가격 : <input type="text" name="price"><br>
	상품할인가 : <input type="text" name="price_sale"><br>
	상세설명 : 
	<br>
	<textarea rows="10" cols="60" name="contents"></textarea><br>
	<button>등록</button>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>상품타입등록</h1>
<form action="./typeProcess" method="post">
	부모아이디 : <input type="text" name="this_parent_id"><br>
	node : <input type="text" name="node"><br>
	카테고리명 : <input type="text" name="name"><br>
	<button>등록</button>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#login_btn").on('click', function() {
		login();
	})
});

function login(){
	const userId = $("#userId").val();
	console.log(userId);
    $.ajax({
        url: "loginProcess",
        method: "POST",
        data: {
        	email : userId,
        	password : $("#userPw").val()
        },
        success: function(res){
        	if(res==1){
        		location.href = 'mainPage';
        	}else if(res ==2){
        		location.href = 'productOrderPage';
        	}
        	else{
        		alert("실패");
        	}
        },
        error: function(){
            alert("err");
        }
  	});
}


</script>
</head>
<body>
<h1>로그인</h1>

	ID : <input id="userId" type="text" name="email"><br> 	
	PW : <input id="userPw" type="password" name="password"><br>
	<input type="button" value="로그인" id="login_btn">
	<br>

<a href="./register">회원가입</a><br>


</body>
</html>
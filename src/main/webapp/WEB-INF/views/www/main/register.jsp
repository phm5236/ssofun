<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script >
$(document).ready(function(){
	$("#regist_btn").on('click', function() {
		const pw = $('#userPw').val();
		const pw2 = $('#userPwConfirm').val();
		pwcheck();
		if( pw == pw2 ){
			register();
		}
	})
});

function register(){
	let userId =  $("#userId").val();
	let userPw =  $("#userPw").val();
	let BizId =  $("#BizId").val();
    $.ajax({
        url: "registerProcess",
        method: "POST",
        data: {
        	login_account: userId,
        	login_password: userPw,
        	biz_id : BizId
        },
        success: function(res){
        	if(res==1){
        		alert("이미 존재하는 아이디 입니다.")
        	}else{
        		location.href = 'loginPage';
        	}
        },
        error: function(){
            alert("err");
        }
  	});
}

function pwcheck(){
	//비밀번호
	const userPwBox = document.getElementById("userPw");
	const userPwConfirmBox = document.getElementById("userPwConfirm");
	
	const pwValue = userPwBox.value;
	const pwConvalue = userPwConfirmBox.value;
	
	if(pwValue != pwConvalue){
		alert("비밀번호 확인을 해주세요.");
		userPwBox.value = "";// 비밀번호지우기
		userPwConfirmBox.value = ""; 
		userPwBox.focus();
		return;
	}
}
<%--
$(function(){
	//비밀번호 확인
		$('#userPwConfirm').blur(function(){
		   if($('#userPw').val() != $('#userPwConfirm').val()){
		    	if($('#userPwConfirm').val()!=''){
			    alert("비밀번호가 일치하지 않습니다.");
			    	$('#userPw').val('');
			    	$('#userPwConfirm').val('');
		        	$('#userPwConfirm').focus();
		       }
		    }
		})  	   
}); --%>
</script>
</head>
<body>
<h1>회원 가입</h1>

	아이디 : <input id="userId" type="text" name="login_account">
	<br>
	비밀번호 : <input id="userPw" type="password" name="login_password"><br>
	비밀번호 확인: <input id="userPwConfirm" type="password"><br>
	biz_id : <input id="BizId" type="text" name="biz_id"><br>
	<input type="button" value="회원가입" id="regist_btn">
<br>
<a href="./loginPage">로그인</a>
</body>
</html>
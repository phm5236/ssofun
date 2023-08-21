<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#login_log table td, th {
	width:100px;
	border: 1px solid #444444;
    border-collapse: collapse;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script >
$(document).ready(function () {
	//이력 보기 클릭 시 이벤트 발생
	$("#userList_btn").on('click', function() {
		loginLog();
	});
});

function loginLog() {
	
	$.ajax({
        url: "./userlistProcess",
        success: function(data){
           if (data.Code == 0 ) {
        	let tag ="";
	        for (i=0; i<data.data.length; i++ ) {
	          		tag = "<tr>" + 
		                  		"<td>" + data.data[i].user_id + "</td>" + 
		                   		"<td>" + data.data[i].id + "</td>" +
	  	                   		"<td>" + data.data[i].pass + "</td>" +
	  	                   		"<td>" + data.data[i].nickname + "</td>" +
		   	               		"<td>" + data.data[i].created_at + "</td>" +
	   	               	  "</tr>"   
	   	         $("#user_tb").append(tag);
	            }
	        else {
	        	   alert(data.Msg);
	          	 }
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
<h1>회원 정보 목록</h1>

<div id="userList_btn" style="margin-top:20px; cursor:pointer; background-color:#ddd; width:100px;">
	회원리스트
</div>
	<div id="login_log" style="padding-top:20px;">
		<table id ="user_tb">
			<tr> 
			      <th>회원번호</th> 
	              <th>아이디</th>
	              <th>비밀번호</th>	
	              <th>닉네임</th>
	              <th>가입날짜</th>
	        </tr> 
		</table>
	</div>
</body>
</html>
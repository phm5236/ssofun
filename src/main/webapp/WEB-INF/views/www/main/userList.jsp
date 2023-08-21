<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 정보 목록</h1>
		<table border="1" id="user_list">
			<tr> 
			      <th>회원번호</th> 
	              <th>아이디</th>
	              <th>비밀번호</th>
	              <th>닉네임</th>	
	              <th>가입날짜</th>
	        </tr>
		</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	 $.ajax({
	        type:'POST',
	        url:"userlistProce",
	        success:function(list)
	        {   
	       		console.log(list);
	           let res="";
	           for(let i=0;i<list.length;i++)
	          {
	                res+="<tr>"    
	                 +"<td>"+list[i].user_id+"</td>"
	                 +"<td>"+list[i].id+"</td>"
	                 +"<td>"+list[i].pass+"</td>"
	                 +"<td>"+list[i].nickname+"</td>"
	                 +"<td>"+list[i].created_at+"</td></tr>";
	           }
	          $('#user_list').append(res); 
	       }
	 });
});
</script>
</body>
</html>
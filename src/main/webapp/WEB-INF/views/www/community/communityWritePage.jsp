<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.16.0/font/bootstrap-icons.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="../../resources/js/logout.js"></script>
	<!-- Summernote 라이브러리 추가 -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css">


	<style>
	
	
	/* 페이지 전체 사이즈 설정  */
	.section {
	    width: 1200px;
	    margin: 0 auto;
	}
	
	  /* 제목과 내용 사이의 간격을 주기 위한 스타일 */
	  .input-container {
	    margin-bottom: 20px;
	  }
	
	  .summernote-container {
	    margin-bottom: 30px;
	  }
	  
		
		  /* 제출 버튼 아래 간격 추가 */
	  .submit-button-container {
	    margin-top: 20px;
	  }
	
	  /* 제출 버튼 스타일 변경 */
	  .submit-button {
	    width: 10%;
	    padding: 5px;
	  }
  
	  .button-container{
		 margin-top: 20px;  
	  margin-bottom: 70px;
	  
	  }
	  
		 
		  /*배너 설정  */
		.img-fluid{
		margin-bottom: 70px;	
		width: 100%;
		height: 100%; 
		}

	</style>
</head>


<body>
	<jsp:include page="../../include/fundingHeader.jsp"/>
		<img src="../../resources/img/jangsoyeon/banner.jpg" class="img-fluid" alt="">
		
		<div class ="section">
			<main role="main" class="container">
			  <c:choose>
			    <c:when test="${!empty user.user_id}">
			      <form action="./communityWriteProcess" method="post">
			      
			        <!-- 게시글 카테고리 선택 -->
			         <div class="input-container">
			        <select name="community_category_id">
			          <option>카테고리 선택</option>
			          <c:forEach items="${communityCategoryList}" var="communityCategoryList">
			            <option value="${communityCategoryList.community_category_id}">${communityCategoryList.name}</option>
			          </c:forEach>
			        </select>
			       </div> 
			        
			         <div class="input-container">
			          <input type="text" name="title" placeholder="제목을 입력하세요" style="border-radius:5px; width: 100%; padding:5px;">
			        </div>
			        <div class="summernote-container">
			          <textarea class="summernote" name="contents"></textarea>
			        </div>
			        
			        
			        
			   <script>
				    $(document).ready(function() {
				        $('.summernote').summernote({
				            placeholder: '내용을 입력해주세요',
				            tabsize: 2,
				            height: 300
				        });
				
				        $('form').submit(function(event) {
				            // Summernote의 내용을 일반 텍스트로 변환하여 textarea의 값으로 설정
				            var summernoteContent = $('.summernote').summernote('code');
				            $('.summernote').val(summernoteContent);
				        });
				    });
			</script>

			          <div class="button-container text-end">
			          	<button class="btn text-white" style="background-color: #FF6462;">등록</button>
        			 </div>
			      </form>
			    </c:when>
			   </c:choose>
			    
			    
			    
			  <!--관리자 글쓰기 페이지-->  
			    
			   <div class ="container">
			  <c:choose>
			    <c:when test="${!empty shopAdmin.admin_id}">
			      <form action="./communityWriteProcess" method="post">
			         <div class="input-container">
			          <input type="text" name="title" placeholder="제목을 입력하세요" style="border-radius:5px; width: 100%; padding:5px;">
			        </div>
			        <div class="summernote-container">
			          <textarea class="summernote" name="contents"></textarea>
			        </div>
			        
			        
			        
			   <script>
				    $(document).ready(function() {
				        $('.summernote').summernote({
				            placeholder: '내용을 입력해주세요',
				            tabsize: 2,
				            height: 300
				        });
				
				        $('form').submit(function(event) {
				            // Summernote의 내용을 일반 텍스트로 변환하여 textarea의 값으로 설정
				            var summernoteContent = $('.summernote').summernote('code');
				            $('.summernote').val(summernoteContent);
				        });
				    });
			</script>
			

			          <div class="button-container text-end">
			          	<button class="btn text-white" style="background-color: #FF6462;">등록</button>
        			 </div>
			      </form>
			    </c:when>
			       </c:choose>
			   </div> 
			</main>
		</div>
	
			
				<!-- 푸터 영역 -->
			<jsp:include page="../../include/fundingFooter.jsp"/>
		
			
			</body>
			</html>

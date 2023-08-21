<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.16.0/font/bootstrap-icons.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="../../resources/js/logout.js"></script>
	
    
    <title>커뮤니티</title>
	
		 <style>
		 
			 @import url('https://fonts.googleapis.com/css2?family=Inter&display=swap');
			*{margin: 0; padding: 0; list-style: none; box-sizing: border-box; font-family: 'Inter', sans-serif; font-weight: 400;}
				body{position: relative;}
			
			/* 페이지 전체 사이즈 설정  */
			.section {
			    width: 1200px;
			    margin: 0 auto;
			    }
		 
			 /*게시물 설정  */
			 .col-10 .title {
			    border-top: 1px solid black;
			    font-size: 1.5rem;
			    font-weight: bold;
			    background-color: #f3f3f3;
			    padding: 20px 0;
			     padding-left: 10px;
				}
			 
		 
				.col-10 .author{
			   	 background-color: #f3f3f3;
			   	  padding: 5px 0;
			   	  padding-left: 10px;
			   } 
		   
			 .col-10 .read-count {
			    border-bottom: 1px solid #ccc;
			     background-color: #f3f3f3;
			     padding-left: 10px;
			    display: flex;
				}
			 
			 	
			 .col-10 .contents {
			    border-bottom: 1px solid black;
			    height: 400px; 
			    padding: 30px 0;
			    padding-left: 10px;    
			   
				 }
		 
		 /* 목록으로 돌아가기 버튼  */
		 .back-list{
		  padding: 30px 0;
		 }
		 
			 
		  /*배너 설정  */
		.img-fluid{
		margin-bottom: 70px;	
		width: 100%;
		height: 100%; 
		}

			/*수정-삭제 버튼 설정  */
			.modification-delete{
		  	padding: 30px 0;
		 		}
		 		
		 	/*댓글 닉네임-날짜 */
		 	.comment-nickname{
		 	margin-top: 20px;
		 	font-weight: 550;
		 	}
		 	
		 	/*댓글 간격 조정  */
		 	.comment {
		 	margin-top: 10px;
		 	margin-bottom: 20px;
		 	
		 	}
		 		
		 	/*댓글 날짜  */
		 	.comment-date{
		 	color : #9e9e9e;
		 	}	
		 	
		 	
		 	/*댓글등록 버튼 설정 */
		 	.comment-submit {
			    display: flex;
			    justify-content: center; /* 수평 가운데 정렬 */
			    align-items: center; /* 수직 가운데 정렬 */
			    height: 100%; /* Flex Container의 높이를 100%로 설정하여 부모 요소 높이에 맞춤 */
			  
			}
		 	.btn-primary{
		 	 margin-top : 45px;
		 	 background-color: #FF6462;
		 	border-radius: 5px; 
			border-color : #FF6462;
		 	 	 
		 	}
		 	
		 	/*댓글 사이 선 넣기 */
		 	.centered-line__line {
		    height: 1px;
		    background-color: #9e9e9e;
		    width:760px;
			}
			
		 	
		 	/*하단의 여백 설정 */
		 	.row-margin{
		 		margin-bottom: 100px;
		 	}
		 	
		 	
		 	/*수정-삭제 간격 설정  */
		 	.modification{
		 	margin-left: 30px;
		 	
		 	}
		 	.delete{
		 		margin-left: 40px;
		 	}
		 	
		 
		 </style>   
	  
	 
</head>

<body>
	<jsp:include page="../../include/fundingHeader.jsp"/>
	<img src="../../resources/img/jangsoyeon/banner.jpg" class="img-fluid" alt="">	

				<div class ="section">
					<div class="container">
						<div class ="row">
						
					<!--사이드 바-->
						<div class="col-2" style="padding-right: 20px; padding-left: 0px;">
			   				 <div class="card">
			        	<div class="card-header">
			            커뮤니티
			        </div>
			        <ul class="list-group list-group-flush">
			            <c:forEach items="${communityCategoryList}" var="communityCategoryList">
			                <li class="list-group-item">
			                    <a href="./communityCategoryPage?community_category_id=${communityCategoryList.community_category_id}" style="text-decoration: none; color: #333;">
			                        ${communityCategoryList.name}
			                    </a>
			                </li>
			            </c:forEach>
			        </ul>
	    		</div>
			</div>
					
					<!-- 게시글 상세페이지  -->
					
					<div class="col-10" style="padding-left: 30px;">
					
					<div class="title">${data.communityNoticeDto.title}</div>
				    <div class="author">${data.userDto.nickname}</div>
				    
				    <!-- 여기에 하단 테두리 추가 -->
				    <div class="read-count"><fmt:formatDate value="${data.communityNoticeDto.created_at}" pattern="yy.MM.dd"/> 
				     <span style="margin-left: 20px;">
					        <i class="bi bi-eye">${data.communityDto.read_count}</i>
					   </span>   
					 </div>
					        
					<!-- 내용 -->
					<div class="contents">${data.communityNoticeDto.contents}</div>
					
					<div class ="row">
						<div class ="col-2">
							<div class = "back-list"><a href="./communityMainPage">목록으로</a></div>
						</div>
						<div class ="col-2"></div>
						<div class ="col-2"></div>
						<div class ="col-2"></div>
						<div class ="col-2"></div>
						<div class ="col-2 modification-delete">
						<c:if test="${!empty user && user.user_id == data.userDto.user_id}">
								<span class ="modification">
							    	<a href="./communityUpdatePage?community_id=${data.communityDto.community_id}">수정</a>
							    </span>
							    <span class ="delete">
							    	   <a href="./deleteProcess?community_id=${data.communityDto.community_id}">삭제</a>
							    </span>
							</c:if> 
						</div>
						
		              </div>
				
					
	
					        
						</div>
					</div>
				</div>
			</div>
				
			<div class = "row-margin">
				<div class = "col"></div>
			</div>	
		
				
		<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>



</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ssofuncss.css">
   
   <script type="text/javascript">
		

	   
   
   </script>
   

   

<title>Insert title here</title>
</head>
<body>




  




    <div class="container container1">
    
    <!--헤더 영역-->
    	<jsp:include page="../../include/fundingHeader.jsp"/>
    	
    	
    	
    	<!--
	   	 <div class="row one">
	            <div class="col">
	                <div class="row">
	                    <div class="col one-2"><p class="one-font">LOGO</p></div>
	                    <div class="col one-1"><p class="one-font">펀딩</p></div>
	                    <div class="col one-1"><p class="one-font">스토어</p></div>
	                    <div class="col-4 one-1"></div>
	                    <div class="col one-1"><a href="../qna/loginPage" class="one-font-1"><p class="one-font">로그인</p></a></div>
	                    <div class="col one-1"><p class="one-font">고객센터</p></div>
	                </div>
	            </div>
	        </div>
	      -->        
	        
    </div>

    <div class="backgroundcolor" id="searchBg">
    
        <div class="container mb-3" id="searchBox">
            <div class="row">
                <div class="col">
                    <div class="row"><div class="col"></div></div>
                    <div class="row mt-5"><div class="col"><p class="two_font mb-0">쏘펀 고객센터입니다.</p></div></div>
                    <div class="row mt-1"><div class="col"><p class="two_font mb-0">어떤 도움이 필요하세요?</p></div></div>
                    <div class="row mt-1">
                        <div class="col-5">
                            <div class="search-bar style" style="background-color: white;">
                                <input type="text" class="search-input" placeholder="자주 찾는 질문을 검색해보세요!" >
                                <button class="search-bar-button"><i class="fas fa-search search-icon" style="color: #000000;"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-5"><div class="col"></div></div>
                    <div class="row mb-5"><div class="col"></div></div>
                </div>
            </div>
       </div>
       <img src="/resources/img/kimhaneul/customerserviceimg/finalbanner.webp" alt="">
    </div>
    <div class="container mt-4 container2">
        <div class="row">
            <div class="col">
                <div class="row ">
                    <div class="col-2">
                        <div class="row"><div class="col"><p class="three-font mb-3">고객센터</p></div></div>
                        <div class="row">
                            <div class="col borderline">
                                <div class="row"><div class="col"><p class="four-font" id="four-font-default">공지사항</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><a href="../faq/faqMainPage"><p class="four-font" id="four-font-default">자주찾는질문</p></a></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><p class="four-font" id="four-font-default">이용약관</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><button type="button" class="qnaMainbutton"onclick="location.href='../qna/qnaMain'"><p class="four-font"  id="four-font-active">1:1문의하기</p></button></div></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col borderline mt-4">
                                <div class="row"><div class="col"><p class="four-font">쏘펀 고객센터 안내</p></div></div>
                                <div class="row"><div class="col"><p class="three-font">02-123-7798</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><p class="four-font-1 mb-1">평일(월~금)</p></div></div>
                                <div class="row"><div class="col"><P class="four-font-1 mb-1">· 09:00~18:00운영</P></div></div>
                                <div class="row"><div class="col"><p class="four-font-1 mb-1">휴일(토~일), 공휴일</p></div></div>
                                <div class="row"><div class="col"><P class="four-font-1">· 10:00~15:00운영</P></div></div>
                            </div>
                        </div>  
                    </div>
                    
                    <div class="col-1"></div>
                    
                    <div class="col">
                        <div class="row">
                            <div class="col-2"><p class="three-font mt-1">1:1 문의하기</p></div>
                            <div class="col c-five-font"><p class="five-font mt-2">답변까지 약 2~3일 정도가 소요될 수 있습니다.</p></div>
                            <div class="col-2">
                            <c:if test="${!empty user }">
                            	<input type="button" class="qnabutton" value="1:1문의"  onclick="location.href='writeQnaPage'" style="border-radius: 5px;">
                            </c:if>
                            </div>
                         
                        </div>
                        <div class="row">
                            <div class="col hr-col"><hr class="hr-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-1"><p class="center1">번호</p></div>
                            <div class="col"><p class="five-font">제목</p></div>
                            <div class="col-2"><p class="center1">작성일</p></div>
                            <div class="col-2"><p class="center1">문의상태</p></div>
                        </div>
                        
                        <c:forEach items="${qnaList}" var="qna" varStatus="status">
                        <div class="row mb-2 line">
                            <div class="col-1"><p class="center1" name="qna_id" id="qna_id">${fn:length(qnaList)-status.count+1}</p></div>
                            <div class="col"><p class="five-font"><a class="readQnalink" href="./readQnaPage?qna_id=${qna.qna_id }">${qna.title }</a></p></div>
                            <div class="col-2">
	                            <p class="center1">
	                            	<fmt:formatDate pattern="yyyy. MM. dd. (E)" value="${qna.created_at }"/>
	                            </p>
	                        </div>
                            <div class="col-2">
                                <div class="row">
                                    <div class="col"><p class="center1">
                                    	<c:if test="${empty qna.answer_contents }">
                                    	 답변대기
                                    	</c:if>
                                    	<c:if test="${!empty qna.answer_contents }">
                                    	 답변완료
                                    	</c:if>
                                    
                                    </p></div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
  
                        <div class="row">
                            <div class="col">
                            </div>
                        <!-- 페이지네이션 -->
			            <div class="row" style="text-align: center;">
			            	<div class="col"></div>
			            	<div class="col">
				            	<nav aria-label="Page navigation example">
								  <ul class="pagination">
								    <li class="page-item">
								      <a class="page-link" href="#" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
								    <li class="page-item"><a class="page-link" href="#">1</a></li>
								    <li class="page-item"><a class="page-link" href="#">2</a></li>
								    <li class="page-item"><a class="page-link" href="#">3</a></li>
								    <li class="page-item"><a class="page-link" href="#">4</a></li>
								    <li class="page-item"><a class="page-link" href="#">5</a></li>
							<!-- <li class="page-item"><a class="page-link" href="#">6</a></li>
								    <li class="page-item"><a class="page-link" href="#">7</a></li>
								    <li class="page-item"><a class="page-link" href="#">8</a></li>
								    <li class="page-item"><a class="page-link" href="#">9</a></li>
								    <li class="page-item"><a class="page-link" href="#">10</a></li> -->	    
								    <li class="page-item">
								      <a class="page-link" href="#" aria-label="Next">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								    </li>
								  </ul>
								</nav>
							</div>
							<div class="col"></div>
			            </div>
                            
                            
                            
                            
                        </div>
                    </div>
                </div>
         
            </div>
  
        </div>
    </div>
	<div class="container">
		<div class="row  mt-5">
			<div class="col"></div>
		</div>
		<div class="row  mt-5">
			<div class="col"></div>
		</div>
		  
                    
	</div>
	
   
    	<jsp:include page="../../include/fundingFooter.jsp"/>
  
	




<script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/js/all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>    
<script src="../../resources/js/logout.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <title>Document</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="../../resources/css/funding_CompletePayment.css">    
<script src="../../resources/js/funding_completePayment.js"></script>
</head>
<body>
    <div class="container text-center">	
        <!--헤더 영역-->
    	<jsp:include page="../../include/fundingHeader.jsp"/>
		
		<div class="section" id="participation">
            <ul id="pageName">
                <li><img src="../../resources/img/kimdaseul/celebration.PNG" alt=""></li>
                <li>프로젝트 참여가 완료되었습니다.</li>
            </ul>
            <div id="history">
                <ul id="project">
                    <li>카테고리</li>
                    <li>프로젝트 제목입니다</li>
                </ul>

                <div id="projectInfo">
                    <ul class="reward">
                        <li class="title">[쏘펀 한정] 올인원 패키지 1+1 (99종)</li>
                        <li class="detail">
                            <!-- <ul>
                                <li>&#8226; 15소년 표류기 1개</li>
                                <li>&#8226; 본품 2ea</li>
                                <li>&#8226; 정상가 118,000원</li>
                                <li>&#8226; 1ea당 26,950원</li>
                                <li>&#8226; 구매시 배수구클리너 1봉 선물 증정</li>
                            </ul> -->
                        </li>
                        <li class="total">
                            <!-- <span>수량 1개</span>
                            <b>33,000원</b> -->
                        </li>
                    </ul>
                </div>

                <p class="click">내용을 클릭하면 상세보기로 이동합니다.</p>
            </div>
        </div>
        

        <div class="row section" id="similar">
            <div class="col">
                <h5 class="row p-0">이런 프로젝트는 어떠세요?</h5>

                <div class="row p-0 d-flex" id="sList">
                    <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a>
                    <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a>
                    <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a>
                    <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a>
                </div>

            </div>
        </div>

        <div class="row section" id="pick">
            <div class="col">
                <h5 class="row p-0">다른 서포터님들이 후원하신 프로젝트</h5>

                <div class="row p-0 d-flex" id="pList">
                    <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a>
                    <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a>
                    <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a>
                    <a href="">
                        <ul class="p-0">
                            <li>image 280 x 280</li>
                            <li class="text-start">카테고리</li>
                            <li class="text-start">상품 제목이 1줄이상 넘어가면 이렇게 표시를 하면 되겠습니다. 가나라마바사 아자차카다파하</li>
                            <li class="text-start"><b class="text-danger">152% 달성</b> 12일 남음</li>
                        </ul>
                    </a> 
                </div>

            </div>
        </div>


	</div>
	
	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="../../resources/css/funding_detailCommunityList.css">
<script src="../../resources/js/funding_detailCommunityList.js"></script>
</head>
<body>
<input type="hidden" id="funding_id" value="${funding_id}">
    <div class="container text-center">	
		<!--헤더 영역-->
		<jsp:include page="../../include/fundingHeader.jsp"/>
		
		<div class="row section2" id="projectIntroduction">
			<div class="col p-0">
			
				<div class="row" id="category-name">
					<h6 class="p-0 m-0">카테고리</h6>
				</div>
							
				<div class="row section2" id="title">
					<h3 class="p-0 m-0">이것은 펀딩 제목입니다</h3>
				</div>
				
				<div class="row section2" id="introduction">
				
					<div class="p-0 m-0 d-flex justify-content-center" id="thumbnail">
						<ul id="moveLeft">
							<li></li>
							<li></li>
						</ul>
                        <div id="thumbBox">
                            <ul id="thumb">
                                <!-- <li>image 500 x 450</li> -->
                            </ul>
                        </div>
						<ul id="moveRight">
							<li></li>
							<li></li>
						</ul>
                        <ul class="p-0 m-0" id="swiper"> 
                            <!-- <li class="activeBtn"></li>
                            <li></li>
                            <li></li> -->
                        </ul>
					</div>
					
					<div class="col-1 p-0 m-0" id="aside">
                        <ul class="m-0">
                            <li id="introduce">
                                <span>펀딩소개</span>
                                이곳은 펀딩에 대한 소개가 들어갑니다<br>
                                아까 목록에서 봤던 그것 맞음
                            </li>
                            <li id="totalAmount">
                                <span>모인금액</span>
                                2,300,000<b>원</b>
                                <span id="achieve">56% 달성</span>
                            </li>
                            <li id="endtime">
                                <span>남은 시간</span>
                                3<b>일</b>
                                <span id="end">2023-06-18 금요일 종료</span>
                            </li>
                            <li id="sponsor">
                                <span>후원자</span>
                                61<b>명 참여</b>
                            </li>
                            <li>
                                <ul>
                                    <li><i class="bi bi-truck"></i> 2023년 4월 15일에 발송됩니다. 멘트 미정</li>
                                    <li id="likeBtn"><i class="bi bi-heart"></i>1</li>
                                    <li id="supportBtn">프로젝트 후원하기</li>
                                </ul>
                            </li>
                        </ul>
					</div>
					
				</div>

				
			</div>
		</div>
		
        <div class="row section2" id="tab">
            <ul class="p-0 m-0">
                <li id="reward">리워드 <i>&#9662;</i> <span></span></li>
                <li id="info"><a href="./fundingDetailPage">소개</a></li>
                <li id="notice"><a href="./fundingDetailNoticeListPage">공지사항</a></li>
                <li id="community"><a class="activeTab" href="./fundingDetailCommunityPage">커뮤니티</a></li>
            </ul>
            <div id="rewardModal" class="hide">
                <!-- <dl>
                    <dt>99,000<b>원</b></dt>
                    <dd>3,000명이 선택</dd>
                    <dd>&#91;쏘펀한정&#93; 올인원 패키지 1 + 1 	&#40;99종&#41;</dd>
                    <dd>
                        &lt;쏘펀 입점 기념 이벤트&gt;<br>
                        친구들 다섯명과 함께 하면 최대 혜택&#33;&#33;<br>
                        5개 구성 세트 중 택1<br>
                        &#8226; 15소년 표류기 1개<br>
                        &#8226; 본품 2ea<br>
                        &#8226; 정상가 118,000원 쏘펀 혜택 53,900원<br>
                        &#8226; 1ea당 26,950원<br>
                        &#8226; 구매시 배수구클리너 1봉 선물 증정
                    </dd>
                    <dd><span>남은 수량</span> 300개</dd>
                    <dd><span>발송 예정일</span> 2023. 06. 19 월요일 예정</dd>
                </dl>-->
            </div>
        </div>

        <!--여기부터 탭별로 변경 필요!-->

        <div class="row section2" id="content">
            <div class="input">
                <!-- <input type="text" id="reviewInput" placeholder="리뷰를 남겨보세요!">
                <input type="button" value="작성하기" id="reviewSubmit"> -->
            </div>
            
            </div>
        </div>
		
	</div>
	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>
	
</body>
</html>
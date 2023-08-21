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
<link rel="stylesheet" href="../../resources/css/funding_detailNotice.css">
<script src="../../resources/js/funding_detailNotice.js"></script>
</head>
<body>
<input type="hidden" id="funding_id" value="${funding_id}">
<input type="hidden" id="funding_notice_id" value="${funding_notice_id}">
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
                <li id="notice"><a class="activeTab" href="./fundingDetailNoticeListPage">공지사항</a></li>
                <li id="community"><a href="./fundingDetailCommunityPage">커뮤니티</a></li>
            </ul>
            <div id="rewardModal" class="hide">

            </div>
        </div>

        <!--여기부터 탭별로 변경 필요!-->

        <div class="row section2" id="content">

        </div>
		
	</div>
	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>
	
</body>
</html>
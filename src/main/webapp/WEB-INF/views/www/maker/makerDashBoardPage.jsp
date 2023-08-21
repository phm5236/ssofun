<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <link rel="stylesheet" href="../../resources/css/maker_dashBoard.css">

</head>

<body>
    <div id="sidebarBg">
        <ul id="sidebarName">
            <li>SSOFUN</li>
            <li id="sidebarHide"><i class="bi bi-caret-left-fill"></i></li>
            <li id="sidebarShow" class="hide"><i class="bi bi-caret-right-fill"></i></li>
            <li>MAKER STUDIO</li>
        </ul>
        <ul id="fixedSidebar">
            <li><a href="./makerProjectRegisterPage">프로젝트 관리</a></li>
            <li><a href="./makerOrderListPage">주문 · 배송 현황</a></li>
            <li class="click"><a class="active" href="./makerDashBoardPage">대시보드</a></li>
            <li><a href="./makerNoticeListPage">공지사항 관리</a></li>
            <li><a href="./makerCommunityListPage">커뮤니티 관리</a></li>
        </ul>
        <p id="goOut">나가기<i class="bi bi-box-arrow-right" id="out"></i></p>
    </div>


	<div class="container text-center">	

        <div class="section">
            <div id="dashTopBox">
                <h3>대시보드</h3>     
                <h5>모공피지99%세정ㅣ쌀뜨물 세안, 클렌징 반죽으로 매일하면 확 뽀얘져요.</h5> 
                <ul id="fundingDate">
                    <li>시작일 : 2023년 7월 15일</li>
                    <li>종료일 : 2023년 9월 1일</li>
                </ul>
                <div id="totalBox">
                    <ul>
                        <li class="paymentTotal">총 후원금액<span>156,245,840원</span></li>
                        <li class="archiveTotal">달성률<span>5115%</span></li>
                        <li class="supportTotal">후원자 수<span>800명</span></li>
                        <li class="remainingDate">남은 기간<span>14일</span></li>
                    </ul>          
                </div>
            </div>

        </div>

        <div class="section2 chartSection">
            <div id="genderAndAgdChartBox">
                <div class="genderWrap">
                    <p>성별 비율</p>
                    <canvas id="genderSection"></canvas>
                </div>
                <div class="ageWrap">
                    <p>연령별 비율</p>
                    <canvas id="ageSection">
                        
                    </canvas>
                </div>               
            </div>

            <div id="supportTotalChartBox">
                <div class="dayTotalWrap">
                    <p>펀딩 일별 결제 현황</p>
                    <canvas id="daySection"></canvas>
                </div>
                <div class="dayTotalWrap">
                    <p>펀딩 누적 결제 현황</p>
                    <canvas id="totalSection"></canvas>
                </div>
            </div>
        </div>


	</div>
   	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>
	    <script src="../../resources/js/maker_dashboard.js"></script>
</body>
</html>
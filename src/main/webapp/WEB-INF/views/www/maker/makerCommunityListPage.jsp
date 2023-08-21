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

    <link rel="stylesheet" href="../../resources/css/maker_communityList.css">

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
            <li><a href="./makerDashBoardPage">대시보드</a></li>
            <li><a href="./makerNoticeListPage">공지사항 관리</a></li>
            <li class="click"><a class="active" href="./makerCommunityListPage">커뮤니티 관리</a></li>
        </ul>
        <p id="goOut">나가기<i class="bi bi-box-arrow-right" id="out"></i></p>
    </div>

    <div id="communityAnswerModalBg" class="hide">
        <ul class="hide">
            <li>답변하기</li>
            <li>작성자</li>
            <li>내용</li>
            <li>
                <textarea name="contents" id="contents"></textarea>
            </li>
            <li>
                <input type="button" id="communityAnswerBtn" value="등록">
                <input type="hidden" id="funding_review_id" value="">
                <input type="button" id="cancleBtn" value="취소">
            </li>
        </ul>
    </div>


	<div class="container text-center">	

        <div class="section">
            <div id="communityTabBox">
                <h5>커뮤니티 관리</h5>                
            </div>


            <div id="sortSelect">
                <ul id="tabBox">
                    <li class="all click">전체 보기</li>
                    <li class="answerBefore">답변 전</li>
                </ul>
                <select name="sort" id="sort">
                    <option value="create_at" selected>등록일순</option>
                    <option value="orderDateAsc">주문일역순</option>
                    <option value="orderDateAsc">주문일역순</option>
                    <option value="orderDateAsc">총 결제금액순</option>
                </select>
                <select name="showAmount" id="showAmount">
                    <option value="10">10개씩보기</option>
                    <option value="20">20개씩보기</option>
                    <option value="30">30개씩보기</option>
                    <option value="50">50개씩보기</option>
                    <option value="100">100개씩보기</option>
                </select>
                <input type="button" value="삭제" id="chedckDeleteBtn">
            </div>

            <div id="orderList">
                <table>
                    <thead>
                        <tr>
                            <th class="checkBox"><input type="checkbox" name="allCheck" id="allCheck"></th>
                            <th class="no">NO</th>
                            <th class="contents">내용</th>
                            <th class="writer">작성자</th>
                            <th class="comment">댓글수</th>
                            <th class="createDate">등록일</th>
                            <th class="answerStatus">답변상태</th>
                            <th class="answer">답변하기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="funding_notice_id" class="funding_notice_id" value="펀딩공지아이디값 들어가야함"></td>
                            <td><a href="">1</a></td> <!-- funding_order_id를 임시로 넣기-->
                            <td><a href="">title</a></td>
                            <td>김하늘</td>
                            <td>5</td>
                            <td>2023-07-13</td>
                            <td>-</td>
                            <td>
                                <input type="button" value="답변" class="answerbtn">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="paging">
                <ul>
                    <li>&lt;</li>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>6</li>
                    <li>7</li>
                    <li>8</li>
                    <li>9</li>
                    <li>10</li>
                    <li>&gt;</li>
                </ul>
            </div>

        </div>

	</div>
   	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>
	    <script src="../../resources/js/maker_communityList.js"></script>
</body>
</html>
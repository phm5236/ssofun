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

    <link rel="stylesheet" href="../../resources/css/maker_orderList.css">

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
            <li class="click"><a class="active" href="./makerOrderListPage">주문 · 배송 현황</a></li>
            <li><a href="./makerDashBoardPage">대시보드</a></li>
            <li><a href="./makerNoticeListPage">공지사항 관리</a></li>
            <li><a href="./makerCommunityListPage">커뮤니티 관리</a></li>
        </ul>
        <p id="goOut">나가기<i class="bi bi-box-arrow-right" id="out"></i></p>
    </div>

    <div id="deliveryCompanyModalBg" class="hide">
        <ul class="hide">
            <li>택배사 선택</li>
            <li>
                <select name="delivery_company_id" id="delivery_company_id">
                    <option value="none">택배사 선택</option>
                </select>
            </li>
            <li>
                <input type="button" id="deliveryCompanyBtn" value="등록">
                <input type="hidden" id="funding_order_id" value="">
                <input type="button" id="cancleBtn" value="취소">
            </li>
        </ul>
    </div>


	<div class="container text-center">	

        <div class="section">
            <div id="orderDeliveryStatusBox">
                <h5>주문 · 배송 현황</h5>
                <ul id="statusBox">
                    <li class="click">전체<span>50</span></li>
                    <li>상품 준비 중<span>36</span></li>
                    <li>배송 대기 중<span>2</span></li>
                    <li>배송 중<span>0</span></li>
                    <li>배송 완료<span>1</span></li>
                    <li>수령 완료<span>4</span></li>
                    <li>구매 확정<span>9</span><span id="lately">최근 7일</span></li>
                </ul>
            </div>

            <div id="sortOrder">
                <dl id="searchSection">
                    <dt>검색</dt>
                    <dd id="searchBox">
                        <select name="selectName" id="selectName">
                            <option value="none">검색 항목 선택</option>
                            <option value="funding_order_status_id">주문 상태</option>
                            <option value="funding_order_code">주문번호</option>
                            <option value="invoice_no">운송장번호</option>
                            <option value="user_name">주문자명</option>
                            <option value="funding_title">펀딩명</option>
                            <option value="funding_code">펀딩코드</option>
                        </select>
                    </dd>
                    <dd id="orderStatusSelectBox" class="">
                        <select name="funding_order_status_id" id="funding_order_status_id">
                            <option value="none">상세 조건 선택</option>
                            <option value="1">결제대기</option>
                            <option value="2">주문취소</option>
                            <option value="3">결제완료</option>
                            <option value="5">배송중</option>
                            <option value="6">배송완료</option>
                            <option value="7">구매확정</option>
                        </select>
                    </dd>
                    <dd>
                        <input type="text" id="searchWord">
                    </dd>
                </dl>
                <dl dir="dateSection">
                    <dt>기간</dt>
                    <dd id="dateBox">
                        <input type="date" id="startDate"> ~ 
                        <input type="date" id="closeDate">
                    </dd>
                </dl>
                <div id="btnBox">
                    <input type="button" value="검색" id="searchBtn">
                    <input type="button" value="초기화" id="resetBtn">
                </div>
            </div>

            <div id="sortSelect">
                <select name="orderSort" id="orderSort">
                    <option value="orderDate" selected>주문일순</option>
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
                <input type="button" value="주문취소" id="cancleOrderBtn">
            </div>

            <div id="orderList">
                <table>
                    <thead>
                        <tr>
                            <th class="checkBox"><input type="checkbox" name="allCheck" id="allCheck"></th>
                            <th class="order_date">주문일(결제일)</th>
                            <th class="order_id">주문번호</th>
                            <th class="user_name">주문자</th>
                            <th class="title">상품명</th>
                            <th class="totalPrice">총 결제금액</th>
                            <th class="payment_status">결제상태</th>
                            <th class="delivery_status">배송상태</th>
                            <th class="approvalBtn">승인버튼</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- <tr>
                            <td><input type="checkbox" name="funding_id" class="funding_id" value="펀딩아이디값 들어가야함"></td>
                            <td>2023-07-13</td>
                            <td><a href="">54</a></td> //funding_order_id를 임시로 넣기
                            <td>김하늘</td>
                            <td><a href=""><img src="" alt="">title</a></td>
                            <td>KRW 5,000</td>
                            <td>결제완료</td>
                            <td>상품 준비 중</td>
                            <td><input type="button" value="제품 출고" class="deliveryBtn"></td>
                        </tr> -->
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
	    <script src="../../resources/js/maker_orderList.js"></script>
</body>
</html>
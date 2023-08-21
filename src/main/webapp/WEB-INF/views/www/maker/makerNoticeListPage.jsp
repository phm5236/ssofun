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

    <link rel="stylesheet" href="../../resources/css/maker_noticeList.css">

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
            <li class="click"><a class="active" href="./makerNoticeListPage">공지사항 관리</a></li>
            <li><a href="./makerCommunityListPage">커뮤니티 관리</a></li>
        </ul>
        <p id="goOut">나가기<i class="bi bi-box-arrow-right" id="out"></i></p>
    </div>


	<div class="container text-center">	

        <div class="section">
            <div id="noticeBox">
                <h5>공지사항 등록</h5>
                <div id="noticeWriteBox">
                    <ul id="wirteSection">
                        <!-- <li class="subtitle">공지사항 등록</li> -->
                        <li class="title">
                            <input type="text" id="title" placeholder="제목을 입력하세요.">
                        </li>
                        <li class="contents">
                            <textarea name="contents" id="contents" placeholder="내용을 입력하세요."></textarea>
                        </li>
                        <li class="submit">
                            <input type="button" value="등록하기" id="noticeSubmitBtn">
                            <input type="button" id="noticeUpdateBtn" value="수정" class="hide">
                            <input type="button" id="noticeUpdateCancleBtn" value="취소" class="hide">
                            <input type="hidden" id="funding_notice_id" value="">
                        </li>
                    </ul>
                    <ul id="writeGuideSection">
                        <li class="wiriteGuide">
                            공지사항 작성 가이드
                            <span>
                                활발하고 진정성 있는 소통은 후원자의 신뢰를 얻는 가장 중요
                                한 요소입니다. 프로젝트의 진행과정 동안 꾸준한 업데이트를
                                동해 후원자들과 소통해주세요.
                            </span>
                        </li>
                        <li class="tip">
                            공지사항 팁
                            <span>· 달성 현황을 공유하고 감사의 인사를 전해 보세요.</span>
                            <span>· 달성 전이라면 더 많은 주변 홍보를 독려해보세요.</span>
                            <span>· 후원 인증이나 SNS 홍보 이벤트를 진행해보세요.</span>
                            <span>· 상세 사양이나 추가 콘텐츠를 공유해 보세요.</span>
                            <span>· 프로젝트의 제작 과정을 상세히 공유해 보세요.</span>
                        </li>
                        <li  class="note">
                            <i class="bi bi-exclamation-circle"></i> 유의사항
                            <span>· 제작 계획이 늦어지거나 변경된다면 알려주세요.</span>
                            <span>· 공지사항이 게시되면 모든 후원자들에게 알림이 발송됩니다.</span>
                            <span>· 후원자의 댓글을 주기적으로 확인해주세요.</span>
                            <span>· 개인정보가 노출되지 않도록 유의해주세요.</span>
                            <span>· 민감한 내용에 관한 업데이트가 필요하다면, 쏘펀 헬프센터와 상의해보세요.</span>
                            <span>· 쏘펀 커뮤니티 운영원칙을 준수해주세요.</span>
                        </li>
                    </ul>

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
                <input type="button" value="삭제" id="checkedDeleteBtn">
            </div>

            <div id="orderList">
                <table>
                    <thead>
                        <tr>
                            <th class="checkBox"><input type="checkbox" name="allCheck" id="allCheck"></th>
                            <th class="no">NO</th>
                            <th class="title">제목</th>
                            <th class="commend">댓글수</th>
                            <th class="createDate">등록일</th>
                            <th class="updateAndDelete">수정 / 삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="funding_notice_id" class="funding_notice_id" value="펀딩공지아이디값 들어가야함"></td>
                            <td><a href="">1</a></td> <!-- funding_order_id를 임시로 넣기-->
                            <td><a href="">title</a></td>
                            <td>5</td>
                            <td>2023-07-13</td>
                            <td>
                                <input type="button" value="수정" class="updatebtn">
                                <input type="button" value="삭제" class="deleteBtn">
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
	    <script src="../../resources/js/maker_noticeList.js"></script>
</body>
</html>
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

    <link rel="stylesheet" href="../../resources/css/maker_my.css">

</head>

<body>

    <!--헤더 영역-->
   	<jsp:include page="../../include/fundingHeader.jsp"/>

    <div id="topBg"></div>
    <div class="section" id="height">
        <div class="myPage">
            <div class="fakeSection">
                <ul id="myPageTab">
                    <li><a>서포터</a><i class="bi bi-caret-down-fill"></i></li>
                    <li class="click"><a class="click">창작자</a><i class="bi bi-caret-down-fill click"></i></li>
                </ul>
            </div>
            
            <div id="myPageSection">
                <div id="profile">
                    <ul>
                        <li id="profileIcon"><span></span></li>
                        <li id="makerName">쏘펀 창작자님</li>
                        <li id="biz">개인 사업자</li>
                        <!--여기에 메뉴 넣으세요!-->
                        <li id="projectBtn">프로젝트 만들기</li>
                        <li id="logout">로그아웃</li>
                    </ul>
                </div>
                <div id="contents">
                    <div id="leftBorder">
                        <div id="subTitle">
                            <h5>만든 프로젝트<span>5</span></h5>
                            <!-- <input type="button" value="프로젝트 만들기" id="projectRegisterBtn"> -->
                        </div>
                        <div id="list">
                            <!-- <div class="projectWrap">
                                <i class="bi bi-three-dots-vertical"></i>
                                <span class="projectDelete hide">삭제</span>
                                <a class="project" href="./makerProjectRegisterPage?funding_id=1">
                                    <ul>
                                        <li class="img"><img src="../IMG/펀딩_섬네일.webp" alt=""></li>
                                        <li class="title">[두번째 프로젝트] 덕질가방, 이제 크로스백으로 돌아왔다!</li>
                                        <li class="status">심사 중</li>
                                    </ul>
                                </a>
                            </div> -->
                            

                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>
   	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>
	    <script src="../../resources/js/maker_my.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link href="../../resources/css/user_my.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/productReviewPage.css" rel="stylesheet"
	type="text/css">



</head>
<body>


	<jsp:include page="../../include/fundingHeader.jsp" />
	<div id="topBg"></div>
	<div class="section zIndex">
		<div class="myPage">
			<div class="fakeSection">
				<ul id="myPageTab">
					<li class="click"><a class="click" href="">서포터</a><i
						class="bi bi-caret-down-fill click"></i></li>
					<li><a href="">창작자</a><i class="bi bi-caret-down-fill"></i></li>
				</ul>
			</div>

			<div id="myPageSection">
				<div id="profile">
					<ul id="first">
						<li id="profileIcon"><span></span></li>
						<li id="makerName">${sessionUser.name }님</li>	
						<li id="logoutUser">로그아웃</li>
					</ul>
					<dl>
						<dt>나의 쇼핑 내역</dt>
						<!--중분류명 넣으면 됩니다-->
						<dd class="click">
							<a class="click" href="./orderListPage">주문목록</a><i
								class="bi bi-caret-right-fill click"></i>
						</dd>
						<!--여기에 메뉴 넣으세요!-->
						<dd class="click">
							<a href="./readQnaPage">문의내역</a><i
								class="bi bi-caret-right-fill"></i>
						</dd>
						<!--여기에 메뉴 넣으세요!-->
						<dd class="click">
							<a href="./cartPage">장바구니</a><i
								class="bi bi-caret-right-fill"></i>
						</dd>
						<!--여기에 메뉴 넣으세요!-->
					</dl>

					<dl>
						<dt>나의 펀딩 내역</dt>
						<dd>
							<a href="">후원한 프로젝트</a><i class="bi bi-caret-right-fill"></i>
						</dd>
						<dd>
							<a href="">프로젝트 후기</a><i class="bi bi-caret-right-fill"></i>
						</dd>
					</dl>
				</div>
				<div id="contents">
					<div id="leftBorder">
						<div id="subTitle">
							<h5>문의하기</h5>
						</div>
						<div id="list">
							<!--리스트 영역-->

							<form action="./productQnaProcess" class="mb-3" id="myform" method="post"
								enctype="multipart/form-data">
								<div class="my-review">
									<div class="review-table">
										<div class="re-img">
											<img src="../../resources/img/parkhyunmin/thumbnail/${rev.thumbnail_name}"
												style="width: 80px; height: 80px;">
										</div>
										<div class="pname">${rev.product_name }</div>
										
									</div>
									
									<div class="detail-review">
										<div class="review-table">
											<div class="re-title">문의 제목</div>
											<div class="re-content">
												<textarea class="col-auto form-control" id="reviewtitle" name="title"
												placeholder="제목을 입력해 주세요."	></textarea>
											</div>
										</div>
									</div>
									

									<div class="detail-review">
										<div class="review-table">
											<div class="re-title">문의 내용</div>
											<div class="re-content">
												<textarea class="col-auto form-control" id="reviewContents" name="contents"
												placeholder="내용을 입력해 주세요."	></textarea>
											</div>
										</div>
									</div>

									
									
									<div class="review-register">
									<input type="hidden" name="admin_id" value="${rev.admin_id }" readonly/>
									<input type="hidden" name="biz_id" value="${rev.biz_id }" readonly/>
										<input type="hidden" name="poiID" id="product_Order_Id" readonly/>
										<a href="./orderListPage"><input type="button" class="cancel-button" value="취소하기"></a>
										<button class="submit-button">등록하기</button>
									</div>
								</div>
							</form>


						</div>

					</div>
				</div>

			</div>

		</div>
		</div>

<script>

// 파일 선택이 변경되었을 때 파일 이름들을 표시합니다.
$(document).ready(function() {
  $('#file-input').change(function() {
    var fileNames = '';
    var files = $(this).prop('files');
    
    for (var i = 0; i < files.length; i++) {
      fileNames += files[i].name + '<br>';
    }
    
    $('#file-name-display').html(fileNames);
  });
});

//URL에서 id 값을 추출하여 productId input 요소의 value에 설정
var url = new URL(window.location.href);
var id = url.searchParams.get("id");
document.getElementById("product_Order_Id").value = id;
</script>
		<script src="../../resources/js/user_my.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">


		<title>공지사항</title>

		<style>
			.section {
				width: 1200px;
				margin: 0 auto;
			}

			/* 부트스트랩 사용하면 마진이 알아서 적용돼서 마진을 0으로 해서 없앰! */
			#navbar{margin: 0; } 
			/* 네비바 바로 밑 자식요소들에 스타일 적용 !  */
			#navbar>div{height: 100px; line-height: 100px;}



			/* nav 스타일  
			.d-flex.flex-row.mb-3 {
				color: black;
				font-weight: 545;
				font-size: 24px;
				width: 267px;
				height: 29px;
				/* display: flex;
    align-items: center;
    justify-content: center; 

			}*/

			/* LOGO 탭 스타일 
			.logo-link {
				background-color: #D9D9D9;
				/* display: flex;
    align-items: center;
    justify-content: center; 
			}

			.d-flex.flex-row-reverse {
				color: black;
				font-weight: 545;
				font-size: 24px;
				width: 156px;
				height: 29px;
				margin-top: 0;

				/* display: flex;
    align-items: center;
    justify-content: center; 

			}*/

			/* .nav-link {
   
    font-family : Inter;
   
    display: flex;
    align-items: center;
    justify-content: center;
  	} */


			/* 검색창 스타일  */
			/* 검색창 뒷배경 스타일 */

			/* .container {
	   max-width: 1519.2px;
	   width: 100%;
	   padding: 0;
	   margin-left: auto;
	   margin-right: auto;
	 } */

			.search-container {
				background-color: #D9D9D9;
				height: 300px;
				max-width: 1519.2px;
				width: 100%;
				display: flex;
				align-items: center;
				justify-content: flex-start;
				margin-left: auto;
				margin-right: auto;
			}



			/* 검색창 줄글 스타일 */
			.bold-text {
				font-weight: 545;
				font-size: 20px;
				margin-bottom: 10px;
			}

			/* 실질 검색창 스타일 */
			input {
				width: 400px;
				height: 40px;
				border: 1px solid #000000;
				border-radius: 0px;
				padding: 10px 12px;
				color: #BFBFBFFB;
				font-size: 12px;
				font-family: Noto Sans KR;
				text-align: left;
				padding-left: 20px;
			}

			.search-button {
				background-image: url('https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png');
				background-size: contain;
				background-repeat: no-repeat;
				background-position: center;
				background-color: white;
				width: 18px;
				height: 18px;
				top: 268px;
				left: 739px;
				padding: 3px;
				border: none;
				margin-left: -40px;
			}



			/* 고객센터 스타일  */


			.first-container {
				width: 200px;
				height: 262px;
				top: 451px;
				left: 360px;

			}


			/*고객센터 타이틀 스타일  */
			.customer-title {
				margin-top: 50px;
				margin-bottom: 10px;
				margin-left: 10px;
				font-weight: bold;
				font-family: Noto Sans KR;
			}

			/* 고객센터 리스트 */

			.low-container {
				height: 800px;
			}

			.first-ul {
				width: 200px;
				height: 227px;
				top: 486px;
				left: 360px;
				list-style-type: none;
				border: 1px solid #D6D6D6;
				padding: 0;
				margin: 0;
				display: flex;
				flex-direction: column;
				align-items: left;
			}

			.first-list {
				margin-top: 20px;
				margin-left: 35px;
				font-size: 14px;
				font-weight: 545;
			}

			.divider {
				margin-top: 10px;
				margin-left: 35px;
				width: 125px;
				border-top: 1px solid #E9E9E9;
			}


			.second-ul {
				width: 200px;
				height: 214px;
				top: 745px;
				left: 360px;
				list-style-type: none;
				border: 1px solid #D6D6D6;
				padding: 0;
				margin: 0;
				display: flex;
				flex-direction: column;
				align-items: left;
			}

			.list-1 {
				margin-top: 20px;
				margin-left: 35px;
				font-size: 14px;
				font-weight: 545;
				letter-spacing: 0em;
				color: #333333;
			}

			.list-2 {
				margin-top: 5px;
				margin-left: 35px;
				font-size: 20px;
				font-weight: bold;
				color: #333333;
			}

			.list-3 {
				margin-top: 10px;
				margin-left: 35px;
				font-size: 14px;
				color: #666666;
			}

			.list-4 {
				margin-left: 55px;
				list-style-type: disc;
				font-size: 14px;
				color: #666666;
			}

			.list-5 {
				margin-top: 10px;
				margin-left: 35px;
				font-size: 14px;
				color: #666666;
			}

			.list-6 {
				margin-left: 55px;
				list-style-type: disc;
				font-size: 14px;
				color: #666666;
			}


			.list-group-item {
				border-bottom: 1px solid #CCCCCC;
				padding: 15px 12px;
			}


			/* 공지사항 리스트 스타일 */
			.notice-title {
				margin-top: 50px;
				margin-bottom: 10px;
				margin-left: 10px;
				font-weight: bold;
				font-family: Noto Sans KR;
			}





			/*footer 스타일  */
			.footer {
				max-width: 1519.2px;
				width: 100%;
				height: 70px;
				padding: 0;
				margin-left: auto;
				margin-right: auto;
				background: #D9D9D9;
				font-family: Inter;
				font-size: 24px;
				font-weight: 400;
				line-height: 29px;
				letter-spacing: 0em;
				display: flex;
				justify-content: center;
				align-items: center;
				text-align: center;
			}
		</style>



	</head>


	<body>

		<div class="container">

			<div class="section">

				<!--네비바 -->
				<div class="row d-flex text-center" id="navbar">
					<div class="col-1">
						<a class="nav-link logo-link" aria-current="page" href="#">LOGO</a>
					</div>
					<div class="col-1">
						<a class="nav-link" aria-current="page" href="#">펀딩</a>
					</div>
					<div class="col-1">
						<a class="nav-link" aria-current="page" href="#">스토어</a>
					</div>
					<div class="col-1 ms-auto">
						<a class="nav-link" aria-current="page" href="#">로그인</a>
					</div>
					<div class="col-1">
						<a class="nav-link" aria-current="page" href="#">고객센터</a>
					</div>
				</div>


				<!--검색창 -->
				<div class="row search-container">
					<div class="col-2"></div>
					<div class="col-8">
						<div class="row">
							<div class="col bold-text">쏘펀 고객센터입니다.</div>
						</div>
						<div class="row">
							<div class="col bold-text">어떤 도움이 필요하세요?</div>
						</div>
						<div class="row">
							<div class="col search">
								<input type="text" placeholder="자주 찾는 질문을 검색해보세요!"></input>
								<button type="submit" class="search-button"></button>
							</div>
						</div>
					</div>
					<div class="col-2"></div>
				</div>


				<!-- 하단부 부분-->
				<div class="row low-container">
					<div class="col-2"></div>

					<!--고객센터 리스트 -->
					<div class="col-2">
						<div class="first-container">
							<div class="customer-title">고객센터</div>
							<ul class="first-ul">
								<li class="first-list">공지사항</li>
								<li class="divider"></li>
								<li class="first-list">자주찾는질문</li>
								<li class="divider"></li>
								<li class="first-list">이용약관</li>
								<li class="divider"></li>
								<li class="first-list">1:1 문의하기</li>
							</ul>
						</div>

						<div class="row mb-4">
							<div class="col"></div>
						</div>

						<!--고객센터 안내 -->
						<div class="second-container">
							<ul class="second-ul">
								<li class="list-1">쏘펀 고객센터 안내</li>
								<li class="list-2">02-123-7798</li>
								<li class="divider"></li>
								<li class="list-3">평일(월-금)</li>
								<li class="list-4">09:00~18:00 운영</li>
								<li class="list-5">휴일(토,일), 공휴일</li>
								<li class="list-6">10:00~15:00 운영</li>
							</ul>
						</div>
					</div>

					<!--공지사항 게시물 부분  -->
					<div class="col-6">
						<div class="notice-title">공지사항</div>
						<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill"
									data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
									aria-selected="true">Home</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
									data-bs-target="#pills-profile" type="button" role="tab"
									aria-controls="pills-profile" aria-selected="false">Profile</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill"
									data-bs-target="#pills-contact" type="button" role="tab"
									aria-controls="pills-contact" aria-selected="false">Contact</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill"
									data-bs-target="#pills-disabled" type="button" role="tab"
									aria-controls="pills-disabled" aria-selected="false" disabled>Disabled</button>
							</li>
						</ul>
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-home" role="tabpanel"
								aria-labelledby="pills-home-tab" tabindex="0">...</div>
							<div class="tab-pane fade" id="pills-profile" role="tabpanel"
								aria-labelledby="pills-profile-tab" tabindex="0">...</div>
							<div class="tab-pane fade" id="pills-contact" role="tabpanel"
								aria-labelledby="pills-contact-tab" tabindex="0">...</div>
							<div class="tab-pane fade" id="pills-disabled" role="tabpanel"
								aria-labelledby="pills-disabled-tab" tabindex="0">...</div>
						</div>

						<table class="table">
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Mark</td>
									<td>Otto</td>
									<td>@mdo</td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td colspan="2">Larry the Bird</td>
									<td>@twitter</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="col-2"></div>
				</div>


				<!-- FOOTER -->
				<div class="row">
					<div class="col- footer">FOOTER(미정)</div>
				</div>



			</div>


			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
				crossorigin="anonymous"></script>
	</body>

	</html>
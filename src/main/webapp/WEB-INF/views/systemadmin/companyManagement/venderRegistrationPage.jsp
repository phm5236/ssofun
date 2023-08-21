<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 주소찾기 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/systemAdminMain.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ssofuncss.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminCompanyManagement.css">
	<!-- <script type="text/javascript"> </script>-->


<style>


</style>
<script>
document.addEventListener("DOMContentLoaded", function () {
    // 파일 입력 요소 가져오기
    var fileInput = document.getElementById("file_input_id");
    // 썸네일 컨테이너 요소 가져오기
    var thumbnailContainer = document.getElementById("thumbnail_container");

    // 파일이 선택되었을 때 썸네일 생성 및 보여주기
    fileInput.addEventListener("change", function (event) {
      var file = event.target.files[0];

      // FileReader를 사용하여 파일을 읽습니다.
      var reader = new FileReader();

      reader.onload = function (event) {
        // 썸네일 이미지 요소 생성 및 설정
        var thumbnailImage = document.createElement("img");
        thumbnailImage.src = event.target.result;
        thumbnailImage.classList.add("thumbnail"); // 썸네일에 스타일을 적용하려면 클래스를 추가할 수 있습니다.

        var thumbnailDiv = document.createElement("div");
        thumbnailDiv.style.width = "100px"; // 썸네일의 가로 크기
        thumbnailDiv.style.height = "100px"; // 썸네일의 세로 크기
       
        thumbnailDiv.style.overflow = "hidden"; // 이미지를 넘치지 않도록 설정
        
        thumbnailImage.style.width = "100%";
        thumbnailImage.style.height = "100%";
        thumbnailImage.style.objectFit = "cover";
        
        thumbnailDiv.appendChild(thumbnailImage);
  
        // 썸네일을 썸네일 컨테이너에 추가합니다.
        thumbnailContainer.innerHTML = ""; // 기존 썸네일 삭제
        thumbnailContainer.appendChild(thumbnailDiv);
  	
        
      };

      // 파일을 Data URL로 변환하여 썸네일 생성
      reader.readAsDataURL(file);
    });
  });




</script>
<title>venderRegistrationPage</title>
</head>

<body>





        <!--고객센터 기본 틀 -->
         <div class="container container2" style="margin-top: 0px;">
        <div class="row">
            <jsp:include page="../../include/systemAdminNavi.jsp"></jsp:include>
        </div>
            <div class="row">
                 <div class="col-2">
                    <div class="row leftside1">
                        <div class="col">
                            <div class="row" style="height: 30px;"></div>
                            <div class="row" style="height: 100px;">
                                <div class="col"></div>
                                <div class="col">
                                    <div class="box adminimagecol" style="background-image:url('/resources/img/kimhaneul/companyManagement/systemadmin1.jpg'); background-repeat:no-repeat; background-size:100% 100%;"><img class="adminImage"></div>
                                </div>
                                <div class="col"></div>
                            </div>
                            <div class="row mt-2 adminid">
                                <div class="col">${systemAdmin.admin_nickname} 님 <span><i class="bi bi-circle-fill" style="color:green"></i></span></div>
                            </div>
                            <div class="row mb-3"></div>
                        </div>
                    </div>
                    <div class="row leftside2 ">
                        <div class="col leftsidefontstyle1">NAVIGATION</div>
                    </div>
                       <div class="row leftside3">
                        <div class="col-1"></div>
                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    <div class="row mt-3">
                                        <div class="col">
                                            <i class="bi bi-building text-light" style="margin-right: 5px;"></i>
                                            <a class="leftsidepontstyle1" href="../../systemadmin/companyManagement/companyManagementMainPage" style="font-size: 18px;">업체관리관리</a>
                                        </div>
                                    </div>
                                     <div class="row mt-1">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col">
                                                    <!--<i class="bi bi-building text-light" style="margin-right: 5px;"></i>-->
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/companyManagement/companyManagementMainPage"> 입점사관리</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col">
                                                    <!--<i class="bi bi-building text-light" style="margin-right: 5px;"></i>-->
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/companyManagement/venderManagementMainPage"  style="color: #fff; font-weight: bold;"> 판매자관리</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="row mt-5">
                                        <div class="col">
                                            <i class="bi bi-globe-americas text-light" style="margin-right: 5px;"></i>
                                            <a class="leftsidepontstyle1" href="../../systemadmin/siteManagement/fundingManagementPage" style="font-size: 18px;">사이트관리</a>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col">
                                                    <!--<i class="bi bi-building text-light" style="margin-right: 5px;"></i>-->
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/siteManagement/fundingManagementPage">펀딩</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>    
                                    <div class="row mt">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-3"></div>
                                                <div class="col">
                                                    <!--<i class="bi bi-building text-light" style="margin-right: 5px;"></i>-->
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/siteManagement/fundingManagementPage"> 승인관리</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-3"></div>
                                                <div class="col">
                                                    <!--<i class="bi bi-building text-light" style="margin-right: 5px;"></i>-->
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/siteManagement/fundingCategoryAddPage"> 카테고리관리</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-2">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col">
                                                    <!--<i class="bi bi-building text-light" style="margin-right: 5px;"></i>-->
                                                    <a class="leftsidepontstyle1" href="#"> 쇼핑몰</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-3"></div>
                                                <div class="col">
                                                    <!--<i class="bi bi-building text-light" style="margin-right: 5px;"></i>-->
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/siteManagement/shopCategoryAddPage"> 카테고리관리</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="row mt-5">
                                        <div class="col">
                                            <i class="bi bi-send-check text-light" style="margin-right: 5px;"></i>
                                            <a class="leftsidepontstyle1" href="../../systemadmin/systemAdminFaqMainPage" style="font-size: 18px;">고객센터관리</a>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col">
                                                    <!--<i class="bi bi-building text-light" style="margin-right: 5px;"></i>-->
                                                    <a class="leftsidepontstyle1" href="#"> 공지사항</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col">
                                                    <!--<i class="bi bi-building text-light" style="margin-right: 5px;"></i>-->
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/systemAdminFaqMainPage"> 자주찾는 질문</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col">
                                                    <!--<i class="bi bi-building text-light" style="margin-right: 5px;"></i>-->
                                                    <a class="leftsidepontstyle1" href="#"> 이용약관</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col">
                                                    <!--<i class="bi bi-building text-light" style="margin-right: 5px;"></i>-->
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/systemAdminQnaMainPage"> 1:1문의</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                    
                        </div>
                    </div>
                </div>

                <div class="col mt-3">
                    <div class="row mb-3">
                        <div class="col">
                            <nav class="navbar navbar-expand-lg bg-body-tertiary" style="height:54.98px">
                                <div class="container-fluid">
                                   
                                        <div class="col-2">
                                            <a class="navbar-brand text-black">판매자등록페이지</a>
                                        </div>

                                        <div class="col-6 d-flex align-items-center justify-content-end">
                                            
                                            <!-- <form class="d-flex" role="search">
                                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                                <button class="btn btn-outline-secondary" type="submit">Search</button>
                                            </form> -->
                                        </div>
                                 
                                </div>
                            </nav>
                        </div>
                    </div>

                    <!--안에 페이지 내용만 바꾸기-->
                    
                    
                    
                    
                    
                    
                    <div class="row" style="margin-left: 10px; height:500px">
                    
                        <div class="col">

                           	<div class="row">
                                <div class="col-2"><p class="three-font mt-1" style="margin-left: 10px;">판매자등록</p></div>
                                <div class="col c-five-font"><p class="five-font mt-2"><span class="star">*</span>표시는 필수입력사항입니다.</p></div>
                                <div class="col-2"></div>
                                <div class="col-2">
                            		
                            	</div>
                            </div>
                            
                            <div class="row" >
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>
                            
                            
                            
                            
                            <form action="../venderRegistrationProcess"  method="post">
                                
                            <div class="row">
                            	<div class="col">
                            		<div class="row" style="background-color:#F8F9FA; height:1000px; border-radius: 3%;">
		                            	<div class="col-2"></div>
		                            	<div class="col">
		
		                                    <div class="row mt-5">
		                                        <div class="col-2"></div>
		                                        <div class="col-2 mt-2 textcenter" >
		                                         <div class="row" id="thumbnail_container" >
                                                  	<div id="thumbnailDiv"></div>
                                                  </div>
		                                            <!-- <img src="/resources/companyManagement/exDog.jpg" alt="대표자" width="100px" height="100px"  style=" border-radius: 30%;"> -->
		                                        </div>
		                                        <div class="col">
		                                        	<div class="row mt-2">
		                                        		<div class="col">
		                                        			<p class="companyfont">사진등록</p>
		                                        		</div>
		                                        	</div>
		                                        	<div class="row mt-2">
		                                        		<div class="col">
		                                           			 <input type="file" name="qnaFiles" id="file_input_id" multiple accept="image/*">
		                            					</div>
		                                        	</div>
		                                        </div>
		                                    </div>
		                                                                		
		
		
		                            		<div class="row mt-2">
		                                        <div class="col-1"></div>
		                            			<div class="col-3 textcenter" >
		                            				<p class="companyfont" > 회사명</p>
		                            			</div>

		                            			<div class="col">
			                                           <c:choose>
		                    								<c:when test="${bizId == 0}"> 	
		                    									               
			                 										<select class="form-select"  name="biz_id" aria-label="Default select example">
																	  <option selected>입점업체를 선택해주세요.</option>
																		<c:forEach items="${bizList}" var="bizList"> 
																		  <option  value="${bizList.biz_id}">${bizList.biz_name}</option>
																		</c:forEach>
																	</select>
																
				                                            
				                                            </c:when>
				                                            <c:otherwise>
				                                           	 	<p class="companyfont">${bizDto.bizDto.biz_name}</p>
				                                           	 	<input type="hidden" name="biz_id" value="${bizDto.bizDto.biz_id}">
				                                           	 	
				                                            	<!-- biz_id받아서 bizDto에 네임받아오기 -->
				                                            
				                                            </c:otherwise>
	                   									</c:choose>
			                                            
		                                            
		                                            
		                            			</div>
		                            		</div>
		     		
		                            		<div class="row mt-2">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            				<p class="companyfont"><span class="star">*</span> 닉네임</p>
		                            			</div>
		                            			<div class="col">
		                                            <input type="text" name="admin_nickname" class="form-control" placeholder="닉네임을 입력해주세요." aria-label="companyName">
		                            			</div>
		                            		</div>
		                            		
		                            		<div class="row mt-2">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            				<p class="companyfont"><span class="star">*</span> 계정ID</p>
		                            			</div>
		                            			<div class="col">
													<input type="text" name="login_account" class="form-control" placeholder="생성할 계정명 입력해주세요." aria-label="companyName">		                            				
		                            			</div>
		                            		</div>
		                            		<div class="row mt-2">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            				<p class="companyfont"><span class="star">*</span> 비밀번호</p>
		                            			</div>
		                            			<div class="col">
													<input type="password" name="login_password" class="form-control" placeholder="비밀번호를 입력" aria-label="companyName">		                            				
		                            			</div>
		                            		</div>
		                            		<div class="row mt-2">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            				<p class="companyfont"><span class="star">*</span> 비밀번호확인</p>
		                            			</div>
		                            			<div class="col">
													<input type="password"  class="form-control" placeholder="비밀번호를 확인" aria-label="companyName">		                            				
		                            			</div>
		                            		</div>
		                            		<div class="row">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            			</div>
		                            			<div class="col">
		                            				<p class="companyfont-notes">비밀번호입력과 동일한 비밀번호를 입력해주세요.</p>
		                            			</div>
		                            		</div>
		                            		
		                            		<div class="row mt-3">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            				<p class="companyfont"><span class="star">*</span> 판매자번호</p>
		                            			</div>
		                            			<div class="col">
		                                            <div class="row">
		                            					<div class="col-3">
		                            						<!-- <input type="text" name="title" id="title" class="form-control" placeholder="010"> -->
		                            						<select class="form-select" name="admin_phone1" aria-label="Default select example">
															  <option selected>010</option>
															  <option value="02">02</option>
															  <option value="011">011</option>
															  <option value="031">031</option>
															</select>
		                            					</div>
		                            					<div class="col-1 textcenter"><p class="companyfont">-</p></div>
		                            					<div class="col-3">
		                            						<input type="text" name="admin_phone2" id="title" class="form-control" placeholder="1234">
		                            					</div>
		                            					<div class="col-1 textcenter"><p class="companyfont">-</p></div>
		                            					<div class="col-4">
		                            						<input type="text" name="admin_phone3" id="title" class="form-control" placeholder="1234" aria-label="companyName">
		                            					</div>
		                            				</div>
		                            			
		                            			
		                            			</div>
		                            		</div>
		                            		
		                            		<div class="row mt-2">
		                                        <div class="col-1"> </div>
		                            			<div class="col-3 textcenter">
		                                            <p class="companyfont">출고지주소</p>
		                            			</div>
		                            			<div class="col">
		                                            <input type="text"  id="adress" class="form-control" placeholder="서울 강남 테헤란로" aria-label="companyName">                                            
		                            			</div>
		                            			<div class="col-2" style="padding:0px;">
		                                            <input type="button" class="adressbutton"  value="우편번호찾기" aria-label="companyName">                                            
		                            			</div>
		                            		</div>
		                            				                            		
		                            		<div class="row mt-1">
		                                        <div class="col-1"> </div>
		                            			<div class="col-3 textcenter">
		                                        
		                            			</div>
		                            			<div class="col">
		                                            <input type="text" id="adress" class="form-control" placeholder="나머지주소" aria-label="companyName">                                            
		                            			</div>
		                            		</div>
		                            		
		                            		
		                            				                            		
		                            		<div class="row mt-3">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            				<p class="companyfont" style="font-size:17px"><span class="star">*</span> 통신판매업신고</p>
		                            			</div>
		                            			<div class="col">
		                 							<p class="companyfont" style="font-size:16px; font-color:#B3B8C3;">통신판매업에 신고하셨습니까?</p>                   				
		                            			</div>
		                            		</div>
		                            		
		                            		<div class="row mt-1">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            				
		                            			</div>
		                            			<div class="col">
		                            				<div class="row">
		                            					<div class="col">
		                            						<div class="form-check form-check-inline">
															  <input class="form-check-input" type="radio" name="admin_received_report" id="flexRadioDefault1" value="1" checked>
															  <label class="form-check-label" for="flexRadioDefault1">
															    신고함
															  </label>
															</div>
														</div>
														<div class="col">
															<div class="form-check form-check-inline">
															  <input class="form-check-input" type="radio" name="admin_received_report" id="flexRadioDefault2" value="0">
															  <label class="form-check-label" for="flexRadioDefault2">
															    신고안함
															  </label>
															</div>
														</div>
		                            				</div>                   				
		                            			</div>
		                            		</div>
		                            		<div class="row mt-2">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            				
		                            			</div>
		                            			<div class="col">
		                 							<p class="companyfont" style="font-size:16px">통신판매업 신고를 입력해주세요.</p>                   				
		                            			</div>
		                            		</div>
		                            		<div class="row mt-1">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            			</div>
		                            			<div class="col">
		                                            <input type="text" name="admin_report_description" class="form-control" placeholder="예시) 안양 제 12345호, 제 2009-충북-575858호" aria-label="companyName">
		                            			</div>
		                            		</div>
		                            		<div class="row mt-1">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            			</div>
		                            			<div class="col">
		                                            <p class="explanationfont">
		                                            	전자상거래 등에서의 소비자 보호에 관한 법률에 의해 사업자 회원의 경우를 통신판매업 신고 의무가 있습니다.
		                                            	통신판매업 신고대상임에도 불구하고 신고를 하지 아니한 자는 관련 법령에 따라 500만원 이하의 과태료가 부과되며 공정거래 위원회로부터 시정조치, 영업정지 등의 행정처분을 받을 수도 있습니다.
		                                            	2012년 8월 18일부터 개정, 시행되는 전자상거래 등에서의 소비자 보호에 관한 법률 시행령 제 12조 제1항 제3호에 따라 통신판매업 신고시 '결제대금예치'또는 '소비자피해보상보험 계약'체결을 증명하는 서류를 신고기관에 제출해야 통신판매업 신고를 할 수 있습니다.
		                                            	구매회원이 별도의 통신판매 사이트를 운영하지 않고, 당사와 같은 통신 판매 중개 형태의 오픈마켓에만 입점하여 통신 판매업을 영위하고자 할 경우, 당사가 제공하는 '구매안전 서비스 확인증'을 발급받아 통신판매업 신고 시 관계 기관에 제출하여 신고 절차를 완료할 수 있습니다.
		                                            </p> 
		                            			</div>
		                            		</div>
		                            		
		                          		
			                            	<div class="row mt-4">
				                            	<div class="col"></div>
				                            	<div class="col textcenter"><input type="submit" id ="qnaUserSubmit" class="qnaUserSubmit" value="등록하기"></div>
				                            	<div class="col"></div>
			                            	</div>
		                            	</div>
		                            	<div class="col-2"></div>
	                            	</div>
	                            </div>
                            </div>

                            
                            </form>
                            
                        </div>
                    </div>
    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    <div class="row mb-5">
                        <div class="col"> </div>
                    </div>
                    
                </div>
            </div>

            <div class="row mt-5">
                <div class="col"> </div>
            </div>
        </div>


    </div>
    <script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/js/all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/systemAdminMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ssofuncss.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminCompanyManagement.css">
    <!-- <script type="text/javascript"> </script>-->


<style>


</style>
<!DOCTYPE html>
<html>

<head>
    <!-- 필요한 스타일시트와 스크립트를 추가하세요. -->
</head>



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



</html>







<title>CompanyRegistrationPage</title>
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
                                                    <a class="leftsidepontstyleWhite" href="../../systemadmin/companyManagement/companyManagementMainPage" style="color: #fff; font-weight: bold;"> 입점사관리</a>
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
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/companyManagement/venderManagementMainPage"> 판매자관리</a>
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
                                            <a class="navbar-brand text-black">입점사등록페이지</a>
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
                                <div class="col-2"><p class="three-font mt-1" style="margin-left: 10px;">입점사등록항목</p></div>
                                <div class="col c-five-font"><p class="five-font mt-2"><span class="star">*</span>표시는 필수입력사항입니다.</p></div>
                                <div class="col-2"></div>
                                <div class="col-2">
                            		
                            	</div>
                            </div>
                            
                            <div class="row" >
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>
                            
                            
                            
                            
                            <form action="../writeCompanyAccountProcess" method="post">
                                
                            <div class="row">
                            	<div class="col">
                            		<div class="row" style="background-color:#F8F9FA; height:550px; border-radius: 3%; ">
		                            	<div class="col-2"></div>
		                            	<div class="col">
		
		                                    <div class="row mt-5">
		                                        <div class="col-2" id="image_container"></div>
		                                        <div class="col-2 mt-2 textcenter" style=" margin-right: 0px; margin-left: 10px;" >
                                                  <div class="row" id="thumbnail_container" >
                                                  	<div id="thumbnailDiv"></div>
                                                  </div>
                                              
                                             	
		                                          <!--<img src="/resources/companyManagement/companyperson.jpg" alt="대표자" width="100px" height="100px"  style=" border-radius: 30%;">-->  
		                                        </div>
		                                        <div class="col">
		                                        	<div class="row mt-2">
		                                        		<div class="col">
		                                        			<p id ="thumbnailDiv">사진등록</p>
		                                        		</div>
		                                        	</div>
		                                        	<div class="row mt-2">
		                                        		<div class="col">
		                                           			 <input type="file" id="file_input_id" multiple accept="image/*">
		                            					</div>
		                                        	</div>
		                                        </div>
		                                    </div>
		                                                                		
		
		
		                            		<div class="row mt-2">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter" >
		                            				<p class="companyfont" ><span class="star">*</span> 회사명</p>
		                            			</div>
		                            			<div class="col">
		                            				<input type="text" name="biz_name" class="form-control" placeholder="회사명 입력해주세요." aria-label="companyName">
		                            			</div>
		                            		</div>
		     		
		                            		<div class="row mt-2">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            				<p class="companyfont"><span class="star" >*</span> 대표자명</p>
		                            			</div>
		                            			<div class="col">
		                                            <input type="text" name="biz_ceo"  class="form-control" placeholder="대표자명 입력해주세요." aria-label="companyName">
		                            			</div>
		                            		</div>
		                            		
		                            		<div class="row mt-2">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            				<p class="companyfont"><span class="star">*</span> 사업자번호</p>
		                            			</div>
		                            			<div class="col">
		                            				<div class="row">
		                            					<div class="col-3">
		                            						<input type="text" name="biz_no_1" class="form-control" placeholder="012">
		                            					</div>
		                            					<div class="col-1 textcenter"><p class="companyfont">-</p></div>
		                            					<div class="col-2">
		                            						<input type="text" name="biz_no_2" class="form-control" placeholder="34">
		                            					</div>
		                            					<div class="col-1 textcenter"><p class="companyfont">-</p></div>
		                            					<div class="col-5">
		                            						<input type="text" name="biz_no_3" class="form-control" placeholder="67890" aria-label="companyName">
		                            					</div>
		                            				</div>
		                            				
		                            			</div>
		                            		</div>
		                            		<div class="row">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            			</div>
		                            			<div class="col">
		                            				<p class="companyfont-notes">유효한 사업자번호를 입력해주세요.</p>
		                            			</div>
		                            		</div>
		                            		
		                            		<div class="row mt-3">
		                                        <div class="col-1"><p class="star"></p></div>
		                            			<div class="col-3 textcenter">
		                            				<p class="companyfont"><span class="star">*</span> 회사전화번호</p>
		                            			</div>
		                            			<div class="col">
		                                            <div class="row">
		                            					<div class="col-3">
		                            						<!-- <input type="text" name="title" id="title" class="form-control" placeholder="010"> -->
		                            						<select class="form-select" name="biz_phone_1" aria-label="Default select example">
															  <option selected>010</option>
															  <option value="02">02</option>
															  <option value="011">011</option>
															  <option value="031">031</option>
															</select>
		                            					</div>
		                            					<div class="col-1 textcenter"><p class="companyfont">-</p></div>
		                            					<div class="col-3">
		                            						<input type="text" name="biz_phone_2" class="form-control" placeholder="1234">
		                            					</div>
		                            					<div class="col-1 textcenter"><p class="companyfont">-</p></div>
		                            					<div class="col-4">
		                            						<input type="text" name="biz_phone_3" class="form-control" placeholder="1234" aria-label="companyName">
		                            					</div>
		                            				</div>
		                            			
		                            			
		                            			</div>
		                            		</div>
		                            		
		                            		<div class="row mt-2">
		                                        <div class="col-1"> </div>
		                            			<div class="col-3 textcenter">
		                                            <p class="companyfont">회사위치</p>
		                            			</div>
		                            			<div class="col">
		                                            <input type="text" name="biz_place"  class="form-control" placeholder="주소를 입력해주세요">                                            
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
                            
                            
                            <!-- 
                            <div class="row">
                                <div class="col-1"><p class="center1" style="text-align: center;">입점사번호</p></div>
                                <div class="col"><p class="five-font" style="text-align: center;">회사명</p></div>
                                <div class="col-2"><p class="center1" style="text-align: center;">대표자명</p></div>
                                <div class="col-2"><p class="center1" style="text-align: center;">사업자번호</p></div>
                                <div class="col-1"><p class="center1" style="text-align: center;">사업자수</p></div>
                                                               
                            </div>
                            -->
                            
               			<!--<c:forEach items="${list }" var="map">
                            
	                            <div class="row">
	                                <div class="col-1"><p class="center1">${map.faqDto.faq_id }</p></div>
	                                <div class="col"><p class="five-font"><a class="readFaqlink" href="./systemAdminReadFaqPage?faqId=${map.faqDto.faq_id }">${map.faqDto.title }</a></p></div>
	                                <div class="col-2"><p class="center1">${map.adminDto.login_account}</p></div>
	                                <div class="col-2"><p class="center1">${map.faqDto.faq_category}</p></div>
	                                <div class="col-2"><p class="center1"><fmt:formatDate pattern="yy. MM. dd. (E) HH:mm:ss" value="${map.faqDto.created_at }"/></p></div>
	                            </div>
            
                            </c:forEach> -->             

                        
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
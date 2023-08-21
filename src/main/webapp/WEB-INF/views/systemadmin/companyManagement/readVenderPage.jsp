<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/systemAdminMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ssofuncss.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminCompanyManagement.css">
    <!-- <script type="text/javascript"> </script>-->


<style>
	.star{margin-top:5px; margin-bottom:0px; color:#FF6462}
	.companyfont{font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 19px; margin-bottom: 0; margin-top:7px; margin-bottom:0px;}	
	.companyfont1{font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 25px; margin-bottom: 0; margin-top:7px; margin-bottom:0px;}	
    .qnaUserSubmit{background-color: #FF6462; height: 20px; width: 80px; border: none; border-radius: 5px; color: #ffffff;  font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 16px;  }
	.companyButton{background-color: #212529; height: 50px; width: 150px; border: none; border-radius: 5px; color: #ffffff;  font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 16px;  }
    .readCompanyButton1{height: 40px; width: 110px;  border-color: #FF6462; background-color: #F8F9FA; border-radius: 5px; color:#FF6462;   font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 16px; box-shadow: none; }
    .readCompanyButton2{height: 40px; width: 110px; border-color: #212529; background-color:#F8F9FA ; border-radius: 5px; color: #212529;  font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 16px; box-shadow: none; outline:none;}
    #infoWrap>div>div>p{width: 300px;}
    #infoWrap>div>div>p>span:first-of-type{margin-right: 10px;}
	.bizName{width:400px; margin-right: 5px; font-family: 'Noto Sans KR', sans-serif; font-weight:400; font-size: 28px; margin-bottom: 0; margin-top:4px; margin-bottom:0px; font-weight: bold;}








</style>





    <title>readVenderPage</title>
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
                                            <a class="navbar-brand text-black">판매자 상세정보</a>
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
                    <div class="row" style="margin-left: 10px; height:0px">
                    
                        <div class="col">

                           	<div class="row">
                                <div class="col-2"><p class="three-font mt-1" style="margin-left: 10px;">판매자상세정보</p></div>
                                <div class="col c-five-font"><p class="five-font mt-2">회사에 소속된 판매자상세정보입니다.</p></div>
                                <div class="col-2"></div>
                                <div class="col-2">
                            		
                            	</div>
                            </div>
                            
                            <div class="row" >
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>
                            
                            
                            <div  class="row"style="background-color:#F8F9FA; height:450px; border-radius: 3%;" >
                                <div class="col" >
                                   
                                        <div class="row mt-2" style="height: 60px;">
                                            <div class="col"style="text-align: left;">
												<a class="readQnalink" href="./venderListOfCompanyNumberPage?biz_id=${adminDtoByAdminId.adminDto.biz_id }"><i class="bi bi-chevron-left fs-2"></i></a>
                                            	<span class="bizName">${adminDtoByAdminId.adminDto.login_account } 님</span>
                                            </div>
                                            
                                            <div class="col" >
                                                
                                            </div>
                                            <div class="col mt-3">
                                           		<form action="../venderAccountSetProcess" method="post">
	                                            	<input type="button"  class="readCompanyButton2" value="수정" onclick="location.href='updateCompanyPage?biz_id=${bizData.biz_id }'">
	                               					
	                                                
	                                                
	                                                
	                                                
	                                                <c:choose>
		                                                <c:when test="${adminDtoByAdminId.adminDto.used_fg == 0 }">
		                                                	<input type="submit" class="readCompanyButton1" value="계정활성화"> 
		                                                </c:when>
		                                                <c:when test="${adminDtoByAdminId.adminDto.used_fg ==1  }">
		                                                	<input type="submit" class="readCompanyButton2" value="계정비활성화">
		                                             	</c:when>
		                                             </c:choose>   
	                                                
	                                                
	                                                <input type="hidden" name="admin_id" value="${adminDtoByAdminId.adminDto.admin_id }">
                                            	</form>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <!--<div class="col-1"></div>-->
                                            <div class="col-1"></div>
                                            <div class="col mt-3">
                                                <div class="row"></div>
                                                <div class="row mt-4">
                                                    <div class="col textcenter">
                                                        <img src="/resources/img/kimhaneul/companyManagement/vender.jpg"  alt="vender" width="230px" height="230px"  style=" border-radius: 30%;">
                                                    </div>
                                                    
                                                </div>
                                                
                                            </div>
                                            <div class="col mt-2" id="infoWrap">
                                                <div class="row"></div>
                                                <!-- <div class="row">
                                                    <div class="col mt-2 ">
                                                        <p><span class="companyfont" style="font-weight: bold;">회사명</span><span class="companyfont"> ${bizData.biz_name }</span></p>
                                                    </div>
                                                </div> -->
                                                <div class="row">
                                                    <div class="col mt-3">
                                                        <p><span class="companyfont" style="font-weight: bold;">소속회사</span> <span class="companyfont">${adminDtoByAdminId.bizDto.biz_name }</span></p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col mt-2 ">
                                                        <p><span class="companyfont" style="font-weight: bold;">닉네임</span> <span class="companyfont"> ${adminDtoByAdminId.adminDto.admin_nickname }</span></p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col mt-2">
                                                        <p><span class="companyfont" style="font-weight: bold;">판매자전화번호</span> <span class="companyfont"> ${adminDtoByAdminId.adminDto.admin_phone }</span></p>
                                                    </div>
                                                </div>
												<div class="row">
                                                    <div class="col mt-2">
                                                        <p><span class="companyfont" style="font-weight: bold;">출고지주소</span> <span class="companyfont">  경기도 안산~</span></p>
                                                    </div>
                                                </div>
												<div class="row">
                                                    <div class="col mt-2">
                                                        <p><span class="companyfont" style="font-weight: bold;">통신판매업 신고여부</span> <span class="companyfont"> 
															<c:if test="${adminDtoByAdminId.adminDto.admin_received_report == 1}">
		                                            		<i class="bi bi-envelope-check" style="color:green"></i>
															</c:if>
															<c:if test="${adminDtoByAdminId.adminDto.admin_received_report == 0}">
																<i class="bi bi-x-circle" style="color:#B3B8C3"></i>
															</c:if>
														</span></p>
                                                    </div>
                                                </div>
												<div class="row">
                                                    <div class="col mt-2">
                                                        <p><span class="companyfont" style="font-weight: bold;">계정상태</span> <span class="companyfont"> 
                                                        	          	<c:choose>
							                                                <c:when test="${adminDtoByAdminId.adminDto.used_fg == 0 }">
							                                                	비활성화
							                                                </c:when>
							                                                <c:when test="${adminDtoByAdminId.adminDto.used_fg ==1  }">
							                                                	활성화
							                                             	</c:when>
							                                             </c:choose>
		                                             
                                                        
                                                        </span></p>
                                                    </div>
                                                </div>
											

                                            </div>
                                    
                                            <div class="col-1"></div>
                                        </div>
                                  
                                </div>
                            </div>
                            	
                            	
                            	
                            	
                           
                            	
 
	                            	<div class="row">
	                            	
	                            	</div>
	                            </div>
                            </div>

                            
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
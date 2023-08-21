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





    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/systemAdminMain.css">
    <title>systemAdminFaqMainPage</title>
</head>

<body>




        <!--고객센터 기본 틀 -->
       <div class="container container2" style="margin-top: 0px;">
        <div class="row">
            <jsp:include page="../include/systemAdminNavi.jsp"></jsp:include>
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
                                            <a class="leftsidepontstyle1" href="../../systemadmin/companyManagement/companyManagementMainPage">업체관리관리</a>
                                        </div>
                                    </div>
                                     <div class="row mt-1">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col">
                                                    <!--<i class="bi bi-building text-light" style="margin-right: 5px;"></i>-->
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/companyManagement/companyManagementMainPage" > 입점사관리</a>
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
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/siteManagement/fundingCategoryAddPage" > 카테고리관리</a>
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
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/systemAdminFaqMainPage" style="color: #fff; font-weight: bold;"> 자주찾는 질문</a>
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
                            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                                <div class="container-fluid">
                                    <a class="navbar-brand text-black">자주찾는질문관리</a>
                                    <form class="d-flex" role="search">
                                        <input class="form-control me-2" type="search" placeholder="Search"
                                            aria-label="Search">
                                        <button class="btn btn-outline-secondary"
                                            type="submit">Search</button>
                                    </form>
                                </div>
                            </nav>
                        </div>
                    </div>

                    <!--안에 페이지 내용만 바꾸기-->
                    <div class="row" style="margin-left: 10px;">
                    
                        <div class="col">
                           	<div class="row">
                                <div class="col-2"><p class="three-font mt-1" style="margin-left: 10px;">FAQ글수정</p></div>
                                <div class="col c-five-font"><p class="five-font mt-2">자주찾는질문 글수정페이지입니다.</p></div>
                                <div class="col-2"></div>
                                
                                
                            </div>
                            
                            <div class="row">
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>
                            
							<!--글작성 값넘김--> <form action="./systemAdminUpdateFaqProcess" method="post" enctype="multipart/form-data"> 
		                        <div class="row">
		                            <div class="col">
		                                <div class="row"></div>
		                                <div class="row">
		                                    <div class="col"><p class="six-font">관리자</p></div>
		                                </div>
		                                <div class="row"></div>
		                            </div>
		                            <div class="col-10"><p>${systemAdmin.login_account }</p></div>
		                            <!-- <div class="col"></div> -->
		                        </div>
		                     
		                        <div class="row mt-3">
		                            <div class="col"><p class="six-font">FAQ카테고리</p></div>
		                            <div class="col-10">
					              		<div class="row">
		                                    <div class="col">
		                                        <select class="form-select" name="faq_category" aria-label="Default select example">
		                                            <option class="eight-font" selected>문의 유형을 선택해주세요.</option>
		                                            <option name="faq_category" value="categoryFunding">펀딩</option>
		                                            <option name="faq_category" value="categoryStore">스토어</option>
		                                            <option name="faq_category" value="categoryShipping">배송</option>
		                                            <option name="faq_category" value="categoryUser">회원</option>
		                                            <option name="faq_category" value="categoryCustomerService">고객센터</option>
		                                        </select>
		                                    </div>
		                                   
		                           		</div>
		 	          			 </div>
		                           
		                        </div>
		                        
		                        <div class="row mt-3">
		                            <div class="col"><p class="six-font">FAQ제목</p></div>
		                            <div class="col-10"><input type="text" name="title" id="title" class="form-control" value="${faqData.faqDto.title }" aria-label="First name"></div>
		                            
		                        </div>
		                        <div class="row mt-3">
		                            <div class="col"><p class="six-font">FAQ내용</p></div>
		                            <div class="col-10"><textarea name="contents" id="contents" class="form-control" placeholder="유저가 자주찾는 질문에 대한 답변을 입력해주세요" id="floatingTextarea2" style="height: 250px;  resize: none;">${faqData.faqDto.contents }</textarea></div>    
		                            
		                        </div>
		
		                        <div class="row mt-3">
		                            <div class="col hr-col"><hr class="hr-1"></div>
		                        </div>
		
		        <!--                  <div class="row  mt-3">
		                            <div class="col"><p class="six-font">첨부파일</p></div>
		                            <div class="col-10">
		                                <label for="fileSelect" id="fileSelect" for="input-file">파일첨부</label> 
		                                <div class="filecustom"><input type="file" name="qnaFiles" id="qna_image_id" multiple accept="image/*"></div> 
		                            </div>    
		                            
		                        </div>
		                        <div class="row mt-3">
		                            <div class="col"></div>
		                            <div class="col-10">
		                                <div class="row"><div class="col"><p class="seven-font">· 5mb이하만 첨부가 가능합니다.</p></div></div>
		                                <div class="row"><div class="col"><p class="seven-font">· 문의 내용과 관련이 없거나 음란 및 불법적인 내용은 답변이 불가능할 수 있습니다.</p></div></div>
		                                <div class="row"><div class="col"><p class="seven-font">· 최대 5개까지의 파일을 첨부할 수 있습니다.</p></div></div>
		                            </div>
		                                
		                        -->
		                        </div>

		
		                        <div class="row mt-2">
		                            <div class="col"><p></p></div>
		                            
		                            
		                           	<input type="hidden" name="adminId" value="${systemAdmin.admin_id }">
		                           	<input type="hidden" name ="faq_id" value="${faqData.faqDto.faq_id }">
		                            <div class="col divcenter"><input type="submit" id ="faqCreateSubmit" class="faqCreateSubmit" value="수정하기"></div>    
		                            <div class="col"></div>
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
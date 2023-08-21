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
<!-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminCompanyManagement.css">  -->   
	<link rel="stylesheet" href="../../resources/css/adminCompanyManagement.css">    
    <!-- <script type="text/javascript"> </script>-->






    <title>venderManagementMainPage</title>
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
                    <div class="row mb-2">
                        <div class="col">
                            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                                <div class="container-fluid">
                                   
                                        <div class="col-2">
                                            <a class="navbar-brand text-black">판매자전체목록</a>
                                        </div>
                                        <div class="col">
                                            <p class="five-font mt-2">SSOFUN에 등록된 판매자전체목록입니다.</p>
                                            
                                        </div>
                                        <div class="col-6 d-flex align-items-center justify-content-end">
                                            
                                            <form class="d-flex" role="search">
                                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                                <button class="btn btn-outline-secondary" type="submit">Search</button>
                                            </form>
                                        </div>
                                 
                                </div>
                            </nav>
                        </div>
                    </div>

                    <!--안에 페이지 내용만 바꾸기-->
                    <div class="row" style="margin-left: 12px; height:1000px">
                    
                        <div class="col" style="padding-left: 0px; padding-right: 12px;">

                           	<div class="row" style="padding-left: 0px;">
                                <div class="col-3" style="padding-left: 0px;"><p class="three-font mt-1" style="margin-left: 5px;">전체판매자목록</p></div>
                                
                                <div class="col-7"></div>
                                <div class="col-2" style="text-align: right;">
                            		<button class="btn btn-outline-secondary" style="height:29.98px; padding:6px; font-family: 'Noto Sans KR', sans-serif;font-weight: 400; font-size: 12px;" type="submit">삭제</button>
                                    <input type="button" class="writefaqbutton" style="border-radius: 5px;" value="판매자등록"  onclick="location.href='venderRegistrationPage'">
                            	</div>
                            </div>

                   
                            
                          
                            <div class="row mt-3">
                                <table class="table table-bordered table-sm" style="padding: 12px;">
                                    <thead>
                                      <tr  style="background-color: #f8f9fa;">
                                        <th scope="col"><p class="companyfontTitle-1" style="text-align: center;  margin-top:8px; margin-bottom: 8px;"><input type="checkbox"  name="admin_id" ></p></th>
                                        <th scope="col"><p class="companyfontTitle-1" style="text-align: center;  margin-top:8px; margin-bottom: 8px;">판매자번호</p></th>
                                        <th scope="col"><p class="companyfontTitle-1" style="text-align: center;  margin-top:8px; margin-bottom: 8px;">회사번호</p></th>
                                        <th scope="col"><p class="companyfontTitle-1" style="text-align: center;  margin-top:8px; margin-bottom: 8px;">소속회사명</p></th>
                                        <th class="companyName" scope="col"><p class="companyfontTitle-1" style="text-align: center;  margin-top:8px; margin-bottom: 8px;">계정명</p></th>
                                        <th scope="col"><p class="companyfontTitle-1" style="text-align: center;  margin-top:8px; margin-bottom: 8px;">등록일</p></th>
                                        <th scope="col"><p class="companyfontTitle-1" style="text-align: center;  margin-top:8px; margin-bottom: 8px;">계정상태</p></th>
                                        
                                        
                                      </tr>
                                    </thead>
                                    <c:forEach items="${allAdminList}" var="allAdminList">
                                        <tbody>
                                          <tr>
                                            <th scope="row"><p class="center1" style="text-align: center; margin-top:8px; margin-bottom: 8px;"><input type="checkbox"  name="admin_id"></p></th>
                                            <th scope="row"><p class="center1" style="text-align: center; margin-top:8px; margin-bottom: 8px;">${allAdminList.adminDto.admin_id }</p></th>
                                            <th scope="row"><p class="center1" style="text-align: center; margin-top:8px; margin-bottom: 8px;">${allAdminList.bizDto.biz_id }</p></th>
                                            <th scope="row"><p class="center1" style="text-align: center; margin-top:8px; margin-bottom: 8px;">${allAdminList.bizDto.biz_name}</p></th>
                                            <td><p class="companyfontTitle" style="text-align: center;  margin-top:8px; margin-bottom: 8px;"><a class="readQnalink" href="./readVenderPage?admin_id=${allAdminList.adminDto.admin_id}">${allAdminList.adminDto.login_account}</a></p></td>
                                            <td><p class="center1" style="text-align: center;  margin-top:8px;  margin-bottom: 8px;"><fmt:formatDate pattern="yy. MM. dd. (E)" value="${allAdminList.adminDto.created_at }"/></p></td>
                                            
                                            <td><p class="center1" style="text-align: center;  margin-top:8px; margin-bottom: 8px;">
                                                <c:if test="${allAdminList.adminDto.used_fg == 1}">
                                                    <i class="bi bi-check-circle-fill" style="color:green "></i>
                                                </c:if>
                                                <c:if test="${allAdminList.adminDto.used_fg == 0 }">
                                                    <i class="bi bi-check-circle-fill" style="color:#B3B8C3"></i>
                                                </c:if>
                                            </p></td>
                                          </tr>
                                        </tbody>
                                      </c:forEach>
                                </table> 
                            </div>
              
        
                        </div>
                    </div>
                    <div class="row mb-5">
                        <div class="col"> </div>
                    </div>
                    
                        <!-- 페이지네이션 -->
			            <div class="row">
			            	<div class="col"></div>
			            	<div class="col" style="padding-left: 85px;">
				            	<nav aria-label="Page navigation example">
								  <ul class="pagination">
								    <li class="page-item">
								      <a class="page-link" href="#" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
								    <li class="page-item"><a class="page-link" href="#">1</a></li>
								    <li class="page-item"><a class="page-link" href="#">2</a></li>
								    <li class="page-item"><a class="page-link" href="#">3</a></li>
								    <li class="page-item"><a class="page-link" href="#">4</a></li>
								    <li class="page-item"><a class="page-link" href="#">5</a></li>
							<!-- <li class="page-item"><a class="page-link" href="#">6</a></li>
								    <li class="page-item"><a class="page-link" href="#">7</a></li>
								    <li class="page-item"><a class="page-link" href="#">8</a></li>
								    <li class="page-item"><a class="page-link" href="#">9</a></li>
								    <li class="page-item"><a class="page-link" href="#">10</a></li> -->	    
								    <li class="page-item">
								      <a class="page-link" href="#" aria-label="Next">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								    </li>
								  </ul>
								</nav>
							</div>
							<div class="col"></div>
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
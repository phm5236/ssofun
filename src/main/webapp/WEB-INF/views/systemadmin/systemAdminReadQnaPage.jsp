<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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




<title>Insert title here</title>
</head>
<body>
<body>





        <!--고객센터 기본 틀 -->
       <div class="container container2" style="margin-top: 0px;">
        <div class="row">
            <jsp:include page="../include/systemAdminNavi.jsp"></jsp:include>
        </div>
            <div class="row">
                <!--왼쪽사이드바-->
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
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/companyManagement/companyManagementMainPage" style="color: #fff; font-weight: bold;"> 입점사관리</a>
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
                                                    <a class="leftsidepontstyle1" href="../../systemadmin/systemAdminQnaMainPage" style="color: #fff; font-weight: bold;"> 1:1문의</a>
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
                                    <a class="navbar-brand text-black">1:1문의관리</a>
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


                    <div class="row" style="margin-left: 10px;">
                    <!--안에 페이지 내용만 바꾸기-->
                    
	        
	                    <div class="col">
                           
                            <div class="row">
                                <div class="col-11"><p class="three-font mt-1">1:1 문의내용</p></div>
                                <div class="col-1"><input type="button" class="qnabutton" value="답변대기"></div>
                                

                            </div>
                            <div class="row">
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>

                            
                            <div class="row">
                                <div class="col-1"><p class="center1">번호</p></div>
                                <div class="col"><p class="five-font">제목</p></div>
                                <div class="col-2"><p class="center1">작성자(닉네임)</p></div>
                                <div class="col-2"><p class="center1">작성일</p></div>
                            </div>
                            <div class="row">
                                <div class="col-1"><p class="center1">${data.QnaDto.qna_id}</p></div>
                                <div class="col"><p class="five-font">${data.QnaDto.title}</p></div>
                                <div class="col-2"><p class="center1">${data.UserDto.nickname}</p></div>
                                <div class="col-2"><p class="center1"><fmt:formatDate pattern="yyyy. MM. dd. (E)" value="${data.QnaDto.created_at }"/></p></div>
                            </div>
                            <div class="row">
                                <div class="col" style="padding: 2px;"><hr style="color: grey; padding: 1px; margin: 3px;"></div>
                            </div>
                            
                            <div class="row mt-3" style="height: 300px;">
                                <div class="col ten-font">
                                    ${data.QnaDto.contents}

                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-2 seven-font">첨부파일</div>
                            </div>
                            <div class="row mt-3">
                            
                                <c:forEach items="${data.Qna_ImageDtoList}" var="ImageDtoList">
                                    <div class="col-2 qnaImage">
                                        <div class="row">
                                            <div class="col mt-3" style="text-align: center;"><img src="/ssofunUploadFiles/${ImageDtoList.link}" width="100px" height="100px"></div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <hr class="hr hr-1">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col mb-2">${ImageDtoList.original_filename }</div>
                                        </div> 
                                    </div>
                                    
                                    
                                </c:forEach>
        
                            </div>



                            <div class="row mt-3">
                                <div class="col hr-col"><hr class="hr-1"></div>
                            </div>
                            
                            
                            
                            
                            
	                    
		                    <%--답변이 있을 때--%>
		        			
		        			
		        			
		        			<c:if test="${!empty data.QnaDto.answer_contents }">
		    
		    
		    
                            <div class="row mt-2">
                                <div class="col-1"><i class="bi bi-chat-square-text fs-2" style="color: #1D212A;  margin-left: 10px;"></i></div>
                                <div class="col">
                                    <div class="row">
                                        <div class="col"><p class="nine-font" style="margin:0;">문의한 내용에 대한 답변입니다.</p></div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-2">
                                            <p class="center1">
                                                <fmt:formatDate pattern="yy. MM. dd. (E) hh:mm:ss" value="${data.QnaDto.answer_created_at }"/>
                                            </p>
                                        </div>
                                        <div class="col-10"></div>
                                    </div>
    
                                </div>
                            
                            </div>  
	                        <div class="row mt-2">
	                            <div class="col hr-col"><hr class="hr-1"></div>
	                        </div>
	                        <div class="row mt">
	                            <div class="col ten-font"> ${data.QnaDto.answer_contents}</div>
	                        </div>
		    				
		    
		    
		    
		    
		    
		    
		    
		    
	                             <%-- <div class="row-3">
	                                        <div class="col-2 eight-font"><p>${data.QnaDto.user_id}</p></div>
	                                    </div>	
	                                    <div class="row mt-3">
	                                        <div class="col ten-font">
	                                            ${data.QnaDto.answer_contents}
	                
	                                        </div>
	                                    </div>
	            --%>       
                    		</c:if>
                    		<%--답변이 없을때 --%>
			                  <c:if test="${empty data.QnaDto.answer_contents }">
			                    		
			                    		
			                                <form action="./writeQnaAnswerProcess" method="post" enctype="multipart/form-data">
			                                    <div class="row">
			                                        <div class="col-1" ><i class="bi bi-chat-square-text fs-2" style="color: #1D212A;  margin-left: 10px;"></i></div>
			                                        <div class="col-11"><p class="three-font mt-1" style="padding:0px; margin-left: 0px;">답변작성란</p></div>
			                                        <div class="col-1"></div>
			                                        
			        
			                                    </div>
			                                    <div class="row">
			                                        <div class="col" style="padding: 2px;"><hr style="color: grey; padding: 1px; margin: 3px;"></div>
			                                    </div>
			
			
			                                    <div class="row mt-3">
			                                        <div class="col-10"><textarea name="answer_contents" id="answer_contents" class="form-control" placeholder="문의에 대한 답변작성란입니다." id="floatingTextarea2" style="height: 250px; width: 1000px; resize: none; "></textarea></div>    
			                                    </div>
			                                    
			
			            
			                                   <%-- <div class="row  mt-5">
			                                        <div class="col-1"><p class="six-font">첨부파일</p></div>
			                                        <div class="col-10">
			                                        	 <label for="fileSelect" id="fileSelect" for="input-file">파일첨부</label> 
			                                            <div class="filecustom"><input type="file" name="qnaFiles" id="qna_image_id" multiple accept="image/*"></div> 
			                                        </div>    
			                                        
			                                    </div>
			                                    <div class="row mt-2">
			                                        <div class="col"></div>
			                                        <div class="col-10">
			                                            <div class="row"><div class="col"><p class="seven-font">· 5mb이하만 첨부가 가능합니다.</p></div></div>
			                                            <div class="row"><div class="col"><p class="seven-font">· 최대 5개까지의 파일을 첨부할 수 있습니다.</p></div></div>
			                                        </div>    
			                                        <div class="col"></div>
			                                    </div>
			                                    
			                                    --%>  
			
			                                    <div class="row mt-3">
			                                        <div class="col hr-col"><hr class="hr-1"></div>
			                                    </div>  
			
			                                    <div class="row mt-3">
			                                    	<input type="hidden" name="qna_id" value="${data.QnaDto.qna_id }">
			                                        <div class="col divcenter"><input type="submit" id ="qnaUserSubmit" class="qnaUserSubmit" value="등록하기"></div>       
			                                    </div> 
			                    
			                                </form>
				   
		         				</c:if>


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
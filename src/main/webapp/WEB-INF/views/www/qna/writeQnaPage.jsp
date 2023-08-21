<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ssofuncss.css">
   
   <script type="text/javascript">
/*   	$(document).ready(function(){
	   $("#qnaUserSubmit").click(writeqna);
   	});
*/   	


/*   	
 
 	$(document).ready(function (){
   	   $("#qnaUserSubmit").on('click', function(){
   		writeqna();      
   	   })
   	});
   
   function writeqna(){  
	   $.ajax({
		    type : "post",           // 타입 (get, post, put 등등)
		    url : "writeQnaProcess",           // 요청할 서버url
		    data : 			({  // 보낼 데이터 (Object , String, Array)
		    user_id : $("#user_id").val(),
		    file_data:${"#"}
		    title : $("#title").val(),
		    contents : $("#contents").val()
		    }),
		    success : function(result) { // 결과 성공 콜백함수
		
		    	console.log(result);
		    	window.open("./qnaMain","_self","");
		        alert('문의글 작성이 완료되었습니다.');
		    },
		    error : function(request, status, error) { // 결과 에러 콜백함수
		        console.log(error)
		    }
	});

   }

  */ 
   
   
   
   </script>

   
<title>Insert title here</title>

</head>
<body>



<div class="container container1">
    
    <!--헤더 영역-->
    	<jsp:include page="../../include/fundingHeader.jsp"/>
    	
    	
    	
    	<!--
	   	 <div class="row one">
	            <div class="col">
	                <div class="row">
	                    <div class="col one-2"><p class="one-font">LOGO</p></div>
	                    <div class="col one-1"><p class="one-font">펀딩</p></div>
	                    <div class="col one-1"><p class="one-font">스토어</p></div>
	                    <div class="col-4 one-1"></div>
	                    <div class="col one-1"><a href="../qna/loginPage" class="one-font-1"><p class="one-font">로그인</p></a></div>
	                    <div class="col one-1"><p class="one-font">고객센터</p></div>
	                </div>
	            </div>
	        </div>
	      -->        
	        
    </div>
    
    
    
    
    

    <div class="backgroundcolor" id="searchBg">
        <div class="container mb-3" id="searchBox">
            <div class="row">
                <div class="col">
                    <div class="row"><div class="col"></div></div>
                    <div class="row mt-5"><div class="col"><p class="two_font mb-0">쏘펀 고객센터입니다.</p></div></div>
                    <div class="row mt-1"><div class="col"><p class="two_font mb-0">어떤 도움이 필요하세요?</p></div></div>
                    <div class="row mt-1">
                        <div class="col-5">
                            <div class="search-bar style" style="background-color: white;">
                                <input type="text" class="search-input" placeholder="자주 찾는 질문을 검색해보세요!" >
                                <button class="search-bar-button"><i class="fas fa-search search-icon" style="color: #000000;"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-5"><div class="col"></div></div>
                    <div class="row mb-5"><div class="col"></div></div>
                </div>
            </div>
        </div>
        <img src="/resources/img/kimhaneul/customerserviceimg/finalbanner.webp" alt="">
    </div>
    <div class="container mt-4 container2">
        <div class="row">
            <div class="col">
                <div class="row ">
                    <div class="col-2">
                        <div class="row"><div class="col"><p class="three-font mb-3">고객센터</p></div></div>
                        <div class="row">
                            <div class="col borderline">
                                <div class="row"><div class="col"><p class="four-font" id="four-font-default">공지사항</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><a href="../faq/faqMainPage"><p class="four-font" id="four-font-default">자주찾는질문</p></a></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><p class="four-font" id="four-font-default">이용약관</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><button type="button" class="qnaMainbutton"  onclick="location.href='../qna/qnaMain'"><p class="four-font"  id="four-font-active">1:1문의하기</p></button></div></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col borderline mt-4">
                                <div class="row"><div class="col"><p class="four-font">쏘펀 고객센터 안내</p></div></div>
                                <div class="row"><div class="col"><p class="three-font">02-123-7798</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><p class="four-font-1 mb-1">평일(월~금)</p></div></div>
                                <div class="row"><div class="col"><P class="four-font-1 mb-1">· 09:00~18:00운영</P></div></div>
                                <div class="row"><div class="col"><p class="four-font-1 mb-1">휴일(토~일), 공휴일</p></div></div>
                                <div class="row"><div class="col"><P class="four-font-1">· 10:00~15:00운영</P></div></div>
                            </div>
                        </div>  
                    </div>
                    
                    <div class="col-1"></div>
                    
                    <div class="col">
                        <div class="row">
                            <div class="col-2"><p class="three-font mt-1">1:1 문의하기</p></div>
                            <div class="col c-five-font"><p class="five-font mt-2">답변까지 약 2~3일 정도가 소요될 수 있습니다.</p></div>

                        </div>
                        <div class="row">
                            <div class="col hr-col"><hr class="hr-1"></div>
                        </div>

<!--글작성 값넘김--> <form action="./writeQnaProcess" method="post" enctype="multipart/form-data"> 
                        <div class="row">
                            <div class="col">
                                <div class="row"></div>
                                <div class="row">
                                    <div class="col"><p class="six-font">문의자</p></div>
                                </div>
                                <div class="row"></div>
                            </div>
                            <div class="col-10"><p>${user.name }</p></div>
                            <!-- <div class="col"></div> -->
                        </div>
    <!-- 카테고리주석                        
                        <div class="row mt-3">
                            <div class="col"><p class="six-font">문의유형</p></div>
                            <div class="col-10">
			               <div class="row">
                                    <div class="col">
                                        <select class="form-select" name="selectCategory1" aria-label="Default select example">
                                            <option class="eight-font" selected>문의 유형을 선택해주세요.</option>
                                            <option name="LargeCategory" value="LargeCategory_one">One</option>
                                            <option name="LargeCategory" value="LargeCategory_two">Two</option>
                                            <option name="LargeCategory" value="LargeCategory_three">Three</option>
                                          </select>
                                    </div>
                                    
                                    <div class="col">
                                        <select class="form-select" name="selectCategory2" aria-label="Default select example">
                                            <option class="eight-font" selected>더 상세한 내용을 선택해주세요.</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">기타</option>
                                            
                                           	<option name="mediumCategory" value="1">One</option>
                                            <option name="mediumCategory" value="2">Two</option>
                                            <option name="mediumCategory" value="3">기타</option>
                                          </select>
                                    </div>
                                   
                                </div>
 	          			 </div>
                           
                        </div>
 -->                        
                        <div class="row mt-3">
                            <div class="col title"><p class="six-font">제목</p></div>
                            <div class="col-10"><input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력해주세요." aria-label="title"></div>
                            
                        </div>
                        <div class="row mt-3">
                            <div class="col"><p class="six-font">내용</p></div>
                            <div class="col-10"><textarea name="contents" id="contents" class="form-control" placeholder="문의 내용을 자세하게 적어주시면 더욱 정확한 답변을 드릴 수 있습니다." id="floatingTextarea2" style="height: 250px;  resize: none;"></textarea></div>    
                            
                        </div>

                        <div class="row mt-3">
                            <div class="col hr-col"><hr class="hr-1"></div>
                        </div>

                        <div class="row  mt-3">
                            <div class="col"><p class="six-font">첨부파일</p></div>
                            <div class="col-10">
                               <!-- <label for="fileSelect" id="fileSelect" for="input-file">파일첨부</label> -->
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
                            <!-- <div class="col"></div> -->
                        </div>

                        <div class="row mt-3">
                            <div class="col hr-col"><hr class="hr-1"></div>
                        </div>

                        <div class="row mt-2">
                            <div class="col"><p></p></div>
                            
                            
                            <input type="hidden" name="user_id" id="user_id" value="${user.user_id }">
                            <div class="col divcenter"><input type="submit" id ="qnaUserSubmit" class="qnaUserSubmit" value="등록하기"></div>    
                            <div class="col"></div>
                        </div>
                        
                        
              </form> 
                    </div>
                </div>
         
            </div>
  
        </div>
        <div class="row mt-5">
            <div class="col"> </div>
        </div>
    </div>
    
    
   
    	<jsp:include page="../../include/fundingFooter.jsp"/>
 
    








    








<script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/js/all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>    
<script src="../../resources/js/logout.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
  
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ssofuncss.css">
   
   
   <script type="text/javascript">
   
   </script>

<style>
    .checks {
    position: relative;
    height: 20px;
    padding: 10px;
    line-height: 20px;
}
.checks label {
    font-size: 16px;
    color: #666;
    margin-right: 10px;
    vertical-align: middle;
}
            
.checks input[type="radio"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    border: 0;
}
.checks input[type="radio"]+label {
    display: inline-block;
    position: relative;
    padding-left: 25px;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
}
            
.checks input[type="radio"]+label:before {
    content: '';
    position: absolute;
    left: 4px;
    top: 0px;
    width: 14px;
    height: 14px;
    text-align: center;
    background: #fff;
    border: 1px solid #cacece;
    border-radius: 100%;
    box-shadow: none;
}
.checks input[type="radio"]:checked+label:before {
    background: #fff;
    border-color: #FF6462;
} 
            
.checks input[type="radio"]:checked+label:after {
    content: '';
    position: absolute;
    top: 1px;
    left: 5px;
    width: 14px;
    height: 14px;
    background: #FF6462;
    border-radius: 100%;
    box-shadow: none;
}


</style>




<title>펀딩faq</title>
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

<!-- <form> -->

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
                                <div class="row"><div class="col"><a href="../faq/faqMainPage"><p class="four-font" id="four-font-active">자주찾는질문</p></a></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><p class="four-font" id="four-font-default">이용약관</p></div></div>
                                <hr class="hr-1">
                                <div class="row"><div class="col"><button type="button" class="qnaMainbutton" onclick="location.href='../qna/qnaMain'"><p class="four-font"  id="four-font-default" >1:1문의하기</p></button></div></div>
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
                    
                    
                    <!--안쪽 내용입력-->
                    <div class="col">
                        <div class="row">
                            <div class="col-2"><p class="three-font mt-1">자주 찾는 질문</p></div>
                            <div class="col c-five-font"><p class="five-font mt-2">카테고리를 클릭하면 해당되는 목록이 나옵니다.</p></div>
                        </div>

                        <div class="row">
                            <div class="col hr-col"><hr class="hr-1"></div>
                        </div>


                        <!--카테고리 버튼 만들기, 반복문돌리기-->
                        <div class="row mt-2">
                            
                            
                            <div class="col-2" style="margin-right: 0px; text-align: center;"  ><button type="button" onclick="location.href='../faq/faqTopMainPage'" style= "border-width: 1px; border-color: #D9D9D9; background-color:white; border-radius: 60px; height: 30px; width: 110px; cursor: pointer;" ><p class="four-font">TOP10</p></button></div>
                            <div class="col-2" style="margin-right: 0px; text-align: center;"  ><button type="button" onclick="location.href='../faq/faqFundingPage'" style= "border:none; background-color:#FF6462; border-radius: 60px; height: 30px; width: 110px; cursor: pointer;" ><p class="four-font" style="color: white;">펀딩</p></button></div>
                            <div class="col-2" style="margin-right: 0px; text-align: center;"  ><button type="button" onclick="location.href='../faq/faqStorePage'" style= "border-width: 1px; border-color: #D9D9D9; background-color:white; border-radius: 60px; height: 30px; width: 110px; cursor: pointer;" ><p class="four-font">스토어</p></button></div>
                            <div class="col-2" style="margin-right: 0px; text-align: center;"  ><button type="button" onclick="location.href='../faq/faqShippingPage'" style= "border-width: 1px; border-color: #D9D9D9; background-color:white; border-radius: 60px; height: 30px; width: 110px; cursor: pointer;" ><p class="four-font">배송</p></button></div>
                            <div class="col-2" style="margin-right: 0px; text-align: center;"  ><button type="button" onclick="location.href='../faq/faqUserPage'" style= "border-width: 1px; border-color: #D9D9D9; background-color:white; border-radius: 60px; height: 30px; width: 110px; cursor: pointer;" ><p class="four-font">회원</p></button></div>
                            <div class="col-2" style="margin-right: 0px; text-align: center;"  ><button type="button" onclick="location.href='../faq/faqCustomerServicePage'" style= "border-width: 1px; border-color: #D9D9D9; background-color:white; border-radius: 60px; height: 30px; width: 110px; cursor: pointer;" ><p class="four-font">고객센터</p></button></div>                         
                        </div>

                        
                       

                        <div class="row mt-3">
                            <div class="col hr-col"><hr class="hr-1" ></div>
                        </div>
                        
                        <div class="row mt">
                            <div class="col">
                                <div class="accordion accordion-flush" id="accordionFlushExample">

                                    <!--반복문돌리기 foreach-->
     								<c:forEach items="${faqList}" var="faq">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne${faq.faq_id }" aria-expanded="false" aria-controls="flush-collapseOne" style="background-color: white;">
                                                ${faq.title }
                                            </button>
                                        </h2>
                                        <div id="flush-collapseOne${faq.faq_id }" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                            <div class="accordion-body"style="background-color: rgb(241, 241, 241);" >
                                               
                                               <div class="row"> 
                                                    <div class="col"> 
                                                    	<div class="row">
                                                    		<div class="col">
                                                    			${faq.contents }
                                                    		</div>
                                                    	</div>
                                                        <div class="row">
                                                            <div class="col-1"></div>
                                                            <div class="col">
                                                                <div class="row mt-5" style="height: 110px; border-style: thin white; border-radius: 10px; background-color: white;">
                                                                    <div class="col">
                                                                    
                                                                    
                                                                    <form action="./fundingHelpStatusProcess" method="post">
                                                                        <div class="row mt-2">
                                                                            <div class="col-1">설문 |</div>
                                                                            <div class="col-5">문제 해결에 도움이 되셨나요?</div>
                                                                            <div class="col-5">
                                                                                <div class="row">
                                                                                    <div class="col-3">
                                                                                        <div class="checks" style="padding: 0;">
                                                                                            <input type="radio" id="ex_rd" name="helpStatus" value="helpful">
                                                                                            <label for="ex_rd">예</label>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-6">
                                                                                        <div class="checks" style="padding: 0;">
                                                                                            <input type="radio" id="ex_rd2" name="helpStatus" value="unhelpful">
                                                                                            <label for="ex_rd2">아니요</label>
                                                                                        </div>
                                                                                    </div>                                                                                  
                                                                                </div>
                                                                            </div>                                                                        
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col hr-col"><hr class="hr-1"></div>
                                                                        </div>
                                                                        <div class="row mt-2">
                                                                            <div class="col"></div>
                                                                            <div class="col" style="text-align: center;">
                                                                            	<input type="hidden" name="faq_id" value="${faq.faq_id}">
                                                                                <input type="submit" value="의견 보내기">
                                                                            </div>
                                                                            <div class="col"></div>
                                                                        </div>
                                                                        </form>
                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-1"></div>
                                                        </div>
                                                    </div>                                                    
                                               </div>
                                            </div>
                                            <div class="row">
                                                <div class="col hr-col"><hr class="hr-1"></div>
                                            </div>

                                        </div>
                                    </div>
									</c:forEach>

                                </div>
                            </div>

                        </div>

                    </div>
                </div>
         
            </div>
  
        </div>
        <div class="row mt-5">
            <div class="col"> </div>
        </div>
    </div>
    
  
    	<jsp:include page="../../include/fundingFooter.jsp"/>
  
    
  
<!-- </form> -->



<script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/js/all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>    
<script src="../../resources/js/logout.js"></script>
</body>
</html>
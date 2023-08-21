<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="../../resources/css/funding_RewardPayment.css">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
    

    <div class="section hide" id="addressAddModal">
        <h6>배송지 추가</h6>
        <ul>
            <li><i class="bi bi-check-square"></i>이 주소를 기본 주소로 정합니다.</li>
            <li><span>이름</span><input type="text" id="recipient_name"></li>
            <li><span>연락처</span><input type="text" id="address_phone"></li>
            <li><span>우편번호</span><input type="text" id="address_post"><input type="button" id="searchAddressBtn" value="주소찾기"></li>
            <li><span>기본주소</span><input type="text" id="address_default"></li>
            <li><span>상세주소</span><input type="text" id="address_detail"></li>
            <li><span>요청사항</span><input type="text" id="request_message" placeholder="선택사항"></li>
        </ul>
        <div class="button">
            <input type="button" value="돌아가기" id="returnBtn">
            <input type="button" value="추가하기" id="addBtn">
        </div>
    </div>

    <div class="section hide" id="addressSelectModal">
        <h6>배송지 변경</h6>
        <div id="addressSelectSection">
            <!-- <ul class="basic">
                <li>기본</li>
                <li>김다슬</li>
                <li>경기도 파주시 미래로 602 (와동동, 휴먼시아 가람마을)</li>
                <li>상세주소 적어주시면 됩니다.</li>
                <li>010-0000-0000</li>
                <li>요청사항 적어주시면 됩니다.</li>
            </ul>
            
            <ul>
                <li>김다슬</li>
                <li>경기도 파주시 미래로 602 (와동동, 휴먼시아 가람마을)</li>
                <li>상세주소 적어주시면 됩니다.</li>
                <li>010-0000-0000</li>
                <li>요청사항 적어주시면 됩니다.</li>
            </ul> -->
        </div>

        <p id="showAddressAddModalBtn">배송지 추가</p>

    </div>
    <div id="modalBack" class="hide"></div>


    <div class="container text-center">	
        <!--헤더 영역-->
    	<jsp:include page="../../include/fundingHeader.jsp"/>

        <div class="section" id="content">
            <ul id="paymentStep">
                <li><span class="hide">1.</span> 리워드선택</li>
                <li class="activeStep"><span>2.</span> 결제하기</li>
                <li><span class="hide">3.</span> 결제완료</li>
            </ul>

            <div id="rewardInfo">
                <h6>리워드 정보</h6>
                <div id="rewardGroups"> 
                    <!-- <ul>
                        <li class="title">[쏘펀 한정] 올인원 패키지 1+1 (99종)</li>
                        <li class="detail">
                            <ul>
                                <li>&#8226; 15소년 표류기 1개</li>
                                <li>&#8226; 본품 2ea</li>
                                <li>&#8226; 정상가 118,000원</li>
                                <li>&#8226; 1ea당 26,950원</li>
                                <li>&#8226; 구매시 배수구클리너 1봉 선물 증정</li>
                            </ul>
                        </li>
                        <li class="total">
                            <span>수량 1개</span>
                            <b>33,000원</b>
                        </li>   
                    </ul> -->

                </div>
            </div>



            <div id="supporterInfo">
                <h6>서포터 정보</h6>
                <ul>
                    <li><span>이메일</span><span id="userEmail">zoro030@naver.com</span></li>
                    <li><span>이름</span><span id="userName">김아무개</span></li>
                    <li><span>연락처</span><span id="userPhone">010-0000-0000</span></li>
                    <li id="phoneInput"><span>연락처</span><input type="text" id="userPhone" placeholder="'-' 없이 입력해주세요."><input type="button" id="phoneAddBtn" value="등록"></li>
                    <!-- <li><span>이메일</span> zoro030@naver.com</li>
                    <li><span>이름</span><input type="text" name="name" id="name"></li>
                    <li><input type="button" value="인증번호 전송" id="phoneAuthBtn"></li>
                    <li class="hide"><input type="text" name="phoneAuth" id="phoneAuth" placeholder="확인번호"></li>
                    <li class="hide"><input type="button" value="인증번호 확인" id="phoneAuthCheckBtn"><input type="button" value="재전송" id="authAgainBtn" class=""></li> -->
                </ul>
            </div>

            <div id="deliveryInfo">
                <h6>배송지 정보</h6>
                <input type="button" value="배송지 변경" id="addressInputBtn">
                <ul id="addressSection">
                    <li><span>받는분</span>김다슬</li>
                    <li><span>전화번호</span>010-0000-0000</li>
                    <li><span>우편번호</span>10005</li>
                    <li>
                        <span>기본주소지</span>
                        <ul>
                            <li>경기도 오산시 감배산로 602</li>
                            <li>(동동동, 아따맘마 마을)</li>
                        </ul>
                    </li>
                    <li><span>상세주소</span>이편한세상 102동 1105호</li>
                    <li><span>요청사항</span>문 앞에 보관해주세요.</li>
                    <input type="hidden" value="" id="delivery_recipient_id">
                </ul>
            </div>

            
            <div id="choiceReward">
                <ul>
                    <li>결제 정보</li>
                    <li>추가 후원금<b>1,500,000원</b></li>
                    <!-- <li>리워드<b>1,500,000원</b></li>
                    <li>배송비<b>3,000원</b></li>  시연후 다시 추가해놓기-->
                    <li>총 금액<b>1,599,000원</b></li>
                </ul>

                <ul id="agree">
                    <li id="totalAgree"><i class="bi bi-check-square"></i> 전체 동의</li>
                    <li><i class="bi bi-check-square"></i><input type="hidden" name="personalInfoAgree" id="personalInfoAgree" value="1"> 개인정보제공 동의</li>
                    <li><i class="bi bi-check-square"></i><input type="hidden" name="supportServiceAgree" id="supportServiceAgree" value="1"> 후원 서비스 이용 동의</li>
                    <li><input type="button" id="paymentSubmit" value="결제하기"></li>
                </ul>
            </div>            
        </div>
       </div>
       
       <!-- 푸터 영역 -->
		<jsp:include page="../../include/fundingFooter.jsp"/>

        <script src="../../resources/js/funding_rewardPayment.js"></script>
</body>
</html>
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

<link rel="stylesheet" href="../../resources/css/funding_RewardChoice.css">  
<script src="../../resources/js/funding_rewardChoice.js"></script>    

</head>
<body>
    <div class="section text-center">	

        <!--헤더 영역-->
    	<jsp:include page="../../include/fundingHeader.jsp"/>

        <div class="section">
            <ul id="paymentStep">
                <li class="activeStep"><span>1.</span> 리워드선택</li>
                <li><span class="hide">2.</span> 결제하기</li>
                <li><span class="hide">3.</span> 결제완료</li>
            </ul>

            <ul id="fundingInfo">
                <li>Image 140 x 140</li>
                <li>카테고리</li>
                <li>이 곳은 펀딩 제목입니다. 상품클릭하면 가지는 그곳</li>
                <li>1,400,000원 중</li>
                <li><b>152% 달성</b> 12일 남음</li>
            </ul>

            <div id="rewardChoice">
                <h6>리워드 선택</h6>
                <div id="rewardGroup">

                </div>
            </div>
            
            <dl id="add">
                <dt>추가 후원금 (선택)</dt>
                <dd>추가 후원금을 더하여 신청합니다.</dd>
                <dd>추가적인 후원금은 큰 힘이 되어, 목표 금액에 더 빨리 도달할 수 있습니다.</dd>
                <dd><input type="text" name="price_support" id="price_support"><span>원</span></dd>    
            </dl>

            <dl id="open">
                <dt>후원 공개 (선택)</dt>
                <dd>본인의 이름과 얼마 만큼 결제와 후원을 했는지 공개됩니다.</dd>
                <dd>만약, 알리고 싶지 않으시다면 체크를 해제해주세요.</dd>
                <dd>
                    <i class="bi bi-check-square" id="open_name_fg"></i> 이름 비공개
                </dd>
                <dd>
                    <i class="bi bi-check-square" id="open_amount_fg"></i> 후원금액 비공개
                </dd>    
            </dl>

            <input type="button" id="nextSubmit" value="다음으로">
            
        </div>
		
	</div>
	
	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>
	
</body>
</html>
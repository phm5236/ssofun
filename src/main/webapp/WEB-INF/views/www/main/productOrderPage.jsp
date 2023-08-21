<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
    crossorigin="anonymous">
<link href="../../resources/css/productOrder.css" rel="stylesheet"    type="text/css">
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Document</title>
</head>
<body>
    <jsp:include page="../../include/fundingHeader.jsp"/>
    
     <div class="container">
       <div class="row">
        <div class="col"></div>
        <div class="col">
            <div class="row">
                <div class="col-title">주문</div>
            </div>
            <div class="row">
                <div class="col-contents"><hr>
                <div class="row">
                    <div class="col-customer">
                        <h2 class="customer-h2">구매자정보</h2>
                        <table class="customer-table">
                            <tobody>
                                <tr>
                                    <td class="customer-td1">이름</td>
                                    <td class="customer-td2">${sessionUser.nickname }</td>
                                </tr>
                            </tobody>
                        </table>
                    </div>
                </div>

                <form action="./productOrderProcess" method="post">
                <div class="row">
                    <div class="col-customer">
                        <h2 class="delivery-address-h2">받는사람 정보</h2>
                        <table class="customer-table">
                            
                                <tr>
                                    <td class="customer-td1">이름</td>
                                    <td class="customer-td2">
                                        <input type="text" name="name" placeholder="이름">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customer-td1">연락처</td>
                                    <td class="customer-td2">
                                        <input type="text" name="phone" placeholder="연락처">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customer-td1">우편번호</td>
                                    <td class="customer-td2">
                                        <input type="text" name="address_post" id="address_post" placeholder="우편번호">
                                        <input type="button" onclick="address_input()" value="우편번호 찾기">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customer-td1">기본주소</td>
                                    <td class="customer-td2">
                                        <input type="text" name="address_default" id="address_default" placeholder="기본주소">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="customer-td1">상세주소</td>
                                    <td class="customer-td2">
                                        <input type="text" name="address_detail" id="address_detail" placeholder="상세주소">
                                        <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="customer-td1">배송 요청사항</td>
                                    <td class="customer-td2">
                                        <input type="text" name="request_message" placeholder="배송 요청사항">
                                    </td>
                                </tr>
                            
                        </table>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-customer">
                         <h2 class="customer-h2">배송상품</h2>
                        <c:if test="${not empty detail}">                       
                        <table class="customer-table">
                                <tr>
                                    <td class="customer-td1">상품명</td>
                                    <td class="customer-td2">${detail[0].product_name}</td>
                                     <td class="customer-td1">수량</td>
                                    <td class="customer-td2">${count }개</td>
                                </tr>
                        </table>
                        </c:if>
                                    
                    </div>
                </div>           
                
                
                <div class="row">
                    <div class="col-customer">
                        <c:if test="${not empty detail}">
                        <h2 class="customer-h2">결제정보</h2>
                        <table class="customer-table">
                               
                                <tr>
                                    <td class="customer-td1">총삼품가격</td>
                                    <td class="customer-td2"><fmt:formatNumber value="${amount}" pattern="#,###" />원</td>
                                </tr>

                                <tr>
                                    <td class="customer-td1">배송비</td>
                                    <td class="customer-td2">0원</td>
                                </tr>

                                <tr>
                                    <td class="customer-td1">총결제금액</td>
                                    <td class="customer-td2"><fmt:formatNumber value="${amount}" pattern="#,###" />원</td>
                                </tr>
                        </table>
                        </c:if>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-agreebtn">
                        <input type="hidden" name="amount" value="${amount}" readonly/>
                        <input type="hidden" name="count" value="${count}" readonly/>                      
                        <input type="hidden" name="product_id" id="productId" readonly/>
                        <button class="prod-buy-btn">구매하기</button>            
                    </div>
                </div>
                </form>                
                
                </div>
            </div>
        </div>
        <div class="col"></div>
       </div>
    </div>
    
<script>
    // URL에서 id 값을 추출하여 productId input 요소의 value에 설정
    var url = new URL(window.location.href);
    var id = url.searchParams.get("id");
    document.getElementById("productId").value = id;
    
    
    //주소 입력 api
    function address_input() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address_post').value = data.zonecode;
                document.getElementById("address_default").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address_detail").focus();
            }
        }).open();
    }



</script>


<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
</body>
</html>

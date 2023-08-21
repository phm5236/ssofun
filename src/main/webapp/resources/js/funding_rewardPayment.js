$(document).ready(function(){
    var urlParams = new URLSearchParams(window.location.search);
    var $funding_order_id =  urlParams.get("funding_order_id");
    var user_id = getUserSession();

    setUserSession();
    getPaymentBeforeFundingOrder($funding_order_id);
    getDefaultAddress(user_id);
    setEventListener($funding_order_id,user_id);
    getUserInfo(user_id);
});

function setEventListener($funding_order_id,user_id){

    $(document).on("click","#phoneAddBtn",function(e){
        e.stopPropagation();
        var userPhone = $("#userPhone").val();
        var userPhoneLenght = userPhone.length;
        var userPhoneMatch = userPhone.match(/[^0-9]/g);

        if(userPhone == ""){
            return alert("연락처를 입력해주세요.");
        }

        if(userPhoneLenght != 11){
            return alert("연락처를 11자리로 입력해주세요.");
        }

        if(userPhoneMatch){
            return alert("연락처에 숫자만 입력해주세요.");
        }

        updateUserPhone(user_id,userPhone);
    });

    $(document).on("click","#addressInputBtn",function(event){
        event.stopPropagation(); 

        getUserAddressList(user_id);
        $("#modalBack").removeClass("hide");
        $("#addressSelectModal").removeClass("hide");

    });

    $(document).on("click","#modalBack",function(event){
        event.stopPropagation(); 
        if($("div#addressAddModal.hide").length > 0){
            $(this).addClass("hide");
            $("#addressSelectModal").addClass("hide");
        }else{
            return ;
        }
    });

    $(document).on("click","#showAddressAddModalBtn",function(event){
        event.stopPropagation(); 

        $("#addressAddModal").removeClass("hide");
    })

    $(document).on("click","#addressAddModal>ul>li:first-child",function(e){
        e.stopPropagation();

        $(this).toggleClass("checked");
        $(this).children("i").toggleClass("checked");
    });

    $(document).on("click","#addBtn",function(e){
        e.stopPropagation();

        var default_fg;
        if($("#addressAddModal>ul>li.checked:first-child").length){
            default_fg = 1;
        }else{
            default_fg = 0;
        }
        var name = $("#recipient_name").val();
        var phone = $("#address_phone").val();
        var address_post = $("#address_post").val();
        var address_default = $("#address_default").val();
        var address_detail = $("#address_detail").val();
        var request_message = $("#request_message").val();

        if(name == ""){
            return alert("이름을 입력해주세요.");
        }
        if(phone == ""){
            return alert("연락처를 입력해주세요.");
        }
        if(address_post == ""){
            return alert("우편번호를 입력해주세요.");
        }
        if(address_default == ""){
            return alert("기본주소를 입력해주세요.");
        }
        if(address_detail == ""){
            return alert("상세주소를 입력해주세요.");
        }

        insertAddAddress(default_fg,user_id,name,phone,address_post,address_default,address_detail,request_message);
        $("#addressAddModal").addClass("hide");
    });
    
    $(document).on("click","#returnBtn",function(event){
        event.stopPropagation(); 
        $("#addressAddModal").addClass("hide");
    });

    $(document).on("click","#addressSelectSection>ul",function(e){
        e.stopPropagation();

        var delivery_recipient_id;
        var name;
        var address_post;
        var address_extra;
        var address_default;
        var address_detail;
        var phone;
        var request_message;

        var index = $(this).index();
        if(index == 0){
            delivery_recipient_id = $(this).children("input.delivery_recipient_id").val();
            name = $(this).children("li:nth-child(3)").text();

            var addressPostOrgin = $(this).children("li:nth-child(4)").text().match(/\[\d+\]/); // [00000]
            address_post = addressPostOrgin[0].replace(/\[(\d+)\]/,"$1"); // 00

            var addressExtraOrigin = $(this).children("li:nth-child(4)").text().match(/\(([^)]+)\)/); // (***),***
            address_extra = addressExtraOrigin[0]; // (*

            address_default = $(this).children("li:nth-child(4)").text().replace(addressPostOrgin[0],"").replace(address_extra,"").replace(/^\s+/,"");
            address_detail = $(this).children("li:nth-child(5)").text();
            phone = $(this).children("li:nth-child(6)").text();
            request_message = $(this).children("li:nth-child(7)").text();
        }else{
            delivery_recipient_id = $(this).children("input.delivery_recipient_id").val();
            name = $(this).children("li:nth-child(2)").text();

            var addressPostOrgin = $(this).children("li:nth-child(3)").text().match(/\[\d+\]/); // [00000]
            address_post = addressPostOrgin[0].replace(/\[(\d+)\]/,"$1"); // 00000

            var addressExtraOrigin = $(this).children("li:nth-child(3)").text().match(/\(([^)]+)\)/); // (***),***
            address_extra = addressExtraOrigin[0]; // (***)

            address_default = $(this).children("li:nth-child(3)").text().replace(addressPostOrgin[0],"").replace(address_extra,"").replace(/^\s+/,"");
            address_detail = $(this).children("li:nth-child(4)").text();
            phone = $(this).children("li:nth-child(5)").text();
            request_message = $(this).children("li:nth-child(6)").text();
        }

        $("#addressSection").empty();
        $("<li><span>받는분</span>"+name+"</li>").appendTo("#addressSection");
        $("<li><span>전화번호</span>"+phone+"</li>").appendTo("#addressSection");
        $("<li><span>우편번호</span>"+address_post+"</li>").appendTo("#addressSection");
        $("<li><span>기본주소지</span><ul><li>"+address_default+"</li><li>"+address_extra+"</li></ul></li>").appendTo("#addressSection");
        $("<li><span>상세주소</span>"+address_detail+"</li>").appendTo("#addressSection");
        $("<li><span>요청사항</span>"+request_message+"</li>").appendTo("#addressSection");
        $("<input type='hidden' id='delivery_recipient_id' value='"+delivery_recipient_id+"'>").appendTo("#addressSection");
        
        $("#addressSelectModal").addClass("hide");
        $("#modalBack").addClass("hide");

    });

    $(document).on("click","input#paymentSubmit",function(event){
        event.stopPropagation();
        var totalAgreeChecked = $("#totalAgree.checked").length;
        var delivery_recipient_id = $("#addressSection>input#delivery_recipient_id").val();
        alert("delivery_recipient_id: "+delivery_recipient_id);

        if(totalAgreeChecked == 0){
            alert("전체 동의후 결제가 진행됩니다.");
        }else{
            if(delivery_recipient_id == ""){
                alert("배송지 정보 등록후 결제가 진행됩니다.");
            }else{
                payment($funding_order_id,delivery_recipient_id);
            }
        }
    });
    
    // 동의사항 수정해야함..!
    $(document).on("click","#agree>li#totalAgree",function(event){
        event.stopPropagation(); 
        if($("#agree>li.checked").length <= 0 || $("#agree>li.checked").length === 3){

            $(this).toggleClass("checked");
            $(this).children("i").toggleClass("checked");
            
            $("#agree>li").eq(1).toggleClass("checked");
            $("#agree>li").eq(1).children("i").toggleClass("checked");
            
            $("#agree>li").eq(2).toggleClass("checked");
            $("#agree>li").eq(2).children("i").toggleClass("checked");
        
        }else{

            $(this).toggleClass("checked");
            $(this).children("i").toggleClass("checked");

            $("#agree>li").not("#agree>li.checked").toggleClass("checked");
            $("#agree>li").not("#agree>li.checked").children("i").toggleClass("checked");

        }
    });
    
    $(document).on("click","#agree>li:nth-child(2)",function(event){
        event.stopPropagation(); 
        if($("#agree>li#totalAgree.checked").length > 0){
            $("#agree>li#totalAgree").toggleClass("checked");
            $("#agree>li#totalAgree").children("i").toggleClass("checked");

            $(this).toggleClass("checked");
            $(this).children("i").toggleClass("checked");
        }else{
            $(this).toggleClass("checked");
            $(this).children("i").toggleClass("checked");
        }
    });
    
    $(document).on("click","#agree>li:nth-child(3)",function(event){
        event.stopPropagation(); 
        if($("#agree>li#totalAgree.checked").length > 0){
            $("#agree>li#totalAgree").toggleClass("checked");
            $("#agree>li#totalAgree").children("i").toggleClass("checked");

            $(this).toggleClass("checked");
            $(this).children("i").toggleClass("checked");
        }else{
            $(this).toggleClass("checked");
            $(this).children("i").toggleClass("checked");
        }
    });

    $(document).on("click","#searchAddressBtn",function(e){
        e.stopPropagation();
        getPostcode();
    });


    $(document).on("click","#header>div>div>a#logout",function(e){
        e.stopPropagation();
        logout();
    });

}

function logout(){
    $.ajax({
        url: "../user/AJAXlogout",
        method: "GET",
        success: function(res){
            if(res == 1){
                alert("로그아웃 성공!");
                window.location.href = "http://localhost:8181/www/www/funding/fundingMainPage";
            }else{
                alert("이미 로그아웃 되어있습니다.");
            }
        }
    });
}

function payment($funding_order_id,$delivery_recipient_id){ //$delivery_recipient_id 넣어야함


    IMP.init("imp33817838");

    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;


    var rewardCount = $("#rewardGroups>ul").length;
    var name = $("#rewardGroups>ul:first-of-type>li.title").text();
    var orderName;
    if(rewardCount>1){
        orderName = name+"외 "+rewardCount+"건";
    }else{
        orderName = name;
    }

    var buyerName = $("#addressSection>li").first().text().replace("받는분", "");
    var $amount = $("#choiceReward>ul:first-of-type>li:last-child>b").text().replace(/[^0-9]/g, '');
    var buyerEmail = $("#supporterInfo>ul>li:first-child").text().replace("이메일", "");
    var buyerTel = $("#addressSection>li:nth-child(2)").text().replace(/[^0-9]/g, "");

    var defaultAddr = $("#addressSection>li:nth-child(4)>ul>li:first-child").text();
    var detailAddr = $("#addressSection>li:nth-child(5)").text().replace("상세주소", "");
    var buyerAddr = defaultAddr+" "+detailAddr;
    
    var buyerPostcode = $("#addressSection>li:nth-child(3)").text().replace("우편번호", "");
    var requestMessage = $("#addressSection>li:last-child").text().replace("요청사항","");
    // alert(buyerPostcode);

    var data = {
        pg: "html5_inicis.INIpayTest",
        pay_method: "card",
        merchant_uid: "KDS"+makeMerchantUid,   // 주문번호
        name: orderName,
        amount: $amount,                         // 숫자 타입
        buyer_email: buyerEmail,
        buyer_name: buyerName,
        buyer_tel: buyerTel,
        buyer_addr: buyerAddr,
        buyer_postcode: buyerPostcode
        };

        IMP.request_pay(data,function(rsp){
            if(rsp.success){
                //STEP 4
                $.ajax({
                    url: "./AJAXcallback_receive",
                    // url: "./AJAXwebhook_receive", //ngrok으로 연결후 사용해야함 -> 아임포트 웹훅 URL변경 필수
                    method: "POST",
                    headers: {"Content-Type": "application/json"},
                    data: JSON.stringify(rsp)
                }).done(function(data) {
                    //STEP 6
                    alert("결제 성공!!! 결제 정보 입력 실행!"+JSON.stringify(data));
                    
                    var $token = "b068c276cfbaabb6a1020150348545ddb9cb4eab"; // 콜백용 token값 설정

                    $.ajax({
                        url: "./AJAXinsertPayment",
                        method: "POST",
                        data: {token:$token,amount:$amount},
                        success:function(res){
                            if(res != 0 ){

                                var payment_id = res;

                                $.ajax({
                                    url: "./AJAXinsertOrderPayment",
                                    method: "POST",
                                    data: {payment_id:payment_id, funding_order_id:$funding_order_id},
                                    success: function(res){


                                        $.ajax({
                                            url: "./AJAXupdateFundingRewardOrder?funding_order_id="+$funding_order_id,
                                            method: "PATCH",
                                            data: JSON.stringify({delivery_recipient_id:$delivery_recipient_id, used_fg: 1, status: 3 }), // JSON 문자열로 데이터 직렬화 //status:3 -> 3는 결제완료 의미
                                            contentType: "application/json", // Content-Type 헤더 설정 
                                            success: function(res){
                                                if(res == 1){
                                                    
                                                    $.ajax({
                                                        url: "./AJAXupdateFundingOrder?funding_order_id="+$funding_order_id,
                                                        method: "PATCH",
                                                        data: JSON.stringify({ used_fg: 1, funding_order_status_id: 3 }), // JSON 문자열로 데이터 직렬화 //funding_order_status_id:3 -> 3는 결제완료 의미
                                                        contentType: "application/json", // Content-Type 헤더 설정 
                                                        success: function(res){
                                                            if(res == 1){
                                                                alert("주문 확정 완료!!");
                                                                location.href = "./fundingCompletePaymentPage?funding_order_id="+$funding_order_id;
                                                            }
                                                        }
                                                    });
                                                }
                                            }
                                        });
        
                    
                                          
                                           

                                    }
                                });

                                
                            }else{
                                alert("결제정보 입력에 실패하였습니다.");
                            }
                        }
                    });

                    
                    

                    
                    });
                
            }else{
                alert("결제에 실패하였습니다. 에러내용: "+rsp.error_msg);
            }
            });
};

function getPaymentBeforeFundingOrder($funding_order_id){
    $.ajax({
        url: "./AJAXgetPaymentBeforeFundingOrder",
        method: "GET",
        data:{funding_order_id:$funding_order_id},
        success: function(res){
            var $rewardGroup = $("div#rewardGroups");
            $.each(res,function(key,value){
                if(key == "price_support"){
                    var price_support = addCommas(value);
                    $("#choiceReward>ul:first-of-type>li:nth-child(2)>b").text(price_support+"원");
                }
                // if(key == ""){
                //     var delivery_price = addCommas(value);
                //     $("#choiceReward>ul:first-of-type>li:nth-child(3)>b").text(delivery_price+"원");
                // }
                if(key == "total_price"){
                    var total_price = addCommas(value);
                    $("#choiceReward>ul:first-of-type>li:last-child>b").text(total_price+"원");
                }
                if(key =="rewardList"){
                    $.each(value,function(index,item){
                        var $ul = $("<ul></ul>");
                        var count;
                        $.each(item,function(key,value){
                            if(key == "fundingRewardDto"){
                                $.each(value,function(key,value){
                                    if(key == "title"){
                                        $("<li class='title'>"+value+"</li>").appendTo($ul);
                                    }
                                    if(key == "itemList"){
                                        var $detail = $("<li class='detail'></li>");
                                        var $itemList = $("<ul></ul>");
                                        $.each(value,function(index,item){
                                            var name;
                                            $.each(item,function(key,value){
                                                if(key == "name"){
                                                    name = value;
                                                }
                                                if(key == "count"){
                                                    $("<li>&#8226; "+name+" "+value+"개</li>").appendTo($itemList);
                                                }
                                            });
                                        });
                                        $detail.append($itemList);
                                        $ul.append($detail);
                                    }

                                    // if(key == "delivery_from"){
                                        
                                    // }
                                });
                            }

                            if(key == "count"){
                                count = value;
                            }

                            if(key == "amount"){
                                var total = count * value;
                                var totalPrice = addCommas(total);
                                $("<li class='total'><span>수량 "+count+"개</span><b>"+totalPrice+"원</b></li>").appendTo($ul);
                            }

                        });

                        $rewardGroup.append($ul);
                    });
                }
            });
        }
    });
};

function addCommas(num){
    var str = num.toString();
    if(str.length >= 4){
        str = str.replace(/(\d)(?=(\d{3})+$)/g, '$1,');
    }

    return str;
};

function getDefaultAddress(user_id){
    $("#addressSection").empty();

    $.ajax({
        url: "./AJAXgetDefaultAddress",
        method: "GET",
        data: {user_id:user_id},
        success: function(res){
            if(res != ""){
                var default_fg;
                var delivery_recipient_id;
                var name;
                var phone;
                var address_post;
                var address_default;
                var address_detail;
                $.each(res,function(key,value){
                    if(key == "default_fg"){
                        default_fg = value;
                    }

                    if(key == "delivery_recipient_id"){
                        delivery_recipient_id = value;
                    }

                    if(key == "name"){
                        name = value;
                    }

                    if(key == "phone"){
                        phone = value;
                    }

                    if(key == "address_post"){
                        address_post = value;
                    }

                    if(key == "address_default"){
                        address_default = value;
                    }

                    if(key == "address_detail"){
                        address_detail = value;
                    }

                    if(key == "request_message"){
                        var addressExtraOrigin = address_default.match(/\(([^)]+)\)/);
                        var address_extra = addressExtraOrigin[0];
                        address_default = address_default.replace(address_extra,"");

                        $("<li><span>받는분</span>"+name+"</li>").appendTo("#addressSection");
                        $("<li><span>전화번호</span>"+formatPhoneNumber(phone)+"</li>").appendTo("#addressSection");
                        $("<li><span>우편번호</span>"+address_post+"</li>").appendTo("#addressSection");
                        $("<li><span>기본주소지</span><ul><li>"+address_default+"</li><li>"+address_extra+"</li></ul></li>").appendTo("#addressSection");
                        $("<li><span>상세주소</span>"+address_detail+"</li>").appendTo("#addressSection");
                        $("<li><span>요청사항</span>"+value+"</li>").appendTo("#addressSection");
                        $("<input type='hidden' id='delivery_recipient_id' value='"+delivery_recipient_id+"'>").appendTo("#addressSection");
                    }
                });
                
            }else{
                $("<li><span>받는분</span>-</li>").appendTo("#addressSection");
                $("<li><span>전화번호</span>-</li>").appendTo("#addressSection");
                $("<li><span>우편번호</span>-</li>").appendTo("#addressSection");
                $("<li><span>기본주소지</span><ul><li>-</li><li>-</li></ul></li>").appendTo("#addressSection");
                $("<li><span>상세주소</span>-</li>").appendTo("#addressSection");
                $("<li><span>요청사항</span>-</li>").appendTo("#addressSection");
                $("<input type='hidden' id='delivery_recipient_id' value=''>").appendTo("#addressSection");
        }
        }
    });
}

function getUserAddressList(user_id){
    $("#addressSelectSection").empty();
    

    $.ajax({
        url: "./AJAXgetUserAddressList",
        method: "GET",
        data: {user_id:user_id},
        success: function(res){
            if(res != ""){
                $.each(res,function(index,item){
                    var basic = $("<ul class='basic'></ul>");
                    var ul = $("<ul></ul>");

                    var default_fg;
                    var delivery_recipient_id;
                    var name;
                    var phone;
                    var address_post;
                    var address_default;
                    var address_detail;
                    $.each(item,function(key,value){
                        if(key == "default_fg"){
                            default_fg = value;
                        }

                        if(key == "delivery_recipient_id"){
                            delivery_recipient_id = value;
                        }

                        if(key == "name"){
                            name = value;
                        }

                        if(key == "phone"){
                            phone = value;
                        }

                        if(key == "address_post"){
                            address_post = value;
                        }

                        if(key == "address_default"){
                            address_default = value;
                        }

                        if(key == "address_detail"){
                            address_detail = value;
                        }

                        if(key == "request_message"){
                            if(default_fg == 1){
                                $("<input type='hidden' class='delivery_recipient_id' value='"+delivery_recipient_id+"'>").appendTo(basic);
                                $("<li>기본</li>").appendTo(basic);
                                $("<li>"+name+"</li>").appendTo(basic);
                                $("<li>["+address_post+"] "+address_default+"</li>").appendTo(basic);
                                $("<li>"+address_detail+"</li>").appendTo(basic);
                                $("<li>"+formatPhoneNumber(phone)+"</li>").appendTo(basic);
                                $("<li>"+value+"</li>").appendTo(basic);
                                basic.prependTo("#addressSelectSection");
                            }else{
                                $("<input type='hidden' class='delivery_recipient_id' value='"+delivery_recipient_id+"'>").appendTo(ul);
                                $("<li>"+name+"</li>").appendTo(ul);
                                $("<li>["+address_post+"] "+address_default+"</li>").appendTo(ul);
                                $("<li>"+address_detail+"</li>").appendTo(ul);
                                $("<li>"+formatPhoneNumber(phone)+"</li>").appendTo(ul);
                                $("<li>"+value+"</li>").appendTo(ul);
                                ul.appendTo("#addressSelectSection");
                            }
                        }
                    });
                });
            }else{
                $("#addressSelectSection").html("<p id='addressEmpty'>등록된 배송지가 없어요 :(<p>");
            }
        }
    });
}

function formatPhoneNumber(phoneNumber) {
    // 정규식을 사용하여 전화번호 형식을 변환합니다.
    return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
}

function getPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var extra;
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
                extra = extraAddr;
            
            }else {
                extra = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address_post').value = data.zonecode;
            document.getElementById("address_default").value = addr+" "+extra;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address_detail").focus();
        }
    }).open();
}



function insertAddAddress(default_fg,$user_id,name,phone,address_post,address_default,address_detail,request_message){
    $.ajax({
        url: "./AJAXinsertDeliveryRecipient",
        method: "POST",
        data: {default_fg:default_fg,user_id:$user_id, name:name, phone: phone, address_post:address_post, address_default:address_default, address_detail:address_detail, request_message:request_message},
        success: function(res){
            // 새로 등록된 주소의 default_fg가 1인 경우 
            // 기존 기본 주소의 default_fg를 0으로 수정한후 주소목록 불러오기
            if(default_fg == 1){
                updateAddressDefaultFg(res,$user_id);
            }else{
                $("#recipient_name").val("");
                $("#address_phone").val("");
                $("#address_post").val("");
                $("#address_default").val("");
                $("#address_detail").val("");
                $("#request_message").val("");

                getUserAddressList($user_id);
            }

        }
    });
}

function updateAddressDefaultFg(delivery_recipient_id,$user_id){
    $.ajax({
        url: "./AJAXupdateAddressDefaultFg?delivery_recipient_id="+delivery_recipient_id,
        method: "PATCH",
        contentType: "application/json",
        data: JSON.stringify({user_id:$user_id,default_fg:0}),
        success: function(res){
            if(res != 0){ //res가 0인 경우 실패, 1인 경우 성공
                alert("기본 배송지 등록 성공!");

                $("#addressAddModal>ul>li:first-child").removeClass("checked");
                $("#recipient_name").val("");
                $("#address_phone").val("");
                $("#address_post").val("");
                $("#address_default").val("");
                $("#address_detail").val("");
                $("#request_message").val("");

                getUserAddressList($user_id);
            }else{
                alert("기본 배송지 변경에 실패했습니다. 다시 등록해주세요.");
            }
        }
    });
}


function setUserSession(){
    $.ajax({
        url: "../user/AJAXsetUserSession",
        method: "GET",
        success: function(res){
            if(res == 0){
                alert("세션이 종료되어 로그아웃되었습니다.");
                window.location.href = "../user/userLoginPage";
            }
        }
    });
}



function getUserSession(){
    var user_id;

    $.ajax({
        url: "../user/AJAXgetUserSession",
        method: "GET",
        async: false,
        success: function(res){
            if(res != null){
                user_id = res;
            }else{
                user_id = 0;
            }
        }
    });

    if(user_id != 0){
        return user_id;
    }else{
       return 0;
    }
}


function getUserInfo(user_id){
    $("#supporterInfo>ul").empty();

    $.ajax({
        url: "../user/AJAXgetUserInfo",
        method: "GET",
        data: {user_id:user_id},
        success: function(res){
            if(res != ""){
                var ul = $("#supporterInfo>ul");
                var name;
                var phone;
                $.each(res,function(key,value){
                    if(key == "name"){
                        name = value;
                    }
                    if(key == "phone"){
                        phone = value;
                    }

                    if(key == "email"){
                        if(phone != null){
                            $("<li><span>이메일</span><span id='userEmail'>"+value+"</span></li>").appendTo(ul);
                            $("<li><span>이름</span><span id='userName'>"+name+"</span></li>").appendTo(ul);
                            $("<li><span>연락처</span><span id='userPhone'>"+formatPhoneNumber(phone)+"</span></li>").appendTo(ul);
                        }else{
                            $("<li><span>이메일</span><span id='userEmail'>"+value+"</span></li>").appendTo(ul);
                            $("<li><span>이름</span><span id='userName'>"+name+"</span></li>").appendTo(ul);
                            $("<li id='phoneInput'><span>연락처</span><input type='text' id='userPhone' placeholder='- 없이 입력해주세요.'><input type='button' id='phoneAddBtn' value='등록'></li>").appendTo(ul);
                        }
                    }
                });
            }
        }
    });
}


function updateUserPhone(user_id,phone){
    $.ajax({
        url: "../user/AJAXupdateUserPhone?user_id="+user_id,
        method: "PATCH",
        contentType: "application/json",
        data: JSON.stringify({phone:phone}),
        success: function(res){
            if(res != 0){
                alert("연락처가 등록되었습니다.");
                getUserInfo(user_id);
            }else{
                alert("연락처 등록이 실패하였습니다. 다시 시도해주세요.")
            }
        }
    });
}
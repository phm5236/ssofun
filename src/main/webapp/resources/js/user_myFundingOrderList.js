$(document).ready(function(){
    var user_id = getUserSession();

    getFundingOrderList(user_id);
    setEventListener(user_id);
    getUserName(user_id);
    

});

function setEventListener(user_id){

    $(document).on("click","#myPageTab>li:first-child",function(e){
        e.stopPropagation();
        window.location.href = "../store/userMyPage";
    });

    $(document).on("click","#myPageTab>li:first-child>a",function(e){
        e.stopPropagation();
        window.location.href = "../store/userMyPage";
    });
    
    $(document).on("click","#myPageTab>li:last-child",function(e){
        e.stopPropagation();
        window.location.href = "../maker/makerMyPage";
    });

    $(document).on("click","#myPageTab>li:last-child>a",function(e){
        e.stopPropagation();
        window.location.href = "../maker/makerMyPage";
    });

    $(document).on("click","#header>div>div>a#logout",function(e){
        e.stopPropagation();
        logout();
    });

    $(document).on("click","#first>li#logout",function(e){
        e.stopPropagation();
        logout();
    });
    


}

function getUserName(user_id){
    $.ajax({
        url: "../user/AJAXgetUserName",
        method: "GET",
        data: {user_id:user_id},
        success: function(res){
            if(res != ""){
                $("#makerName").text(res+"님");
            }
        }
    });
}

function getUserSession(){
    var user_id;

    $.ajax({
        url: "../user/AJAXgetUserSession",
        metho: "GET",
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
        alert("세션이 만료되어 로그아웃되었습니다.");
        window.location.href = "../user/userLoginPage";
    }
}

function logout(){
    $.ajax({
        url: "../user/AJAXlogout",
        method: "GET",
        success: function(res){
            if(res == 1){
                alert("로그아웃 성공!");
                window.location.href = "http://localhost:8181/www/funding/fundingMainPage";
            }else{
                alert("이미 로그아웃 되어있습니다.");
            }
        }
    });
}

function getFundingOrderList(user_id){
    $.ajax({
        url: "./AJAXgetFundingOrderList",
        method: "GET",
        data: {user_id:user_id},
        success: function(res){
            if(res != ""){
                $.each(res,function(index,item){
                    var list = $("#list");
                    var funding = $("<div class='funding'></div>");
                    var a = $("<a href='#'></a>");
                    var btnUl = $("<ul class='btnSection'></ul>");
                    var dl = $("<dl></dl>");
                    var total_price;
                    $.each(item,function(key,value){
                        if(key == "funding_order_id"){
                            $("<input type='hidden' class='"+key+"' value='"+value+"'>").appendTo(btnUl);
                            $("<li class='orderDetail'>주문상세 <i class='bi bi-chevron-right'></i></li>").appendTo(btnUl);
                        }
                        if(key == "created_at"){
                            $("<span class='paymentDate'>"+value+"</span>").appendTo(funding);
                        }
                        if(key == "fundingDto"){
                            $.each(value,function(key,value){
                                if(key == "thumbnailList"){
                                    $.each(value,function(inex,item){
                                        var url;
                                        $.each(item,function(key,value){
                                            if(key == "url"){
                                                url = value;
                                            }
                                            if(key == "image_order"){
                                                if(value == 1){
                                                    $("<dt><img src='../../resources/img/kimdaseul/funding/"+url+"' alt=''></dt>").appendTo(dl);
                                                }
                                            }
                                        });
                                    });
                                }

                                if(key == "title"){
                                    $("<dd class='title'>"+value+"</dd>").appendTo(dl);
                                }
                            });
                        }

                        if(key == "total_price"){
                            total_price = addCommas(value);
                        }

                        if(key == "rewardList"){
                            var rewardList = $("<dd class='rewardList'></dd>");
                            var prevDateString;
                            var prevDate;
                            var length = value.length;
                            var checkLength;
                            var dateString;
                            var delivery_from;
                            $.each(value,function(index,item){
                                $.each(item,function(key,value){

                                    if(key == "fundingRewardDto"){
                                        $.each(value,function(key,value){
                                            if(key == "title"){
                                                $("<span class='reward'>"+value+"</span>").appendTo(rewardList);
                                            }
                                            if(key == "delivery_from"){
                                                dateString = value.replace(/\s/g,"");

                                                if(length == 1){ //리워드가 하나밖에 없을 경우
                                                    return delivery_from = $("<dd class='deliveryDate'><span>"+dateString+"</span> 배송예정</dd>");
                                                }
        
                                                if(prevDateString == null){ //첫번째 리워드인 경우
                                                    prevDate = new Date(dataString);
                                                    return prevDateString = dataString;
                                                }
                                                
                                                checkLength +=1;
                                                var date = new Date(dateString);
        
                                                if(date == prevDate){ //리워드 날짜가  동일한 경우
                                                    if(checkLength == length){ // 날짜가 동일하고 마지막 리워드인 경우
                                                        return delivery_from = $("<dd class='deliveryDate'><span>"+dataString+"</span> 배송예정</dd>");
                                                    }else{
                                                        prevDate = new Date(dataString);
                                                        return prevDateString = dataString;
                                                    }
                                                }else if(date > prevDate){ //현재 리워드가 더 큰 경우
                                                    if(checkLength == length){ // 마지막 리워드인 경우
                                                        return delivery_from = $("<dd class='deliveryDate'><span>"+dataString+"</span> 배송예정</dd>");
                                                    }else{
                                                        prevDate = new Date(dataString);
                                                        return prevDateString = dataString;
                                                    }
                                                }else{ //이전 리워드가 더 큰 경우
                                                    if(checkLength == length){ // 마지막 리워드인 경우
                                                        return delivery_from = $("<dd class='deliveryDate'><span>"+prevDateString+"</span> 배송예정</dd>");
                                                    }else{
                                                        prevDate = new Date(prevDateString);
                                                        return prevDateString = prevDateString;
                                                    }
                                                }
                                                
                                            }
                                        });
                                    }
                                    
                                    if(key == "delivery_recipient_id"){
                                        getDeliveryExist(value,function(res){
                                            if(res == 0){
                                                $("<li class='deliveryStatusBtn'>주문 취소<li>").appendTo(btnUl);
                                            }else{
                                                getDeliveryStatus(value,function(res){
                                                    
                                                    if(res == "배송 대기중" || res == "배송 중"){
                                                        $("<li class='deliveryStatusBtn'>배송 중<li>").appendTo(btnUl);
                                                    }else if(res == "배송 완료" || res == "수령 완료"){
                                                        $("<li class='deliveryStatusBtn'>구매 확정<li>").appendTo(btnUl);
                                                    }else if(res == "구매 확정"){
                                                        $("<li class='deliveryStatusBtn'>리뷰 작성<li>").appendTo(btnUl);
                                                    }else if(res == "리뷰 작성 완료"){
                                                        $("<li class='deliveryStatusBtn'>리뷰 보기<li>").appendTo(btnUl);
                                                    }
                                                });
                                            }
                                        });
                                    }
                                });
                            });
                            
                            rewardList.appendTo(dl);
                            delivery_from.appendTo(dl);
                            $("<dd class='totalPrice'><span>"+total_price+"원</span> 결제 완료</dd>").appendTo(dl);
                            dl.appendTo(a);
                            a.appendTo(funding);
                            btnUl.appendTo(funding);
                        }
                    });
                    funding.appendTo(list);
                });
                divHeightSense();
            }else{
                $("<div id='fundingOrderListEmpty'>후원한 프로젝트가 없습니다 :(</div>").appendTo("#list");
                divHeightSense();
            }
        }
    });

}

function getDeliveryExist(delivery_recipient_id,callback){
    $.ajax({
        url: "../maker/AJAXgetDeliveryExist",
        method: "GET",
        data: {delivery_recipient_id:delivery_recipient_id},
        success: function(res){
            callback(res);            
        }
    });
}

function getDeliveryStatus(delivery_recipient_id,callback){
    $.ajax({
        url: "../maker/AJAXgetDeliveryStatus",
        method: "GET",
        data:{delivery_recipient_id:delivery_recipient_id},
        success: function(res){
            if(res != null){
                $.each(res, function(key,value){
                    if(key == "name"){
                        callback(value);
                    }

                });
            }
        }
    });
}

function addCommas(num){
    var str = num.toString();
    if(str.length >= 4){
        str = str.replace(/(\d)(?=(\d{3})+$)/g, '$1,');
    }

    return str;
}

function divHeightSense(){
    var divHight =  $('div#myPageSection').height();
    $('#topBg').height(divHight+160);
    $('#height').height(divHight+160);
}
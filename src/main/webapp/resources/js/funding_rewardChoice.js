$(document).ready(function(){
    var urlParams = new URLSearchParams(window.location.search);
    var $funding_id =  urlParams.get("funding_id");
    var funding_reward_id =  urlParams.get("funding_reward_id");
    var user_id = getUserSession();
    
    setUserSession();
    getFundingDto($funding_id,funding_reward_id);
    setEventListener($funding_id,user_id);
});

function setEventListener($funding_id,user_id){

    $(document).on("click","#rewardGroup>.reward>ul:first-of-type",function(e){
        e.stopPropagation(); 
        $(this).children("li").eq(1).toggleClass("activeColor");
        $(this).children("li:eq(1)").children("i").toggleClass("activeColor");
        $(this).parent("div").toggleClass("checked");
        $(this).next().children("li").first().children("input").val("");
        $(this).next().children("li").first().children("input").removeClass("activeInput");
        $(this).next().children("li.activeColor").removeClass("activeColor");
        $(this).next().toggleClass("hide");
    });
    
    $(document).on("focus","#rewardGroup>.reward>ul:last-of-type>li:first-child>input",function(e){
        e.stopPropagation(); 
        $(this).addClass("activeInput");
        $(this).parent("li").next().addClass("activeColor");
    });

    $(document).on("blur","#rewardGroup>.reward>ul:last-of-type>li:first-child>input",function(e){
        e.stopPropagation();         
        var $thisVal = $(this).val();
        var valParseInt = parseInt($thisVal);
        var buyCountVal = $(this).parent("li").next("li").next("li").text().replace(/[^0-9]/g,"");
        var buyCount = parseInt(buyCountVal);
        // var buyCount = 5;
        if($thisVal != ""){
            if(valParseInt>buyCount){
                alert("최대 "+buyCount+"개까지 구매 가능합니다.");
                $(this).val("");
                $(this).removeClass("activeInput");
                $(this).parent("li").next().removeClass("activeColor");
            }else{
                $(this).val($thisVal+"개");
                $(this).addClass("activeInput").addClass("activeColor");
                $(this).parent().next().addClass("activeColor");
            }
        }else{
            $(this).removeClass("activeInput");
            $(this).parent("li").next().removeClass("activeColor");
        }    
    });

    $(document).on("click","#nextSubmit",function(e){
        e.stopPropagation(); 
        if($("div.checked").length){
            var inputValue = $("div.checked>ul:last-of-type>li>input").val();
            
            if(inputValue == ""){
                alert("최소 1개 이상의 리워드 수량을 입력해주세요.");
            }else{
                insertFundingOrder(user_id);
            }
        }else{
            alert("최소 1개 이상의 리워드를 선택해주세요.");
        }
        
    });
    
    $(document).on("input","#price_support",function(e){
        e.stopPropagation(); 
        // 현재 입력된 값 가져오기
        var value = $(this).val();
        
        // 콤마 제거하기
        value = value.replace(/,/g, '');
        
        // 숫자만 남기기
        value = value.replace(/\D/g, '');
        
        // 세 자리마다 콤마 추가하기
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        
        // 값 업데이트
        $(this).val(value);
    });


    $(document).on("click","#open>dd:nth-child(4)",function(e){
        e.stopPropagation(); 
        $(this).toggleClass("checked");
        $(this).children("i").toggleClass("activeColor");
    });
    
    
    $(document).on("click","#open>dd:last-child",function(e){
        e.stopPropagation(); 
        $(this).toggleClass("checked");
        $(this).children("i").toggleClass("activeColor");
    });

    $(document).on("click","#header>div>div>a#logout",function(e){
        e.stopPropagation();
        logout();
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

function insertFundingOrder(user_id){
    
    var $rewardList = [];
    var $total_price = 0;
    
    $("div.checked").each(function(i){
        
        var reward_id =  $(this).children("ul").first().children("li").first().children("input").val();
        
        var currentCountValue = $(this).children("ul").last().children("li").children("input").val();
        var reward_count = currentCountValue.replace(/[^0-9]/g, '');
        
        var currentAmountValue = $(this).children("ul").first().children("li.first").children("b").text();
        var reward_amount = currentAmountValue.replace(/[^0-9]/g, '');
        
        var fundingRewardOrderDto = {
            funding_reward_id : reward_id,
            count: reward_count,
            amount: reward_amount,
            status: 1 // 1 -> 주문 진행중
        };

        
        $total_price += parseInt(reward_count*reward_amount);
        
        $rewardList.push(fundingRewardOrderDto);
        
    });
    
    var $price_support = $("#price_support").val().replace(/[^0-9]/g, '');
    if($price_support == ""){
        $price_support = 0;
    }

    $total_price += parseInt($price_support);
    
    
    var $open_name_fg = 0;
    var $open_amount_fg = 0;

    $("dd.checked").each(function(i){
        var checkValue = $(this).text().replace(/\s/g, "");

        if(checkValue == "후원금액비공개"){
            $open_amount_fg = 1;
        }
        if(checkValue == "이름비공개"){
            $open_name_fg = 1;
        }

    });
    
    var $fundingOrderDto = {
        user_id: parseInt(user_id),
        funding_order_status_id: 1, // 1 -> 주문 진행중
        price_support: $price_support,
        open_name_fg: $open_name_fg,
        open_amount_fg: $open_amount_fg,
        total_price: $total_price,
        rewardList: $rewardList
    };


    $.ajax({
        url: "./AJAXinsertFundingOrder",
        method: "POST",
        data: JSON.stringify($fundingOrderDto),
        contentType : "application/json",
        success: function(res){
            if(res != 0){
                alert("주문 데이터 입력 완료! 리워드 데이터 입력 실행!!");
                location.href = "./fundingRewardPaymentPage?funding_order_id="+res;
            }else{
                alert("주문 처리중 문제가 발생했습니다. 다시 시도해주세요.")
            }
        }
    });
};





function getFundingDto($funding_id,$funding_reward_id){
    $.ajax({
        url: "./getFundingDtoAjax",
        method: "GET",
        data: {funding_id:$funding_id},
        success: function(res){
            $.each(res,function(key,value){

                if(key == "thumbnailList"){
                    $.each(value,function(index,item){
                        var $url;
                        $.each(item,function(key,value){
                            if(key == "url"){
                                $url = value;
                            }

                            if(key == "image_order"){
                                if(value == 1){
                                    $("#fundingInfo>li:first-child").html("<img src='../../resources/img/kimdaseul/funding/"+$url+"' alt='리스트 섬네일'>");
                                }
                            }
                        });
                    });
                }

                if(key == "funding_category_id"){
                    $("#fundingInfo>li:nth-child(2)").text(getFundingCategoryName(value));
                }
                if(key == "title"){
                    $("#fundingInfo>li:nth-child(3)").text(value);
                }

                if(key == "target_price"){
                    var achievementRate = getFundingAchievementRate($funding_id);
                    var $d_day = getDday($funding_id);
                    var achievement = getfundingAchievement($funding_id);

                    if(achievement != 0){
                        achievement = addCommas(achievement);
                    }
                    $("#fundingInfo>li:nth-child(4)").html(achievement+"원");
                    $("#fundingInfo>li:last-child").html("<b>"+achievementRate+"% 달성</b> "+$d_day+"일 남음");
                }
     
                if(key == "rewardList"){
                    $.each(value,function(index,item){
                        var $rewardGroup = $("#rewardGroup");
                        var $rewardDiv = $("<div class='reward'></div>");
                        var $ul = $("<ul></ul>");
                        var $ulInput = $("<ul></ul>");
                        var price;
                        var title;
                        var description;
                        var $itemList = $("<ul class='itemList'></ul>");
                        var stock_max;
                        var funding_reward_id;
                        var buy_count;
                        $.each(item,function(key,value){
                            if(key == "funding_reward_id"){
                                funding_reward_id = value;
                            }
                            if(key == "price"){
                                var commasPrice = addCommas(value);
                                price = commasPrice;
                            }
                            if(key == "title"){
                                title = value;
                            }
                            if(key == "description"){
                                description = value;
                            }
                            if(key == "itemList"){
                                $.each(value,function(index,item){
                                    var name;
                                    $.each(item,function(key,value){                                        
                                        if(key == "name"){
                                            name = value;
                                        }
                                        if(key == "count"){
                                            $itemList.append("<li>&#8226; "+name+" "+value+"개</li>");
                                        }
                                    });
                                });
                                $("<li></li>").append($itemList).appendTo($ul);
                            }
                            if(key == "stock_max"){
                                stock_max = value;
                                
                                getRewardPaymentCount(function(res){
                                    var paymentCountCommas = addCommas(res);
                                    if(value == 0){
                                        $ul.prepend("<li>"+description+"</li>");
                                        $ul.prepend("<li>"+title+"</li>");
                                        $ul.prepend("<li>"+paymentCountCommas+"명이 선택</li>");
                                        if($funding_reward_id != "" && $funding_reward_id == funding_reward_id){
                                            $ul.prepend("<li class='first activeColor'><i class='bi bi-check-square activeColor'></i><b>"+price+"원</b><span>남은수량 "+value+"개</span></li>");
                                        }else{
                                            $ul.prepend("<li class='first'><i class='bi bi-check-square'></i><b>"+price+"원</b><span>남은수량 "+value+"개</span></li>");
                                        }
                                        $ul.prepend("<li><input type='hidden' class='rewardId' value='"+funding_reward_id+"'></li>");
                                    }else{
                                        if(res < value){
                                            $ul.prepend("<li>"+description+"</li>");
                                            $ul.prepend("<li>"+title+"</li>");
                                            $ul.prepend("<li>"+paymentCountCommas+"명이 선택</li>");
                                            if($funding_reward_id != "" && $funding_reward_id == funding_reward_id){
                                                $ul.prepend("<li class='first activeColor'><i class='bi bi-check-square activeColor'></i><b>"+price+"원</b><span>남은수량 "+(value - res)+"개</span></li>");
                                            }else{
                                                $ul.prepend("<li class='first'><i class='bi bi-check-square'></i><b>"+price+"원</b><span>남은수량 "+(value - res)+"개</span></li>");
                                            }
                                            $ul.prepend("<li><input type='hidden' class='rewardId' value='"+funding_reward_id+"'></li>");
                                        }else if(res >= value){
                                            $ul.prepend("<li class='soldOut'>"+description+"</li>");
                                            $ul.prepend("<li class='soldOut'>"+title+"</li>");
                                            $ul.prepend("<li class='soldOut'>"+paymentCountCommas+"명이 선택</li>");
                                            $ul.prepend("<li class='soldOut first'><i class='bi bi-check-square'></i><b>"+price+"원</b><span class='activeColor'>남은수량 0개 (매진)</span></li>");
                                            $ul.prepend("<li><input type='hidden' class='funding_reward_id' value='"+funding_reward_id+"'></li>");
                                        }
                                    }
                                    
                                },funding_reward_id);
                            }

                            if(key == "buy_count"){
                                buy_count = value
                            }
                            if(key == "delivery_from"){
                                getRewardPaymentCount(function(res){
                                    if(res < stock_max || stock_max == 0){                                    
                                        $ul.append("<li><span>발송예정일</span> "+value+" 예정</li>");
                                        if(buy_count == 0){
                                            if($funding_reward_id != "" && $funding_reward_id == funding_reward_id){
                                                $ulInput.append("<li><input type='text' name='amount' class='amount'></li><li>수량</li><li>갯수 제한 없음</li>");
                                            }else{
                                                $ulInput.addClass("hide").append("<li><input type='text' name='amount' class='amount'></li><li>수량</li><li>갯수 제한 없음</li>");
                                            }
                                        }else{
                                            if($funding_reward_id != "" && $funding_reward_id == funding_reward_id){
                                                $ulInput.append("<li><input type='text' name='amount' class='amount'></li><li>수량</li><li class='buy_count'>최대 "+buy_count+"개</li>");
                                            }else{
                                                $ulInput.addClass("hide").append("<li><input type='text' name='amount' class='amount'></li><li>수량</li><li class='buy_count'>최대 "+buy_count+"개</li>");
                                            }
                                        }
                                    }else if(res >= stock_max){
                                        $ul.append("<li class='soldOut'><span>발송예정일</span> "+value+" 예정</li>");
                                    }
                                },funding_reward_id);
                            }
                            
                        });
                        if($funding_reward_id != "" && $funding_reward_id == funding_reward_id){
                            $rewardDiv.addClass("checked").append($ul).append($ulInput).appendTo($rewardGroup);
                        }else{
                            $rewardDiv.append($ul).append($ulInput).appendTo($rewardGroup);
                        }
                    });
                }

            });
        }
    });
    
};

function getFundingCategoryName(funding_category_id){
    var fundingCategoryName;
    $.ajax({
        url: "../user/AJAXgetFundingCategoryName",
        method: "GET",
        async : false,
        data: {funding_category_id:funding_category_id},
        success: function(res){
            if(res !=  null){
                fundingCategoryName = res;
            }
        }
    });

    return fundingCategoryName;
}

function getRewardPaymentCount(callback,funding_reward_id){
    $.ajax({
        url: "./AJAXgetRewardPaymentCount",
        method: "GET",
        data: {funding_reward_id:funding_reward_id},
        success: function(res){
            callback(res);
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


function getDday(funding_id){
    var dday;

    $.ajax({
        url: "../user/AJAXgetDday",
        method: "GET",
        async: false,
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                dday = res;
            }
        }
    });

    return dday;
}

function getFundingAchievementRate(funding_id){
    var respone;
    $.ajax({
        url: "./AJAXgetFundingAchievementRate",
        method: "GET",
        async: false,
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                respone = res;
            }
        }
    });
    return respone;
}


function getfundingAchievement(funding_id){
    var respone;
    $.ajax({
        url: "./AJAXgetFundingAchievement",
        method: "GET",
        async: false,
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                respone = res;
            }
        }
    });
    return respone;
}
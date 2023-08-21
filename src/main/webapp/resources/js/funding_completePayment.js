$(document).ready(function(){
    var urlParams = new URLSearchParams(window.location.search);
    var $funding_order_id =  urlParams.get("funding_order_id");
    var user_id = 1;

    getFundingOrder($funding_order_id);
    setEventListener($funding_order_id,user_id);
});

function setEventListener(){   

    $(document).on("click","#header>div>div>a#logout",function(e){
        e.stopPropagation();
        logout();
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

function getFundingOrder($funding_order_id){
    $.ajax({
        url: "./AJAXgetFundingOrder",
        method: "GET",
        data: {funding_order_id:$funding_order_id},
        success: function(res){
            if(res != null){
                var funding_id;
                $.each(res, function(key,value){
                    
                    if(key == "rewardList"){
                        $.each(value,function(index,item){
                            if(index == 0){ // 첫번째 리워드만 보여주기
                                $.each(item,function(key,value){
                                    if(key == "fundingRewardDto"){
                                        $.each(value,function(key,value){
                                            if(key == "funding_id"){
                                                var category = getFundingCategoryNameByFundingId(value);
                                                var title = getFundingTitle(value);
                                                $("#participation>#history>#project>li:last-child").html(title);
                                                $("#participation>#history>#project>li:first-child").html(category);
                                            }
                                            if(key == "title"){
                                                $("#projectInfo>.reward>li.title").html(value);
                                            }
                                            if(key == "itemList"){
                                                var $detailLi = $("#projectInfo>.reward>li.detail");
                                                var $ul = $("<ul></ul>");
                                                $.each(value,function(index,item){
                                                    var name;
                                                    $.each(item,function(key,value){
                                                        if(key=="name"){
                                                            name = value;
                                                        }
                                                        if(key == "count"){
                                                            $("<li>&#8226; "+name+" "+value+"개</li>").appendTo($ul);
                                                        }
                                                    });
                                                });
                                                $detailLi.append($ul);
                                            }
                                        });
                                    }

                                    if(key == "count"){
                                        var $totalLi = $("#projectInfo>.reward>li.total");
                                        $("<span>수량 "+value+"개</span>").appendTo($totalLi);
                                    }
            
                                    if(key =="amount"){
                                        var $totalLi = $("#projectInfo>.reward>li.total");
                                        var amountCommas = addCommas(value);
                                        $("<b>"+amountCommas+"원</b>").appendTo($totalLi);
                                    }


                                });
                            }
                        });
                    }

                    
                });
            }
        }
    });
};

function getFundingCategoryNameByFundingId(funding_id){
    var fundingCategoryName;
    $.ajax({
        url: "./AJAXgetFundingCategoryNameByFundingId",
        method: "GET",
        async : false,
        data: {funding_id:funding_id},
        success: function(res){
            if(res !=  null){
                fundingCategoryName = res;
            }
        }
    });

    return fundingCategoryName;
}

function getFundingTitle(funding_id){
    var fundingTitle;
    $.ajax({
        url: "./AJAXgetFundingTitle",
        method: "GET",
        async : false,
        data: {funding_id:funding_id},
        success: function(res){
            if(res !=  null){
                fundingTitle = res;
            }
        }
    });

    return fundingTitle;
}

function addCommas(num){
    var str = num.toString();
    if(str.length >= 4){
        str = str.replace(/(\d)(?=(\d{3})+$)/g, '$1,');
    }

    return str;
};
$(document).ready(function(){

    // getSession();
    setEventListener();
    getFundingOrderByAchievementRate();
    getFundingOrderByCreatedAt();
    setInterval(moveLeft, 2000);

});

function setEventListener(){

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
                window.location.href = "http://localhost:8181/www/funding/fundingMainPage";
            }else{
                alert("이미 로그아웃 되어있습니다.");
            }
        }
    });
}

function moveLeft(){
    var banners = $("#bannerList>li");
    var bannerCount = banners.length-3; //배너 8개 보임 8개는 만들어야함

    for(var currentBanner = 0; currentBanner<bannerCount; currentBanner++){

        var nextBanner = currentBanner*(-315);
        $('ul#bannerList').animate({left:nextBanner},3500);
    }
}

// function moveLeft(){
//     var banners = $("#bannerList>li");
//     var bannerCount = banners.length;
//     var visibleBannerCount = 4; // 화면에 보이는 배너 개수
//     var bannerWidth = 315; // 배너 하나의 가로 너비
//     var moveDistance = bannerWidth * (bannerCount - visibleBannerCount); // 이동해야 할 거리

//     // 배너가 이동된 거리를 가져옴
//     var currentPosition = parseInt($('ul#bannerList').css('left'));

//     // 이동해야 할 거리를 더하여 새로운 위치를 계산
//     var nextPosition = currentPosition - bannerWidth;

//     // 이동한 거리가 음수일 경우, 첫 번째 배너로 이동한 것이므로 원래 위치로 되돌림
//     if (nextPosition < -moveDistance) {
//         nextPosition = 0;
//     }

//     $('ul#bannerList').animate({left: nextPosition}, 3000);
// }



function getFundingOrderByCreatedAt(){
    $.ajax({
        url: "./AJAXgetFundingOrderByCreatedAt",
        method: "GET",
        success: function(res){
            if(res != null){
                $.each(res,function(index,item){
                    var a;
                    var funding_id;
                    var ul = $("<ul class='p-0'></ul>");
                    $.each(item,function(key,value){
                        if(key == "funding_id"){
                            funding_id = value;
                            a = $("<a href='../funding/fundingDetailPage?funding_id="+value+"'></a>");
                        }

                        if(key == "thumbnailList"){
                            $.each(value,function(index,item){
                                var url;
                                $.each(item,function(key,value){
                                    if(key == "url"){
                                        url = value;
                                    }
                                    if(key == "image_order"){
                                        if(value == 1){
                                            $("<li><img src='../../resources/img/kimdaseul/funding/"+url+"' alt=''></li>").appendTo(ul);
                                        }
                                    }
                                });
                            });
                        }

                        if(key == "funding_category_id"){
                            $("<li class='text-start'>"+getFundingCategoryName(value)+"</li>").appendTo(ul);
                        }

                        if(key == "title"){
                            $("<li class='text-start'>"+value+"</li>").appendTo(ul);
                        }

                        if(key == "target_price"){
                            $("<li class='text-start'><b class='text-danger'>"+getFundingAchievementRate(funding_id)+"% 달성</b> "+getDday(funding_id)+"일 남음</li>").appendTo(ul);
                            ul.appendTo(a);
                            a.appendTo("#nList");
                        }
                    });
                });

            }
        }
    });
}

function getFundingOrderByAchievementRate(){
    $.ajax({
        url: "./AJAXgetFundingOrderByAchievementRate",
        method: "GET",
        success: function(res){
            if(res != null){
                $.each(res,function(index,item){
                    var a;
                    var funding_id;
                    var ul = $("<ul class='p-0'></ul>");
                    $.each(item,function(key,value){
                        if(key == "funding_id"){
                            funding_id = value;
                            a = $("<a href='../funding/fundingDetailPage?funding_id="+value+"'></a>");
                        }

                        if(key == "thumbnailList"){
                            $.each(value,function(index,item){
                                var url;
                                $.each(item,function(key,value){
                                    if(key == "url"){
                                        url = value;
                                    }
                                    if(key == "image_order"){
                                        if(value == 1){
                                            $("<li><img src='/resources/img/kimdaseul/funding/"+url+"' alt=''></li>").appendTo(ul);
                                        }
                                    }
                                });
                            });
                        }

                        if(key == "funding_category_id"){
                            $("<li class='text-start'>"+getFundingCategoryName(value)+"</li>").appendTo(ul);
                        }

                        if(key == "title"){
                            $("<li class='text-start'>"+value+"</li>").appendTo(ul);
                        }

                        if(key == "target_price"){
                            $("<li class='text-start'><b class='text-danger'>"+getFundingAchievementRate(funding_id)+"% 달성</b> "+getDday(funding_id)+"일 남음</li>").appendTo(ul);
                            ul.appendTo(a);
                            a.appendTo("#sList");
                        }
                    });
                });

            }
        }
    });
}

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




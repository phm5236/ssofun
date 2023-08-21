
$(document).ready(function(){
    var urlParams = new URLSearchParams(window.location.search);
    var $funding_id = urlParams.get("funding_id");

    getFundingDto($funding_id);
    setEventListener($funding_id);

});

function setEventListener($funding_id){
    var user_id = getUserSession();

    $("#tab>ul>li#reward").click(function(e){
        e.stopPropagation();
        $("#tab>div#rewardModal").toggleClass("hide");
    });

    $(document).on("click","#likeBtn",function(e){
        e.stopPropagation();
        if(user_id != 0){
            insertFavorit($funding_id,user_id);
        }else{
            alert("로그인이 필요한 서비스입니다.");
            return window.location.href = "../user/userLoginPage";
        }
    });

    $(document).on("click","#supportBtn",function(e){
        e.stopPropagation();

        if(user_id != 0){
            location.href = "./fundingRewardChoicePage?funding_id="+$funding_id;
        }else{
            alert("로그인이 필요한 서비스입니다.");
            return window.location.href = "../user/userLoginPage";
        }
    });

    var n=0;
    $('ul#moveLeft').click(function(e){
        e.stopPropagation();
        n--;
        getDetailThumbnailCount(function(res){
            var $thumbLength = res-1;

            if(n<0){
                n=$thumbLength;
            };

            $("ul#swiper>li").removeClass("activeBtn");
            $("ul#swiper>li").eq(n).addClass("activeBtn");

            var nm= n*(-100)+'%';
            $('ul#thumb').animate({left:nm});
        }, $funding_id);
        

    });

    $('ul#moveRight').click(function(e){
        e.stopPropagation();
        n++;
        getDetailThumbnailCount(function(res){
            var $thumbLength = res-1;

            if(n>$thumbLength){
                n=0;
            };
            $("ul#swiper>li").removeClass("activeBtn");
            $("ul#swiper>li").eq(n).addClass("activeBtn");

            var nm= n*(-100)+'%';
            $('ul#thumb').animate({left:nm});
        }, $funding_id);


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

function getDetailThumbnailCount(callback,$funding_id){
    $.ajax({
        url: "./AJAXgetDetailThumbnailCount",
        method: "GET",
        data: {funding_id:$funding_id},
        success: function(res){
            if(res != 0){
                callback(res);
            }
        }
    });
}

function insertFavorit($funding_id,user_id){
    $.ajax({
        url: "./AJAXinsertFavorit",
        method: "POST",
        data: {funding_id:$funding_id,user_id:user_id},
        success: function(res){
            if(res==1){
                // uesd_fg 1인 좋아요 갯수 조회하기
                getCountFavorit($funding_id);
            }else{
                // 만들어야함 uesd_fg 0으로 처리하기
                deleteFavorit($funding_id,user_id);
            }
        }
    });
}

function getCountFavorit($funding_id){
    $.ajax({
        url: "./AJAXgetCountFavorit",
        method: "GET",
        data: {funding_id:$funding_id},
        success: function(res){
            if(res != null){
                $("#likeBtn").html("<i class='bi bi-heart'></i>"+res);
            }
        }
    });
}

function deleteFavorit($funding_id,user_id){
    $.ajax({
        url: "./AJAXdeleteFavorit?funding_id="+$funding_id+"&user_id="+user_id,
        method: "PATCH",
        data: {used_fg:0},
        success: function(res){
            if(res == 1){
                getCountFavorit($funding_id);
            }
        }
    });
}

function getFundingDto($funding_id){
    $.ajax({
        url: "./getFundingDtoAjax",
        method: "GET",
        data: {funding_id:$funding_id},
        success: function(res){
            var $creator_name;
            var $funding_id;
            var $tabInfo = $("#tab>ul>li#info");
            var $tabNotice = $("#tab>ul>li#notice");
            var $tabCommunity = $("#tab>ul>li#community");
            $.each(res,function(key,value){
                    if(key == "user_creator_id"){
                        $creator_name = getCreator(value);
                    }

                    if(key == "funding_id"){
                        $funding_id = value;
                        $tabInfo.html("<a href='./fundingDetailPage?funding_id="+value+"'>소개</a>");
                        $tabNotice.html("<a class='activeTab' href='./fundingDetailNoticeListPage?funding_id="+value+"'>공지사항</a>");
                        $tabCommunity.html("<a href='./fundingDetailCommunityListPage?funding_id="+value+"'>커뮤니티</a>");

                        getSupportCount(value,function(res){
                            $("#sponsor").html("<span class='first'>후원자</span>"+res+"<b>명 참여</b>");
                        });
                    }

                    if(key == "thumbnailList"){
                        $.each(value,function(index,item){
                            var $url;
                            $.each(item,function(key,value){
                                if(key == "url"){
                                    $url = value;
                                }

                                if(key == "image_order"){
                                    if(value != 1){
                                        if(value == 2){
                                            $("ul#swiper").append("<li class='activeBtn'></li>");
                                            $("ul#thumb").append("<li><img src='../../resources/img/kimdaseul/funding/"+$url+"' alt='상세 섬네일'></li>");
                                            // $("ul#thumb").append("<li><img src='/ssofunUploadFiles/"+$url+"' alt='상세 섬네일'></li>");
                                        }else{
                                            $("ul#swiper").append("<li></li>");
                                            $("ul#thumb").append("<li><img src='../../resources/img/kimdaseul/funding/"+$url+"' alt='상세 섬네일'></li>");
                                            // $("ul#thumb").append("<li><img src='/ssofunUploadFiles/"+$url+"' alt='상세 섬네일'></li>");
                                        }
                                    }
                                }
                            });
                        });
                    }

                    if(key == "funding_category_id"){ 
                        var categoryName = getFundingCategoryName(value);
                        $("#category-name>h6").text(categoryName);
                    }

                    if(key == "title"){return $("#title>h3").text(value);}

                    if(key == "description"){
                        return $("#introduce").html("<span class='first'>펀딩소개</span>"+value);
                    }

                    if(key == "target_price"){
                        $achievementRate = getFundingAchievementRate($funding_id);
                        var $d_day = getDday($funding_id);
                        var achievement = getfundingAchievement($funding_id);
                        var closeAt = getFundingCloseAt($funding_id);

                        if(achievement != 0){
                            achievement = addCommas(achievement);
                        }

                        $("#totalAmount").html("<span class='first'>모인금액</span>"+achievement+"<b>원</b><span id='achieve'>"+$achievementRate+"% 달성</span>");
                        
                        if($d_day < 0){
                            $("#endtime").html("<span class='first'>남은 시간</span>종료</b><span id='end'>"+closeAt+" 종료</span>");
                            $("#supportBtn").addClass("hide");
                            $("#supportCloseBtn").removeClass("hide");
                        }else{
                            $("#endtime").html("<span class='first'>남은 시간</span>"+$d_day+"<b>일</b><span id='end'>"+closeAt+" 종료</span>");
                        }
                    }



                    if(key == "delivery_from"){
                        return $("#aside>ul>li>ul>li:first-child").html("<i class='bi bi-truck'></i> "+value+"에 발송됩니다.");
                    }

                    if(key =="contents"){
                        return true;
                    }

                    if(key == "favorit"){
                        return $("#likeBtn").html("<i class='bi bi-heart'></i>"+value);
                    }

                    if(key == "rewardList"){
                        $.each(value,function(index,item){
                            var $stock;
                            var $addCommaReward;
                            var $dl = $("<dl></dl>");
                            var $funding_reward_id;
                            var $dt = $("<dt></dt>");
                            $.each(item, function(key,value){

                                if(key == "funding_reward_id"){
                                     $("<input type='hidden' id='funding_reward_id' value='"+value+"'>").appendTo($dl);
                                     $funding_reward_id = value;
                                }

                                if(key == "price"){
                                    $addCommaRward = addCommas(value);
                                     $dt.append($addCommaRward+"<b>원</b>").appendTo($dl);

                                     getRewardPaymentCount(function(res){
                                        $dt.after("<dd class='ddFirst'>"+res+"명이 선택</dd>");
                                     },$funding_reward_id);
                                }
    
                                if(key == "delivery_price"){
                                    $addCommaRward = addCommas(value);
                                     $("<dd><span>배송비</span>"+$addCommaRward+"원</dd>").appendTo($dl);
                                }
                                
                                if(key == "title"){
                                     $(" <dd class='ddNthTwo'>"+value+"</dd>").appendTo($dl);
                                }
                                
                                if(key == "description"){
                                     $("<dd class='ddNthThree'>"+value+"</dd>").appendTo($dl);
                                }
                                
                                if(key == "stock_max"){
                                    getRewardPaymentCount(function(res){
                                        $stock = value-res;
                                        $addCommaReward = addCommas($stock);
                                        $("<dd class='stock'><span>남은 수량</span> "+$addCommaReward+"개</dd>").appendTo($dl);
                                     },$funding_reward_id);                                    
                                }

                                if(key == "buy_count"){
                                    $("<dd class='buyCount'><span>1인당 구매수량</span> "+value+"개</dd>").appendTo($dl);
                                }
                                
                                if(key == "delivery_from"){
                                     $("<dd class='ddLast'><span>발송 예정일</span> "+value+" 예정</dd>").appendTo($dl);
                                }

                                if(key == "itemList"){
                                    $.each(value, function(index,item){
                                        var $name;
                                        $.each(item, function(key,value){
                                            if(key=="name"){
                                                 $name = value;
                                            }
                                            if(key == "count"){
                                                 $("<dd class='item'>&#8226; "+$name+" "+value+"개</dd>").appendTo($dl);
                                            }
                                        });
                                    });
                                }

                            });
                            $("#rewardModal").append($dl);
                        });
                    }

                    if(key == "newsList"){  
                        if(value != ""){
                            $.each(value,function(index,item){
                                var $div = $("<div></div>");
                                var $noticeList = $("<div class='noticeList'></div>");
                                var $ul = $("<ul class='noticeWriter'></ul>");
                                $.each(item,function(key,value){
    
                                    if(key == "created_after"){
                                        if(value == 0){
                                            return $ul.append("<li class='profile'></li><li class='name'>"+$creator_name+"<span>메이커</span></li><li class='date'> 오늘</li>").appendTo($noticeList);
                                        }else{
                                            return $ul.append("<li class='profile'></li><li class='name'>"+$creator_name+"<span>메이커</span></li><li class='date'>"+value+"일전</li>").appendTo($noticeList);
                                        }
                                    }
                                    if(key == "title"){
                                        return true;
                                    }                                      
                                    if(key == "contents"){                       
                                        return $noticeList.append("<div class='noticeContent'>"+value+"</div><div class='gradient'></div>");
                                    }
                                    if(key == "funding_notice_id"){
                                        $div.append($noticeList);
                                        return $div.append("<a href='./fundingDetailNoticePage?funding_id="+$funding_id+"&funding_notice_id="+value+"' class='moreBtn'>더보기</a>");
                                    }
                                });
                                $("#content").append($div);
                            });
                        }else{
                            $("<div id='newsEmpty'><i class='bi bi-exclamation-circle'></i>등록된 공지사항이 없어요 :(</div>").appendTo("#content");
                        }                
                    }
            });
        }
    });
}

function getCreator(user_creator_id){
    var respone;
    $.ajax({
        url: "./AJAXgetCreator",
        method: "GET",
        async: false,
        data: {user_creator_id:user_creator_id},
        success: function(res){
            if(res != null){
                respone = res;
            }
        }
    });
    return respone;
}

function getSupportCount(funding_id,callback){
    $.ajax({
        url: "./AJAXgetSupportCount",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                callback(res);
            }
        }
    });
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

function getFundingCloseAt(funding_id){
    var closeAt;
    $.ajax({
        url: "./AJAXgetFundingCloseAt",
        method: "GET",
        async : false,
        data: {funding_id:funding_id},
        success: function(res){
            if(res !=  null){
                closeAt = res;
            }
        }
    });

    return closeAt;
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

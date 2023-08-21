$(document).ready(function(){
    var user_id = getUserSession();

    setEventListener();
    getLikeFundingList(user_id);
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

function getLikeFundingList(user_id){
    $.ajax({
        url: "./AJAXgetLikeFundingList",
        method: "GET",
        data: {user_id:user_id},
        success: function(res){
            if(res != ""){
                $.each(res,function(index,item){
                    var funding_id;
                    var a;
                    var ul = $("<ul class='p-0'></ul>");
                    var achievementRate;
                    var achievementPrice;
                    var funding_category_id;
                    var title;
                    $.each(item,function(key,value){
                        if(key == "funding_id"){
                            funding_id = value;
                            a = $("<a href='../funding/fundingDetailPage?funding_id="+value+"'></a>");
                        }
                        
                        if(key == "thumbnailList"){
                            var url;
                            $.each(value,function(index,item){
                                $.each(item,function(key,value){
                                    if(key == "url"){
                                        url = value;
                                    }
                                    if(key == "image_order"){
                                        if(value == 1){
                                            return $("<li class='thumbnail'><img src='../../resources/img/kimdaseul/funding/"+url+"' alt=''></li>").appendTo(ul);
                                        }
                                    }
                                });
                            });
                        }

                        if(key == "funding_category_id"){
                            funding_category_id = value;
                            
                        }

                        if(key == "title"){
                            title = value;
                        }
                        
                        if(key == "description"){
                            getFundingCategoryName(funding_category_id,function(res){
                                $("<li>"+res+"</li>").appendTo(ul);
                                $("<li>"+title+"</li>").appendTo(ul);
                                $("<li>"+value+"</li>").appendTo(ul);
                            });
                        }

                        if(key == "target_price"){
                            getAchievementPrice(funding_id,function(res){
                                achievementPrice = addCommas(res);
                                achievementRate = Math.floor((res/value)*100);
                                getDday(funding_id,function(res){
                                    if(res < 0){
                                        $("<li><b class='text-danger'>"+achievementRate+"% 달성</b> "+achievementPrice+"원 <span class='float-end'>종료</span></li>").appendTo(ul);
                                    }else{
                                        $("<li><b class='text-danger'>"+achievementRate+"% 달성</b> "+achievementPrice+"원 <span class='float-end'>"+res+"일 남음</span></li>").appendTo(ul);
                                    }
                                    if(achievementRate>100){
                                        achievementRate = 100;
                                    }
                                    var li = $("<li></li>");
                                    $("<span></span>").css({"width": achievementRate+"%"}).appendTo(li);
                                    li.appendTo(ul);
                                });
                            });
                        }
                    });

                    a.append(ul);
                    $("#list").append(a);
                });
                divHeightSense();

            }else{
                $("<div id='fundingLikeListEmpty'>찜한 프로젝트가 없습니다 :(</div>").appendTo("#list");
                divHeightSense();
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

function divHeightSense(){
    var divHight =  $('div#myPageSection').height();
    $('#topBg').height(divHight+160);
    $('#height').height(divHight+160);
}

function addCommas(num){
    var str = num.toString();
    if(str.length >= 4){
        str = str.replace(/(\d)(?=(\d{3})+$)/g, '$1,');
    }

    return str;
}

function getFundingCategoryName(funding_category_id,callback){
    $.ajax({
        url: "./AJAXgetFundingCategoryName",
        method: "GET",
        data: {funding_category_id:funding_category_id},
        success: function(res){
            if(res !=  null){
                callback(res);
            }
        }
    });
}

function getAchievementPrice(funding_id,callback){
    $.ajax({
        url: "./AJAXgetAchievementPrice",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                callback(res);
            }
        }
    });
}

function getDday(funding_id,callback){
    $.ajax({
        url: "./AJAXgetDday",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                callback(res);
            }
        }
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




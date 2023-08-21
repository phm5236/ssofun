$(document).ready(function(){
    var user_id = getUserSession();
    var user_creator_id = getUserCreatorIdSession();
    
    if(user_creator_id != ""){
        getMakerFundingList(user_creator_id);
        getMakerProfile(user_creator_id);
    }else{
        $("#makerName").html("미래 창작자님");
        $("#biz").html("-");
        $("#subTitle>h5>span").html("0");
        $("<div id='fundingListEmpty'>등록된 펀딩이 없습니다 :(</div>").appendTo("#list");
        divHeightSense();
    }

    setEventListener();

});

function setEventListener(){

    $(document).on("click","#projectBtn",function(e){
        e.stopPropagation();
        window.location.href = "../maker/makerProjectRegisterPage";
    });

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

    $(document).on("click","#leftBorder>div#list>div.projectWrap>i", function(e) {
        e.stopPropagation();
        $(this).next("span.projectDelete").toggleClass("hide");
      });


      $(document).on("click","#header>div>div>a#logout",function(e){
        e.stopPropagation();
        logout();
    });
    
    $(document).on("click","#profile>ul>li#logout",function(e){
      e.stopPropagation();
      logout();
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
        window.location.href = "../user/userLoginPage";
       return 0;
    }
}


function getUserCreatorIdSession(){
    var user_creator_id;

    $.ajax({
        url : "../user/AJAXgetUserCreatorIdSessoin",
        method: "GET",
        async: false,
        success: function(res){
            user_creator_id = res;
        }
    });

    if(user_creator_id != null){
        return user_creator_id;
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

function getMakerFundingList(user_creator_id){
    $.ajax({
        url: "./AJAXgetMakerFundingList",
        method: "GET",
        data: {user_creator_id:user_creator_id},
        success: function(res){
            if(res != ""){
                var length = res.length;
                $("#subTitle>h5>span").html(length);
                $.each(res,function(index,item){
                    var projectWrap = $("<div class='projectWrap'></div>");
                    var a;
                    var ul = $("<ul></ul>");
                    $.each(item,function(key,value){
                        if(key == "funding_id"){
                            $("<i class='bi bi-three-dots-vertical'></i>").appendTo(projectWrap);
                            $("<span class='projectDelete hide'>삭제</span>").appendTo(projectWrap);
                            a = $("<a class='project' href='./makerProjectRegisterPage?funding_id="+value+"'></a>");
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
                                            $("<li class='img'><img src='../../resources/img/kimdaseul/funding/"+url+"' alt=''></li>").appendTo(ul);
                                        }
                                    }
                                });
                            });
                        }

                        if(key == "title"){
                            $("<li class='title'>"+value+"</li>").appendTo(ul);
                        }

                        if(key == "confirm_fg"){
                            if(value == 0){
                                $("<li class='status'>심사 중</li>").appendTo(ul);
                            }else if(value == 1){
                                $("<li class='status'>진행 중</li>").appendTo(ul);
                            }
                        }

                    });
                    ul.appendTo(a);
                    a.appendTo(projectWrap);
                    projectWrap.appendTo("#list");
                });
                divHeightSense();
            }else{
                $("#subTitle>h5>span").html("0");
                $("<div id='fundingListEmpty'>등록된 펀딩이 없습니다 :(</div>").appendTo("#list");
                divHeightSense();
            }

        }
    });

}

function divHeightSense(){
    var divHight =  $('div#myPageSection').height();
    $('#topBg').height(divHight+160);
    $('#height').height(divHight+160);
}


function getMakerProfile(user_creator_id){
    $.ajax({
        url: "./AJAXgetMakerProfile",
        method: "GET",
        data: {user_creator_id:user_creator_id},
        success: function(res){
            if(res != null){
                $.each(res,function(key,value){
                    if(key == "name"){
                        $("#makerName").html(value+" 창작자님");
                    }
                    if(key == "creator_type"){
                        if(value == 0){
                            $("#biz").html("개인 사업자");
                        }else if(value == 1){
                            $("#biz").html("법인 사업자");
                        }
                    }
                });
            }
        }
    });
}










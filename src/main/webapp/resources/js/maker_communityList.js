
$(document).ready(function(){
    setUserSession();
    
    var user_id = getUserSession();
    var user_creator_id = getUserCreatorIdSession();

    var urlParams = new URLSearchParams(window.location.search);
    var funding_id = urlParams.get("funding_id");

    getCommunityList(funding_id,user_creator_id);
    setEventListener(user_creator_id,funding_id);
    checkFundingId(funding_id);

});

function setEventListener(user_creator_id,funding_id){
    
    $(document).on("click","p#goOut",function(event){
        event.stopPropagation(); 
        window.location.href = "../maker/makerMyPage";
    });

    $(document).on("click","li#sidebarHide",function(event){
        event.stopPropagation(); 
        $(this).addClass("hide");
        $("li#sidebarShow").removeClass("hide");
        $("div#sidebarBg").animate({left:"-200px"});
    });

    $(document).on("click","li#sidebarShow",function(event){
        event.stopPropagation(); 
        $(this).addClass("hide");
        $("li#sidebarHide").removeClass("hide");
        $("div#sidebarBg").animate({left:"0"});
    });

    $(document).on("click","#tabBox>li.answerBefore",function(e){
        e.stopPropagation();

        $("#tabBox>li").removeClass("click");
        $(this).addClass("click");
        
        var trLength = $("tbody>tr").length;
        // alert(trLength);

        for(var i=0; i<trLength; i++){

            var before = $("tbody>tr:nth-of-type("+(i+1)+")>td:nth-of-type(7)").text();
            if(before == "답변 완료"){
                $("tbody>tr:nth-of-type("+(i+1)+")").addClass("hide");
            }
        }
        
        
    });
    
    $(document).on("click","#tabBox>li.all",function(e){
        e.stopPropagation();
        $("#tabBox>li").removeClass("click");
        $(this).addClass("click");
        $("tbody>tr").removeClass("hide");
    });

    $(document).on("click","input[type=button].answerbtn",function(e){
        e.stopPropagation();
   
        var funding_review_id = $(this).parent("td").parent("tr").children("td.pk").children("input").val();
        $("#communityAnswerModalBg").removeClass("hide");
        $("#communityAnswerModalBg>ul").removeClass("hide");
        $("#communityAnswerModalBg>ul>li:last-child>input#funding_review_id").val(funding_review_id);  

    });

    $(document).on("click","#communityAnswerModalBg>ul>li:last-child>input#communityAnswerBtn",function(e){
        e.stopPropagation();
        $("#communityAnswerModalBg").addClass("hide");
        $("#communityAnswerModalBg>ul").addClass("hide");
        
        var this_answer_id = $("#communityAnswerModalBg>ul>li:last-child>input#funding_review_id").val();
        var contents = $("#communityAnswerModalBg>ul>li:nth-of-type(4)>textarea").val();
        var user_id = user_creator_id; // 수정 필요 세션에서 받아와야함

        insertCommunityAnswer(funding_id,this_answer_id,contents,user_id);

        $("#communityAnswerModalBg>ul>li:nth-child(4)>textarea").val("");
        $("#communityAnswerModalBg>ul>li:last-child>input#funding_review_id").val("");   
    });

    $(document).on("click","#communityAnswerModalBg>ul>li:last-child>input#cancleBtn",function(e){
        e.stopPropagation();
        $("#communityAnswerModalBg").addClass("hide");
        $("#communityAnswerModalBg>ul").addClass("hide");
        $("#communityAnswerModalBg>ul>li:nth-child(4)>textarea").val("");
        $("#communityAnswerModalBg>ul>li:last-child>input#funding_review_id").val("");  
    });

    $(document).on("change","#orderList>table>thead>tr>th.checkBox>input#allCheck",function(e){
        e.stopPropagation();
        if($(this).is(":checked")){
            $("tbody>tr>td.pk>input.funding_review_id").prop("checked", true);
        }else{
            $("tbody>tr>td.pk>input.funding_review_id").prop("checked", false);
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


function checkFundingId(funding_id){

    $("input#fundingRegisterSubmitBtn").addClass("hide");
    $("input#fundingRegisterUpdateBtn").removeClass("hide");

    $("#fixedSidebar").empty();
    $("<li><a href='./makerProjectRegisterPage?funding_id="+funding_id+"'>프로젝트 관리</a></li>").appendTo("#fixedSidebar");
    $("<li><a href='./makerOrderListPage?funding_id="+funding_id+"'>주문 · 배송 현황</a></li>").appendTo("#fixedSidebar");
    $("<li><a href='./makerDashBoardPage?funding_id="+funding_id+"'>대시보드</a></li>").appendTo("#fixedSidebar");
    $("<li><a href='./makerNoticeListPage?funding_id="+funding_id+"'>공지사항 관리</a></li>").appendTo("#fixedSidebar");
    $("<li class='click'><a class='active' href='./makerCommunityListPage?funding_id="+funding_id+"'>커뮤니티 관리</a></li>").appendTo("#fixedSidebar");

}



function insertCommunityAnswer(funding_id,this_answer_id,contents,user_id){
    $.ajax({
        url: "./AJAXinsertCommunityAnswer",
        method: "POST",
        contentType: "application/json",
        data:JSON.stringify({funding_id:funding_id,this_answer_id:this_answer_id,contents:contents,user_id:user_id}),
        success: function(res){
            if(res != 0){
                alert("답변하기 성공!");
                getCommunityList(funding_id,user_id);
            }
        }
    });
}

function getCommunityList(funding_id,user_creator_id){
    $("tbody").empty();

    $.ajax({
        url: "./AJAXgetCommunityList",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                var tbody = $("tbody");
                $.each(res,function(index,item){
                    var tr = $("<tr></tr>");
                    var user_id;
                    var created_at;
                    var contents;
                    var funding_review_id;
                    $.each(item,function(key,value){
                        
                        if(key == "user_id"){
                            user_id = value;
                        }

                        if(key == "created_at"){
                            created_at = value;
                        }

                        if(key == "contents"){
                            contents = value;
                        }

                        if(key == "funding_review_id"){
                            funding_review_id = value;
                            $("<td class='pk'><input type='checkbox' name='funding_review_id' class='funding_review_id' value='"+value+"'></td>").appendTo(tr);
                            $("<td><a href=''>"+value+"</a></td>").appendTo(tr);
                            $("<td><a href=''>"+contents+"</a></td>").appendTo(tr);
                            getUser(user_id,function(res){
                                $("<td>"+res+"</td>").appendTo(tr);

                                getCommunityReviewCount(value,function(res){
                                    $("<td>"+res+"</td>").appendTo(tr);
                                    $("<td>"+created_at+"</td>").appendTo(tr);

                                    getCommunityReviewExistCreatorUserId(funding_review_id,user_creator_id,function(res){
                                        if(res == 0){
                                            $("<td>답변 전</td>").appendTo(tr);
                                            $("<td><input type='button' value='답변' class='answerbtn'></td>").appendTo(tr);
                                        }else{
                                            $("<td>답변 완료</td>").appendTo(tr);
                                            $("<td>-</td>").appendTo(tr);
                                        }
                                    });
                                });
                            });
                        }

                        $(tbody).append(tr);
                    });
                });
            }
        }
    });
}

function getUser(user_id,callback){
    $.ajax({
        url: "./AJAXgetUser",
        method: "GET",
        data: {user_id:user_id},
        success: function(res){
            if(res != null){
                $.each(res,function(key,value){
                    if(key == "name"){
                        callback(value);
                    }
                });
            }
        }
    });
}

function getCommunityReviewCount(funding_review_id,callback){
    $.ajax({
        url: "./AJAXgetCommunityReviewCount",
        method: "GET",
        data: {funding_review_id:funding_review_id},
        success: function(res){
            callback(res);
        }
    });
}

function getCommunityReviewExistCreatorUserId(funding_review_id,user_creator_id,callback){
    $.ajax({
        url: "./AJAXgetCommunityReviewExistCreatorUserId",
        method: "GET",
        data: {funding_review_id:funding_review_id,user_creator_id:user_creator_id},
        success: function(res){
            callback(res);
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
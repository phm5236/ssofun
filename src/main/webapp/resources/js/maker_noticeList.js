
$(document).ready(function(){
    setUserSession();

    var user_id = getUserSession();
    var user_creator_id = getUserCreatorIdSession();

    var urlParams = new URLSearchParams(window.location.search);
    var funding_id = urlParams.get("funding_id");

    getFundingNoticeList(funding_id);
    setEventListener(user_id,funding_id);
    checkFundingId(funding_id);

});

function setEventListener(user_id,funding_id){
    
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

    $(document).on("click","#noticeSubmitBtn",function(e){
        e.stopPropagation(); 
        var title = $("#wirteSection>li.title>input#title").val();
        var contents = $("#wirteSection>li.contents>textarea#contents").val();

        if(title == ""){
            return alert("제목을 입력해주세요!");
        }
        if(contents == ""){
            return alert("내용을 입력해주세요!");
        }
        
        insertFundingNotice(funding_id,title,contents);
    });

    $(document).on("click","tbody>tr>td:nth-of-type(6)>input.updatebtn",function(e){
        e.stopPropagation(); 
        var funding_notice_id = $(this).parent("td").siblings("td.pk").children("input.funding_notice_id").val();
        alert(funding_notice_id);
        $("input#noticeSubmitBtn").addClass("hide");
        $("input#noticeUpdateCancleBtn").removeClass("hide");
        $("input#noticeUpdateBtn").removeClass("hide");

        $("input#funding_notice_id").val(funding_notice_id);
        $("#noticeBox>h5").html("공지사항 수정");

        getFundingNotice(funding_notice_id);
    });

    $(document).on("click","input#noticeUpdateCancleBtn",function(e){
        e.stopPropagation(); 

        $("input#noticeSubmitBtn").removeClass("hide");
        $("input#noticeUpdateCancleBtn").addClass("hide");
        $("input#noticeUpdateBtn").addClass("hide");

        $("input#funding_notice_id").val("");
        $("#wirteSection>li.title>input#title").val("");
        $("#wirteSection>li.contents>textarea#contents").val("");

        $("#noticeBox>h5").html("공지사항 등록");
    });

    $(document).on("click","input#noticeUpdateBtn",function(e){
        e.stopPropagation(); 

        var title = $("#wirteSection>li.title>input#title").val();
        var contents = $("#wirteSection>li.contents>textarea#contents").val();
        var funding_notice_id =  $("input#funding_notice_id").val();

        if(title == ""){
            return alert("수정할 제목을 입력해주세요!");
        }
        if(contents == ""){
            return alert("수정할 내용을 입력해주세요!");
        }
        if(funding_notice_id == ""){
            return alert("공지사항 아이디값이 없습니다. 새로고침 후 다시 실행해주세요!");
        }

        updateFundingNotice(funding_notice_id,title,contents,funding_id);

        $("input#noticeSubmitBtn").removeClass("hide");
        $("input#noticeUpdateCancleBtn").addClass("hide");
        $("input#noticeUpdateBtn").addClass("hide");

        $("input#funding_notice_id").val("");
        $("#wirteSection>li.title>input#title").val("");
        $("#wirteSection>li.contents>textarea#contents").val("");

        $("#noticeBox>h5").html("공지사항 등록");
    });

    $(document).on("change","#orderList>table>thead>tr>th.checkBox>input#allCheck",function(e){
        e.stopPropagation();
        if($(this).is(":checked")){
            $("tbody>tr>td.pk>input.funding_notice_id").prop("checked", true);
        }else{
            $("tbody>tr>td.pk>input.funding_notice_id").prop("checked", false);
        }
    });

    $(document).on("click","#checkedDeleteBtn",function(e){
        e.stopPropagation();
        var trLength = $("tbody>tr").length;
        // var noticeIdList = [];
        for(var i=0; i<trLength; i++){
            var $trChecked = $("tbody>tr:nth-of-type("+(i+1)+")>td.pk>input.funding_notice_id");
            if($trChecked.is(':checked')){
                alert($trChecked.val());
                deleteFundingNotice($trChecked.val(),funding_id);
                // noticeIdList.push($trChecked.val());
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
    $("<li class='click'><a class='active' href='./makerNoticeListPage?funding_id="+funding_id+"'>공지사항 관리</a></li>").appendTo("#fixedSidebar");
    $("<li><a href='./makerCommunityListPage?funding_id="+funding_id+"'>커뮤니티 관리</a></li>").appendTo("#fixedSidebar");

}

function deleteFundingNotice(funding_notice_id,funding_id){
    $.ajax({
        url: "./AJAXdeleteFundingNotice?funding_notice_id="+funding_notice_id,
        method: "PATCH",
        contentType: "application/json",
        data: JSON.stringify({used_fg:0}),
        success: function(res){
            if(res != 0){
                alert("공지사항 삭제 성공!");
                getFundingNoticeList(funding_id);
            }
        }
    });
}

function updateFundingNotice(funding_notice_id,title,contents,funding_id){
    $.ajax({
        url: "./AJAXupdateFundingNotice?funding_notice_id="+funding_notice_id,
        method: "PATCH",
        contentType: "application/json",
        data: JSON.stringify({title:title,contents:contents}),
        success: function(res){
            if(res != 0){
                alert("공지사항 수정 완료!");
                getFundingNoticeList(funding_id);
            }
        }
    });

}

function getFundingNotice(funding_notice_id){
    $.ajax({
        url: "./AJAXgetFundingNotice",
        method: "GET",
        data: {funding_notice_id:funding_notice_id},
        success: function(res){
            if(res != null){
                $.each(res,function(key,value){
                    if(key == "title"){
                        $("#wirteSection>li.title>input#title").val(value);
                    }
                    if(key == "contents"){
                        $("#wirteSection>li.contents>textarea#contents").val(value);
                    }
                });
            }
        }
    });
}


function insertFundingNotice(funding_id,title,contents){
    $.ajax({
        url: "./AJAXinsertFundingNotice",
        method: "POST",
        data: {funding_id:funding_id,title:title,contents:contents},
        success: function(res){
            if(res == 1){
                alert("공지사항 등록 성공!! 공지사항 조회 실행!");
                alert(funding_id);
                getFundingNoticeList(funding_id);
            }
        }
    });
}

function getFundingNoticeList(funding_id){

    $("tbody").empty();

    $.ajax({
        url: "./AJAXgetFundingNoticeList",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                var tbody = $("tbody");
                $.each(res,function(index,item){
                    var tr = $("<tr></tr>");
                    var title;
                    var created_at;
                    $.each(item,function(key,value){
                        if(key == "title"){
                            title = value;
                        }

                        if(key == "created_at"){
                            created_at = value;
                        }
                        
                        if(key == "funding_notice_id"){
                            $("<td class='pk'><input type='checkbox' name='funding_notice_id' class='funding_notice_id' value='"+value+"'></td>").appendTo(tr);
                            $("<td><a href=''>"+value+"</a></td>").appendTo(tr);
                            $("<td><a href=''>"+title+"</a></td>").appendTo(tr);
                            
                            getNoticeReviewCount(value,function(res){
                                $("<td>"+res+"</td>").appendTo(tr);
                                $("<td>"+created_at+"</td>").appendTo(tr);
                                $("<td><input type='button' value='수정' class='updatebtn'><input type='button' value='삭제' class='deleteBtn'></td>").appendTo(tr);
                            });

                        }
                        
                        
                        $(tbody).append(tr);
                    });

                });
            }
        }
    });
}

function getNoticeReviewCount(funding_notice_id,callback){
    $.ajax({
        url: "./AJAXgetNoticeReviewCount",
        method: "GET",
        data: {funding_notice_id:funding_notice_id},
        success: function(res){
            callback(res);
        }
    });
}


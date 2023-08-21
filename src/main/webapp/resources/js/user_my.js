$(document).ready(function(){

    divHeightSense();
    setEventListener();

});

function setEventListener(){

    
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

    $(document).on("click","#first>li#logoutUser",function(e){
        e.stopPropagation();
        logout();
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
                window.location.href = "http://localhost:8181/www/funding/fundingMainPage";
            }else{
                alert("이미 로그아웃 되어있습니다.");
            }
        }
    });
}

function divHeightSense(){
    var divHight =  $('div#myPageSection').height();
    $('#topBg').height(divHight+160);
    $('#height').height(divHight+160);
}
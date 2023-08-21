
$(document).ready(function(){

    setEventListener();

});

function setEventListener(){

    $(document).on("click","#loginTab>li#admin",function(e){
        e.stopPropagation();
        window.location.href = "../../../systemadmin/login/adminLoginPage";

        $("#loginTab>li").removeClass("click");
        $(this).addClass("click");

        $("#userLogin").addClass("hide");
        $("#userApiLogin").addClass("hide");
        $("#userJoin").addClass("hide");

        $("#adminLogin").removeClass("hide");

    });
    
    $(document).on("click","#loginTab>li#user",function(e){
        e.stopPropagation();

        window.location.href = "../../www/user/userLoginPage";
        $("#loginTab>li").removeClass("click");
        $(this).addClass("click");

        $("#adminLogin").addClass("hide");

        $("#userLogin").removeClass("hide");
        $("#userApiLogin").removeClass("hide");
        $("#userJoin").removeClass("hide");
    });
    
    $(document).on("click","input#userLoginBtn",function(e){
        e.stopPropagation();
        var email = $("input#email").val();
        var password = $("input#password").val();
        
        if(email == ""){
            return alert("이메일을 입력해주세요.");
        }
        if(password == ""){
            return alert("비밀번호를 입력해주세요.");
        }
        
        loginWithEmail(email,password);
    });
    
    $(document).on("click","#loginSection>ul#userApiLogin>li#kakao",function(e){
        e.stopPropagation();
        loginWithKakao();
    });

}


function loginWithEmail(email,password){
    $.ajax({
        url: "./AJAXloginWithEmail",
        method: "POST",
        data: {email:email,password:password},
        success: function(res){
            if(res != null){
                window.location.href = "../funding/fundingMainPage";
            }else{
                alert("로그인에 실패하였습니다. 이메일과 비밀번호를 확인해주세요.");
            }
        }
    });
}


var popup;

// 카카오 로그인 처리 함수
function loginWithKakao(){

    $.ajax({
        url: "./AJAXkakaoLogin",
        method: "GET",
        success: function(res) {

            // 새 창을 띄우는 팝업 창 옵션
            var popupOptions = "width=450,height=500,scrollbars=yes,resizable=no";

            // 팝업 창을 띄웁니다. (window.open() 메서드를 호출하여 새로운 창을 엽니다.)
            popup = window.open("../user/kakaoOauthPage", "KakaoLoginPopup", popupOptions);

            // popup.addressFromParent = res;

            // 자식 창으로 바로 주소로 이동
            popup.location.href = res;

        },
        error: function(err) {
            // 에러 처리
            console.error(err);
        }
    });    
}

function checkKakaoUser(access_token){
    popup.close();

    $.ajax({
        url: "./AJAXcheckKakaoUser",
        method: "GET",
        data: {access_token:access_token},
        success: function(res){
            if(res != null){
                window.location.href = res;
            }
        }
    });
}
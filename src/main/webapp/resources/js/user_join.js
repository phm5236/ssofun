
$(document).ready(function(){

    setEventListener();

});

function setEventListener(){

    $(document).on("click","#snsJoin>ul>li#kakao",function(e){
        e.stopPropagation();
        loginWithKakao();
    });

    $(document).on("click","div#emailJoin>ul>li:nth-child(6)>span>input",function(e){
        e.stopPropagation();

        $("#emailJoin>ul>li:nth-child(6)>span>input").removeClass("click");
        $(this).addClass("click");
    });
    
    
    $(document).on("click","input#userJoinSubmitBtn",function(e){
        e.stopPropagation();
        
        var email = $("input#email").val();
        var name = $("input#name").val();
        var password = $("input#password").val();
        var passwordCheck = $("input#passwordCheck").val();
        var birth = $("input#birth").val();
        var nickname = $("input#nickname").val();
        var gender = $("input.gender.click").index();
        var agree_sms = $("input#agree_sms").is(":checked");

        if(email == ""){
            return alert("이메일을 입력해주세요.");
        }
        if(name == ""){
           return alert("이름을 입력해주세요.");
        }
        if(password == ""){
           return alert("비밀번호를 입력해주세요.");
        }
        if(passwordCheck == ""){
           return alert("비밀번호 확인을 입력해주세요.");
        }
        if(password != passwordCheck){
            return alert("비밀번호가 다릅니다. 다시 확인해주세요");
        }
        if(birth == ""){
           return alert("생년월일을 선택해주세요.");
        }
        if(nickname == ""){
           return alert("닉네임을 입력해주세요.");
        }
        if(!agree_sms){
            return alert("필수약관을 체크해주세요.");
        }

        if(gender == -1){
            gender = 2;
        }

        insertEmailJoin(email,name,password,gender,birth,nickname,1);

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
            popup = window.open("./kakaoOauthPage", "KakaoLoginPopup", popupOptions);

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

function insertEmailJoin(email,name,password,gender,birth,nickname,agree_sms){
    $.ajax({
        url: "./AJAXinsetEmailJoin",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({email:email,name:name,password:password,gender:gender,birth:birth,nickname:nickname,agree_sms:agree_sms}),
        success: function(res){
            if(res != 0){
                window.location.href = "http://localhost:8181/www/user/userJoinSuccessPage?user_id="+res;
            }
        }
    });
}
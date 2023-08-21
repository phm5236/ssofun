
$(document).ready(function(){
    var params = new URLSearchParams(window.location.search);
    var user_id = params.get('user_id');

    setEventListener(user_id);
    getSimpleJoinUser(user_id);

});

function setEventListener(user_id){

    $(document).on("click","input#userJoinSubmitBtn",function(e){
        e.stopPropagation();

        // var email = $("input#email").val();
        var name = $("input#name").val();
        var agree_sms = $("input#agree_sms").is(":checked");
        
        if(email == ""){
            return alert("이메일을 입력해주세요.");
        }
        
        if(name == ""){
            return alert("이름을 입력해주세요.");
        }
        
        if(!agree_sms){
            return alert("필수약관에 동의해주세요.");
        }
        
        
        alert(email+" "+name+" "+agree_sms);
        updateUserNameAgree(user_id,name);
        
    });
    
    $(document).on("click","input#emailUpdateBtn",function(e){
        e.stopPropagation();

        var email = $("input#email").val();
        if(email == ""){
            return alert("이메일을 입력해주세요.");
        }

        updateEmail(user_id,email);
    });

}

function getSimpleJoinUser(user_id){
    $.ajax({
        url: "./AJAXgetSimpleJoinUser",
        method: "GET",
        data: {user_id:user_id},
        success: function(res){
            if(res != null){
                $.each(res,function(key,value){
                    if(key == "email"){
                        $("#snsJoin>ul>li:first-child>span>input#email").val(value);
                    }
                    if(key == "name"){
                        $("#snsJoin>ul>li:nth-child(2)>span>input#name").val(value);
                    }
                });
            }
        }
    });
}

function updateEmail(user_id,email){
    $.ajax({
        url: "./AJAXupdateEmail?user_id="+user_id,
        method: "PATCH",
        contentType: "application/json",
        data: JSON.stringify({email:email}),
        success: function(res){
            if(res == 1){
                alert("이메일이 변경되었습니다.");
            }else{
                alert("이메일 변경에 실패했습니다.");
            }
        }
    });
}


function updateUserNameAgree(user_id,name){
    $.ajax({
        url: "./AJAXupdateUserNameAgree?user_id="+user_id,
        method: "PATCH",
        contentType: "application/json",
        data: JSON.stringify({name:name,agree_sms:1}),
        success: function(res){
            if(res == 1){
                alert("회원정보 업데이트 성공!");
                window.location.href = "http://localhost:8181/www/www/user/userJoinSuccessPage?user_id="+user_id;
            }
        }
    });
}
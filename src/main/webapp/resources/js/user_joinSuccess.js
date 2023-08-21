
$(document).ready(function(){
    var params = new URLSearchParams(window.location.search);
    var user_id = params.get('user_id');

    setEventListener(user_id);
    getUserName(user_id);
});

function setEventListener(user_id){

    $(document).on("click","input#moveMainPageBtn",function(e){
        e.stopPropagation();
        window.location.href = "http://localhost:8181/www/funding/fundingMainPage";
    });

}

function getUserName(user_id){
    $.ajax({
        url: "./AJAXgetUserName",
        method: "GET",
        data: {user_id:user_id},
        success: function(res){
            if(res!=null){
                $("#welcome>ul.notosanskr>li:first-child").text(res+" 서포터님");
            }
        }
    });
}

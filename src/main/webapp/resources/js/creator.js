function getTagList(){
    $.ajax({
        url: "./getTagListAjax",
        method: "GET",
        success: function(res){
            $.each(res,function(i,item){
                $.each(item,function(key,value){
                    
                });
            });
        }
    });
}

function upload(){
    var form = $("uploadForm")[0];
    var formData = new formData(form);
    
    $.ajax({
        url: "./uploadAjax",
        method: "POST",
        enctype: "multipart/form-data",
        data:formData,
        dataType:'json',
        processData:false,
        contentType:false,
        cache:false,
        success:function(data){
            alert("프로젝트가 등록되었습니다.");
            location.href = "./fundingListPage";
        },
        error:function(e){
            console.log("error : ", e);
        }
    });
};

$(document).ready(function(){

    $("#submitBtn").click(function(){
        upload();
    });

});
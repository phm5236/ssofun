<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.insert {
    padding: 20px 30px;
    display: block;
    width: 600px;
    margin: 5vh auto;
    height: 90vh;
    border: 1px solid #dbdbdb;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.insert .file-list {
    height: 200px;
    overflow: auto;
    border: 1px solid #989898;
    padding: 10px;
}
.insert .file-list .filebox p {
    font-size: 14px;
    margin-top: 10px;
    display: inline-block;
}
.insert .file-list .filebox .delete i{
    color: #ff5353;
    margin-left: 5px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#login_btn").on('click', function() {
        productThumbnailInsert();
    })
});

function productThumbnailInsert() {
    var product_id = $("#product_id").val();
   // var order_list = $("#order_list").val();
    let inputFile = $("input[name='imageFiles']");
    let files = inputFile[0].files;

   

    var data = new FormData();
    data.append("product_id", product_id);
   // data.append("order_list", order_list);
    data.append("files", files);
    for (var i = 0; i < files.length; i++) {
        data.append("imageFiles", files[i]);
    }


    $.ajax({
        url: "thumbnailProcess",
        method: "POST",
        enctype: 'multipart/form-data',
        data: data,
        processData: false,
        contentType: false,
        success: function(res) {
            if (res === "1") {
                alert("상품썸네일 등록에 성공했습니다.");
            } else {
                alert("상품썸네일 등록에 실패했습니다.");
            }
        }
    });
}

var fileNo = 0;
var filesArr = new Array();

// Ver1.
/* 첨부파일 추가 */
function addFile(obj){
    var maxFileCnt = 5;   // 첨부파일 최대 개수
    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    } else {
        for (const file of obj.files) {
            // 첨부파일 검증
            if (validation(file)) {
                // 파일 배열에 담기
                var reader = new FileReader();
                reader.onload = function () {
                    filesArr.push(file);
                };
                reader.readAsDataURL(file);

                // 목록 추가
                let htmlData = '';
                htmlData += '<div id="file' + fileNo + '" class="filebox">';
                htmlData += '   <p class="name">' + file.name + '</p>';
                htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
                htmlData += '</div>';
                $('.file-list').append(htmlData);
                fileNo++;
            } else {
                continue;
            }
        }
    }
    // 초기화
    document.querySelector("input[type=file]").value = "";
}

</script>
</head>
<body>

<div class="insert">
	<h1>썸네일 등록</h1>
       상품번호 : <input id="product_id" type="text" name="product_id"><br>
	   썸네일 : <input id="imageFiles" name="imageFiles" type="file" multiple accept="image/*" onchange="addFile(this);"><br>
       <div class="file-list"></div>
		<input type="button" value="썸네일 등록" id="login_btn">
</div>
	
</body>
</html>

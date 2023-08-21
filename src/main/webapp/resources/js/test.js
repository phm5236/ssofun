
$(document).ready(function(){

    setEventListener();

});

function setEventListener(){
    $(document).on("change","#categorySelect",function(){
        var categoryVal = $(this).val();

        if(categoryVal != null){
            //getMidCategory(categoryVal);
            $("select#subCategorySelect").removeAttr("disabled");

        }
    });
};


function getMidCategory(categoryVal){
    $.ajax({
        url: "./컨트롤러 리퀘스트 맵핑주소",
        method: "GET",
        data: {categoryVal:categoryVal},
        success: function(res){
            if(res != null){
                $.each(res,function(index,item){
                    $.each(item,function(key,value){
                        if(key == "category_id"){

                        }
                    });
                });
            }
        }
    });
}
// var categories = ${pctlist};

// function showSubCategories() {
    
// }

// function showSubSubCategories() {
//     var subCategoryId = parseInt(document.getElementById("subCategorySelect").value);
//     var subSubCategorySelect = document.getElementById("subSubCategorySelect");
//     subSubCategorySelect.disabled = true;
//     subSubCategorySelect.innerHTML = "<option value='0'>소분류 선택</option>";

//     if (subCategoryId !== 0) {
//         for (var i = 0; i < categories.length; i++) {
//             if (categories[i].this_parent_id === subCategoryId) {
//                 var subSubCategoryOption = document.createElement("option");
//                 subSubCategoryOption.value = categories[i].product_category_type_id;
//                 subSubCategoryOption.text = categories[i].name;
//                 subSubCategorySelect.appendChild(subSubCategoryOption);
//             }
//         }

//         subSubCategorySelect.disabled = false;
//     }
// }
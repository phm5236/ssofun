
$(document).ready(function(){
    setUserSession();
    
    var user_id = getUserSession();
    var user_creator_id = getUserCreatorIdSession();

    if(user_creator_id != 0){
        getCreatorInfo(user_creator_id);
    }

    var urlParams = new URLSearchParams(window.location.search);
    var funding_id = urlParams.get("funding_id");

    setEventListener(user_id,funding_id,user_creator_id);
    getCategoryList();
    checkFundingId(funding_id);




      tinymce.init({
        language: 'ko_KR',
        selector: 'textarea#contents',
        plugins: ['advlist', 'autolink','image code', 'lists', 'link', 'image', 'charmap', 'print', 'preview', 'anchor', 'searchreplace', 'visualblocks', 'code', 'fullscreen', 'insertdatetime', 'media', 'table', 'paste', 'code', 'help', 'wordcount', 'save' ],
        toolbar: 'formatselect fontselect fontsizeselect |'
                + ' forecolor backcolor |'
                + ' bold italic underline strikethrough |'
                + ' alignjustify alignleft aligncenter alignright |'
                + ' bullist numlist |'
                + ' table tabledelete |'
                + ' link custom_image'
                + 'undo redo | link image | code',
        fontsize_formats: '9px 10px 11px 12px 13px 14px 15px 16px 18px 20px 22px 24px 28px 32px 36px 48px',
        content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }',
        menubar: false,
        /*** image upload ***/
        image_title: true,
        /* enable automatic uploads of images represented by blob or data URIs*/
        automatic_uploads: true,
        /*
            URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
            images_upload_url: 'postAcceptor.php',
            here we add custom filepicker only to Image dialog
        */
        file_picker_types: 'image',
        /* and here's our custom image picker*/
        file_picker_callback: function (cb, value, meta) {
            var input = document.createElement('input');
            input.setAttribute('type', 'file');
            input.setAttribute('accept', 'image/*');

            /*
            Note: In modern browsers input[type="file"] is functional without
            even adding it to the DOM, but that might not be the case in some older
            or quirky browsers like IE, so you might want to add it to the DOM
            just in case, and visually hide it. And do not forget do remove it
            once you do not need it anymore.
            */
            input.onchange = function () {
                var file = this.files[0];

                var reader = new FileReader();
                reader.onload = function () {
                    /*
                    Note: Now we need to register the blob in TinyMCEs image blob
                    registry. In the next release this part hopefully won't be
                    necessary, as we are looking to handle it internally.
                    */
                    var id = 'blobid' + (new Date()).getTime();
                    var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
                    var base64 = reader.result.split(',')[1];
                    var blobInfo = blobCache.create(id, file, base64);
                    blobCache.add(blobInfo);

                    /* call the callback and populate the Title field with the file name */
                    cb(blobInfo.blobUri(), { title: file.name });
                };
                reader.readAsDataURL(file);
            };
            input.click();
        },
        /*** image upload ***/
      setup: function(editor) {}
     });

});

function setEventListener(user_id,funding_id,user_creator_id){

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

    $(document).on("click","input#fundingRegisterSubmitBtn",function(event){
        event.stopPropagation();  
        // var itemCount = $("ul.reward>li.rewardItemList>ul>li:first-child>span").text();
        // var itemName = $("ul.reward>li.rewardItemList>ul>li:first-child").text().replace(itemCount,"").replace("• ","");
        // alert("itemName: "+itemName);

        var creatorType = $("#creatorType>ul:first-child>li.checked").index();
        var bizNo = $("#creatorType>ul:last-child>li:last-child>input#biz_no").val();

        if(creatorType == ""){
            return alert("창작자 유형을 선택헤주세요.");
        }else if(creatorType == 1){
            if(bizNo == ""){
                return alert("법인사업자는 사업자 등록번호를 입력해주세요.");
            }
        }

        var categoryId = $("select#funding_category_id>option:selected").val();
        if(categoryId == "none"){
            return alert("카테고리를 선택해주세요.");
        }

        if(user_creator_id != 0){
            insertTag(user_creator_id);
        }else{
            insertUserCreator(user_id);
        }
    });

    $(document).on("click","span#rewardAddBtn",function(event){
        event.stopPropagation();
        insertTemporarilyReward();

        var itemLength = $(this).closest("ul.reward").children("li.rewardItemList").children("ul").children("li").length;
        
        $("#rewardModal>ul:last-of-type>li:last-child>input#updateRewardIndex").val("");

        $("#rewardModal>ul:last-of-type>li:first-child>input#rewardPrice").val("");
        $("#rewardModal>ul:last-of-type>li:nth-child(2)>input#rewardName").val("");
        $("#rewardModal>ul:last-of-type>li:nth-child(3)>input#rewardDesc").val("");
        for(var i=0; i<itemLength; i++){
            $("#rewardModal>ul:last-of-type>li#itemList>ul>li:nth-child("+(i+1)+")>input.itemName").val("");
            $("#rewardModal>ul:last-of-type>li#itemList>ul>li:nth-child("+(i+1)+")>input.itemCount").val("");
        }
        $("#rewardModal>ul:last-of-type>li#stockMax>input#stock_max").val("");
        $("#rewardModal>ul:last-of-type>li#buyCount>input#buy_count").val("");
        $("#rewardModal>ul:last-of-type>li#delivery>input#delivery_price").val("");
        $("#rewardModal>ul:last-of-type>li#deliveryFromReward>input#reward_delivery_from").val("");
        $("#rewardModal>ul:last-of-type>li#start>input#start_from").val("");
        $("#rewardModal>ul:last-of-type>li#closeAt>input#close_at").val("");

        $("#rewardModal").addClass("hide");
        $("#modalBg").addClass("hide");

    });


    $(document).on("click","span#rewardUpdateAddBtn",function(event){
        event.stopPropagation();

        var updateRewardIndex = $("input#updateRewardIndex").val();
        insertTemporarilyReward(updateRewardIndex);

        var itemLength = $(this).closest("ul.reward").children("li.rewardItemList").children("ul").children("li").length;
        
        $("#rewardModal>ul:last-of-type>li:last-child>input#updateRewardIndex").val("");

        $("#rewardModal>ul:last-of-type>li:first-child>input#rewardPrice").val("");
        $("#rewardModal>ul:last-of-type>li:nth-child(2)>input#rewardName").val("");
        $("#rewardModal>ul:last-of-type>li:nth-child(3)>input#rewardDesc").val("");
        for(var i=0; i<itemLength; i++){
            $("#rewardModal>ul:last-of-type>li#itemList>ul>li:nth-child("+(i+1)+")>input.itemName").val("");
            $("#rewardModal>ul:last-of-type>li#itemList>ul>li:nth-child("+(i+1)+")>input.itemCount").val("");
        }
        $("#rewardModal>ul:last-of-type>li#stockMax>input#stock_max").val("");
        $("#rewardModal>ul:last-of-type>li#buyCount>input#buy_count").val("");
        $("#rewardModal>ul:last-of-type>li#delivery>input#delivery_price").val("");
        $("#rewardModal>ul:last-of-type>li#deliveryFromReward>input#reward_delivery_from").val("");
        $("#rewardModal>ul:last-of-type>li#start>input#start_from").val("");
        $("#rewardModal>ul:last-of-type>li#closeAt>input#close_at").val("");

        $("#rewardModal").addClass("hide");
        $("#modalBg").addClass("hide");

    });

    $(document).on("click","#creatorType>ul:first-of-type>li",function(event){
        event.stopPropagation(); 
        $("#creatorType>ul:first-of-type>li").removeClass("checked");
        $(this).addClass("checked");
    });

    $(document).on("input","#target_price",function(event){
        event.stopPropagation(); 
        // 현재 입력된 값 가져오기
        var value = $(this).val();
        
        // 콤마 제거하기
        value = value.replace(/,/g, '');
        
        // 숫자만 남기기
        value = value.replace(/\D/g, '');
        
        // 세 자리마다 콤마 추가하기
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        
        // 값 업데이트
        $(this).val(value);
    });

    $(document).on("click","li#close",function(event){
        event.stopPropagation();

        var itemLength = $("#rewardModal>ul:last-of-type>li#itemList>ul>li").length;

        $("#rewardModal>ul:last-of-type>li:last-child>input#updateRewardIndex").val("");

        $("#rewardModal>ul:last-of-type>li:first-child>input#rewardPrice").val("");
        $("#rewardModal>ul:last-of-type>li:nth-child(2)>input#rewardName").val("");
        $("#rewardModal>ul:last-of-type>li:nth-child(3)>input#rewardDesc").val("");
        for(var i=0; i<itemLength; i++){
            $("#rewardModal>ul:last-of-type>li#itemList>ul>li:nth-child("+(i+1)+")>input.itemName").val("");
            $("#rewardModal>ul:last-of-type>li#itemList>ul>li:nth-child("+(i+1)+")>input.itemCount").val("");
        }
        $("#rewardModal>ul:last-of-type>li#stockMax>input#stock_max").val("");
        $("#rewardModal>ul:last-of-type>li#buyCount>input#buy_count").val("");
        $("#rewardModal>ul:last-of-type>li#delivery>input#delivery_price").val("");
        $("#rewardModal>ul:last-of-type>li#deliveryFromReward>input#reward_delivery_from").val("");
        $("#rewardModal>ul:last-of-type>li#start>input#start_from").val("");
        $("#rewardModal>ul:last-of-type>li#closeAt>input#close_at").val("");
        
        $("#rewardModal").addClass("hide");
        $("#modalBg").addClass("hide");
        $("#rewardModal>ul:first-of-type>li:last-child").text("리워드 추가");
        $("div#rewardModal>ul:last-of-type>li:last-child>span#rewardAddBtn").removeClass("hide");
        
        $("#rewardModal>ul:last-of-type>li:last-child>span#rewardUpdateAddBtn").addClass("hide");
    });
    
    $(document).on("click","span.close",function(event){
        event.stopPropagation();

        var itemLength = $("#rewardModal>ul:last-of-type>li#itemList>ul>li").length;

        $("#rewardModal>ul:last-of-type>li:last-child>input#updateRewardIndex").val("");

        $("#rewardModal>ul:last-of-type>li:first-child>input#rewardPrice").val("");
        $("#rewardModal>ul:last-of-type>li:nth-child(2)>input#rewardName").val("");
        $("#rewardModal>ul:last-of-type>li:nth-child(3)>input#rewardDesc").val("");
        for(var i=0; i<itemLength; i++){
            $("#rewardModal>ul:last-of-type>li#itemList>ul>li:nth-child("+(i+1)+")>input.itemName").val("");
            $("#rewardModal>ul:last-of-type>li#itemList>ul>li:nth-child("+(i+1)+")>input.itemCount").val("");
        }
        $("#rewardModal>ul:last-of-type>li#stockMax>input#stock_max").val("");
        $("#rewardModal>ul:last-of-type>li#buyCount>input#buy_count").val("");
        $("#rewardModal>ul:last-of-type>li#delivery>input#delivery_price").val("");
        $("#rewardModal>ul:last-of-type>li#deliveryFromReward>input#reward_delivery_from").val("");
        $("#rewardModal>ul:last-of-type>li#start>input#start_from").val("");
        $("#rewardModal>ul:last-of-type>li#closeAt>input#close_at").val("");

        $("#rewardModal").addClass("hide");
        $("#modalBg").addClass("hide");
        $("#rewardModal>ul:first-of-type>li:last-child").text("리워드 추가");
        $("div#rewardModal>ul:last-of-type>li:last-child>span#rewardAddBtn").removeClass("hide");
        
        $("#rewardModal>ul:last-of-type>li:last-child>span#rewardUpdateAddBtn").addClass("hide");
    });



    $(document).on("click","div#rewardRegisterBtn",function(event){
        event.stopPropagation();
        $("#rewardModal").removeClass("hide");
        $("#modalBg").removeClass("hide");
        
    });
    
    $(document).on("keyup","#tags>input#name",function(key){
        if(key.keyCode == 13){
            key.stopPropagation();
            var tag = $(this).val();
            $(this).val("");
            insertTemporarilyTag(tag);
            
        }
    });

    $(document).on("click","ul.reward>li.inputBtn>input.rewardCopyBtn",function(e){
        e.stopPropagation();
        var $ulCopy = $(this).parent("li").parent("ul.reward").html();
        $("<ul class='reward'></ul>").append($ulCopy).appendTo("#rewardList");
    });

    $(document).on("click","ul.reward>li.inputBtn>span>input.rewardDeleteBtn",function(e){
        e.stopPropagation();
        $(this).closest("ul.reward").remove();
    });

    $(document).on("click","ul.reward>li.inputBtn>span>input.rewardUpdateBtn",function(e){
        e.stopPropagation();

        var ulIndex = $(this).closest("ul.reward").index();
        var buyCountOrigin = $(this).closest("ul.reward").children("li").first().children("span").text();
        var buyCount = buyCountOrigin.replace(/[^0-9]/g,"");

        var price = $(this).closest("ul.reward").children("li").first().text().replace(buyCountOrigin,"").replace(/[^0-9]/g,"");
        var title = $(this).closest("ul.reward").children("li.rewardTitle").text();
        var desc = $(this).closest("ul.reward").children("li.rewardDesc").text();
        var itemLength = $(this).closest("ul.reward").children("li.rewardItemList").children("ul").children("li").length;

        var itemNameList = [];
        var itemCountList = [];
        for(var i=0; i<itemLength; i++){
            var itemCount = $(this).closest("ul.reward").children("li.rewardItemList").children("ul").children("li").eq(i).children("span").text().replace(/[^0-9]/g,"");
            var itemName = $(this).closest("ul.reward").children("li.rewardItemList").children("ul").children("li").eq(i).text().replace(itemCount,"").replace("개","").replace(" ","").replace("•","");
            
            itemNameList.push(itemName);
            itemCountList.push(itemCount);            
        }
        var maxStock = $(this).closest("ul.reward").children("li.maxStock").text().replace(/[^0-9]/g,"");
        var deliveryPrice = $(this).closest("ul.reward").children("li.deliveryPrice").text().replace(/[^0-9]/g,"");
        var startDate = $(this).closest("ul.reward").children("li.startDate").text().replace(/[^-\d]/g,"");
        var closeDate = $(this).closest("ul.reward").children("li.closeDate").text().replace(/[^-\d]/g,"");
        var deliveryDate = $(this).closest("ul.reward").children("li.deliveryDate").text().replace(/[^-\d]/g,"");
        
        $("#rewardModal").removeClass("hide");
        $("#modalBg").removeClass("hide");
        $("div#rewardModal>ul:last-of-type>li:last-child>span#rewardAddBtn").addClass("hide");

        $("#rewardModal>ul:first-of-type>li:last-child").text("리워드 수정");
        $("#rewardModal>ul:last-of-type>li:last-child>span#rewardUpdateAddBtn").removeClass("hide");
        $("#rewardModal>ul:last-of-type>li:last-child>input#updateRewardIndex").val(ulIndex);

        $("#rewardModal>ul:last-of-type>li:first-child>input#rewardPrice").val(price);
        $("#rewardModal>ul:last-of-type>li:nth-child(2)>input#rewardName").val(title);
        $("#rewardModal>ul:last-of-type>li:nth-child(3)>input#rewardDesc").val(desc);
        for(var i=0; i<itemLength; i++){
            $("#rewardModal>ul:last-of-type>li#itemList>ul>li:nth-child("+(i+1)+")>input.itemName").val(itemNameList[i]);
            $("#rewardModal>ul:last-of-type>li#itemList>ul>li:nth-child("+(i+1)+")>input.itemCount").val(itemCountList[i]);
        }
        $("#rewardModal>ul:last-of-type>li#stockMax>input#stock_max").val(maxStock);
        $("#rewardModal>ul:last-of-type>li#buyCount>input#buy_count").val(buyCount);
        $("#rewardModal>ul:last-of-type>li#delivery>input#delivery_price").val(deliveryPrice);
        $("#rewardModal>ul:last-of-type>li#deliveryFromReward>input#reward_delivery_from").val(deliveryDate);
        $("#rewardModal>ul:last-of-type>li#start>input#start_from").val(startDate);
        $("#rewardModal>ul:last-of-type>li#closeAt>input#close_at").val(closeDate);

        // 파라미터로 펀딩아이디 받아서 존재시 다르게 짜야함!!
    
    });
};


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

    if(funding_id != null){ // 펀딩아이디가 있는 경우
        $("input#fundingRegisterSubmitBtn").addClass("hide");
        $("input#fundingRegisterUpdateBtn").removeClass("hide");

        $("#fixedSidebar").empty();
        $("<li class='click'><a class='active' href='./makerProjectRegisterPage?funding_id="+funding_id+"'>프로젝트 관리</a></li>").appendTo("#fixedSidebar");
        $("<li><a href='./makerOrderListPage?funding_id="+funding_id+"'>주문 · 배송 현황</a></li>").appendTo("#fixedSidebar");
        $("<li><a href='./makerDashBoardPage?funding_id="+funding_id+"'>대시보드</a></li>").appendTo("#fixedSidebar");
        $("<li><a href='./makerNoticeListPage?funding_id="+funding_id+"'>공지사항 관리</a></li>").appendTo("#fixedSidebar");
        $("<li><a href='./makerCommunityListPage?funding_id="+funding_id+"'>커뮤니티 관리</a></li>").appendTo("#fixedSidebar");

        getFunding(funding_id);

    }else{ // 펀딩아이디가 없는 경우
        $("input#fundingRegisterUpdateBtn").addClass("hide");
        $("input#fundingRegisterSubmitBtn").removeClass("hide");

        $("#fixedSidebar").empty();
        $("<li class='click'><a class='active' href='./makerProjectRegisterPage'>프로젝트 관리</a></li>").appendTo("#fixedSidebar");
        $("<li><a>주문 · 배송 현황<i class='bi bi-lock'></i></a></li>").appendTo("#fixedSidebar");
        $("<li><a>대시보드<i class='bi bi-lock'></i></a></li>").appendTo("#fixedSidebar");
        $("<li><a>공지사항 관리<i class='bi bi-lock'></i></a></li>").appendTo("#fixedSidebar");
        $("<li><a>커뮤니티 관리<i class='bi bi-lock'></i></a></li>").appendTo("#fixedSidebar");

    }
}

function getFunding(funding_id){
    $.ajax({
        url: "./AJAXgetFunding",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                $.each(res,function(key,value){
                    if(key == "thumbnailList"){
                        $.each(value,function(index,item){
                            var url;
                            $.each(item,function(key,value){
                                if(key == "url"){
                                    url = value;
                                }
                                if(key == "image_order"){
                                    if(value == 1){
                                        $("p#uploadMainThumb").removeClass("hide");
                                        $("<img src='../../resources/img/kimdaseul/funding/"+url+"' alt=''><span id='mainThumbDelete'>X</span>").appendTo("p#uploadMainThumb");

                                    }else{ // 상세 섬네일 어떻게 처리할지 고민중!------------------------

                                    }
                                }
                            });
                        });
                    }
                    if(key == "funding_category_id"){
                        $("#funding_category_id").val(value).prop("selected",true);
                    }
                    if(key == "target_price"){
                        $("input#target_price").val(addCommas(value));
                    }
                    if(key == "title"){
                        $("input#projectTitle").val(value);
                    }
                    if(key == "adult_fg"){
                        if(value == 1){
                            $("input#adult_fg").prop("checked",true);
                        }
                    }
                    if(key == "funding_tag_id"){
                        getTagName(value,function(res){
                            $("<li>#"+res+"<span>X</span></li>").appendTo("#insertTagList");
                        });
                    }
                    if(key == "delivery_from"){
                        $("input#delivery_from").val(value.replace(/(\d+)년 (\d+)월 (\d+)일/, "$1-$2-$3"));
                    }
                    if(key == "description"){
                        $("#description").val(value);
                    }
                    if(key == "contents"){
                    
                        tinymce.activeEditor.setContent(value);
                        // $("#contents").html(value);
                    }
                    if(key == "rewardList"){
                        $.each(value,function(index,item){
                            var funding_reward_id;
                            var rewardUl = $("<ul class='reward'></ul>");
                            var price;
                            var title
                            var description;
                            var itemList = $("<li class='rewardItemList'></li>");
                            
                            var stock_max;
                            $.each(item,function(key,value){
                                if(key == "funding_reward_id"){
                                    funding_reward_id = value;
                                }
                                if(key == "price"){
                                    price = value;
                                }
                                if(key == "title"){
                                    title = value;
                                }
                                if(key == "description"){
                                    description = value;
                                }
                                if(key == "itemList"){
                                    var ul = $("<ul></ul>");
                                    $.each(value,function(index,item){
                                        var name;
                                        $.each(item,function(key,value){
                                            if(key == "name"){
                                                name = value;
                                            }
                                            if(key == "count"){
                                                $("<li>"+name+"<span>"+value+"</span>개</li>").appendTo(ul);
                                            }
                                        });
                                    });
                                    ul.appendTo(itemList);

                                }
                                if(key == "stock_max"){
                                    stock_max = value;
                                }

                                if(key == "buy_count"){
                                    $("<li>"+addCommas(price)+"원<span>제한 수량 "+value+"개</span></li>").appendTo(rewardUl);
                                    $("<li class='rewardTitle'>"+title+"</li>").appendTo(rewardUl);
                                    $("<li class='rewardDesc'>"+description+"</li>").appendTo(rewardUl);
                                    itemList.appendTo(rewardUl);
                                    $("<li class='maxStock'><span>최대 재고</span>"+addCommas(stock_max)+"개</li>").appendTo(rewardUl);
                                }

                                if(key == "delivery_price"){
                                    $("<li class='deliveryPrice'><span>배송비</span>"+addCommas(value)+"원</li>").appendTo(rewardUl);
                                }

                                if(key == "start_from"){
                                    $("<li class='startDate'><span>시작일</span>"+value.replace(/\./g, '-')+"</li>").appendTo(rewardUl);
                                }
                                if(key == "close_at"){
                                    $("<li class='closeDate'><span>종료일</span>"+value.replace(/\./g, '-')+"</li>").appendTo(rewardUl);
                                }
                                if(key == "delivery_from"){
                                    $("<li class='deliveryDate'><span>발송 예정일</span>"+convertDateFormat(value)+" 예정</li>").appendTo(rewardUl);
                                    var liInput = $("<li class='inputBtn'></li>");
                                    $("<input type='button' class='rewardCopyBtn' value='복사'>").appendTo(liInput);
                                    $("<span><input type='button' class='rewardUpdateBtn' value='수정'><input type='hidden' value='"+funding_reward_id+"' class='funding_reward_id'><input type='button' class='rewardDeleteBtn' value='삭제'></span>").appendTo(liInput);
                                    liInput.appendTo(rewardUl);
                                }
                            });
                            rewardUl.appendTo("#rewardList");
                        });
                    }
                });
            }
        }
    });
}

function convertDateFormat(str) {
    var cleanedDate = str.replace(/\s|\./g, '');

    // 날짜를 새로운 형식으로 변환합니다.
    var year = cleanedDate.substring(0, 4);
    var month = cleanedDate.substring(4, 6);
    var day = cleanedDate.substring(6, 8);
    var convertedDate = year + "-" + month + "-" + day;

   return convertedDate;
  }


function getCreatorInfo(user_creator_id){
    $.ajax({
        url: "./AJAXgetCreatorInfo",
        method: "GET",
        data: {user_creator_id,user_creator_id},
        success: function(res){
            if(res != null){
                $.each(res,function(key,value){
                    if(key == "name"){
                        $("input#creatorName").val(value);
                    }
                    if(key =="email"){
                        $("input#creatorEmail").val(value);
                    }
                    if(key == "phone"){
                        $("input#creatorPhone").val(value);
                    }
                    if(key == "creator_type"){
                        $("#creatorType>ul:first-of-type>li").eq(value).addClass("checked");
                    }
                    if(key == "biz_no"){
                        $("input#biz_no").val(value);
                    }

                    if(key == "userCreatorBankDto"){
                        $.each(value,function(key,value){
                            if(key == "bank_type"){
                                $("select#bank_type>option").eq(value).prop("selected",true);
                            }
                            if(key == "account_no"){
                                $("input#account_no").val(value);
                            }
                            if(key == "account_name"){
                                $("input#account_name").val(value);
                            }

                        });
                    }

                });
            }
        }
    });
}

function getTagName(funding_tag_id,callback){
    $.ajax({
        url: "./AJAXgetTagName",
        method: "GET",
        data: {funding_tag_id:funding_tag_id},
        success: function(res){
            if(res != null){
                callback(res);
            }
        }
    });
}


function insertUserCreator(user_id){

    var name = $("#creatorName").val();
    var email = $("#creatorEmail").val();
    var phone = $("#creatorPhone").val();
    var creator_type = $("#creatorType>ul:first-of-type>li.checked").index();
    var biz_no = $("#creatorType>ul:last-of-type>li>input#biz_no").val();


    $.ajax({
        url: "./AJAXinsertUserCreator",
        method: "POST",
        data: {user_id:user_id, name:name, email:email, phone:phone, creator_type:creator_type, biz_no:biz_no},
        success: function(res){
            if(res!=0){
                // ------ 창작자 은행 정보 입력 ------ 
                var user_creator_id = res;
                var bank_type = $("#bank_type>option:selected").val();
                var account_no = $("input#account_no").val();
                var account_name = $("input#account_name").val();

                $.ajax({
                    url: "./AJAXinsertCreatorBank",
                    method: "POST",
                    data: {user_creator_id:user_creator_id,bank_type:bank_type,account_no:account_no,account_name:account_name},
                    success: function(res){
                        if(res == 1){
                            insertTag(user_creator_id);
                           
                        }
                    }
                });

            }
        }
    });
}

function insertTag(user_creator_id){
     // ------ 태그 입력 ------ 
     var tagName = $("#insertTagList>li").text().replace("#","").replace("X","");
     var funding_tag_id;
     $.ajax({
         url: "./AJAXinsertTag",
         method: "POST",
         data: {name:tagName},
         success: function(res){
             if(res != 0){
                 funding_tag_id = res;

                 var $funding_category_id = $("select#funding_category_id>option:selected").val();

                 var funding_code = generateUniqueProductCode(10);
                 var title = $("#projectTitle").val();
                 var description = $("#description").val();
                 // var editorContent = tinymce.activeEditor.getContent(); // TinyMCE 에디터의 내용을 가져옴
                 var contents = tinymce.activeEditor.getContent(); // TinyMCE 에디터의 내용을 가져옴
                 var target_price = $("#target_price").val().replace(/[^0-9]/g,"");
                 var adult_fg = $("#adult_fg:checked").val();
                 if(adult_fg == null){
                     adult_fg = 0;
                 }
                 var delivery_from = formatDateToKorean($("#delivery_from").val());

                 $.ajax({
                     url: "./AJAXinsertFunding",
                     method: "POST",
                     contentType: "application/json",
                     data: JSON.stringify({funding_category_id:$funding_category_id,
                             funding_tag_id:funding_tag_id,
                             user_creator_id:user_creator_id,
                             funding_code:funding_code,
                             title: title,
                             description:description,
                             contents:contents,
                             target_price:target_price,
                             //confirm_fg:1, //나중에 수정해야함
                             adult_fg:adult_fg,
                             delivery_from:delivery_from
                         }),
                     success: function(res){

                         if(res!=0){

                             var formData = new FormData();
                             var funding_id = res;
                             var mainUrl = $("input#mainUrl")[0].files[0];
                             
                             formData.append("funding_id",funding_id);
                             formData.append("url",mainUrl);
                             formData.append("image_order",1);
                             
                             $.ajax({
                                 url: "./AJAXinsertFundingThumbnail",
                                 method: "POST",
                                 data: formData,
                                 processData: false, // 데이터 처리 방지
                                 contentType: false, // 컨텐츠 타입 설정을 자동으로 처리
                                 success: function(res){
                                     if(res == 1){                                                          
                                         
                                     }
                                 }
                             });

                             var files = $('input#url')[0].files;
                             var order = 2;
                             
                             for (var i = 0; i < files.length; i++) {
                                 var fundingId = res;
                                 var formDataDetail = new FormData();
                                 var file = files[i]; // 파일에 대한 작업 수행
                                 
                                 formDataDetail.append("funding_id",fundingId);
                                 formDataDetail.append("url",file);
                                 formDataDetail.append("image_order",i+order);

                                 $.ajax({
                                     url: "./AJAXinsertFundingThumbnail",
                                     method: "POST",
                                     data: formDataDetail,
                                     processData: false, // 데이터 처리 방지
                                     contentType: false, // 컨텐츠 타입 설정을 자동으로 처리
                                     success: function(res){
                                         if(res == 1){
                                             
                                         }
                                     }
                                 });

                             }



                             var itemList = [];
                             var rewardList = [];
                             var rewardLength = $("#rewardList>ul").length;         
                             
                             // 리워드 입력 다시 수정해야함!! ------------------------------------------------------------------------------------

                             for(var i = 0; i<rewardLength; i++){
                                 var title = $("#rewardList>ul.reward").eq(i).children("li.rewardTitle").text();
                                 var description = $("#rewardList>ul.reward").eq(i).children("li.rewardDesc").text();

                                 var stock_max = $("#rewardList>ul.reward").eq(i).children("li.maxStock").text().replace(/[^0-9]/g,"");

                                 var $buy_count_origin = $("#rewardList>ul.reward").eq(i).children("li:first-child").children("span").text();
                                 var buy_count =  $buy_count_origin.replace(/[^0-9]/g,"");

                                 var price_orgin = $("#rewardList>ul.reward").eq(i).children("li:first-child").text().replace($buy_count_origin,"");
                                 var price = price_orgin.replace(/[^0-9]/g,"");

                                 var delivery_price = $("#rewardList>ul.reward").eq(i).children("li.deliveryPrice").text().replace(/[^0-9]/g,"");
                                 var delivery_from_origin = $("#rewardList>ul.reward").eq(i).children("li.deliveryDate").text().replace(/[^a-zA-Z0-9-]/g,"");
                                 var delivery_from = formatDate(delivery_from_origin);

                                 var start_from_origin = $("#rewardList>ul.reward").eq(i).children("li.startDate").text().replace(/[^a-zA-Z0-9-]/g,"");
                                 var start_from = parseDate(start_from_origin);

                                 var close_at_origin = $("#rewardList>ul.reward").eq(i).children("li.closeDate").text().replace(/[^a-zA-Z0-9-]/g,"");
                                 var close_at = parseDate(close_at_origin);

                                 
                             
                                 // var fundingRewardDto = {
                                 //     funding_id:funding_id,
                                 //     title:title,
                                 //     description:description,
                                 //     price:price,
                                 //     delivery_price:delivery_price,
                                 //     itemList:itemList,
                                 //     // stock_max:
                                 //     buy_count:buy_count,
                                 //     delivery_from:delivery_from
                                 // };
                                 $.ajax({
                                     url: "./AJAXinsertFundingReward?delivery_from="+delivery_from+"&start_from="+start_from+"&close_at="+close_at,
                                     method: "POST",
                                     data: JSON.stringify({
                                         funding_id:funding_id,
                                         title:title,
                                         description:description,
                                         price:price,
                                         delivery_price:delivery_price,
                                         stock_max:stock_max,
                                         buy_count:buy_count
                                     }), // JSON 문자열로 데이터 직렬화 //funding_order_status_id:2 -> 2는 결제완료 의미
                                     contentType: "application/json",
                                     async: false, //동기적으로 변경
                                     success: function(res){
                                        if(res != 0){
                                            
                                            var funding_reward_id = res;
                                               
                                            var rewardLength = $("#rewardList>ul").length;

                                                var itemLength = $("#rewardList>ul:nth-of-type("+(i+1)+")>li.rewardItemList>ul>li").length;

                                                for(var j = 0; j<itemLength; j++){

                                                    var $itemCount_orgin = $("div#rewardList").children("ul.reward").eq(i).children("li.rewardItemList").children("ul").children("li").eq(j).children("span").text();
                                                    
                                                    var itemCount = $itemCount_orgin.replace("개","");
                                                    var itemName = $("#rewardList").children("ul.reward").eq(i).children("li.rewardItemList").children("ul").children("li").eq(j).text().replace($itemCount_orgin,"").replace("• ","");
                                                    var fundingItemDto = {funding_reward_id:funding_reward_id, name:itemName, count:itemCount};                                                
                                                    

                                                        $.ajax({
                                                            url: "./AJAXinsertFundingRewardItem",
                                                            method: "POST",
                                                            data: JSON.stringify(fundingItemDto),
                                                            contentType: "application/json",
                                                            async: false,
                                                            success: function(res){
                                                                if(res == 1){
                                                                    if(j == itemLength){
                                                                        alert("펀딩이 등록되었습니다!");
                                                                    }
                                                                    window.location.href = "../maker/makerProjectRegisterPage?funding_id="+funding_id;
                                                                    
                                                                }
                                                            }
                                                        });

                                                    
                                                }
                                                     
                                                 
                                             //};
                                         }
                                     }
                                 });
                             }

                         }
                     }
                 });


             }
         }
     });
}



//2023. 7. 11. 화요일 이렇게 나옴
function formatDate(dateString) {
    var parts = dateString.split('-');
    var year = parseInt(parts[0], 10);
    var month = parseInt(parts[1], 10) - 1;
    var day = parseInt(parts[2], 10);
    
    var date = new Date(year, month, day);
    
    var options = { year: 'numeric', month: '2-digit', day: '2-digit', weekday: 'long' };
    var formattedDate = date.toLocaleDateString('ko-KR', options);
    
    formattedDate = formattedDate.replace(/(\d{4}).(\d{2}).(\d{2}).*/, '$1. $2. $3');
    
    return formattedDate;
  }
  

//2023.07.11 
function parseDate(dateString) {
    var parts = dateString.split('-');
    var year = parseInt(parts[0], 10);
    var month = parseInt(parts[1], 10) - 1;
    var day = parseInt(parts[2], 10);
    
    var date = new Date(year, month, day);
    
    var formattedDate = date.getFullYear() + '.' 
                      + padZero(date.getMonth() + 1) + '.' 
                      + padZero(date.getDate());
    
    return formattedDate;
  }

//2023년 09월 01일 로 나옴
  function formatDateToKorean(dateString) {
    var dateObject = new Date(dateString);
    var year = dateObject.getFullYear();
    var month = (dateObject.getMonth() + 1).toString().padStart(2, '0');
    var day = dateObject.getDate().toString().padStart(2, '0');
    var formattedDate = year + "년 " + month + "월 " + day + "일";
    return formattedDate;
  }

  
  function padZero(number) {
    return (number < 10 ? '0' : '') + number;
  }
  

function generateUniqueProductCode(length) {
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    var code = '';
  
    for (var i = 0; i < length; i++) {
      var randomIndex = Math.floor(Math.random() * characters.length);
      code += characters.charAt(randomIndex);
    }
  
    return "SF"+code;
  }





function getCategoryList(){
    $.ajax({
        url: "./AJAXgetCategoryList",
        method: "GET",
        success: function(res){
            if(res!=null){
                $.each(res,function(index,item){
                    var $funding_category_id;
                    $.each(item,function(key,value){
                        if(key == "funding_category_id"){
                            $funding_category_id = value;
                        }
                        
                        if(key == "name"){
                            if(value == "전체" || value == "BEST 펀딩"){
                                return ;
                            }else{
                                $("select#funding_category_id").append("<option value='"+$funding_category_id+"'>"+value+"</option>");
                            }
                        }
                    });
                });
            }
        }
    });
};


function insertTemporarilyTag(tag){
    $("#insertTagList").append("<li>#"+tag+"<span>X</span></li>");
};


function insertTemporarilyReward(updateRewardIndex){


    var price = addCommas($("input#rewardPrice").val());
    var title = $("input#rewardName").val();
    var desc = $("#rewardDesc").val();
    var itemLength = $("#rewardModal>ul:last-of-type>li#itemList>ul>li").length;
    


    //stock_max 추가해야함
    var buy_count = $("input#buy_count").val();
    var stock_max = $("input#stock_max").val();
    var delivery_price = addCommas($("#delivery>input.delivery_price").val());
    var start_from = $("input#start_from").val();
    var close_at = $("input#close_at").val();
    var delivery_from = $("input#reward_delivery_from").val();



    var rewardList = $("#rewardList");
    if(updateRewardIndex != null){        
        var rewardUl = $("#rewardList>ul").eq(updateRewardIndex);
        rewardUl.empty();
    }else{
        var rewardUl = $("<ul class='reward'></ul>");
    }
    
    rewardUl.append("<li>"+price+"원<span>제한 수량 "+buy_count+"개</span></li>");
    rewardUl.append("<li class='rewardTitle'>"+title+"</li>");
    rewardUl.append("<li class='rewardDesc'>"+desc+"</li>");
    var rewardItemList = $("<li class='rewardItemList'></li>");
    var itemUl = $("<ul></ul>");
    
    for(var i = 1; i<=itemLength; i++){
        var itemName = $("#rewardModal>ul:last-of-type>li#itemList>ul>li").eq(i-1).children("input.itemName").val();
        var itemCount = $("#rewardModal>ul:last-of-type>li#itemList>ul>li").eq(i-1).children("input.itemCount").val();
 
        itemUl.append("<li>&#8226; "+itemName+"<span>"+itemCount+"개</span></li>");
    };
    rewardItemList.append(itemUl);
    rewardUl.append(rewardItemList);
    
    rewardUl.append("<li class='maxStock'><span>최대 재고</span>"+stock_max+"개</li>");
    rewardUl.append("<li class='maxBuy'><span>제한 수량</span>"+buy_count+"개</li>");
    rewardUl.append("<li class='deliveryPrice'><span>배송비</span>"+delivery_price+"원</li>");
    rewardUl.append("<li class='startDate'><span>시작일</span>"+start_from+"</li>");
    rewardUl.append("<li class='closeDate'><span>종료일</span>"+close_at+"</li>");
    rewardUl.append("<li class='deliveryDate'><span>발송 예정일</span>"+delivery_from+" 예정</li>");
    rewardUl.append("<li class='inputBtn'><input type='button' class='rewardCopyBtn' value='복사'><span><input type='button' class='rewardUpdateBtn' value='수정'><input type='button' class='rewardDeleteBtn' value='삭제'></span></li>");
    
    
    rewardList.append(rewardUl);
}

function addCommas(num){
    var str = num.toString();
    if(str.length >= 4){
        str = str.replace(/(\d)(?=(\d{3})+$)/g, '$1,');
    }

    return str;
};

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
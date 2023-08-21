$(document).ready(function(){

	var $funding_category_id = $("#funding_category_id").val();

    getCategoryList($funding_category_id);
    getPageName($funding_category_id);
    getFundingList(null,$funding_category_id);
    getPageList(null,$funding_category_id);

    $("#sort").css({
        "height":"25px",
        "font-size":"5px"
    });

    $(document).on("click","#move-right",function(){
        var $currentPageNum = $(".active").text();
        var $maxPageNum;
        getMaxPageNum(function(res){
            $maxPageNum = res;
            if($currentPageNum == $maxPageNum){
                return alert("더이상 이동할 페이지가 없습니다.");
            }
            $("#pageNum"+$currentPageNum).removeClass('active');
            var $nextPageNum =  parseInt($currentPageNum) + 1 ;
            getPageList($nextPageNum,$funding_category_id);
            getFundingList($nextPageNum,$funding_category_id);
        },$funding_category_id);
    });

    $(document).on("click","#move-left",function(){
        var $currentPageNum = $(".active").text();
        if($currentPageNum == 1){
            return alert("더이상 이동할 페이지가 없습니다.");
        }
    	$("#pageNum"+$currentPageNum).removeClass('active');
        var $prePageNum = $currentPageNum - 1 ;
        getPageList($prePageNum,$funding_category_id);
        getFundingList($prePageNum,$funding_category_id);
    });

    $(document).on("click","#paging ul li",function(){
        $("#paging ul li").removeClass('active');
        var $clickNum = $(this).text();
        getPageList($clickNum,$funding_category_id);
        getFundingList($clickNum,$funding_category_id);
    });

    $("#category>li").first().addClass('active-cate');


});

function getPageName($funding_category_id){
    $.ajax({
        url: "./getPageNameAjax",
        method: "GET",
        //contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data: {funding_category_id:$funding_category_id},
        success: function(res){
            $("#category-name").html(res);
        }
    });
};


function getMaxPageNum(callback,$funding_category_id){
    $.ajax({
        url: "./getMaxPageNumAjax",
        method: "GET",
        data: {funding_category_id:$funding_category_id},
        success: function(res){
            callback(res);
        }
    });
}

function getPageList(clickNum,$funding_category_id){
	$("#paging ul").empty();
    
    $.ajax({
        url: "./getPageListAjax",
        method: "GET",
        data: {clickNum:clickNum !== null ? clickNum : null,
            funding_category_id:$funding_category_id},
        success: function(res){
            // if(res == null){
            //     return true;
            // }
            $("#paging ul").append("<span id='move-left'>&lt;</span>");
            $.each(res,function(index,item){
            	if(item == clickNum){
            		return $("#paging ul").append("<li class='active' id='pageNum"+item+"'>"+item+"</li>");
            	}
                if(item == 1 && clickNum == null){
                    return $("#paging ul").append("<li class='active' id='pageNum"+item+"'>"+item+"</li>");
                }
                $("#paging ul").append("<li id='pageNum"+item+"'>"+item+"</li>");
            });
            $("#paging ul").append("<span id='move-right'>&gt;</span>");
        }
    });
};

function getFundingList(pageNum,$funding_category_id){
    $("#list").empty();


    $.ajax({
        url: "./getFundingListAjax",
        method: "GET",
        data: {pageNum:pageNum !== null ? pageNum : null,
            funding_category_id:$funding_category_id},
        success: function(res){

            $.each(res,function(index,item){
                var $a;
                var $achievementPrice;
                var $achievementRate;
                var $addComma;
                var $ul = $("<ul class='p-0'></ul>");
                var funding_id;
                $.each(item,function(key,value){
                    
                    if(key == "funding_id"){
                        funding_id = value;
                        $a = $("<a href='./fundingDetailPage?funding_id="+value+"'></a>");
                    }

                    if(key == "thumbnailList"){
                        $.each(value,function(index,item){
                            var $url;
                            $.each(item,function(key,value){
                                if(key == "url"){
                                    $url = value;
                                }

                                if(key == "image_order"){
                                    if(value == 1){
                                        $ul.append("<li><img src='/resources/img/kimdaseul/funding/"+$url+"' alt='리스트 섬네일'></li>");
                                        // $ul.append("<li><img src='/ssofunUploadFiles/"+$url+"' alt='리스트 섬네일'></li>");
                                    }
                                }
                            });
                        });
                    }

                    if(key == "funding_category_id"){
                        $("<li class='text-start'>"+getFundingCategoryName(value)+"</li>").appendTo($ul);
                    }

                    if(key == "title"){
                        $("<li class='text-start'>"+value+"</li>").appendTo($ul);
                    }
                    if(key == "description"){
                        $("<li class='text-start'>"+value+"</li>").appendTo($ul);
                    }


                    if(key == "target_price"){
                        $achievementRate = getFundingAchievementRate(funding_id);
                        var d_day = getDday(funding_id);
                        var achievement = getfundingAchievement(funding_id);

                        if(achievement != 0){
                            achievement = addCommas(achievement);
                        }
                        if(d_day<0){
                            $("<li class='text-start'><b class='text-danger'>"+$achievementRate+"% 달성</b> "+achievement+"원 <span class='float-end'>종료</span></li>").appendTo($ul);
                        }else{
                            $("<li class='text-start'><b class='text-danger'>"+$achievementRate+"% 달성</b> "+achievement+"원 <span class='float-end'>"+d_day+"일 남음</span></li>").appendTo($ul);
                        }

                        if($achievementRate>=100){
                            $achievementRate = 100;
                        }
                        var $li = $("<li></li>");
                        $("<span></span>").css({"width": $achievementRate+"%"}).appendTo($li);
                        $($li).appendTo($ul);
                    }
                    

                });
                $a.append($ul);
                $("#list").append($a);
            });
        } 
    });
};
  

function getDday(funding_id){
    var dday;

    $.ajax({
        url: "../user/AJAXgetDday",
        method: "GET",
        async: false,
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                dday = res;
            }
        }
    });

    return dday;
}

function getFundingAchievementRate(funding_id){
    var respone;
    $.ajax({
        url: "./AJAXgetFundingAchievementRate",
        method: "GET",
        async: false,
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                respone = res;
            }
        }
    });
    return respone;
}


function getfundingAchievement(funding_id){
    var respone;
    $.ajax({
        url: "./AJAXgetFundingAchievement",
        method: "GET",
        async: false,
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                respone = res;
            }
        }
    });
    return respone;
}


function getFundingCategoryName(funding_category_id){
    var fundingCategoryName;
    $.ajax({
        url: "../user/AJAXgetFundingCategoryName",
        method: "GET",
        async : false,
        data: {funding_category_id:funding_category_id},
        success: function(res){
            if(res !=  null){
                fundingCategoryName = res;
            }
        }
    });

    return fundingCategoryName;
}

function addCommas(num){
    var str = num.toString();
    if(str.length >= 4){
        str = str.replace(/(\d)(?=(\d{3})+$)/g, '$1,');
    }

    return str;
}


function getCategoryList(clickCategory){
    $("#category").empty();

    $.ajax({
        url: "./getCategoryListAjax",
        method: "GET",
        success: function(res){
            var ul = $("<ul></ul>");
            $.each(res,function(index,item){
                var $li = $("<li></li>");
                var $cateId;
                var image_url;
                $.each(item, function(key,value){
                    if(key == "funding_category_id"){
                        $cateId = value;
                    }
                    
                    if(key == "image_url"){
                        image_url = value;
                    }
                    if(key == "name"){
                        if($cateId == clickCategory){
                            $li.addClass('active-cate');
                            $("<a href='./categoryFundingListPage?funding_category_id="+$cateId+"'><img src='../../resources/img/kimdaseul/category/"+image_url+"' alt='"+value+"'>"+value+"</a>").appendTo($li);
                            // $("<a href='./categoryFundingListPage?funding_category_id="+$cateId+"'><img src='/ssofunUploadFiles/"+image_url+"' alt='"+value+"'>"+value+"</a>").appendTo($li);
                            
                        }else if($cateId == 1 && clickCategory == null){
                            $li.addClass('active-cate');
                            $("<a href='./fundingListPage'><img src='../../resources/img/kimdaseul/category/"+image_url+"' alt='"+value+"'>"+value+"</a>").appendTo($li);
                            // $("<a href='./fundingListPage'><img src='/ssofunUploadFiles/"+image_url+"' alt='"+value+"'>"+value+"</a>").appendTo($li);
                            
                        }else{
                            $("<a href='./categoryFundingListPage?funding_category_id="+$cateId+"'><img src='../../resources/img/kimdaseul/category/"+image_url+"' alt='"+value+"'>"+value+"</a>").appendTo($li);
                            // $("<a href='./categoryFundingListPage?funding_category_id="+$cateId+"'><img src='/ssofunUploadFiles/"+image_url+"' alt='"+value+"'>"+value+"</a>").appendTo($li);
                        }
                    }
                });
                $li.appendTo(ul);
            });
            $('#category').append(ul);
            $("#category>ul").width((res.length*90));
        }
    });
};


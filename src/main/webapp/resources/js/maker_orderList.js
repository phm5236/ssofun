
$(document).ready(function(){
    setUserSession();
    
    var user_id = getUserSession();
    var user_creator_id = getUserCreatorIdSession();

    var urlParams = new URLSearchParams(window.location.search);
    var funding_id = urlParams.get("funding_id");

    getFundingOrderList(funding_id);
    getDeliveryCompanyList();
    setEventListener(user_id,funding_id);
    checkFundingId(funding_id);
    

});

function setEventListener(user_id,funding_id){
    
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

    $(document).on("click","input[type=button].deliveryBtn",function(e){
        e.stopPropagation();
        var btnText = $(this).val();
        alert(btnText);
        if(btnText == "주문 발주"){
            var funding_order_id = $(this).parent("td").parent("tr").children("td.pk").children("input").val();
            $("#deliveryCompanyModalBg").removeClass("hide");
            $("#deliveryCompanyModalBg>ul").removeClass("hide");
            $("#deliveryCompanyModalBg>ul>li:last-child>input#funding_order_id").val(funding_order_id);  
        }

        if(btnText == "배송 시작"){
            var funding_order_id = $(this).parent("td").parent("tr").children("td.pk").children("input").val();
            alert(funding_order_id);
            var invoice_no = generateRandomValue();
            var delivery_status_id = 2;
            updateDelivering(funding_order_id,delivery_status_id,invoice_no,funding_id);
        }
        if(btnText == "배송 완료"){
            var funding_order_id = $(this).parent("td").parent("tr").children("td.pk").children("input").val();
            alert(funding_order_id);
            var delivery_status_id = 3;
            updateDeliveryStatus(funding_order_id,delivery_status_id,funding_id);
        }

        if(btnText == "수령 완료"){
            var funding_order_id = $(this).parent("td").parent("tr").children("td.pk").children("input").val();
            alert(funding_order_id);
            var delivery_status_id = 4;
            updateDeliveryStatus(funding_order_id,delivery_status_id,funding_id);
        }
        //구매 확정 버튼 넣을지말지 미정
    });
    
    $(document).on("click","#deliveryCompanyModalBg>ul>li:last-child>input#deliveryCompanyBtn",function(e){
        e.stopPropagation();
        $("#deliveryCompanyModalBg").addClass("hide");
        $("#deliveryCompanyModalBg>ul").addClass("hide");
        
        var funding_order_id = $("#deliveryCompanyModalBg>ul>li:last-child>input#funding_order_id").val();
        var delivery_company_id = $("select#delivery_company_id>option:selected").val();
        var delivery_status_id = 1;

        insertDelivery(funding_order_id,delivery_company_id,delivery_status_id,funding_id);
        // $(this).prev("tr").text("배송 대기 중");

        $("#deliveryCompanyModalBg>ul>li:nth-child(2)>select").val("none").prop("selected",true);
        $("#deliveryCompanyModalBg>ul>li:last-child>input#funding_order_id").val("");  
    });
    
    $(document).on("click","#deliveryCompanyModalBg>ul>li:last-child>input#cancleBtn",function(e){
        e.stopPropagation();
        $("#deliveryCompanyModalBg").addClass("hide");
        $("#deliveryCompanyModalBg>ul").addClass("hide");
        $("#deliveryCompanyModalBg>ul>li:nth-child(2)>select").val("none").prop("selected",true);
        $("#deliveryCompanyModalBg>ul>li:last-child>input#funding_order_id").val("");  
    });

    $(document).on("change","#orderList>table>thead>tr>th.checkBox>input#allCheck",function(e){
        e.stopPropagation();
        if($(this).is(":checked")){
            $("tbody>tr>td.pk>input.funding_order_id").prop("checked", true);
        }else{
            $("tbody>tr>td.pk>input.funding_order_id").prop("checked", false);
        }
    });

    $(document).on("click","#statusBox>li",function(e){
        e.stopPropagation();
        $("#statusBox>li").removeClass("click");
        $(this).addClass("click");
        var clickIndex = $(this).index();
        var trLength = $("#orderList>table>tbody>tr").length;

        if(clickIndex == 0){
            $("#orderList>table>tbody>tr").removeClass("hide");
        }else if(clickIndex == 1){
            $("#orderList>table>tbody>tr").removeClass("hide");
            for(var i=0; i<trLength; i++){
                var deliveryStatus = $("tbody>tr:nth-of-type("+(i+1)+")>td:nth-of-type(8)").text();
                if(deliveryStatus != "-"){
                    $("tbody>tr:nth-of-type("+(i+1)+")").addClass("hide");
                }
            }
        }else if(clickIndex == 2){
            $("#orderList>table>tbody>tr").removeClass("hide");
            for(var i=0; i<trLength; i++){
                var deliveryStatus = $("tbody>tr:nth-of-type("+(i+1)+")>td:nth-of-type(8)").text();
                if(deliveryStatus != "배송 대기중"){
                    $("tbody>tr:nth-of-type("+(i+1)+")").addClass("hide");
                }
            }
        }else if(clickIndex == 3){
            $("#orderList>table>tbody>tr").removeClass("hide");
            for(var i=0; i<trLength; i++){
                var deliveryStatus = $("tbody>tr:nth-of-type("+(i+1)+")>td:nth-of-type(8)").text();
                if(deliveryStatus != "배송 중"){
                    $("tbody>tr:nth-of-type("+(i+1)+")").addClass("hide");
                }
            }
        }else if(clickIndex == 4){
            $("#orderList>table>tbody>tr").removeClass("hide");
            for(var i=0; i<trLength; i++){
                var deliveryStatus = $("tbody>tr:nth-of-type("+(i+1)+")>td:nth-of-type(8)").text();
                if(deliveryStatus != "배송 완료"){
                    $("tbody>tr:nth-of-type("+(i+1)+")").addClass("hide");
                }
            }
        }else if(clickIndex == 5){
            $("#orderList>table>tbody>tr").removeClass("hide");
            for(var i=0; i<trLength; i++){
                var deliveryStatus = $("tbody>tr:nth-of-type("+(i+1)+")>td:nth-of-type(8)").text();
                if(deliveryStatus != "수령 완료"){
                    $("tbody>tr:nth-of-type("+(i+1)+")").addClass("hide");
                }
            }
        }else if(clickIndex == 6){
            $("#orderList>table>tbody>tr").removeClass("hide");
            for(var i=0; i<trLength; i++){
                var deliveryStatus = $("tbody>tr:nth-of-type("+(i+1)+")>td:nth-of-type(8)").text();
                if(deliveryStatus != "구매 확정"){
                    $("tbody>tr:nth-of-type("+(i+1)+")").addClass("hide");
                }
            }
        }

    });

}

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

    $("input#fundingRegisterSubmitBtn").addClass("hide");
    $("input#fundingRegisterUpdateBtn").removeClass("hide");

    $("#fixedSidebar").empty();
    $("<li><a href='./makerProjectRegisterPage?funding_id="+funding_id+"'>프로젝트 관리</a></li>").appendTo("#fixedSidebar");
    $("<li class='click'><a class='active' href='./makerOrderListPage?funding_id="+funding_id+"'>주문 · 배송 현황</a></li>").appendTo("#fixedSidebar");
    $("<li><a href='./makerDashBoardPage?funding_id="+funding_id+"'>대시보드</a></li>").appendTo("#fixedSidebar");
    $("<li><a href='./makerNoticeListPage?funding_id="+funding_id+"'>공지사항 관리</a></li>").appendTo("#fixedSidebar");
    $("<li><a href='./makerCommunityListPage?funding_id="+funding_id+"'>커뮤니티 관리</a></li>").appendTo("#fixedSidebar");

}

function updateDeliveryStatus(funding_order_id,delivery_status_id,funding_id){
    $.ajax({
        url: "./AJAXupdateDeliveryStatus?funding_order_id="+funding_order_id,
        data: {delivery_status_id:delivery_status_id},
        success: function(res){
            if(res != 0){
                alert("배송상태 업데이트 완료!");
                getFundingOrderList(funding_id);
            }
        }
    });
}

function updateDelivering(funding_order_id,delivery_status_id,invoice_no,funding_id){
    $.ajax({
        url: "./AJAXupdateDelivering?funding_order_id="+funding_order_id,
        method: "PATCH",
        // dataType : 'json',
        contentType: "application/json",
        data: JSON.stringify({delivery_status_id:delivery_status_id,invoice_no:invoice_no}),
        success: function(res){
            if(res != 0){
                alert("상품 배송중!");
                getFundingOrderList(funding_id);
            }
        }
    });
}

// 현재 날짜와 시간을 기반으로 랜덤 값을 생성하는 함수
function generateRandomValue() {
var currentDate = new Date();
var randomValue = currentDate.getFullYear().toString() +
                    (currentDate.getMonth() + 1).toString().padStart(2, '0') +
                    currentDate.getDate().toString().padStart(2, '0') +
                    Math.floor(Math.random() * 10000).toString().padStart(4, '0');
    return randomValue;
}


function insertDelivery(funding_order_id,delivery_company_id,delivery_status_id,funding_id){
    $.ajax({
        url: "./AJAXinsertDelivery",
        method: "POST",
        data: {funding_order_id:funding_order_id,delivery_company_id:delivery_company_id, delivery_status_id:delivery_status_id},
        success: function(res){
            if(res!=0){
                alert("주문 발주 성공! 배송상태 배송 대기 중으로 변경");
                getFundingOrderList(funding_id);
            }
        }
    });
}

function getDeliveryCompanyList(){
    $.ajax({
        url: "./AJAXgetDeliveryCompanyList",
        method: "GET",
        success: function(res){
            if(res != null){
                $.each(res,function(index,item){
                    var delivery_company_id;
                    var selectDelivery = $("select#delivery_company_id");
                    $.each(item,function(key,value){
                        if(key == "delivery_company_id"){
                            delivery_company_id = value;
                        }
                        if(key == "name"){
                            $("<option value='"+delivery_company_id+"'>"+value+"</option>").appendTo(selectDelivery);
                        }
                    });
                });

            }
        }
    });
}


function getFundingOrderList(funding_id){
    $("tbody").empty();

    $.ajax({
        url: "./AJAXgetFundingOrderList",
        method: "GET",
        data: {funding_id,funding_id},
        success: function(res){
            if(res != null){
                
                $.each(res,function(index,item){
                    var tbody = $("tbody");
                    var tr = $("<tr></tr>");
                    var funding_order_id;
                    var funding_order_status_id;
                    $.each(item,function(key,value){
                        
                        if(key == "funding_order_id"){
                            funding_order_id = value;
                            $("<td class='pk'><input type='checkbox' name='funding_order_id' class='funding_order_id' value='"+value+"'></td>").appendTo(tr);
                        }
                        if(key == "created_at"){                            
                            $("<td>"+value+"</td>").appendTo(tr);
                            $("<td><a href=''>"+funding_order_id+"</a></td>").appendTo(tr);

                        }
                        if(key == "userDto"){
                            $.each(value,function(key,value){
                                if(key == "name"){
                                    $("<td>"+value+"</td>").appendTo(tr);
                                }
                            })
                        }
                        if(key == "fundingDto"){
                            $.each(value,function(key,value){
                                if(key == "title"){
                                    $("<td><a href=''><img src='' alt=''>"+value+"</a></td>").appendTo(tr);
                                }
                            })
                        }

                        if(key == "total_price"){
                            var total_price = addCommas(value);
                            $("<td>KRW "+total_price+"</td>").appendTo(tr);
                        }

                        if(key == "funding_order_status_id"){
                            funding_order_status_id = value;                            
                        }

                        if(key == "rewardList"){
                            var delivery_recipient_id;
                            $.each(value,function(index,item){
                                $.each(item,function(key,value){
                                    if(key == "delivery_recipient_id"){
                                        delivery_recipient_id = value;
                                        getFundingOrderStatus(funding_order_status_id,function(res){
                                            $.each(res,function(key,value){
                                                if(key == "name"){
                                                    $("<td>"+value+"</td>").appendTo(tr);
                                                    getDeliveryExist(delivery_recipient_id,function(res){
                                                        if(res == 0){
                                                            $("<td>-</td>").appendTo(tr);
                                                            $("<td><input type='button' value='주문 발주' class='deliveryBtn'></td>").appendTo(tr);
                                                        }else{
                                                            getDeliveryStatus(delivery_recipient_id,function(res){
                                                                $("<td>"+res+"</td>").appendTo(tr);

                                                                if(res == "배송 대기중"){
                                                                    $("<td><input type='button' value='배송 시작' class='deliveryBtn'></td>").appendTo(tr);
                                                                }else if(res == "배송 중"){
                                                                    $("<td><input type='button' value='배송 완료' class='deliveryBtn'></td>").appendTo(tr);
                                                                }else if(res == "배송 완료"){
                                                                    $("<td><input type='button' value='수령 완료' class='deliveryBtn'></td>").appendTo(tr);
                                                                }else if(res == "수령 완료"){
                                                                    $("<td><input type='button' value='구매 확정' class='deliveryBtn'></td>").appendTo(tr);
                                                                }
                                                                // 구매확정 버튼은 넣을지 말지 미정
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                        });
                                        
                                    }
                                });
                            });

                        }
                        $(tbody).append(tr);
                        
                    });
                });
                getDeliveryStatusTotal();
            }
        }
    });
}


function getDeliveryStatus(delivery_recipient_id,callback){
    $.ajax({
        url: "./AJAXgetDeliveryStatus",
        method: "GET",
        data:{delivery_recipient_id:delivery_recipient_id},
        success: function(res){
            if(res != null){
                $.each(res, function(key,value){
                    if(key == "name"){
                        callback(value);
                    }

                });
            }
        }
    });
}

function getDeliveryStatusTotal(){
    var orderCount = $("#orderList>table>tbody>tr").length;

    var delivery1 = 0; //상품준비중 -> 0
    var delivery2 = 0; //배송대기중 -> 1
    var delivery3 = 0; //배송중 -> 2
    var delivery4 = 0; //배송완료 -> 3
    var delivery5 = 0; //구매확정 -> 4
    var delivery6 = 0; //전체

if(orderCount != 0){

    var orderIdList = [];
    for(var i = 0; i<orderCount; i++){
        var order_id = $("#orderList>table>tbody>tr:nth-child("+(i+1)+")>td.pk>input").val();
        orderIdList.push(order_id);
    }


        $.ajax({
            url: "./AJAXgetDeliveryStatusTotal",
            method: "GET",
            // contentType: "application/json",
            dataType : 'json',
            data: {orderIdList:orderIdList},
            success: function(res){
                if(res != null){
                   var deliveryStatusIdList = res;
                   for(var i = 0; i<deliveryStatusIdList.length; i++){
                        if(deliveryStatusIdList[i] == 5){
                            delivery6 += 1;
                        }else if(deliveryStatusIdList[i] == 1){
                            delivery2 += 1;
                        }else if(deliveryStatusIdList[i] == 2){
                            delivery3 += 1;
                        }else if(deliveryStatusIdList[i] == 3){
                            delivery4 += 1;
                        }else if(deliveryStatusIdList[i] == 4){
                            delivery5 += 1;
                        }else{
                            delivery1 += 1;
                        }
                   }
    
                   var deliveryAll = delivery1+delivery2+delivery3+delivery4+delivery5+delivery6; // 전체
    
                   $("#statusBox>li:first-child>span").text(deliveryAll);
                   $("#statusBox>li:nth-child(2)>span").text(delivery1);
                   $("#statusBox>li:nth-child(3)>span").text(delivery2);
                   $("#statusBox>li:nth-child(4)>span").text(delivery3);
                   $("#statusBox>li:nth-child(5)>span").text(delivery4);
                   $("#statusBox>li:nth-child(6)>span").text(delivery5);
                   $("#statusBox>li:nth-child(7)>span:first-of-type").text(delivery6);
                }
            }
    
        });

    }else{
        var deliveryAll = delivery1+delivery2+delivery3+delivery4+delivery5+delivery6; // 전체
    
        $("#statusBox>li:first-child>span").text(deliveryAll);
        $("#statusBox>li:nth-child(2)>span").text(delivery1);
        $("#statusBox>li:nth-child(3)>span").text(delivery2);
        $("#statusBox>li:nth-child(4)>span").text(delivery3);
        $("#statusBox>li:nth-child(5)>span").text(delivery4);
        $("#statusBox>li:nth-child(6)>span").text(delivery5);
        $("#statusBox>li:nth-child(7)>span:first-of-type").text(delivery6);
    }


}

function addCommas(num){
    var str = num.toString();
    if(str.length >= 4){
        str = str.replace(/(\d)(?=(\d{3})+$)/g, '$1,');
    }

    return str;
};

function getFundingOrderStatus(funding_order_status_id,callback){
    $.ajax({
        url: "./AJAXgetFundingOrderStatus",
        method: "GET",
        data: {funding_order_status_id:funding_order_status_id},
        success: function(res){
            if(res != null){
                callback(res);
            }
        }
    });
}


function getDeliveryExist(delivery_recipient_id,callback){
    $.ajax({
        url: "./AJAXgetDeliveryExist",
        method: "GET",
        data: {delivery_recipient_id:delivery_recipient_id},
        success: function(res){
            callback(res);            
        }
    });
}










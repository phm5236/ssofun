
$(document).ready(function(){
    setUserSession();
    var user_id = getUserSession();
    var user_creator_id = getUserCreatorIdSession();

    var urlParams = new URLSearchParams(window.location.search);
    var funding_id = urlParams.get("funding_id");

    chartJs(funding_id);
    setEventListener(user_id);
    getTotalSupportPrice(funding_id);
    getFundingTitle(funding_id);
    getFundingStartFromAndCloseAt(funding_id);
    checkFundingId(funding_id);

});


function setEventListener(user_id){

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
    $("<li><a href='./makerOrderListPage?funding_id="+funding_id+"'>주문 · 배송 현황</a></li>").appendTo("#fixedSidebar");
    $("<li class='click'><a class='active' href='./makerDashBoardPage?funding_id="+funding_id+"'>대시보드</a></li>").appendTo("#fixedSidebar");
    $("<li><a href='./makerNoticeListPage?funding_id="+funding_id+"'>공지사항 관리</a></li>").appendTo("#fixedSidebar");
    $("<li><a href='./makerCommunityListPage?funding_id="+funding_id+"'>커뮤니티 관리</a></li>").appendTo("#fixedSidebar");

}

function getFundingTitle(funding_id){
    $.ajax({
        url: "./AJAXgetFundingTitle",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                $("#dashTopBox>h5").text(res);
            }
        }
    });
}

function getFundingStartFromAndCloseAt(funding_id){
    $.ajax({
        url: "./AJAXgetFundingStartFromAndCloseAt",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                $.each(res,function(key,value){
                    if(key == "start_from"){
                        $("#fundingDate>li:first-child").text("시작일 : "+formatDate(value));
                    }
                    if(key == "close_at"){
                        $("#fundingDate>li:last-child").text("종료일 : "+formatDate(value));
                    }
                });
            }
        }
    });
}



function formatDate(inputDate) {
    // 입력된 날짜 형식이 "yyyy.MM.dd"여야 합니다.
    var regex = /^(\d{4})\.(\d{2})\.(\d{2})$/;
    
    // 정규식을 사용하여 날짜를 치환합니다.
    var formattedDate = inputDate.replace(regex, function(match, year, month, day) {
        return year + "년 " + month + "월 " + day + "일";
    });

    return formattedDate;
}




// 차트 영역 --------------------------------------------------------------------------

function chartJs(funding_id){

// 성별별 비율
var genderArea = document.getElementById('genderSection').getContext('2d');
var genderChart = new Chart(genderArea, {
    type: "doughnut",
    data:{
        labels: ["여자","남자","기타"],// 여기에 ajax값 넣어야함
        datasets: [{
            label: "성별별 비율",
            data: [60,30,10], // 여기에 ajax값 넣어야함
            backgroundColor: ["#FF6462","#65a6db","#ffe58f"],
            borderWidth: 0,
            scaleBeginAtZero: true,
            hoverOffser: 4
        }]
    },
    options: {
        title: {
            display: true,
            text: '성별별 비율'
            },
        plugins: {
            legend: {
                display: true,
                position: "bottom",
                labels: {
                boxWidth: 8,
                padding: 10,
                usePointStyle: true,
                pointStyle: "rect",
                font: {
                    size: 14
                }
                }}},
        // percentageInnerCutout: 90,
        maintainAspectRatio :false
    }
});

// 연령별 비율
var ageArea = document.getElementById('ageSection').getContext('2d');
var ageChart = new Chart(ageArea, {
    type: "bar",
    data:{
        labels: ["10대","20대","30대","40대","기타"],// 여기에 ajax값 넣어야함
        datasets: [{
            label: "연령별 비율(%)",
            data: [10,35,30,10,0], // 여기에 ajax값 넣어야함
            backgroundColor: "#FF6462",
            borderColor: "#FF6462",
            borderWidth: 0.5
        }]
    },
    options: {
        // responsive: false,
        plugins: {legend:{display:false}},
        maintainAspectRatio :false,
        scales: {
            y:{
                beginAtZero: true
            }
        }
    }
});

// 누적 후원액 차트
var totalArea = document.getElementById('totalSection').getContext('2d');
var totalChart = new Chart(totalArea, {
    type: "line",
    data:{
        labels: ["23-07-16","23-07-17","","23-07-19",""],// 여기에 ajax값 넣어야함
        datasets: [{
            label: "누적 후원액",
            data: [0,35,40,80,100], // 여기에 ajax값 넣어야함
            backgroundColor: 'rgba(255, 100, 98, 0.1)', // 투명도 조절을 위해 RGBA 색상 값으로 변경
            borderColor: "#FF6462",
            fill: true,
            lineTension: 0
        }]
    },
    options: {
        // responsive: false,
        plugins: {legend:{display:false}},
        maintainAspectRatio :false,
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'x축'
                }
            }],
            y:{
                // beginAtZero: true
                min: 0,
                max: 100000,
                ticks:{
                    stepSize: 10000
                }
            },
            yAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'y축'
                }
            }]
        }
    }
});

// 일일 후원액 차트
var dayArea = document.getElementById('daySection').getContext('2d');
var dayChart = new Chart(dayArea, {
    type: "bar",
    data:{
        labels: ["1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"], // 여기에 ajax값 넣어야함
        datasets: [{
            label: "일별 후원액",
            data: [10,35,30,15,10,20,30,80,65,40,32,84,65,42,1,25,7,54], // 여기에 ajax값 넣어야함
            backgroundColor: "#FF6462",
            borderColor: "#FF6462",
            borderWidth: 0.5
        }]
    },
    options: {
        // responsive: false,
        plugins: {legend:{display:false}},
        maintainAspectRatio :false,
        scales: {
            y:{
                min: 0,
                max: 100000,
                ticks:{
                    stepSize: 10000
                }
            }
        }
    }
});

getAgeChartData(funding_id,function(res){
    ageChart.data.datasets[0].data = res;
    ageChart.update();
});

getGenderChartData(funding_id,function(res){
    genderChart.data.datasets[0].data = res;
    genderChart.update();
});

getTotalChartData(funding_id,function(res){
    var labelsArrays = [];
    var dataArrays = [];

    $.each(res,function(index,item){
        $.each(item,function(key,value){
            if(key == "created_at"){
                labelsArrays.push(value);
            }
            if(key == "total_price"){
                dataArrays.push(value);
            }
        });
    });

    totalChart.data.labels = labelsArrays;
    totalChart.data.datasets[0].data = dataArrays;
    totalChart.update();
});


getDayChartData(funding_id,function(res){
    var labelsArrays = [];
    var dataArrays = [];

    $.each(res,function(index,item){
        $.each(item,function(key,value){

            if(key == "created_at"){
                labelsArrays.push(value);
            }
            if(key == "total_price"){
                dataArrays.push(value);
            }
        });
    });

    dayChart.data.labels = labelsArrays;
    dayChart.data.datasets[0].data = dataArrays;
    dayChart.update();
    
});



}

function getAgeChartData(funding_id,callback){
    $.ajax({
        url: "./AJAXgetAgeChartData",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res!=null){
                callback(res);
            }
        }
    });
}

function getGenderChartData(funding_id,callback){
    $.ajax({
        url: "./AJAXgetGenderChartData",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                callback(res);
            }
        }
    });
}


function getDayChartData(funding_id,callback){
    return $.ajax({
        url: "./AJAXgetDayChartData",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                callback(res);
            }
        }
    });
}

function getTotalChartData(funding_id,callback){
    return $.ajax({
        url: "./AJAXgetTotalChartData",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                callback(res);
            }
        }
    });
}

function getTotalSupportPrice(funding_id){
    $.ajax({
        url: "./AJAXgetTotalSupportPrice",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res != null){
                var totalSupportPrice = addCommas(res);
                $("#totalBox>ul>li.paymentTotal>span").html(totalSupportPrice+"원");
                getTargetPrice(funding_id,res);
                getSupportCount(funding_id);
            }else{
                $("#totalBox>ul>li.paymentTotal>span").html(0+"원");
                $("#totalBox>ul>li.archiveTotal>span").html(0+"%");
                $("#totalBox>ul>li.supportTotal>span").html(0+"명");
            }
            getFundingDateDiff(funding_id);

        }
    });
}


function getTargetPrice(funding_id,supportPrice){
    $.ajax({
        url: "./AJAXgetTargetPrice",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            var achivementPrice = Math.floor((supportPrice/res)*100); 
            $("#totalBox>ul>li.archiveTotal>span").html(achivementPrice+"%");
        }
    });
}

function getSupportCount(funding_id){
    $.ajax({
        url: "./AJAXgetSupportCount",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            $("#totalBox>ul>li.supportTotal>span").html(res+"명");
        }
    });
}

function getFundingDateDiff(funding_id){
    $.ajax({
        url: "./AJAXgetFundingDateDiff",
        method: "GET",
        data: {funding_id:funding_id},
        success: function(res){
            if(res <= 0){
                $("#totalBox>ul>li.remainingDate>span").html("펀딩 종료");
            }else{
                $("#totalBox>ul>li.remainingDate>span").html(res+"일");
            }
        }
    });
}



function addCommas(num){
    var str = num.toString();
    if(str.length >= 4){
        str = str.replace(/(\d)(?=(\d{3})+$)/g, '$1,');
    }

    return str;
}


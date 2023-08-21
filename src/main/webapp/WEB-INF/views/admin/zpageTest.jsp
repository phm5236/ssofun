<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   ul {
    text-align: center;
    display: inline-block;
    border: 1px solid #ccc;
    border-right: 0;
   padding-left :0;
}
ul li {
    text-align: center;
    float: left;
   list-style:none;

}

ul li a {
    display: block;
    font-size: 14px;
   color: black;
    padding: 9px 12px;
    border-right: solid 1px #ccc;
    box-sizing: border-box;
   text-decoration-line:none;
}

ul li.on {
    background: #eda712;
}

ul li.on a {
    color: #fff;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
<h1>게시판</h1>
<select id="dataPerPage">
      <option value="5">5개씩보기</option>
        <option value="10">10개씩보기</option>
        <option value="15">15개씩보기</option>
        <option value="20">20개씩보기</option>
</select>
<span id="displayCount"></span>
<table border ="1" id="dataTableBody">
         <tr> 
               <th>글번호</th> 
                 <th>제목</th>
                 <th>작성자</th>
                 <th>작성일</th>   
           </tr>
</table>
   <ul id="pagingul">
   </ul><br>
<a href="../main/mainPage">메인페이지</a>
<c:if test="${!empty sessionUser }">
<a href="./writeContentPage">글쓰기</a>
</c:if>

<script>

let totalData; //총 데이터 수
let dataPerPage; //한 페이지에 나타낼 글 수
let pageCount = 5; //페이징에 나타낼 페이지 수
let globalCurrentPage=1; //현재 페이지
let dataList; //표시하려하는 데이터 리스트

$(document).ready(function () {
          //dataPerPage 선택값 가져오기
          dataPerPage = $("#dataPerPage").val();
          
          $.ajax({ // ajax로 데이터 가져오기
            method: "GET",
            url: "boardListProcess",
            success: function (list){
                //totalData(총 데이터 수) 구하기
                 totalData = list.length;
                 //데이터 대입
                  dataList=list;
         
          
          //글 목록 표시 호출 (테이블 생성)
          displayData(1, dataPerPage);
          
          //페이징 표시 호출
          paging(totalData, dataPerPage, pageCount, 1);
      }
    });
});

//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {

  let chartHtml = "";

//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
  currentPage = Number(currentPage);
  dataPerPage = Number(dataPerPage);
  
  let maxpnum = (currentPage-1)*dataPerPage+dataPerPage;
  if(maxpnum > totalData){
     maxpnum = totalData;
  }
  
  for (
    var i = (currentPage - 1) * dataPerPage;
    i < maxpnum;
    i++
  ) {
     chartHtml +="<tr>"    
            +"<td>"+dataList[i].board_id+"</td>"
            +"<td><a href='./readContentPage?board_id="+dataList[i].board_id+"'>"+dataList[i].title+"</a></td>"
            +"<td>"+dataList[i].nickname+"</td>"
            +"<td>"+dataList[i].reg_date+"</td></tr>";
  } //dataList는 임의의 데이터임.. 각 소스에 맞게 변수를 넣어주면 됨...
  $("#dataTableBody").html(chartHtml);
}

function paging(totalData, dataPerPage, pageCount, currentPage) {
     console.log("currentPage : " + currentPage);

     totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
     
     if(totalPage<pageCount){
       pageCount=totalPage;
     }
     
     let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
     let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
     
     if (last > totalPage) {
       last = totalPage;
     }

     //let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
     let first = parseInt((currentPage - 1) / pageCount) * pageCount + 1;
     let next = last + 1;
     let prev = first - 1;

     let pageHtml = "";

     if (prev > 0 || currentPage >= 1) {
        console.log("prev:"+prev);
       pageHtml += "<li><a href='#' id='prev'> &lt; </a></li>";
     }

    //페이징 번호 표시 
     for (var i = first; i <= last; i++) {
        console.log("prev:"+prev);
       if (currentPage == i) {
         pageHtml +=
           "<li class='on'><a href='#' id='" + i + "'>" + i + "</a></li>";
       } else {
         pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
       }
     }

     if (last < totalPage) {
       pageHtml += "<li><a href='#' id='next'> &gt; </a></li>";
     }

     $("#pagingul").html(pageHtml);
     let displayCount = "";
     displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
     $("#displayCount").text(displayCount);


     //페이징 번호 클릭 이벤트 
     $("#pagingul li a").click(function () {
       let $id = $(this).attr("id");
       selectedPage = $(this).text();

       /* if ($id == "next") selectedPage = next;
       if ($id == "prev") selectedPage = prev;
       if (selectedPage < 1){
          selectedPage =1;
       } */ 
       
       if ($id == "next") {
          selectedPage = currentPage + 1; // 현재 페이지에서 1 증가
        } else if ($id == "prev") {
          selectedPage = currentPage - 1; // 현재 페이지에서 1 감소
        }
       
       if (selectedPage < 1){
            selectedPage =1;
        }
       
       //전역변수에 선택한 페이지 번호를 담는다...
       globalCurrentPage = selectedPage;
       //페이징 표시 재호출
       paging(totalData, dataPerPage, pageCount, selectedPage);
       //글 목록 표시 재호출
       displayData(selectedPage, dataPerPage);
     });
   }
   

$("#dataPerPage").change(function () {
    dataPerPage = $("#dataPerPage").val();
    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    displayData(globalCurrentPage, dataPerPage);
 });


</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 리스트</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="../../resources/css/funding_list.css">
<script src="../../resources/js/funding_list.js"></script>
</head>
<body>
	<input type="hidden" id="funding_category_id" value="${funding_category_id}">
	
    <div class="container text-center">

        <!--헤더 영역-->
    	<jsp:include page="../../include/fundingHeader.jsp"/>

        <!--배너 영역-->
        <div class="row section" id="main-banner">
            <img src="../../resources/img/kimdaseul/ssofun_list_banner.png" alt="">                
        </div>

        <!--카테고리 영역-->
        <div class="section" id="category">
        </div>
        
        <!--활성화된 카테고리 리스트 영역-->
        <div class="row section" id="category-list">
            <div class="col p-0">
                <h5 class="fw-bold text-start p-0 m-0 mb-2 row" id="category-name">카테고리명</h5>

                <div class="row m-0">
                    <select name="sort" id="sort" class="col-1 me-2">
                        <option value="new">최신순</option>
                        <option value="hit">인기순</option>
                        <option value="recommend">추천순</option>
                        <option value="end">마감순</option>
                    </select>
                    <select name="achieve" id="achieve" class="col-2">
                        <option value="" selected disabled hidden>달성률</option>
                        <option value="75">75&#37; 이하</option>
                        <option value="76">75&#37; &#126; 100&#37;</option>
                        <option value="101">100&#37; 이상</option>
                    </select>
                </div>

                <div class="row d-flex m-0" id="list">
                   
                </div>
            </div>
        </div>

        <!--페이징 리스트 영역-->
        <div class="row section" id="paging">            
            <ul class="d-flex justify-content-center">

            </ul>            
        </div>
    </div>

	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp"/>
	
</body>
</html>
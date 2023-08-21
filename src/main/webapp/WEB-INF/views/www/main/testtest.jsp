<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page import="java.util.List"%>
<%
  // Jackson ObjectMapper를 사용하여 Java 객체를 JSON 형태로 변환합니다.
  ObjectMapper objectMapper = new ObjectMapper();
  String jsonPctList = objectMapper.writeValueAsString(request.getAttribute("pctlist"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
<link href="../../resources/css/main.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/productPage.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/productOrder.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/cartPage.css" rel="stylesheet"
	type="text/css">
<style>
.test {
	height: 30px;
	margin: 5px 0px;
}
.category-box-1{
	width: 650px;
}
.hide{display: none;}
</style>
</head>
<body>
	<jsp:include page="../../include/fundingHeader.jsp" />

	<div class="category-head">
		<div class="search-header-content">
			<div id="categoryMenu" class="category-box-1">
				<div class="test">
		<label for="categorySelect"></label> <select
			id="categorySelect" onchange="showSubCategories()">
			<option value="0">카테고리</option>
			<c:forEach items="${pctlist}" var="category">
				<c:if test="${category.this_parent_id eq 0}">
					<option value="${category.product_category_type_id}">${category.name}</option>
				</c:if>
			</c:forEach>
		</select> <label for="subCategorySelect"></label> <select class="hide"
			id="subCategorySelect" onchange="showSubSubCategories()" disabled>
			<option value="0">선택하세요</option>

		</select> <label for="subSubCategorySelect"></label> <select class="hide"
			id="subSubCategorySelect" disabled>
			<option value="0">선택하세요</option>
		</select>
	</div>
			</div>
		</div>
	</div>

	

	<div class="banner-a">
		<!--         <img class="banner-img" src="../../resources/img/banner.jpg"> -->
	</div>

	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp" />


	<script>

 
  function showSubCategories() {
      var categorySelect = document.getElementById("categorySelect");
      var subCategorySelect = document.getElementById("subCategorySelect");
      subCategorySelect.innerHTML = '<option value="0">선택하세요</option>'; // 초기화
      console.log(categorySelect);
      // 선택한 대분류의 ID를 가져옴
      var selectedCategoryId = categorySelect.value;
      console.log(selectedCategoryId);
      if (selectedCategoryId !== "0") {
       
          subCategorySelect.disabled = false; // 중분류를 보여주기 위해 드롭 메뉴 활성화
          subCategorySelect.classList.remove('hide');
          var subCategories = <%= jsonPctList %>;
          console.log(subCategories)

          // 중분류 드롭다운 메뉴에 옵션 추가
          for (var i = 0; i < subCategories.length; i++) {
              if (subCategories[i].this_parent_id == selectedCategoryId) {
                  var option = document.createElement("option");
                  option.value = subCategories[i].product_category_type_id;
                  option.text = subCategories[i].name;
                  subCategorySelect.appendChild(option);
              }
          }
          
       // 소분류 드롭다운 메뉴 초기화
          subSubCategorySelect.innerHTML = '<option value="0">선택하세요</option>';
          subSubCategorySelect.disabled = true;
        
      } else {
          subCategorySelect.disabled = true; // 대분류가 선택되지 않았을 때 중분류 드롭 메뉴 비활성화

          subSubCategorySelect.innerHTML = '<option value="0">선택하세요</option>';
          subSubCategorySelect.disabled = true; // 중분류가 선택되지 않았을 때 소분류 드롭다운 메뉴 비활성화
      }
  }
  
  function showSubSubCategories() {
      var subSubCategorySelect = document.getElementById("subSubCategorySelect");
      var selectedSubCategoryId = subCategorySelect.value;
      subSubCategorySelect.innerHTML = '<option value="0">선택하세요</option>'; // 소분류 드롭다운 메뉴 초기화

      if (selectedSubCategoryId !== "0") {
          subSubCategorySelect.disabled = false; // 소분류를 보여주기 위해 드롭다운 메뉴 활성화
          subSubCategorySelect.classList.remove('hide');
          var subCategories = <%= jsonPctList %>;
          
          // 서버에서 가져온 JSON 형태의 소분류 목록을 사용하여 소분류 옵션 추가
          for (var i = 0; i < subCategories.length; i++) {
              if (subCategories[i].this_parent_id == selectedSubCategoryId) {
                  var option = document.createElement("option");
                  option.value = subCategories[i].product_category_type_id;
                  option.text = subCategories[i].name;
                  subSubCategorySelect.appendChild(option);
              }
          }
      } else {
          subSubCategorySelect.disabled = true; // 중분류가 선택되지 않았을 때 소분류 드롭다운 메뉴 비활성화
      }
  }
  

    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>

package com.ssofun.admin.store.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssofun.admin.store.service.StoreAdminService;
import com.ssofun.dto.*;
import com.ssofun.www.integration.service.IntegratedAuthenticationService;

@Controller
@RequestMapping("/admin/*")
public class StoreAdminController {
   
	   @Autowired
	   private StoreAdminService storeAdminService;
	   
	   // 관리자 메인페이지 
	   @RequestMapping("adminMainPage")
	   public String adminMainPage(HttpSession session,Model model, ProductDto productDto) {
		  	
		  AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		  session.setAttribute("shopAdmin", shopAdmin);
		     		   
	      return "admin/adminMainPage";
	   }
	   
	   // 대시보드
	   // 총 매출
	   @ResponseBody
	   @RequestMapping("totalPriceProcess")
	   public int selectTotalPrice(HttpSession session, ProductDto productDto) {
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   int TotalPrice = storeAdminService.selectTotalPrice(productDto, shopAdmin.getAdmin_id()); // 총 매출
		   return TotalPrice;
	   }
	   // 총 판매수
	   @ResponseBody
	   @RequestMapping("totalProductCountProcess")
	   public int selectTotalProductCount(HttpSession session, ProductDto productDto) {
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   int TotalProductCount = storeAdminService.selectTotalProductCount(productDto, shopAdmin.getAdmin_id()); // 모든상품수
		   return TotalProductCount;
	   }
	   // 총 리뷰수
	   @ResponseBody
	   @RequestMapping("totalProductReviewCountProcess")
	   public int selectTotalProductReviewCount(HttpSession session, ProductDto productDto) {
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   int TotalProductReviewCount = storeAdminService.selectTotalProductReviewCount(productDto, shopAdmin.getAdmin_id()); // 총 리뷰수
		   return TotalProductReviewCount;
	   }
	   // 총 평점
	   @ResponseBody
	   @RequestMapping("productReviewAvgScoreProcess")
	   public double selectProductReviewAvgScore(HttpSession session, ProductDto productDto) {
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   double productReviewAvgScore = storeAdminService.selectProductReviewAvgScore(productDto, shopAdmin.getAdmin_id()); // 총 평점
		   return productReviewAvgScore;
	   }
	   
	   // 대시보드
	   // 상품리스트
	   @ResponseBody
	   @RequestMapping("dashboardProductListProcess")
	   public List<ProductDto> dashboardProductList(HttpSession session, ProductDto productDto){
		   
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");

		   List<ProductDto> dashboardProductList = storeAdminService.dashboardProductList(productDto, shopAdmin.getAdmin_id());
		   
		   return dashboardProductList;
	   }
	   // 대시보드
	   // 오더리스트
	   @ResponseBody
	   @RequestMapping("dashboardProductOrderListProcess")
	   public List<ProductDto> dashboardProductOrderList(HttpSession session, ProductDto productDto){
		   
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   
		   List<ProductDto> dashboardProductOrderList =  storeAdminService.dashboardProductOrderList(productDto, shopAdmin.getAdmin_id());
		   
		   return dashboardProductOrderList;
	   }
	   // 대시보드
	   // 상품(리뷰,평점)리스트
	   @ResponseBody
	   @RequestMapping("HyunMinProductReviewListProcess")
	   public List<HyunMinProductReviewListDto> dashboardproductReviewList(HttpSession session, HyunMinProductReviewListDto hyunMinProductReviewListDto){
		   
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   int id = shopAdmin.getAdmin_id();
		   hyunMinProductReviewListDto.setAdmin_id(id);
		   List<HyunMinProductReviewListDto> dashboardproductReviewList = storeAdminService.dashboardproductReviewList(hyunMinProductReviewListDto); //리뷰,평점
		   return dashboardproductReviewList;
	   }
	   
//	   --------------------------------      대 시 보 드 끝     --------------------------------------------------------------
	   
	   	// 로그아웃
		@RequestMapping("logoutProcess")
		public String logout(HttpSession session) {
			
			session.invalidate(); // session 저장공간 날리기
			
			return "admin/adminMainPage";
		}
	   
	   // 상품등록 페이지 
	   @RequestMapping("productInsertPage")
	   public String productInsertPage(ProductCategoryTypeDto productCategoryTypeDto, Model model) {
		   
		   List<ProductCategoryTypeDto> categoryTypeList = storeAdminService.categoryTypeList(productCategoryTypeDto);
		   
		   model.addAttribute("categoryTypeList", categoryTypeList);
	      
	      return "admin/productInsertPage";
	   }
	      
	   // 상품등록
	   @RequestMapping("productInsertProcess")
	   public String productThumbnaillInsertProcess(ProductDto productDto, ProductThumbnailDto params,ProductCategoryDto productCategoryDto,
			   ProductDetailImageDto params2,MultipartFile [] thumbnail_files, MultipartFile [] detailImage_files) {
	      int thumbnailFiles = thumbnail_files.length; // 등록된 이미지 파일의 총 개수
	      
	      List<ProductThumbnailDto> productThumbnailList = new ArrayList<>();
      
	      // 상품썸네일
	      if(thumbnailFiles > 0) { // 파일이 있을 때
	         
	         for(int i = 0; i < thumbnailFiles; i++) {
	            MultipartFile multipartFile = thumbnail_files[i];
	            
	            if(multipartFile.isEmpty()) {
	               continue;
	            }
	            
	            System.out.println("파일명 " + multipartFile.getOriginalFilename());
	            
	            String rootFolder = "C:/ssofunUploadFiles/";
	            
	            String saveFileName = multipartFile.getOriginalFilename(); // 파일명 저장
	                     
	            try {
	               multipartFile.transferTo(new File(rootFolder + saveFileName));
	            }catch(Exception e) {
	               e.printStackTrace();
	            }
	            
	            ProductThumbnailDto productThumbnailDto = new ProductThumbnailDto();
	            productThumbnailDto.setName(saveFileName);
	            productThumbnailDto.setOrder_list(i);
	            
	            productThumbnailList.add(productThumbnailDto);
	            
	            
	         }
	         
	      }
	      
	      int detailImageFiles = detailImage_files.length; // 등록된 이미지 파일의 총 개수
	      
	      List<ProductDetailImageDto> ProductDetailImageList = new ArrayList<>();
	      
	      // 상품상세이미지
	      if(detailImageFiles > 0) { // 파일이 있을 때
	         
	         for(int i = 0; i < detailImageFiles; i++) {
	            MultipartFile multipartFile = detailImage_files[i];
	            
	            if(multipartFile.isEmpty()) {
	               continue;
	            }
	            
	            System.out.println("파일명 " + multipartFile.getOriginalFilename());
	            
	            String rootFolder = "C:/ssofunDetailImageFiles/";
	            
	            String saveFileName = multipartFile.getOriginalFilename(); // 파일명 저장
	                     
	            try {
	               multipartFile.transferTo(new File(rootFolder + saveFileName));
	            }catch(Exception e) {
	               e.printStackTrace();
	            }
	            
	            ProductDetailImageDto productDetailImageDto = new ProductDetailImageDto();
	            productDetailImageDto.setName(saveFileName);
	            productDetailImageDto.setOrder_list(i);
	            
	            ProductDetailImageList.add(productDetailImageDto);
	            
	            
	         }
	         
	      }
	      
	      storeAdminService.productInsert(productDto);
	      storeAdminService.productcategoryInsert(productCategoryDto);
	      storeAdminService.productThumbnaillInsert(params,productThumbnailList);
	      storeAdminService.productDetailImageInsert(params2, ProductDetailImageList);
	      

	      
	      return "redirect:./adminMainPage";
	   }
	   
	   // 상품 리스트페이지
	   @RequestMapping("productListPage")
	   public String productListPage(@RequestParam(defaultValue = "1") int page, Model model, HttpSession session
			   , HyunMinProductJoinDto hyunMinProductJoinDto) {
		   		   
		   int itemsPerPage = 10; // 페이지당 아이템 개수

		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   session.setAttribute("shopAdmin", shopAdmin);
		   int id = shopAdmin.getAdmin_id();
		   hyunMinProductJoinDto.setAdmin_id(id);
		   List<HyunMinProductJoinDto> productList = storeAdminService.selectAll(hyunMinProductJoinDto); // 전체 상품목록 가져오기
		   
		    // 페이지 번호에 따라 상품 목록을 제한하여 새로운 리스트를 생성합니다.
		   List<HyunMinProductJoinDto> paginatedList = new ArrayList<>();
		   int startIdx = (page - 1) * itemsPerPage;
		   int endIdx = Math.min(startIdx + itemsPerPage, productList.size());
		   for (int i = startIdx; i < endIdx; i++) {
		        paginatedList.add(productList.get(i));
		    }

		   int pageCount = (int) Math.ceil((double) productList.size() / itemsPerPage); // 총 페이지 수 계산

		   model.addAttribute("list", paginatedList);
		   model.addAttribute("currentPage", page);
		   model.addAttribute("pageCount", pageCount);		   
		   	 
		   return "admin/productListPage";
	   }
	   
	   // 상품리스트
	   @ResponseBody
	   @RequestMapping("productListProcess")
	   public List<HyunMinProductJoinDto> productList(HyunMinProductJoinDto hyunMinProductJoinDto, HttpSession session){
		   
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   
		   int id = shopAdmin.getAdmin_id();
		   hyunMinProductJoinDto.setAdmin_id(id);		   
		   List<HyunMinProductJoinDto> productList = storeAdminService.selectAll(hyunMinProductJoinDto);
		   
		   return productList;
	   }
	   
	   // 상품카테고리타입페이지 
	   @RequestMapping("productCategoryTypeInsertPage")
	   public String productCategoryTypeInsertPage() {
	      return "admin/productCategoryTypeInsertPage";
	   }
	   
	   // 상품카테고리타입등록 
	   @RequestMapping("productCategoryTypeInsertProcess")
	   public String productCategoryTypeInsertProcess(ProductCategoryTypeDto productCategoryTypeDto) {
	      
	      storeAdminService.productcategorytypeInsert(productCategoryTypeDto);
	      
	      return "redirect:./adminMainPage";
	   }
	   
	   // 상품상세보기페이지
	   @RequestMapping("productDetailPage")
	   public String productDetailPage(int product_id, Model model,HttpSession session) {
	      
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   
		   HyunMinProductJoinDto productDetail = storeAdminService.productDetail(product_id);
		   List<ProductThumbnailDto> productThumbnailDetail = storeAdminService.productThumbnailDetail(product_id);
		   List<ProductDetailImageDto> productDetailImageList = storeAdminService.productDetailImageList(product_id);
		   
		   session.setAttribute("shopAdmin", shopAdmin);
		   model.addAttribute("productDetail", productDetail);
		   model.addAttribute("productThumbnailDetail", productThumbnailDetail);
		   model.addAttribute("productDetailImageList", productDetailImageList);
		   
	      return "admin/productDetailPage";
	   }
	   
	   // 상품카테고리 등록페이지
	   @RequestMapping("productCategoryInsertPage")
	   public String productcategoryInsertPage() {
	      return "admin/productCategoryInsertPage";
	   }
	   
	   // 상품수정페이지
	   @RequestMapping("productUpdatePage")
	   public String productUpdatePage(int product_id, Model model) {
		   
		   HyunMinProductJoinDto productDetail = storeAdminService.productDetail(product_id);
		   List<ProductThumbnailDto> productThumbnailDetail = storeAdminService.productThumbnailDetail(product_id);
		   
		   model.addAttribute("productDetail", productDetail);
		   model.addAttribute("productThumbnailDetail", productThumbnailDetail);
		   
		   return "admin/productUpdatePage";
	   }
	   
	   // 상품수정
	   @RequestMapping("productUpdateProcess")
	   public String productUpdateProcess(int product_id,ProductDto productDto, ProductThumbnailDto params,
			   ProductCategoryDto productCategoryDto,MultipartFile[] thumbnail_files) {


	       storeAdminService.productUpdate(productDto);
	       
	       return "redirect:./adminMainPage";
	   }
	   
	   // 상품삭제
	   @ResponseBody
	   @RequestMapping("productDeleteProcess")
	   public String productDeleteProcess(ProductDto productDto) {
		   
		   storeAdminService.productDelete(productDto);
		   System.out.println(productDto.getUsed_fg());
		   
		   return "1";
	   }
	   
	   // 주문페이지
	   @RequestMapping("orderItemInsertPage")
	   public String orderItemInsertPage() {
		   return "admin/orderItemInsertPage";
	   }
	   
	   // 상품주문
	   @RequestMapping("productOrderItemInsertProcess")
	   public String productOrderItemInsertProcess(ProductOrderItemDto productOrderItemDto) {
		   
		   storeAdminService.productOrderItemInsert(productOrderItemDto);
		   
		   return "redirect:./orderItemInsertPage";
	   }
	   
	   // 오더리스트페이지
	   @RequestMapping("orderItemListPage")
	   public String orderItemListPage(@RequestParam(defaultValue = "1") int page, Model model, HttpSession session
			   , ProductOrderItemDto productOrderItemDto) {
		   
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   session.setAttribute("shopAdmin", shopAdmin);

		   // 페이지당 아이템 개수
		   int itemsPerPage = 10; 
		   
		   // 전체 상품목록 가져오기
		   List<ProductOrderItemDto> orderItemList = storeAdminService.productOrderItemList(productOrderItemDto, shopAdmin.getAdmin_id());
   
		   int totalItems  = orderItemList.size();
		   
		   // 총 페이지 수 계산
		   int pageCount = (int) Math.ceil((double) totalItems / itemsPerPage);
		   
		   // 현재 페이지 번호에 따라 상품 목록을 제한하여 새로운 리스트를 생성합니다.
		   List<ProductOrderItemDto> paginatedList = new ArrayList<>();
		   int startIdx = (page - 1) * itemsPerPage;
		   int endIdx = Math.min(startIdx + itemsPerPage, orderItemList.size());
		   for (int i = startIdx; i < endIdx; i++) {
		       paginatedList.add(orderItemList.get(i));
		   }
		   
		   // JSP로 전달할 데이터를 Model에 추가합니다.
		   model.addAttribute("orderItemList", paginatedList);
		   model.addAttribute("currentPage", page);
		   model.addAttribute("pageCount", pageCount);

		    
	       return "admin/orderItemListPage";
	   }

	   
	   // 오더리스트
	   @ResponseBody
	   @RequestMapping("orderItemListProcess")
	   public List<ProductOrderItemDto> orderItemList(ProductOrderItemDto productOrderItemDto, HttpSession session){
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
	   	   	   
		   List<ProductOrderItemDto> orderItemList = storeAdminService.productOrderItemList(productOrderItemDto, shopAdmin.getAdmin_id());
		   
		   return orderItemList;
	   }
	   
	   // 관리자 판매상품 상세보기페이지
	   @RequestMapping("orderItemDetailPage")
	   public String orderItemDetailPage(Model model ,int product_order_item_id, 
			   DeliveryCompanyDto deliveryCompanyDto,@RequestParam(value = "delivery_id", defaultValue = "0") int delivery_id) {
		   
		   List<DeliveryCompanyDto> deliveryCompanyList = storeAdminService.deliveryCompanyList(deliveryCompanyDto);
		   
		   ProductOrderItemDto orderItemDetail = storeAdminService.orderItemDetail(product_order_item_id);
		   
		   ProductOrderItemDto deliveryDetail = storeAdminService.deliveryDetail(product_order_item_id);
		   
		   model.addAttribute("deliveryDetail", deliveryDetail);   
		   model.addAttribute("orderItemDetail", orderItemDetail);
		   model.addAttribute("deliveryCompanyList", deliveryCompanyList);
		   
		   
		   return "admin/orderItemDetailPage";
	   }
	   
	   // 오더카테고리리스트페이지
	   @RequestMapping("orderItemCategoryListPage")
	   public String orderItemCategoryListPage(Model model, ProductOrderItemDto productOrderItemDto, 
			   HttpSession session, ProductOrderStatusDto productOrderStatusDto) {
		   
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   	   
		   List<ProductOrderStatusDto> orderStatusList = storeAdminService.orderStatusList(productOrderStatusDto);
		   
		   session.setAttribute("shopAdmin", shopAdmin);		   
		   int id = shopAdmin.getAdmin_id();
		   productOrderItemDto.setAdmin_id(id);
		   
		   List<ProductOrderItemDto> orderItemCategoryList = storeAdminService.orderItemCategoryList(productOrderItemDto);
		   
		   model.addAttribute("orderItemCategoryList", orderItemCategoryList);
		   model.addAttribute("orderStatusList", orderStatusList);
		   
		   return "admin/orderItemCategoryListPage";
	   }
	   
	   // 관리자 진행상태처리
	   @RequestMapping("orderStatusProcess")
	   public String orderStatusProcess(Model model,int product_order_item_id,ProductOrderItemDto productOrderItemDto) {
		   
		   ProductOrderItemDto orderItemDetail = storeAdminService.orderItemDetail(product_order_item_id);
		   
		   if(orderItemDetail.getProduct_order_status_id() == 3) {
			   storeAdminService.adminCheckUpdate(productOrderItemDto);
			   return "redirect:./orderItemDetailPage?product_order_item_id=" + product_order_item_id;
		   }else {
			   return "redirect:./orderItemDetailPage?product_order_item_id=" + product_order_item_id;
		   }
	   }
	   
	   // 택배사등록
	   @RequestMapping("deliveryInsertProcess")
	   public String deliveryInsertProcess(DeliveryDto deliveryDto, int product_order_item_id, int delivery_recipient_id) {
		   
	       storeAdminService.deliveryInsert(deliveryDto);
	       int delivery_id = deliveryDto.getDelivery_id();
	       deliveryDto.setDelivery_id(delivery_id);
	       
	       ProductOrderItemDto productOrderItemDto = new ProductOrderItemDto();
	       productOrderItemDto.setProduct_order_item_id(product_order_item_id);
	       storeAdminService.deliveryingUpdate(productOrderItemDto);

	       return "redirect:./orderItemDetailPage?product_order_item_id=" + product_order_item_id;
	   }
	   
	   // 상품리뷰리스트페이지(리뷰개수,평점)
	   @RequestMapping("productReviewListPage")
	   public String productReviewListPage(HttpSession session) {
		   
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");		   
		   session.setAttribute("shopAdmin", shopAdmin);		   
		   
		   return "admin/productReviewListPage";
	   }
	   
	   // 상품리뷰리스트
	   @ResponseBody
	   @RequestMapping("productReviewListProcess")
	   public List<HyunMinProductReviewListDto> productReviewList(HyunMinProductReviewListDto hyunMinProductReviewListDto, HttpSession session){
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   
		   session.setAttribute("shopAdmin", shopAdmin);
		   
		   int id = shopAdmin.getAdmin_id();
		   hyunMinProductReviewListDto.setAdmin_id(id);
		   List<HyunMinProductReviewListDto> productReviewList = storeAdminService.productReviewList(hyunMinProductReviewListDto);
		   
		   return productReviewList;
	   }
	   
	   // 상품하나에 대한 리뷰리스트페이지
	   @RequestMapping("productDetailReviewListPage")
	   public String productDetailReviewListPage(Model model, int product_id) {
		   
		   List<HyunMinProductReviewListDto> productDetailReviewList = storeAdminService.productDetailReviewList(product_id);
		   
		   List<ProductReviewImageDto> productReviewImageList = storeAdminService.productReviewImageList(product_id);
		   
		   model.addAttribute("productDetailReviewList", productDetailReviewList);
		   model.addAttribute("productReviewImageList", productReviewImageList);
		   
		   return "admin/productDetailReviewListPage";
	   }
	   
	   // 문의리스트
	   @RequestMapping("qnaContentListPage")
	   public String adminQnaListPage(HyunMinQnaJoinDto hyunMinQnaJoinDto, Model model, HttpSession session) {
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");		   
		   session.setAttribute("shopAdmin", shopAdmin);
		   
		   List<HyunMinQnaJoinDto> qnaContentsList = storeAdminService.qnaContentsList(hyunMinQnaJoinDto, shopAdmin.getAdmin_id());
		   
		   if(shopAdmin != null) {
			   model.addAttribute("qnaContentsList", qnaContentsList);
		   }else {
			   return "redirect:./loginPage";
		   }
		      
		   return "admin/qnaContentListPage";
	   }
	   // 문의상세보기
	   @RequestMapping("qnaContentDetailPage")
	   public String qnaContentDetailPage(int qna_id, Model model, HttpSession session) {
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   session.setAttribute("shopAdmin", shopAdmin);
		   
		   HyunMinQnaJoinDto qnaContentDetail = storeAdminService.qnaContentDetail(qna_id);
		   
		   model.addAttribute("qnaContentDetail", qnaContentDetail);
		   
		   return "admin/qnaContentDetailPage";
	   }
	   // 답글등록하기
	   @RequestMapping("answerContentsInsertProcess")
	   public String answerContentsInsertProcess(HyunMinQnaJoinDto hyunMinQnaJoinDto, int qna_id) {
		   
		   storeAdminService.answerContentsInsert(hyunMinQnaJoinDto);
		   
		   return "redirect:./qnaContentDetailPage?qna_id=" + qna_id;
	   }
	   
	   // 통계그래프
	   @ResponseBody
	   @RequestMapping("getSalesYear")
	   public Map<String, Object> getSalesYear(int year, HttpSession session){
		   Map<String, Object> map = new HashMap<String, Object>();
		   AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		   
		   map.put("result", "success");
		   map.put("currentYearSalesData", storeAdminService.getSalesYear(year, shopAdmin.getAdmin_id()));
		   map.put("prevYearSalesData", storeAdminService.getSalesYear(year-1, shopAdmin.getAdmin_id()));
		   
		   
		   return map;
		   
	   }
	   
	   
	   
}
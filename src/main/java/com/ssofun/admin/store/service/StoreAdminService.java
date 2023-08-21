package com.ssofun.admin.store.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.admin.store.mapper.StoreAdminSqlMapper;
import com.ssofun.dto.DeliveryCompanyDto;
import com.ssofun.dto.DeliveryDto;
import com.ssofun.dto.HyunMinDeliveryJoinDto;
import com.ssofun.dto.HyunMinProductJoinDto;
import com.ssofun.dto.HyunMinProductReviewListDto;
import com.ssofun.dto.HyunMinQnaJoinDto;
import com.ssofun.dto.ProductCategoryDto;
import com.ssofun.dto.ProductCategoryTypeDto;
import com.ssofun.dto.ProductDetailImageDto;
import com.ssofun.dto.ProductDto;
import com.ssofun.dto.ProductOrderItemDto;
import com.ssofun.dto.ProductOrderStatusDto;
import com.ssofun.dto.ProductReviewImageDto;
import com.ssofun.dto.ProductThumbnailDto;

@Service
public class StoreAdminService {

	   @Autowired
	   private StoreAdminSqlMapper storeAdminSqlMapper;
	   
	   // 대시보드
	   // 총 매출
	   public int selectTotalPrice(ProductDto productDto, int adminId) {
		   int TotalPrice = storeAdminSqlMapper.selectTotalPrice(productDto, adminId);
		   return TotalPrice;
	   }
	   // 모든상품수
	   public int selectTotalProductCount(ProductDto productDto, int adminId) {
		   int TotalProductCount = storeAdminSqlMapper.selectTotalProductCount(productDto, adminId);
		   return TotalProductCount;
	   }
	   // 총 리뷰수
	   public int selectTotalProductReviewCount(ProductDto productDto, int adminId) {
		   int TotalProductReviewCount = storeAdminSqlMapper.selectTotalProductReviewCount(productDto, adminId);
		   return TotalProductReviewCount;
	   }
	   // 총 평점
	   public double selectProductReviewAvgScore(ProductDto productDto, int adminId) {
		   double productReviewAvgScore = storeAdminSqlMapper.selectProductReviewAvgScore(productDto, adminId);
		   return productReviewAvgScore;
	   }
	   
	   // 리스트 시작
	   // 상품리스트
	   public List<ProductDto> dashboardProductList(ProductDto productDto, int adminId){
		   List<ProductDto> dashboardProductList = storeAdminSqlMapper.dashboardProductList(productDto, adminId);
		   return dashboardProductList;
	   }
	   // 오더리스트
	   public List<ProductDto> dashboardProductOrderList(ProductDto productDto, int adminId){
		   List<ProductDto> dashboardProductOrderList = storeAdminSqlMapper.dashboardProductOrderList(productDto, adminId);
		   return dashboardProductOrderList;
	   }
	   // 리뷰,평점리스트
	   public List<HyunMinProductReviewListDto> dashboardproductReviewList(HyunMinProductReviewListDto hyunMinProductReviewListDto){
		   List<HyunMinProductReviewListDto> dashboardproductReviewList = storeAdminSqlMapper.dashboardproductReviewList(hyunMinProductReviewListDto);
		   return dashboardproductReviewList;
	   }
	   
	   // 대시보드 끝
	   
	   // 모든상품리스트
	   public List<HyunMinProductJoinDto> selectAll(HyunMinProductJoinDto hyunMinProductJoinDto) {
	      List<HyunMinProductJoinDto> list = storeAdminSqlMapper.selectAll(hyunMinProductJoinDto);
	      return list;
	   }
	   
	   // 카테고리타입리스트
	   public List<ProductCategoryTypeDto> categoryTypeList(ProductCategoryTypeDto productCategoryTypeDto){
		   List<ProductCategoryTypeDto> categoryTypeList = storeAdminSqlMapper.categoryTypeList(productCategoryTypeDto);
		   return categoryTypeList;
	   }
	   
	   // 진행상태리스트
	   public List<ProductOrderStatusDto> orderStatusList(ProductOrderStatusDto productOrderStatusDto){
		   
		   List<ProductOrderStatusDto> orderStatusList = storeAdminSqlMapper.orderStatusList(productOrderStatusDto);
		   
		   return orderStatusList;
	   }
	   
	   //  상품등록
	   public void productInsert(ProductDto productDto) {
	      storeAdminSqlMapper.productInsert(productDto);
	   }
	   
	   // 상품썸네일등록
	   public void productThumbnaillInsert(ProductThumbnailDto productThumbnailDto, List<ProductThumbnailDto> ProductThumbnailDtoList) {
	      
	      for(ProductThumbnailDto pd : ProductThumbnailDtoList) {
	         String name = pd.getName();
	         int list = pd.getOrder_list();
	         productThumbnailDto.setName(name);
	         productThumbnailDto.setOrder_list(list);
	         storeAdminSqlMapper.productThumbnaillInsert(productThumbnailDto);
	      }
	   }
	   
	   // 상품썸네일이미지등록
	   public void productDetailImageInsert(ProductDetailImageDto productDetailImageDto, List<ProductDetailImageDto> ProductDetailImageDtoList) {
		   
		   for(ProductDetailImageDto pdi : ProductDetailImageDtoList) {
			   String name = pdi.getName();
			   int list = pdi.getOrder_list();
			   productDetailImageDto.setName(name);
			   productDetailImageDto.setOrder_list(list);
			   storeAdminSqlMapper.productDetailImageInsert(productDetailImageDto);
		   }
	   }
	   
	   // 상품카테고리타입등록
	   public void productcategorytypeInsert(ProductCategoryTypeDto productCategoryTypeDto) {
	      storeAdminSqlMapper.productcategorytypeInsert(productCategoryTypeDto);
	   }
	   
	   // 카테고리등록
	   public void productcategoryInsert(ProductCategoryDto productCategoryDto) {
	      storeAdminSqlMapper.productcategoryInsert(productCategoryDto);
	   }
	   
	   // 상품상세보기
	   public HyunMinProductJoinDto productDetail(int product_id) {
		   HyunMinProductJoinDto productDto = storeAdminSqlMapper.productDetail(product_id);
		   return productDto;
	   }
	   // 썸네일리스트
	   public List<ProductThumbnailDto> productThumbnailDetail(int product_id){ 
		   
		   List<ProductThumbnailDto> productThumbnailDetail = storeAdminSqlMapper.productThumbnailDetail(product_id);
		   
		   return productThumbnailDetail;
	   }
	   // 상품상세보기이미지리스트
	   public List<ProductDetailImageDto> productDetailImageList(int product_id){
		   List<ProductDetailImageDto> productDetailImageList = storeAdminSqlMapper.productDetailImageList(product_id);
		   return productDetailImageList;
	   }
	   
		// 상품수정
		public void productUpdate(ProductDto productDto) {
		    storeAdminSqlMapper.productUpdate(productDto);
		}
		// 상품삭제
		public void productDelete(ProductDto productDto) {
			storeAdminSqlMapper.productDelete(productDto);
		}
		
		// 상품썸네일수정
		public void productThumbnailUpdate(ProductThumbnailDto productThumbnailDto, List<ProductThumbnailDto> ProductThumbnailDtoList) {
		   for(ProductThumbnailDto pd : ProductThumbnailDtoList) {
			   String name = pd.getName();
		       int list = pd.getOrder_list();
		       productThumbnailDto.setName(name);
		       productThumbnailDto.setOrder_list(list);
		       storeAdminSqlMapper.productThumbnaillUpdate(productThumbnailDto);
		       storeAdminSqlMapper.productThumbnaillUpdateUsedFg(productThumbnailDto);
		       } 
		}
		// 상품카테고리수정
		public void productcategoryUpdate(ProductCategoryDto productCategoryDto) {
			storeAdminSqlMapper.productcategoryUpdate(productCategoryDto);
		}
		
		// 주문아이템등록
		public void productOrderItemInsert(ProductOrderItemDto productOrderItemDto) {
			storeAdminSqlMapper.productOrderItemInsert(productOrderItemDto);
		}
		
		// N번 관리자가 판매하는 모든상품의 주문 내역
		public List<ProductOrderItemDto> productOrderItemList(ProductOrderItemDto productOrderItemDto, int adminId){
			
			List<ProductOrderItemDto> productOrderItemList = storeAdminSqlMapper.productOrderItemList(productOrderItemDto, adminId);
			
			return productOrderItemList;
		}
		// N번 관리자가 판매하는 하나의 상품주문내역
		public ProductOrderItemDto orderItemDetail(int product_order_item_id) {
			
			ProductOrderItemDto orderItemDetail = storeAdminSqlMapper.orderItemDetail(product_order_item_id);
			
			return orderItemDetail;
		}
		
		// 관리자 진행상태수정
		// 판매자확인완료
		public void adminCheckUpdate(ProductOrderItemDto productOrderItemDto) {
			storeAdminSqlMapper.adminCheckUpdate(productOrderItemDto);
		}
		// 배송중
		public void deliveryingUpdate(ProductOrderItemDto productOrderItemDto) {
			storeAdminSqlMapper.deliveryingUpdate(productOrderItemDto);
		}
		
		// 택배사리스트
		public List<DeliveryCompanyDto> deliveryCompanyList(DeliveryCompanyDto deliveryCompanyDto){
			List<DeliveryCompanyDto> deliveryCompanyList = storeAdminSqlMapper.deliveryCompanyList(deliveryCompanyDto);
			return deliveryCompanyList;
		}
		
		// 택배사등록
		public int deliveryInsert(DeliveryDto deliveryDto) {
			int delivery_id = storeAdminSqlMapper.deliveryInsert(deliveryDto);
			return delivery_id;
		}
		
		// 카테고리별 오더리스트
		public List<ProductOrderItemDto> orderItemCategoryList(ProductOrderItemDto productOrderItemDto){
			
			List<ProductOrderItemDto> orderItemCategoryList = storeAdminSqlMapper.orderItemCategoryList(productOrderItemDto);
			
			return orderItemCategoryList;
		}
		
		// 발송리스트
		public List<DeliveryDto> deliveryList(DeliveryDto deliveryDto){
			List<DeliveryDto> deliveryList = storeAdminSqlMapper.deliveryList(deliveryDto);
			return deliveryList;
		}
		
		// 발송상세보기
		public ProductOrderItemDto deliveryDetail(int product_order_item_id) {
			
			ProductOrderItemDto deliveryDetail = storeAdminSqlMapper.deliveryDetail(product_order_item_id);
			
			return deliveryDetail;
		}
		
		// 상품리스트(리뷰개수,평점)
		public List<HyunMinProductReviewListDto> productReviewList(HyunMinProductReviewListDto hyunMinProductReviewListDto){
			
			List<HyunMinProductReviewListDto> productReviewList = storeAdminSqlMapper.productReviewList(hyunMinProductReviewListDto);
			
			return productReviewList;
		}
		
		// 상품하나에 대한 리뷰리스트
		public List<HyunMinProductReviewListDto> productDetailReviewList(int product_id){
			
			List<HyunMinProductReviewListDto> productDetailReviewList = storeAdminSqlMapper.productDetailReviewList(product_id);
			
			return productDetailReviewList;
		}
		// 상품하나에 대한 리뷰이미지리스트
		public List<ProductReviewImageDto> productReviewImageList(int product_id){
			
			
			List<ProductReviewImageDto> productReviewImageList = storeAdminSqlMapper.productReviewImageList(product_id);
			
			return productReviewImageList;
		}
		
		// 문의내용리스트
		public List<HyunMinQnaJoinDto> qnaContentsList(HyunMinQnaJoinDto hyunMinQnaJoinDto,  int adminId){
			List<HyunMinQnaJoinDto> qnaContentsList = storeAdminSqlMapper.qnaContentsList(hyunMinQnaJoinDto, adminId);
			return qnaContentsList;
		}
		// 문의내용상세보기
		public HyunMinQnaJoinDto qnaContentDetail(int qna_id) {
			HyunMinQnaJoinDto qnaContentDetail = storeAdminSqlMapper.qnaContentDetail(qna_id);
			return qnaContentDetail;
		}
		// 답글등록
		public void answerContentsInsert(HyunMinQnaJoinDto hyunMinQnaJoinDto) {
			storeAdminSqlMapper.answerContentsInsert(hyunMinQnaJoinDto);
		}
		
		// 통계그래프
		public List<Map<String,Object>> getSalesYear(int year, int adminId){
			return storeAdminSqlMapper.getSalesYear(year, adminId);
		}
	}
package com.ssofun.admin.store.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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
import com.ssofun.dto.ProductReviewDto;
import com.ssofun.dto.ProductReviewImageDto;
import com.ssofun.dto.ProductThumbnailDto;

public interface StoreAdminSqlMapper {
			
	   // 대시보드	
	   // 총 매출
	   public int selectTotalPrice(ProductDto productDto,@Param("adminId") int adminId);
	   // 모든상품수
	   public int selectTotalProductCount(ProductDto productDto, @Param("adminId") int adminId);
	   // 총 리뷰수
	   public int selectTotalProductReviewCount(ProductDto productDto, @Param("adminId") int adminId);
	   // 총 평점
	   public double selectProductReviewAvgScore(ProductDto productDto, @Param("adminId") int adminId);
	   
	   // 리스트시작
	   // 상품리스트
	   public List<ProductDto> dashboardProductList(ProductDto productDto, @Param("adminId") int adminId);
	   // 오더리스트
	   public List<ProductDto> dashboardProductOrderList(ProductDto productDto, @Param("adminId") int adminId);
	   // 리뷰,평점리스트
	   public List<HyunMinProductReviewListDto> dashboardproductReviewList(HyunMinProductReviewListDto hyunMinProductReviewListDto);
	   
	   // 대시보드 끝
	   
	   // 모든상품리스트
	   public List<HyunMinProductJoinDto> selectAll(HyunMinProductJoinDto hyunMinProductJoinDto);
	   
	   // 카테고리타입리스트
	   public List<ProductCategoryTypeDto> categoryTypeList(ProductCategoryTypeDto productCategoryTypeDto);
	   
	   // 상품상세이미지리스트
	   public List<ProductDetailImageDto> productDetailImageList(int product_id);
	   
	   // 진행상태리스트
	   public List<ProductOrderStatusDto> orderStatusList(ProductOrderStatusDto productOrderStatusDto);
	   
	   // 상품등록 
	   public void productInsert(ProductDto ProductDto);
	   
	   // 상품썸네일등록
	   public void productThumbnaillInsert(ProductThumbnailDto productThumbnailDto);
	   
	   // 상품상세이미지등록
	   public void productDetailImageInsert(ProductDetailImageDto productDetailImageDto);
	   
	   // 상품 카테고리 타입등록 
	   public void productcategorytypeInsert(ProductCategoryTypeDto productCategoryTypeDto);
	   	   
	   // 카테고리 등록
	   public void productcategoryInsert(ProductCategoryDto productCategoryDto);
	   
	  // 상품상세보기
	   public HyunMinProductJoinDto productDetail(int product_id);
	   public List<ProductThumbnailDto> productThumbnailDetail(int product_id);
	   
	   // 상품수정 찐
	   public void productUpdate(ProductDto ProductDto);
	   
	   // 상품수정
	   public void productUpdate1(ProductDto ProductDto);
	   public void productUpdateUsedFg(ProductDto ProductDto);
	   // 상품삭제
	   public void productDelete(ProductDto ProductDto);
	   // 썸네일수정
	   public void productThumbnaillUpdate(ProductThumbnailDto productThumbnailDto);
	   public void productThumbnaillUpdateUsedFg(ProductThumbnailDto productThumbnailDto);
	   // 카테고리수정
	   public void productcategoryUpdate(ProductCategoryDto productCategoryDto);
	   
	   // 주문아이템등록
	   public void productOrderItemInsert(ProductOrderItemDto productOrderItemDto);
	   
	   // N번 관리자가 판매하는 모든상품의 주문 내역
	   public List<ProductOrderItemDto> productOrderItemList(ProductOrderItemDto productOrderItemDto, @Param("adminId") int adminId);
	   
	   // N번 관리가 판매하는 하나의 상품의 주문내역
	   public ProductOrderItemDto orderItemDetail(int product_order_item_id);
	   
	   // 진행상태수정
	   public void adminCheckUpdate(ProductOrderItemDto productOrderItemDto); // 판매자확인완료
	   public void deliveryingUpdate(ProductOrderItemDto productOrderItemDto); // 배송중
	   
	   // 택배사리스트
	   public List<DeliveryCompanyDto> deliveryCompanyList(DeliveryCompanyDto deliveryCompanyDto);
	   // 택배사등록
	   public int deliveryInsert(DeliveryDto deliveryDto);
	   
	   // 카테고리별 오더리스트
	   public List<ProductOrderItemDto> orderItemCategoryList(ProductOrderItemDto productOrderItemDto);
	   
	   // 발송리스트
	   public List<DeliveryDto> deliveryList(DeliveryDto deliveryDto);
	   // 발송상세보기
	   public ProductOrderItemDto deliveryDetail(int product_order_item_id);
	   
	   // 상품리스트(리뷰개수,평점)
	   public List<HyunMinProductReviewListDto> productReviewList(HyunMinProductReviewListDto hyunMinProductReviewListDto);
	   
	   // 상품하나에 대한 리뷰리스트
	   public List<HyunMinProductReviewListDto> productDetailReviewList(@Param("product_id") int product_id);
	   // 상품하나에 대한 리뷰이미지리스트
	   public List<ProductReviewImageDto> productReviewImageList(int product_id);
	   
	   // 문의내용리스트
	   public List<HyunMinQnaJoinDto> qnaContentsList(HyunMinQnaJoinDto hyunMinQnaJoinDto, @Param("adminId") int adminId);
	   // 문의내용상세보기	
	   public HyunMinQnaJoinDto qnaContentDetail(int qna_id);
	   // 답글등록
	   public void answerContentsInsert(HyunMinQnaJoinDto hyunMinQnaJoinDto);
	   
	   // 통게그래프
	   public List<Map<String,Object>> getSalesYear(@Param("year") int year, @Param("adminId") int adminId);
	   
	   
	   
	}
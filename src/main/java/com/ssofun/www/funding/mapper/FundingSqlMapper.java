package com.ssofun.www.funding.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssofun.dto.DeliveryRecipientDto;
import com.ssofun.dto.FundingCategoryDto;
import com.ssofun.dto.FundingCommunityDto;
import com.ssofun.dto.FundingCommunityReviewAnswerDto;
import com.ssofun.dto.FundingCommunityReviewDto;
import com.ssofun.dto.FundingDto;
import com.ssofun.dto.FundingFavoritDto;
import com.ssofun.dto.FundingItemDto;
import com.ssofun.dto.FundingNewsDto;
import com.ssofun.dto.FundingNewsReviewAnswerDto;
import com.ssofun.dto.FundingNewsReviewDto;
import com.ssofun.dto.FundingOrderDto;
import com.ssofun.dto.FundingRewardDto;
import com.ssofun.dto.FundingRewardOrderDto;
import com.ssofun.dto.FundingTagDto;
import com.ssofun.dto.FundingThumbnailDto;
import com.ssofun.dto.PaymentDto;
import com.ssofun.dto.UserCreatorDto;

public interface FundingSqlMapper {

	
	//---달성률 높은 순서대로 펀딩리스트 출력
	public List<FundingDto> selectFundingOrderByAchievementRate();
	//---새로 등록한 펀딩 순서대로 리스트 출력
	public List<FundingDto> selectFundingOrderByCreatedAt();
	//--- 펀딩 달성률 출력
	public int selectFundingAchievementRate(long funding_id);
	//--- 펀딩 달성금액 출력
	public long selectFundingAchievement(long funding_id);
	
	
	
	//---가장 최근에 insert 된 auto_increment값 가져오기
	public long selectLastInsertId();
	
	
	//---카테고리 리스트 전부 출력
	public List<FundingCategoryDto> selectAllFundingCategory();
	//---카테고리 리스트 이름 출력
	public String selectCategoryNameByCateId(long funding_category_id);	
	
	
	//---펀딩 리스트 전부 출력
	public List<FundingDto> selectAllFunding(@Param("startNum") int startNum, @Param("funding_category_id") long funding_category_id);
	//--- 펀딩 갯수 출력
	public int selectCountFunding(@Param("funding_category_id") long funding_category_id);
	//---펀딩 시작일 출력
	public Date selectFundingStartFrom(long funding_id);
	//---펀딩 종료일 출력
	public Date selectFundingCloseAt(long funding_id);
	//---펀딩 리스트 펀딩 종료 잔여일자 출력
	public int selectDateDiff(Date close_at);
	//---펀딩 달성 금액 출력
	public long selectAchievementPrice(long funding_id);
	//---펀딩 목표 금액 출력
	public long selectTargetPrice(long funding_id);
	//---펀딩 정보 출력
	public FundingDto selectFunding(long funding_id);
	//---펀딩 좋아요 갯수 출력
	public int selectCountFavorit(long funding_id);
	//---펀딩 좋아요 조회
	public FundingFavoritDto selectFavorit(FundingFavoritDto fundingFavoritDto);
	//---펀딩 좋아요 입력
	public void insertFavorit(FundingFavoritDto fundingFavoritDto);
	//---펀딩 좋아요 삭제 used_fg 0으로 처리
	public void deleteFavorit(FundingFavoritDto fundingFavoritDto);
	//---펀딩 리워드 리스트 출력
	public List<FundingRewardDto> selectRewardList(long funding_id);
	//---펀딩 리워드 아이템 리스트 출력
	public List<FundingItemDto> selectItemList(@Param("funding_id") long funding_id,@Param("funding_reward_id") long funding_reward_id);
	//---펀딩 섬네일 리스트 출력
	public List<FundingThumbnailDto> selectThumbnailAll(long funding_id);
	//--펀딩 상세 섬네일 갯수 출력
	public int selectDetailThumbnailCount(long funding_id);
	//---펀딩 후원자 수 출력
	public int selectSupportCount(long funding_id);
	//---같은 카테고리 펀딩 추천 리스트 출력
	public List<FundingDto> selectSameCategoryFunding(long funding_id);
	//---가장 최근 후원하 유저가 구매한 펀딩 리스트 출력
	public List<FundingDto> selectOrderUserPickFunding(long funding_id);
	
	
	
	
	
	
	//---펀딩 공지사항 리스트 출력
	public List<FundingNewsDto> selectNewsList(long funding_id);
	//---펀딩 공지사항 상세 출력
	public FundingNewsDto selectFundingNews(long funding_notice_id);
	//---펀딩 공지사항 댓글 리스트 출력
	public List<FundingNewsReviewDto> selectNewsReviewList(long funding_notice_id);
	//---펀딩 공지사항 댓글 갯수 출력
	public int selectCountReview(long funding_notice_id);
	//---펀딩 공지사항 대댓글 리스트 출력
	public List<FundingNewsReviewAnswerDto> selectNewsAnswerList(@Param("funding_notice_id") long funding_notice_id, @Param("funding_news_review_id") long funding_news_review_id);
	//---펀딩 공지사항 대댓글 갯수 출력
	public int selectCountAnswer(@Param("funding_notice_id") long funding_notice_id, @Param("funding_news_review_id") long funding_news_review_id);
	//---펀딩 공지사항 댓글 입력
	public void insertNewsComment(@Param("fundingNewsReviewDto") FundingNewsReviewDto fundingNewsReviewDto, @Param("user_id") long user_id);
	//---펀딩 공지사항 대댓글 입력
	public void insertNewsReply(@Param("fundingNewsReviewAnswerDto") FundingNewsReviewAnswerDto fundingNewsReviewAnswerDto, @Param("user_id") long user_id, @Param("funding_notice_id") long funding_notice_id);
	

	
	
	

	//---펀딩 커뮤니티 리스트 출력
	public List<FundingCommunityDto> selectCommunityList(long funding_id);
	//---펀딩 커뮤니티 댓글 갯수 출력
	public int selectCountCommunityReview(long funding_review_id);
	//---펀딩 커뮤니티 댓글 리스트 출력
	public List<FundingCommunityReviewDto> selectCommunityReviewList(long funding_review_id);
	//---펀딩 커뮤니티 입력
	public void insertReview(@Param("funding_id")long funding_id, @Param("user_id") long user_id, @Param("contents") String contents);
	//---펀딩 커뮤니티 상세 출력
	public FundingCommunityDto selectCommunity(long funding_review_id);
	//---펀딩 커뮤니티 대댓글 리스트 출력
	public List<FundingCommunityReviewAnswerDto> selectCommunityReviewAnswerList(long review_id);
	//---펀딩 커뮤니티 대댓글 갯수 출력
	public int selectCommunityCountAnswer(@Param("review_id") long review_id);
	//---펀딩 커뮤니티 댓글 입력
	public void insertCommunityComment(@Param("funding_id") long funding_id, 
			@Param("fundingCommunityReviewDto") FundingCommunityReviewDto fundingCommunityReviewDto, 
			@Param("user_id") long user_id);
	//---펀딩 커뮤니티 대댓글 입력
	public void insertCommunityCommentReply(@Param("funding_id") long funding_id, 
			@Param("fundingCommunityReviewAnswerDto") FundingCommunityReviewAnswerDto fundingCommunityReviewAnswerDto, 
			@Param("user_id") long user_id);

	
	
	
	
	//---펀딩 결제전 주문 정보 입력
	public long insertOrder(FundingOrderDto fundingOrderDto);
	//---펀딩 결제전 리워드별 주문 정보 입력
	public void insertRewardOrder(FundingRewardOrderDto fundingRewardOrderDto);
	//---결제완료된 리워드 갯수 출력
	public int selectRewardPaymentCount(long funding_reward_id);
	//---펀딩 결제전 주문 정보 조회
	public FundingOrderDto selectPaymentBeforeFundingOrder(long funding_order_id);
	//---펀딩 결제전 리워드별 주문 정보 조회
	public List<FundingRewardOrderDto> selectPaymentBeforeFundingRewardOrder(long funding_order_id);
	//---리워드 정보 조회
	public FundingRewardDto selectReward(long funding_reward_id);
	//---펀딩 결제완료후 주문 정보 업데이트
	public void updateOrder(@Param("funding_order_id") long funding_order_id, @Param("fundingOrderDto") FundingOrderDto fundingOrderDto);
	//---펀딩 결제완료후 리워드별 주문 정보 업데이트
	public void updateRewardOrder(@Param("funding_order_id") long funding_order_id, 
			@Param("fundingRewardOrderDto") FundingRewardOrderDto fundingRewardOrderDto);
	//---펀딩 결제완료된 주문 정보 조회
	public FundingOrderDto selectOrder(long funding_order_id);
	//---펀딩 결제완료된 리워드별 주문 정보 조회
	public List<FundingRewardOrderDto> selectRewardOrder(long funding_order_id);
	//---펀딩 결제 완료후 결제 정보 입력
	public long insertPayment(PaymentDto paymentDto);
	//---주문 결제 정보 입력
	public void insertOrderPayment(@Param("payment_id") long payment_id, @Param("funding_order_id") long funding_order_id);
	//---주문 결제건 택배 수령인 정보 입력
	public long insertDeliveryRecipient(DeliveryRecipientDto deliveryRecipientDto);
	//---배송지 리스트 출력
	public List<DeliveryRecipientDto> selectUserAddressList(long user_id);
	//---기존 기본배송지 default_fg 0으로 변경
	public void updateAddressDefaultFg(@Param("delivery_recipient_id") long delivery_recipient_id, 
			@Param("deliveryRecipientDto") DeliveryRecipientDto deliveryRecipientDto);
	//--- 기본 배송지 출력
	public DeliveryRecipientDto selectDefaultAddressByUserId(long user_id);
	
	
	
	//--- 펀딩 카테고리명 출력
	public String selectFundingCategoryNameByFundingId(long funding_id);
	//--- 펀딩 제목 출력
	public String selectFundingTitle(long funding_id);
	//--- 창작자 정보 출력
	public String selectCreator(long user_creator_id);
	
	












	
	











	

























}

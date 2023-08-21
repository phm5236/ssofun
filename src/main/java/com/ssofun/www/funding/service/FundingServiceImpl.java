package com.ssofun.www.funding.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.ssofun.www.funding.mapper.FundingSqlMapper;

@Service
public class FundingServiceImpl {
	
	@Autowired
	private FundingSqlMapper fundingSqlMapper;
	
//	펀딩 메인페이지 ------------------------------------------------------------------------------------------
	public List<FundingDto> getFundingOrderByAchievementRate() {
		List<FundingDto> fundingList = fundingSqlMapper.selectFundingOrderByAchievementRate();
		for(FundingDto fundingDto : fundingList) {
			fundingDto.setThumbnailList(fundingSqlMapper.selectThumbnailAll(fundingDto.getFunding_id()));
		}
		return fundingList;
	}
	
	
//	펀딩 최신 등록순
	public List<FundingDto> getFundingOrderByCreatedAt() {
		List<FundingDto> fundingList = fundingSqlMapper.selectFundingOrderByCreatedAt();
		for(FundingDto fundingDto : fundingList) {
			fundingDto.setThumbnailList(fundingSqlMapper.selectThumbnailAll(fundingDto.getFunding_id()));
		}
		return fundingList;
	}
	
	
//	펀딩 달성률 가져오기
	public int getFundingAchievementRate(long funding_id) {
		// TODO Auto-generated method stub
		return fundingSqlMapper.selectFundingAchievementRate(funding_id);
	}
	
	
	
	
	
	
//	펀딩 리스트 페이지 ----------------------------------------------------------------------------------------

//	카테고리 목록
	public List<FundingCategoryDto> selectAllFundingCategory() {
		
		return fundingSqlMapper.selectAllFundingCategory();
	}
	
//	카테고리 이름
	public String selectCategoryNameByCateId(long funding_category_id) {
		return fundingSqlMapper.selectCategoryNameByCateId(funding_category_id);
	}

//	펀딩 목록
	public List<FundingDto> selectAllFunding(int pageNum, long funding_category_id) {
		int startNum = (pageNum-1)*12; 
		List<FundingDto> fundingList = fundingSqlMapper.selectAllFunding(startNum,funding_category_id);
		
		for(FundingDto fundingDto : fundingList) {	
			
			List<FundingThumbnailDto> thumbnailList = fundingSqlMapper.selectThumbnailAll(fundingDto.getFunding_id());
			fundingDto.setThumbnailList(thumbnailList);
			
			fundingDto.setClose_at(fundingSqlMapper.selectFundingCloseAt(fundingDto.getFunding_id()));
			

		}
		
		return fundingList;
	}
	
//	펀딩 정보
	public FundingDto selectFunding(long funding_id) {
		FundingDto fundingDto = fundingSqlMapper.selectFunding(funding_id);
		
		fundingDto.setThumbnailList(fundingSqlMapper.selectThumbnailAll(funding_id));
		
		fundingDto.setFavorit(fundingSqlMapper.selectCountFavorit(funding_id));
		
		List<FundingRewardDto> rewardList = fundingSqlMapper.selectRewardList(funding_id);
		for(FundingRewardDto fundingRewardDto : rewardList) {
			List<FundingItemDto> itemList = fundingSqlMapper.selectItemList(funding_id, fundingRewardDto.getFunding_reward_id()); 
			fundingRewardDto.setItemList(itemList);
		}
		fundingDto.setRewardList(rewardList);
		
		fundingDto.setNewsList(fundingSqlMapper.selectNewsList(funding_id));
		fundingDto.setReviewList(fundingSqlMapper.selectCommunityList(funding_id));
		
		
		return fundingDto;		
	}
	


//	페이지 갯수
	public int selectCountPage(long funding_category_id) {
		int fundingCount = fundingSqlMapper.selectCountFunding(funding_category_id);
		int maxNum = (int)Math.ceil(fundingCount/12.0);
		System.out.println(maxNum);
		return maxNum;
	}

//	페이지 목록
	public int[] selectPageNumList(int clickNum, long funding_category_id) {
		
		int fundingCount = fundingSqlMapper.selectCountFunding(funding_category_id);
		int maxNum = (int)Math.ceil(fundingCount/12.0);
		
		//clickNum이 1일때
		int startNum = ((clickNum-1)/10)*10+1; // (9/10)->0이 된다 -> 0*10+1
		int endNum = startNum+10-1; // 10
		if(endNum>=maxNum) {
			endNum = maxNum;
		}
		
		int[] pageNumList = new int[(endNum+1)-startNum];
		
		int start = startNum;
		for(int i = 0; i<pageNumList.length; i++) {
			pageNumList[i] = start;
			start++;
		}
		
		
		return pageNumList;
	}
	
//	펀딩 상세 페이지 -----------------------------------------------------------------------------------------------
	
//	펀딩 상세 섬네일 이미지 갯수	
	public int getDetailThumbnailCount(long funding_id) {
		return fundingSqlMapper.selectDetailThumbnailCount(funding_id);
	}
	
//	펀딩 후원자 수 출력
	public int getSupportCount(long funding_id) {
		return fundingSqlMapper.selectSupportCount(funding_id);
	}
	
//	같은 카테고리 펀딩 추천 리스트 4개 출력
	public List<FundingDto> getSameCategoryFunding(long funding_id) {
		List<FundingDto> fundingList = fundingSqlMapper.selectSameCategoryFunding(funding_id);
		for(FundingDto fundingDto : fundingList) {
			fundingDto.setThumbnailList(fundingSqlMapper.selectThumbnailAll(fundingDto.getFunding_id()));
		}
		return fundingList;
	}
	
//	가장 최근에 구매한 유저가 후원한 펀딩 리스트 3개 출력
	public List<FundingDto> getOrderUserPickFunding(long funding_id) {
		List<FundingDto> fundingList = fundingSqlMapper.selectOrderUserPickFunding(funding_id);
		for(FundingDto fundingDto : fundingList) {
			fundingDto.setThumbnailList(fundingSqlMapper.selectThumbnailAll(fundingDto.getFunding_id()));
		}
		return fundingList;
	}

//	펀딩 공지사항 ------------------------------------------------------------------------------------------------------------------------
	
//	공지사항 상세 정보
	public FundingNewsDto selectFundingNews(long funding_notice_id) {
		
		FundingNewsDto fundingNewsDto = fundingSqlMapper.selectFundingNews(funding_notice_id);
		fundingNewsDto.setTotalComment(fundingSqlMapper.selectCountReview(funding_notice_id));
		
		List<FundingNewsReviewDto> reviewList = fundingSqlMapper.selectNewsReviewList(funding_notice_id);
		
		for(FundingNewsReviewDto fundingNewsReviewDto : reviewList) {
			
			long funding_news_review_id = fundingNewsReviewDto.getFunding_news_review_id();	
			
			List<FundingNewsReviewAnswerDto> answerList = fundingSqlMapper.selectNewsAnswerList(funding_notice_id,funding_news_review_id);
			fundingNewsReviewDto.setAnswer_count(fundingSqlMapper.selectCountAnswer(funding_notice_id, funding_news_review_id));
			fundingNewsReviewDto.setAnswerList(answerList);
		}
		
		fundingNewsDto.setReviewList(reviewList);	
		
		return fundingNewsDto;
	}
	
//	공지사항 댓글 입력
	public int insertNewsComment(FundingNewsReviewDto params, long user_id) {
		fundingSqlMapper.insertNewsComment(params,user_id);
		return 1;
	}
	
//	공지사항 대댓글 입력
	public int insertNewsReply(FundingNewsReviewAnswerDto params, long user_id, long funding_notice_id) {
		System.out.println(params.getThis_answer_id());
		System.out.println(funding_notice_id);
		fundingSqlMapper.insertNewsReply(params,user_id,funding_notice_id);
		return 1;
	}

//	커뮤니티 목록--------------------------------테이블명 수정해야함!!!!!!!!!!!!!!!!!----------------------------------
	public List<FundingCommunityDto> selectCommunityList(long funding_id) {
		
		List<FundingCommunityDto> communityList = fundingSqlMapper.selectCommunityList(funding_id);
		
		for(FundingCommunityDto fundingCommunityDto : communityList) {
			long funding_review_id = fundingCommunityDto.getFunding_review_id();
			
			fundingCommunityDto.setReviewList(fundingSqlMapper.selectCommunityReviewList(funding_review_id));
			System.out.println("커뮤니티 id : "+funding_review_id);
		}
		
		return communityList;
	}

//	커뮤니티 입력
	public int insertReview(long funding_id, long user_id, String contents) {
		fundingSqlMapper.insertReview(funding_id,user_id,contents);
		return 1;
	}

//	커뮤니티 상세
	public FundingCommunityDto selectCommunity(long funding_review_id) {
		FundingCommunityDto fundingCommunityDto = fundingSqlMapper.selectCommunity(funding_review_id);
		
		int totalComment = fundingSqlMapper.selectCountCommunityReview(funding_review_id);
		
		List<FundingCommunityReviewDto> reviewList = fundingSqlMapper.selectCommunityReviewList(funding_review_id);
		
		for(FundingCommunityReviewDto fundingCommunityReviewDto : reviewList) {
			long review_id = fundingCommunityReviewDto.getFunding_review_id();
			int answerCount = fundingSqlMapper.selectCommunityCountAnswer(review_id);
			fundingCommunityReviewDto.setAnswer_count(answerCount);
			fundingCommunityReviewDto.setAnswerList(fundingSqlMapper.selectCommunityReviewAnswerList(review_id));
		}
		
		fundingCommunityDto.setTotalComment(totalComment);
		fundingCommunityDto.setReviewList(reviewList);
		return fundingCommunityDto;
	}

//	커뮤니티 댓글 입력
	public int insertCommunityComment(long funding_id, FundingCommunityReviewDto params, long user_id) {
		fundingSqlMapper.insertCommunityComment(funding_id,params,user_id);
		return 1;
	}
	
//	커뮤니티  대댓글 입력
	public int insertCommunityCommentReply(long funding_id, FundingCommunityReviewAnswerDto params, long user_id) {
		fundingSqlMapper.insertCommunityCommentReply(funding_id,params,user_id);
		return 1;
	}

	
//	펀딩 좋아요 입력
	public int insertFavorit(FundingFavoritDto params) {
		FundingFavoritDto fundingFavoritDto = fundingSqlMapper.selectFavorit(params);
		
		if(fundingFavoritDto != null) {
			return 0;
		}else {
			fundingSqlMapper.insertFavorit(params);
			return 1;
		}
	}

//	펀딩 좋아요 갯수 조회
	public int selectCountFavorit(long funding_id) {
		return fundingSqlMapper.selectCountFavorit(funding_id);
	}

//	펀딩 좋아요 삭제
	public int deleteFavorit(FundingFavoritDto params) {
		fundingSqlMapper.deleteFavorit(params);
		return 1;
	}
	
	
	
	
	
	
//	펀딩 결제하기--------------------------------------------------------
	
//	배송지 정보 리스트 출력
	public List<DeliveryRecipientDto> getUserAddressList(long user_id) {
		List<DeliveryRecipientDto> recipientList = fundingSqlMapper.selectUserAddressList(user_id);
		return recipientList;
	}
	
//	기본 배송지 출력
	public DeliveryRecipientDto getDefaultAddress(long user_id) {
		return fundingSqlMapper.selectDefaultAddressByUserId(user_id);
	}
	
//	펀딩 결제 진행전 주문 정보 입력 -> 리워드별 주문 정보도 같이 입력
	public long insertOrder(FundingOrderDto fundingOrderDto) {
		fundingSqlMapper.insertOrder(fundingOrderDto);
		long funding_order_id = fundingOrderDto.getFunding_order_id();
		
		List<FundingRewardOrderDto> rewardList = fundingOrderDto.getRewardList();
		for(FundingRewardOrderDto fundingRewardOrderDto : rewardList) {
			fundingRewardOrderDto.setFunding_order_id(funding_order_id);

			fundingSqlMapper.insertRewardOrder(fundingRewardOrderDto);
		}
		
		return funding_order_id;
	}

//	펀딩 결제 진행전 주문 정보 조회 -> 리워드별 주문 정보도 같이 조회
	public FundingOrderDto getPaymentBeforeFundingOrder(long funding_order_id) {
		
		FundingOrderDto fundingOrderDto = fundingSqlMapper.selectPaymentBeforeFundingOrder(funding_order_id);

		fundingOrderDto.setRewardList(fundingSqlMapper.selectPaymentBeforeFundingRewardOrder(funding_order_id));
		
		List<FundingRewardOrderDto> rewardList = fundingOrderDto.getRewardList();
		
		for(FundingRewardOrderDto fundingRewardOrderDto : rewardList) {
			FundingRewardDto fundingRewardDto = fundingSqlMapper.selectReward(fundingRewardOrderDto.getFunding_reward_id());
			
			List<FundingItemDto> itemList = fundingSqlMapper.selectItemList(fundingRewardDto.getFunding_id(), fundingRewardDto.getFunding_reward_id());
			fundingRewardDto.setItemList(itemList);
			
			fundingRewardOrderDto.setFundingRewardDto(fundingRewardDto);
		}
		return fundingOrderDto;
	}
	
//	리워드 결제완료 갯수 출력
	public int getRewardPaymentCount(long funding_reward_id) {
		return fundingSqlMapper.selectRewardPaymentCount(funding_reward_id);
	}
	
//	펀딩 리워드별 주문 정보 업데이트
	public int updateFundingRewardOrder(long funding_order_id, FundingRewardOrderDto params) {

		fundingSqlMapper.updateRewardOrder(funding_order_id,params);
		List<FundingRewardOrderDto> rewardList = fundingSqlMapper.selectRewardOrder(funding_order_id);
		
		if(rewardList == null) {
			return 0;
		}
		
		return 1;
	}

//	펀딩 결제 완료후 주문 정보 업데이트
	public int updateFundingOrder(long funding_order_id, FundingOrderDto params) {
		fundingSqlMapper.updateOrder(funding_order_id,params);
		FundingOrderDto fundingOrderDto = fundingSqlMapper.selectOrder(funding_order_id);
		
		if(fundingOrderDto == null) {
			return 0;
		}
		
		return 1;
	}
	
//	펀딩 결제 완료후 결제 정보 입력
	public long insertPayment(PaymentDto paymentDto) {
		fundingSqlMapper.insertPayment(paymentDto);	
		long payment_id = paymentDto.getPayment_id();
		
		return payment_id;
	}
	
//	주문 결제 정보 입력
	public int insertOrderPayment(long payment_id, long funding_order_id) {
		fundingSqlMapper.insertOrderPayment(payment_id,funding_order_id);
		return 1;
	}
	
//	결제완료건 택배 수령인 정보 입력
	public long insertDeliveryRecipient(DeliveryRecipientDto deliveryRecipientDto) {
		fundingSqlMapper.insertDeliveryRecipient(deliveryRecipientDto);
		return deliveryRecipientDto.getDelivery_recipient_id();
	}
	
//	배송지 default_fg 수정
	public int updateAddressDefaultFg(long delivery_recipient_id, DeliveryRecipientDto params) {
		if(delivery_recipient_id != 0) {
			fundingSqlMapper.updateAddressDefaultFg(delivery_recipient_id,params);
			return 1;			
		}else {
			return 0; 
		}
	}
	
//	펀딩 결제 완료된 주문 정보 조회 -> 리워드별 조회도 진행 -> 아이템 리스트도 조회
	public FundingOrderDto selectFundingOrder(long funding_order_id) {
		FundingOrderDto fundingOrderDto = fundingSqlMapper.selectOrder(funding_order_id);
		List<FundingRewardOrderDto> rewardOrderList = fundingSqlMapper.selectRewardOrder(funding_order_id);
		
		for(FundingRewardOrderDto fundingRewardOrderDto : rewardOrderList) {
			FundingRewardDto fundingRewardDto = fundingSqlMapper.selectReward(fundingRewardOrderDto.getFunding_reward_id());
			List<FundingItemDto> itemList = fundingSqlMapper.selectItemList(fundingRewardDto.getFunding_id(), fundingRewardDto.getFunding_reward_id());
			FundingDto FundingDto = selectFunding(fundingRewardDto.getFunding_id());
			
//			fundingOrderDto.setCreator_name(FundingDto.getCreator_name());
			fundingOrderDto.setTitle(FundingDto.getTitle());
			
			fundingRewardDto.setItemList(itemList);
			fundingRewardOrderDto.setFundingRewardDto(fundingRewardDto);
		}
		
		fundingOrderDto.setRewardList(rewardOrderList);
		
		return fundingOrderDto;
	}

	//펀딩 달성금액 출력
	public long getFundingAchievement(long funding_id) {
		return fundingSqlMapper.selectFundingAchievement(funding_id);
	}


	// 펀딩 종료일 출력
	public String getFundingCloseAt(long funding_id) {
		
		Date closeAt = fundingSqlMapper.selectFundingCloseAt(funding_id);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd EEEE");
        String formattedDate = dateFormat.format(closeAt);
        
		return formattedDate;
	}

	//펀딩 카테고리명 출력
	public String getFundingCategoryNameByFundingId(long funding_id) {
		return fundingSqlMapper.selectFundingCategoryNameByFundingId(funding_id);
	}

	//펀딩 제목 출력
	public String getFundingTitle(long funding_id) {
		return fundingSqlMapper.selectFundingTitle(funding_id);
	}

	//창작자 정보 출력
	public String getCreator(long user_creator_id) {
		return fundingSqlMapper.selectCreator(user_creator_id);
	}


























	








	



	
	
	
	
	
	
	
	
	
	

//	public void insertFunding(FundingDto fundingDto, MultipartFile[] url, int funding_category_id, int user_creator_id,
//			int fuding_tag_id) {
//		fundingSqlMapper.insertFunding(fundingDto,funding_category_id,user_creator_id,fuding_tag_id);
//		int funding_id = fundingSqlMapper.selectLastInsertId();
//		
//	}





}

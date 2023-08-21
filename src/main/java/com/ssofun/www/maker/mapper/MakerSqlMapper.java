package com.ssofun.www.maker.mapper;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ssofun.dto.DeliveryCompanyDto;
import com.ssofun.dto.DeliveryDto;
import com.ssofun.dto.DeliveryStatusDto;
import com.ssofun.dto.FundingCommunityDto;
import com.ssofun.dto.FundingCommunityReviewDto;
import com.ssofun.dto.FundingDto;
import com.ssofun.dto.FundingItemDto;
import com.ssofun.dto.FundingNewsDto;
import com.ssofun.dto.FundingOrderDto;
import com.ssofun.dto.FundingOrderStatusDto;
import com.ssofun.dto.FundingRewardDto;
import com.ssofun.dto.FundingRewardOrderDto;
import com.ssofun.dto.FundingTagDto;
import com.ssofun.dto.FundingThumbnailDto;
import com.ssofun.dto.UserCreatorBankDto;
import com.ssofun.dto.UserCreatorDto;
import com.ssofun.dto.UserDto;

public interface MakerSqlMapper {
	
	
	//---창작자 아이디 조회
	public Long selectCreatorId(long user_id);
	//---창작자 펀딩 리스트 조회
	public List<FundingDto> selectMakerFundingList(long user_creator_id);
	//---창작자 펀딩 섬네일 리스트 조회
	public List<FundingThumbnailDto> selectFundingThumbnailList(long funding_id);
	//---창작자 정보 조회
	public UserCreatorDto selectMakerByUserCreatorId(long user_creator_id);
	//---창작자 은행 정보 조회
	public UserCreatorBankDto selectCreatorBank(long user_creator_id);
	//---펀딩 태그 이름 조회
	public String selectFundingTagName(long funding_tag_id);
	//---리워드 아이템 리스트 조회
	public List<FundingItemDto> selectItemList(long funding_reward_id);
	
	
	
	
	
	

	//---창작자 정보 입력
	public long insertUserCreator(UserCreatorDto userCreatorDto);
	//---창작자 은행 정보 입력
	public void insertCreatorBank(UserCreatorBankDto userCreatorBankDto);
	//---태그 정보 입력
	public long insertTag(FundingTagDto fundingTagDto);
	//---펀딩 입력	
//	public long insertFunding(@Param("funding_category_id") long funding_category_id, @Param("funding_tag_id") long funding_tag_id, @Param("user_creator_id") long user_creator_id, 
//			@Param("funding_code") String funding_code, @Param("title") String title, @Param("contents") String contents, @Param("description") String description, @Param("target_price") long target_price, 
//			@Param("adult_fg") int adult_fg, @Param("deliveryFrom") LocalDate deliveryFrom);
	//---펀딩 등록 fundingDto 사용
	public long insertFunding(FundingDto params);
	//---펀딩 코드로 펀딩 아이디 조회
	public long selectFundingIdByCode(String funding_code);
	//---리워드 등록
	public long insertFundingReward(FundingRewardDto fundingRewardDto);
	//---리워드 아이템 등록
	public void insertFundingRewardItem(FundingItemDto fundingItemDto);
	//---섬네일 등록
	public void insertThumbnail(FundingThumbnailDto fundingThumbnailDto);
	
	
	
	
	//---리워드 리스트 조회
	public List<FundingRewardDto> selectRewardList(long funding_id);
	//---리워드 주문 리스트 조회
	public List<FundingRewardOrderDto> selectFundingRewardOrderList(long funding_reward_id);
	//---펀딩 주문 리스트 조회
	public List<FundingOrderDto> selectFundingOrderList(long funding_id);
	//---리워드 조회
	public FundingRewardDto selectReward(long funding_reward_id);
	//---펀딩 조회
	public FundingDto selectFunding(long funding_id);
	//---구매 회원 조회
	public UserDto selectUser(long user_id);
	//---주문 상태 조회
	public FundingOrderStatusDto selectFundingOrderStatus(long funding_order_status_id);
	//---배송 정보 여부 확인
	public int selectDeliveryCount(long delivery_recipient_id);
	//---배송 주소 정보 아이디 조회
	public long selectDeliveryRecipientId(long funding_order_id);
	//---배송사 리스트 조회
	public List<DeliveryCompanyDto> selectDeliveryCompanyList();
	//---배송 입력(배송사+배송주소+배송상태)
	public int insertDelivery(DeliveryDto deliveryDto);
	//---배송 상태 이름 출력
	public DeliveryStatusDto selectDeliveryStatus(long delivery_recipient_id);
	//---배송 상태 아이디 출력
	public Long selectDeliveryStatusId(long deliveryRecipientId);
	//---배송 상태 배송중으로 업데이트
	public void updateDelivering(@Param("funding_order_id") long funding_order_id, 
			@Param("deliveryDto") DeliveryDto deliveryDto);
	//---배송 상태 업데이트 -> 배송완료, 수령완료, 구매확정
	public void updateDeliveryStatus(@Param("funding_order_id")long funding_order_id, 
			@Param("delivery_status_id") long delivery_status_id);
	
	
	
	//---공지사항 리스트 출력
	public List<FundingNewsDto> selectFundingNoticeList(long funding_id);
	//---공지사항별 댓글수 출력
	public int selectNoticeReviewCount(long funding_notice_id);
	//---공지사항 등록
	public void insertFundingNotice(FundingNewsDto fundingNewsDto);
	//---공지사항 조회
	public FundingNewsDto selectFundingNotice(long funding_notice_id);
	//---공지사항 수정
	public void updateFundingNotice(@Param("funding_notice_id") long funding_notice_id, @Param("fundingNewsDto") FundingNewsDto fundingNewsDto);
	//---공지사항 삭제
	public void deleteFundingNotice(long funding_notice_id, FundingNewsDto params);
	
	
	
	//---커뮤니티 리스트 출력
	public List<FundingCommunityDto> selectCommunityList(long funding_id);
	//---커뮤니티 댓글 리스트 출력
	public List<FundingCommunityReviewDto> selectCommunityReviewList(long funding_review_id);
	//---커뮤니티 대댓글 갯수 출력
	public int selectCommunityReviewAnswerCount(long funding_review_id);
	//---판매자 커뮤니티 댓글 존재 여부
	public int selectCommunityReviewExistCreatorUserId(@Param("funding_review_id") long funding_review_id, 
			@Param("user_creator_id") long user_creator_id);
	//---판매자 커뮤니티 답변 입력
	public void insertCommunityAnswer(FundingCommunityReviewDto fundingCommunityReviewDto);
	
	
	
	//---펀딩 제목 조회
	public String selectFundingTitle(long funding_id);
	//---펀딩 시작일 조회
	public Date selectFundingStartFrom(long funding_id);
	//---펀딩 종료일 조회
	public Date selectFundingCloseAt(long funding_id);
	//--- 대시보드 일별 주문금액 조회
	public List<FundingOrderDto> selectDayChartData(long funding_id);
	//--- 대시보드 일별 주문금액 누적합계 조회
	public List<FundingOrderDto> selectTotalChartData(long funding_id);
	//--- 총 후원금액 조회
	public Integer selectTotalSupportPrice(long funding_id);
	//--- 목표 달성금액 조회
	public int selectTargetPrice(long funding_id);
	//--- 후원자 수 조회
	public int selectSupportCount(long funding_id);
	//--- 남은 기간 조회
	public int selectFundingDateDiff(long funding_id);
	//--- 후원자 나이리스트  조회
	public List<Map<String, Long>> selectAgeChartData(long funding_id);
	//--- 후원자 성별 리스트 조회
	public int[] selectGenderChartData(long funding_id);


















	
	
	
	
	
	
	
	













}

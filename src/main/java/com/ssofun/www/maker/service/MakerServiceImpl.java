package com.ssofun.www.maker.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
import com.ssofun.www.maker.mapper.MakerSqlMapper;

@Service
public class MakerServiceImpl {

	@Autowired
	private MakerSqlMapper makerSqlMapper;
	
//	창작자 계정 존재유무 확인
	public Long getCreatorId(long user_id) {
		return makerSqlMapper.selectCreatorId(user_id);
	}
	
//	창작자 펀딩 리스트 조회
	public List<FundingDto> getMakerFundingList(long user_creator_id) {
		List<FundingDto> fundingList = makerSqlMapper.selectMakerFundingList(user_creator_id);
		
		for(FundingDto fundingDto : fundingList) {
			long funding_id = fundingDto.getFunding_id();
			List<FundingThumbnailDto> thumbnailList = makerSqlMapper.selectFundingThumbnailList(funding_id);
			
			fundingDto.setThumbnailList(thumbnailList);
		}
		return fundingList;
	}
	
//	창작자 정보 조회
	public UserCreatorDto getMakerProfile(long user_creator_id) {
		return makerSqlMapper.selectMakerByUserCreatorId(user_creator_id);
	}
	
	
//	창작자 사업자 정보 가져오기
	public UserCreatorDto getCreatorInfo(long user_creator_id) {
		UserCreatorDto userCreatorDto = makerSqlMapper.selectMakerByUserCreatorId(user_creator_id);
		userCreatorDto.setUserCreatorBankDto(makerSqlMapper.selectCreatorBank(user_creator_id));
		return userCreatorDto;
	}

	
//	창작자 펀딩 정보 가져오기
	public FundingDto getFunding(long funding_id) {
		FundingDto fundingDto = makerSqlMapper.selectFunding(funding_id);
		fundingDto.setThumbnailList(makerSqlMapper.selectFundingThumbnailList(funding_id));
		
		List<FundingRewardDto> rewardList = makerSqlMapper.selectRewardList(funding_id);
		for(FundingRewardDto fundingRewardDto : rewardList) {
			fundingRewardDto.setItemList(makerSqlMapper.selectItemList(fundingRewardDto.getFunding_reward_id()));
		}
		
		fundingDto.setRewardList(rewardList);
		
		return fundingDto;
	}
	
	
//	펀딩 태그 이름 가져오기
	public String getTagName(long funding_tag_id) {
		return makerSqlMapper.selectFundingTagName(funding_tag_id);
	}
	
	
	
//	창작자 생성
	public long insertUserCreator(UserCreatorDto userCreatorDto) {
		makerSqlMapper.insertUserCreator(userCreatorDto);
		return userCreatorDto.getUser_creator_id();
	}

	public long insertCreatorBank(UserCreatorBankDto userCreatorBankDto) {
		makerSqlMapper.insertCreatorBank(userCreatorBankDto);
		return 1;
	}

	public long insertTag(FundingTagDto fundingTagDto) {
		makerSqlMapper.insertTag(fundingTagDto);
		return fundingTagDto.getFunding_tag_id();
	}
	

	//펀딩 등록
//	public long insertFunding(long funding_category_id, long funding_tag_id, long user_creator_id, String funding_code,
//			String title, String contents, String description, long target_price, int adult_fg, LocalDate deliveryFrom) {
//		makerSqlMapper.insertFunding(funding_category_id,funding_tag_id,user_creator_id,funding_code,title,contents,description,
//				target_price,adult_fg,deliveryFrom);
//		
//		long funding_id = makerSqlMapper.selectFundingIdByCode(funding_code);
//		return funding_id;
//	}

	//펀딩등록 fundingDto 사용
	public long insertFunding(FundingDto params) {
//		LocalDate deliveryFrom = LocalDate.parse(par);
		makerSqlMapper.insertFunding(params);
		return params.getFunding_id();
	}

//	펀딩 등록시 pk받아서 리워드 및 아이템 입력
	public long insertFundingReward(FundingRewardDto fundingRewardDto) {
		makerSqlMapper.insertFundingReward(fundingRewardDto);
		
		long funding_reward_id = fundingRewardDto.getFunding_reward_id();
		
		return funding_reward_id;
	}

	public int insertFundingRewardItem(FundingItemDto fundingItemDto) {
		System.out.println("아이템 이름: "+fundingItemDto.getName());
		makerSqlMapper.insertFundingRewardItem(fundingItemDto);
		return 1;
	}

	public int insertThumbnail(long funding_id, MultipartFile url, int image_order) {
		FundingThumbnailDto fundingThumbnailDto = new FundingThumbnailDto();
		
		// 메인이미지 저장 로직
		if (!url.isEmpty()) {
			
			System.out.println("파일명: "+ url.getOriginalFilename());
			
			String rootFolder = "c:/ssofunUploadFiles/";

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(new Date());

			File targetFolder = new File(rootFolder + today);

			if (!targetFolder.exists()) {
				targetFolder.mkdirs();
			}

			String fileName = UUID.randomUUID().toString();
			fileName += "_" + System.currentTimeMillis();

			String originalFileName = url.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

			String saveFileName = today + "/" + fileName + ext;

			try {
				url.transferTo(new File(rootFolder + saveFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}

			fundingThumbnailDto.setUrl(saveFileName);
			fundingThumbnailDto.setFunding_id(funding_id);
			fundingThumbnailDto.setImage_order(image_order);

			makerSqlMapper.insertThumbnail(fundingThumbnailDto);
			return 1;
		}else {
			System.out.println("url이 비어있다고!!");
			return 0;
		}
		
	}
	
	
//	펀딩별 주문 리스트 조회
	public List<FundingOrderDto> getFundingOrderList(long funding_id) {
		
//		List<FundingRewardOrderDto> rewardOrderList = null;
		
		List<FundingOrderDto> orderList = makerSqlMapper.selectFundingOrderList(funding_id);
		
		//rewardList로 rewardOrderList 조회
//		for(FundingRewardDto fundingRewardDto : rewardList) {
//			long funding_reward_id = fundingRewardDto.getFunding_reward_id();
//			
//			List<FundingRewardOrderDto> rewardOrderList = 
//					makerSqlMapper.selectFundingRewardOrderList(funding_reward_id);	
//			
//			//rewardOrderList로 orderList 조회
//			for(FundingRewardOrderDto fundingRewardOrderDto : rewardOrderList) {
//				long funding_order_id = fundingRewardOrderDto.getFunding_order_id();
//				
//				orderList = makerSqlMapper.selectFundingOrderList(funding_order_id);
//			}
//			
//		}
		
		//orderList에 rewardOrderList 담기
		for(FundingOrderDto fundingOrderDto : orderList){
			long funding_order_id = fundingOrderDto.getFunding_order_id();
			
			UserDto userDto = makerSqlMapper.selectUser(fundingOrderDto.getUser_id());
			fundingOrderDto.setUserDto(userDto);
			
			//rewardDto에 fundingDto 담기
			FundingDto fundingDto = makerSqlMapper.selectFunding(funding_id);
			fundingOrderDto.setFundingDto(fundingDto);
			
			List<FundingRewardOrderDto> rewardOrderList = 
					makerSqlMapper.selectFundingRewardOrderList(funding_order_id);
			
			//rewardOrderList에 rewardDto 담기
			for(FundingRewardOrderDto fundingRewardOrderDto : rewardOrderList) {
				FundingRewardDto rewardDto = makerSqlMapper.selectReward(fundingRewardOrderDto.getFunding_reward_id());
				
				
				fundingRewardOrderDto.setFundingRewardDto(rewardDto);
			}
			
			fundingOrderDto.setRewardList(rewardOrderList);
		}
		
		return orderList;
	}

	public FundingOrderStatusDto getFundingOrderStatus(long funding_order_status_id) {
		return makerSqlMapper.selectFundingOrderStatus(funding_order_status_id);
	}

	
	
//	배달 정보 존재 확인
	public int getDeliveryExist(long delivery_recipient_id) {
		return makerSqlMapper.selectDeliveryCount(delivery_recipient_id);
	}
	
//	배송 정보 입력
	public int insertDelivery(long funding_order_id,DeliveryDto deliveryDto) {
		long delivery_recipient_id = makerSqlMapper.selectDeliveryRecipientId(funding_order_id);

		deliveryDto.setDelivery_recipient_id((int)delivery_recipient_id);		
		
		return makerSqlMapper.insertDelivery(deliveryDto);
	}
	
//	배송사 정보 출력
	public List<DeliveryCompanyDto> selectDeliveryCompanyList() {
		return makerSqlMapper.selectDeliveryCompanyList();
	}
	
//	배송 상태 출력
	public DeliveryStatusDto getDeliveryStatus(long delivery_recipient_id) {
		return makerSqlMapper.selectDeliveryStatus(delivery_recipient_id);
	}
	
//	주문 배송 현황 조회
	public long[] getDeliveryStatusTotal(long[] orderIdList) {
		
		long[] deliveryStatusIdList = new long[orderIdList.length];
		
		int i = 0;
		for(long o : orderIdList) {
			 long deliveryRecipientId = makerSqlMapper.selectDeliveryRecipientId(o);
			 Long deliveryStatusId = makerSqlMapper.selectDeliveryStatusId(deliveryRecipientId);
			 
			 if(deliveryStatusId == null) {
				 deliveryStatusIdList[i] = 0;
			 }else {
				 deliveryStatusIdList[i] = deliveryStatusId;			 
			 }
			 
			 i++;
		}
		return deliveryStatusIdList;
	}
	
//	배송상태 배송중으로 업데이트
	public int updateDelivering(long funding_order_id, DeliveryDto deliveryDto) {
		makerSqlMapper.updateDelivering(funding_order_id,deliveryDto);
		return 1;
	}
	
	//배송상태 업데이트 -> 배송완료, 수령완료, 구매확정
	public int updateDeliveryStatus(long funding_order_id, long delivery_status_id) {
		makerSqlMapper.updateDeliveryStatus(funding_order_id,delivery_status_id);
		return 1;
	}
	
	
	
	
	
	
	
	
//	공지사항  -------------------------------------------------------------------------------------------------
	
//	펀딩별 공지사항 리스트 출력
	public List<FundingNewsDto> getFundingNoticeList(long funding_id) {
		List<FundingNewsDto> newsList = makerSqlMapper.selectFundingNoticeList(funding_id);
		return newsList;
	}

//	공지사항별 댓글수 출력
	public int getNoticeReviewCount(long funding_notice_id) {
		return makerSqlMapper.selectNoticeReviewCount(funding_notice_id);
	}

//	공지사항 등록
	public int insertFundingNotice(FundingNewsDto fundingNewsDto) {
		makerSqlMapper.insertFundingNotice(fundingNewsDto);
		return 1;
	}
	
//	공지사항 조회
	public FundingNewsDto getFundingNotice(long funding_notice_id) {
		return makerSqlMapper.selectFundingNotice(funding_notice_id);
	}
	
//	공지사항 수정
	public int updateFundingNotice(long funding_notice_id, FundingNewsDto params) {
		makerSqlMapper.updateFundingNotice(funding_notice_id,params);
		return 1;
	}
	
//	공지사항 삭제
	public int deleteFundingNotice(long funding_notice_id, FundingNewsDto params) {
		makerSqlMapper.deleteFundingNotice(funding_notice_id,params);
		return 1;
	}

	
//	커뮤니티  -------------------------------------------------------------------------------------------------------
	
	
//	커뮤니티 리스트 출력
	public List<FundingCommunityDto> getCommunityList(long funding_id) {
		return makerSqlMapper.selectCommunityList(funding_id);
	}
	
//	커뮤니티 작성자 출력
	public UserDto getUser(long user_id) {
		return makerSqlMapper.selectUser(user_id);
	}

//	커뮤니티별 댓글수 출력
	public int getCommunityReviewCount(long funding_review_id) {
		List<FundingCommunityReviewDto> reviewList = makerSqlMapper.selectCommunityReviewList(funding_review_id);
		
		int reviewCount = 0;
		for(FundingCommunityReviewDto fundingCommunityReviewDto : reviewList) {			
			int reviewAnswerCount = makerSqlMapper.selectCommunityReviewAnswerCount(fundingCommunityReviewDto.getFunding_review_id());
			reviewCount += (reviewAnswerCount + 1);
		}
		return reviewCount;
	}

//	커뮤니티 판매자 댓글 존재 여부 확인
	public int getCommunityReviewExistCreatorUserId(long funding_review_id, long user_creator_id) {
		return makerSqlMapper.selectCommunityReviewExistCreatorUserId(funding_review_id,user_creator_id);
	}
	
//	판매자 커뮤니티 답글 입력
	public int insertCommunityAnswer(FundingCommunityReviewDto fundingCommunityReviewDto) {
		makerSqlMapper.insertCommunityAnswer(fundingCommunityReviewDto);
		return 1;
	}
	
	
//	대시보드 ----------------------------------------------------------------------------------------------------------------
	
//	펀딩 제목 조회
	public String getFundingTitle(long funding_id) {
		return makerSqlMapper.selectFundingTitle(funding_id);
	}
	
//	펀딩 시작일 조회
	public FundingRewardDto getFundingStartFromAndCloseAt(long funding_id) {
		FundingRewardDto fundingRewardDto = new FundingRewardDto();
		fundingRewardDto.setStart_from(makerSqlMapper.selectFundingStartFrom(funding_id));
		fundingRewardDto.setClose_at(makerSqlMapper.selectFundingCloseAt(funding_id));
		return fundingRewardDto;
	}
	
//	대시보드 일별 주문금액 조회
	public List<FundingOrderDto> getDayChartData(long funding_id) {
		return makerSqlMapper.selectDayChartData(funding_id);
	}

//	대시보드 일별 주문금액 누적합계 조회
	public List<FundingOrderDto> getTotalChartData(long funding_id) {
		return makerSqlMapper.selectTotalChartData(funding_id);
	}

//	총 후원금액 조회
	public Integer getTotalSupportPrice(long funding_id) {
		return makerSqlMapper.selectTotalSupportPrice(funding_id);
	}
	
//	목표 달성금액 조회
	public int getTargetPrice(long funding_id) {
		return makerSqlMapper.selectTargetPrice(funding_id);
	}
	
//	후원자 수 조회
	public int getSupportCount(long funding_id) {
		return makerSqlMapper.selectSupportCount(funding_id);
	}

//	남은 기간 조회
	public int getFundingDateDiff(long funding_id) {
		return makerSqlMapper.selectFundingDateDiff(funding_id);
	}

	public int[] getAgeChartData(long funding_id) {
		
		int one = 0;
		int two = 0;
		int three = 0;
		int four = 0;
		int etc = 0;	
		
		int supportCount = 0;
		
		List<Map<String, Long>> supportAgeList = makerSqlMapper.selectAgeChartData(funding_id);
		

		for(Map<String, Long> s : supportAgeList) {
			
			long age_group = s.get("age_group");
			long count = s.get("cnt");
			
			supportCount += count;

			if(age_group == 10) {
				one += count;
			}else if(age_group == 20) {
				two += count;
			}else if(age_group == 30) {
				three += count;
			}else if(age_group == 40) {
				four += count;
			}else {
				etc += count;
			}
				
		}
		
			
	    if (supportCount != 0) {
	        one = (int) Math.round((one * 100.0 / supportCount));
	        two = (int) Math.round((two * 100.0 / supportCount));
	        three = (int) Math.round((three * 100.0 / supportCount));
	        four = (int) Math.round((four * 100.0 / supportCount));
	        etc = (int) Math.round((etc * 100.0 / supportCount));
	    }
			
			int [] age = {one,two,three,four,etc};
			
			return age;
		
	}

	public int[] getGenderChartData(long funding_id) {
		
		int f = 0;
		int m = 0;
		int e = 0;
		
		int supportCount = 0;
		int [] supportGenderList = makerSqlMapper.selectGenderChartData(funding_id);
		
		for(int g : supportGenderList) {
			supportCount++;
			
			if(g == 0) {
				m++;
			}else if(g == 1) {
				f++;
			}else {
				e++;
			}
		}
		
		if(supportCount != 0) {
			f = Math.round((f/supportCount)*100);
			m = Math.round((m/supportCount)*100);
			e = Math.round((e/supportCount)*100);			
		}
		
		int[] gender = {f,m,e};
		
		return gender;
	}




































	
	
	
	

}

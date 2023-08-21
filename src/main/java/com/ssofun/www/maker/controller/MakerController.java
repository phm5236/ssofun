package com.ssofun.www.maker.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssofun.dto.DeliveryCompanyDto;
import com.ssofun.dto.DeliveryDto;
import com.ssofun.dto.DeliveryStatusDto;
import com.ssofun.dto.FundingCategoryDto;
import com.ssofun.dto.FundingCommunityDto;
import com.ssofun.dto.FundingCommunityReviewDto;
import com.ssofun.dto.FundingDto;
import com.ssofun.dto.FundingItemDto;
import com.ssofun.dto.FundingNewsDto;
import com.ssofun.dto.FundingOrderDto;
import com.ssofun.dto.FundingOrderStatusDto;
import com.ssofun.dto.FundingRewardDto;
import com.ssofun.dto.FundingTagDto;
import com.ssofun.dto.UserCreatorBankDto;
import com.ssofun.dto.UserCreatorDto;
import com.ssofun.dto.UserDto;
import com.ssofun.www.funding.service.FundingServiceImpl;
import com.ssofun.www.maker.service.MakerServiceImpl;
import com.ssofun.www.user.service.UserServiceImpl;

@Controller
@RequestMapping("www/maker/*")
public class MakerController {
	
	@Autowired
	private FundingServiceImpl fundingService;
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private MakerServiceImpl makerService;
	
//	메이커 마이페이지
	@RequestMapping("makerMyPage")
	public String makerMyPage() {
		return "www/maker/makerMyPage";
	}
	
	
//	메이커 펀딩 리스트 조회
	@ResponseBody
	@RequestMapping("AJAXgetMakerFundingList")
	public List<FundingDto> AJAXgetMakerFundingList(long user_creator_id){
		return makerService.getMakerFundingList(user_creator_id);
	}
	
	
//	메이커 계정 조회
	@ResponseBody
	@RequestMapping("AJAXgetMakerProfile")
	public UserCreatorDto AJAXgetMakerProfile(long user_creator_id) {
		return makerService.getMakerProfile(user_creator_id);
	}
	
	
	
	

	
//	펀딩 등록 페이지 ----------------------------------------------------------------------------

	@RequestMapping("makerProjectRegisterPage")
	public String creatorPage(HttpSession session){		
		
		UserDto userDto = (UserDto) session.getAttribute("user");
		
		if(userDto != null) {
			Long user_creator_id = makerService.getCreatorId(userDto.getUser_id());
			
			if(user_creator_id != null) {
				session.setAttribute("user_creator_id", user_creator_id);
				session.setAttribute("user", userDto);
			}else {
				session.setAttribute("user", userDto);			
			}
		}
		return "www/maker/makerProjectRegisterPage";
	}
	
	//창작자 계좌 및 모든 정보 조회
	@ResponseBody
	@RequestMapping("AJAXgetCreatorInfo")
	public UserCreatorDto AJAXgetCreatorInfo(long user_creator_id) {
		return makerService.getCreatorInfo(user_creator_id);
	}
	
	//창작자 펀딩 정보 조회
	@ResponseBody
	@RequestMapping("AJAXgetFunding")
	public FundingDto AJAXgetFunding(long funding_id) {
		return makerService.getFunding(funding_id);
	}
	
	@ResponseBody
	@RequestMapping(value = "AJAXgetTagName", method = RequestMethod.GET, produces = "text/html; charset=utf-8")
	public String AJAXgetTagName(long funding_tag_id) {
		return makerService.getTagName(funding_tag_id);
	}
	
	@ResponseBody
	@RequestMapping("AJAXgetCategoryList")
	public List<FundingCategoryDto> AJAXgetCategoryList(){
		return fundingService.selectAllFundingCategory();
	}
	
	
	@ResponseBody
	@RequestMapping("AJAXinsertUserCreator")
	public long AJAXinsertUserCreator(UserCreatorDto params) {
		return makerService.insertUserCreator(params);
	}
	
	@ResponseBody
	@RequestMapping("AJAXinsertCreatorBank")
	public long AJAXinsertCreatorBank(UserCreatorBankDto params) {
		return  makerService.insertCreatorBank(params);
	}
	
	@ResponseBody
	@RequestMapping("AJAXinsertTag")
	public long AJAXinsertTag(FundingTagDto params) {
		return makerService.insertTag(params);
	}
	
	
//	@ResponseBody
//	@RequestMapping("AJAXinsertFunding")
//	public long AJAXinsertFunding(@RequestParam("funding_category_id") long funding_category_id, long funding_tag_id, long user_creator_id, String funding_code,
//			String title, String contents, String description, long target_price, int adult_fg, String delivery_from) {
//		LocalDate deliveryFrom = LocalDate.parse(delivery_from);
//		System.out.println("funding_category_id: "+funding_category_id);
//		return makerService.insertFunding(funding_category_id,funding_tag_id,user_creator_id,funding_code,title,contents,description,
//				target_price,adult_fg,deliveryFrom);
//	}
	
	@ResponseBody
	@RequestMapping("AJAXinsertFunding")
	public long AJAXinsertFunding(@RequestBody FundingDto params) {
		
//		System.out.println("funding_category_id: "+funding_category_id);
		return makerService.insertFunding(params);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "AJAXinsertFundingReward", method = RequestMethod.POST)
	public long AJAXinsertFundingReward(@RequestBody FundingRewardDto fundingRewardDto, @RequestParam("delivery_from") String delivery_from 
			,@RequestParam("start_from") String start_from, @RequestParam("close_at") String close_at) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy. MM. dd. EEEE");
		
		SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy.MM.dd");
		System.out.println("delivery_from: "+delivery_from);
		System.out.println("start_from: "+start_from);
		System.out.println("close_at: "+close_at);
		try {
			Date deliveryFrom = formatter.parse(delivery_from);
			fundingRewardDto.setDelivery_from(deliveryFrom);
			System.out.println(deliveryFrom);
			
			Date startFrom = formatter2.parse(start_from);
			fundingRewardDto.setStart_from(startFrom);
			System.out.println(startFrom);
			
			Date closeAt = formatter2.parse(close_at);
			fundingRewardDto.setClose_at(closeAt);
			System.out.println(closeAt);
			
		} catch (Exception  e) {
			e.printStackTrace();
		}
		
		System.out.println("Delivery_price: "+fundingRewardDto.getDelivery_price());
		
		return makerService.insertFundingReward(fundingRewardDto);
	}
	
	@ResponseBody
	@RequestMapping(value = "AJAXinsertFundingRewardItem", method = RequestMethod.POST)
	public int AJAXinsertFundingRewardItem(@RequestBody FundingItemDto fundingItemDto) {
		System.out.println("펀딩 아이템 이름: "+fundingItemDto.getName());
		return makerService.insertFundingRewardItem(fundingItemDto);
	}
	
	
	@ResponseBody
	@RequestMapping("AJAXinsertFundingThumbnail")
	public int AJAXinsertFundingThumbnail(@RequestParam("funding_id") long funding_id,@RequestParam("url") MultipartFile url, @RequestParam("image_order") int image_order) {
		System.out.println("funding_id: "+funding_id);
		
		return makerService.insertThumbnail(funding_id,url,image_order);
	}
	
	
	
	
//	펀딩 주문 리스트 페이지 ------------------------------------------------------------------
	
	@RequestMapping("makerOrderListPage")
	public String makerOrderListPage() {
		return "www/maker/makerOrderListPage";
	}
	
	// 주문 리스트 가져오기
	@ResponseBody
	@RequestMapping("AJAXgetFundingOrderList")
	public List<FundingOrderDto> AJAXgetFundingOrderList(long funding_id){
		return makerService.getFundingOrderList(funding_id);
	}
	
	// 주문 상태 이름 가져오기
	@ResponseBody
	@RequestMapping("AJAXgetFundingOrderStatus")
	public FundingOrderStatusDto AJAXgetFundingOrderStatus(long funding_order_status_id) {
		return makerService.getFundingOrderStatus(funding_order_status_id);
	}
	
	// 배송 정보 존재 여부 확인
	@ResponseBody
	@RequestMapping("AJAXgetDeliveryExist")
	public int AJAXgetDeliveryExist(long delivery_recipient_id) {
		return makerService.getDeliveryExist(delivery_recipient_id);
	}
	
	//주문 발주 버튼 클릭 -> 배송 정보 입력
	@ResponseBody
	@RequestMapping("AJAXinsertDelivery")
	public int AJAXinsertDelivery(long funding_order_id, DeliveryDto params) {
		return makerService.insertDelivery(funding_order_id,params);
	}
	
	//배송사 리스트 조회
	@ResponseBody
	@RequestMapping("AJAXgetDeliveryCompanyList")
	public List<DeliveryCompanyDto> AJAXgetDeliveryCompanyList(){
		return makerService.selectDeliveryCompanyList();
	}
	
	//배송상태 이름 조회
	@ResponseBody
	@RequestMapping("AJAXgetDeliveryStatus")
	public DeliveryStatusDto AJAXgetDeliveryStatus(long delivery_recipient_id) {
		return makerService.getDeliveryStatus(delivery_recipient_id);
	}
	
	//주문 배송 현황 조회
	@ResponseBody
	@RequestMapping("AJAXgetDeliveryStatusTotal")
	public long[] AJAXgetDeliveryStatusTotal(@RequestParam(value = "orderIdList[]") long[] orderIdList) {
		return makerService.getDeliveryStatusTotal(orderIdList);
	} 
	
	//배송상태 배송중으로 업데이트
	@ResponseBody
	@RequestMapping("AJAXupdateDelivering")
	public int AJAXupdateDelivering(long funding_order_id, @RequestBody DeliveryDto params) { //long delivery_status_id, String invoice_no) {
		System.out.println("funding_order_id: "+funding_order_id);
		System.out.println("delivery_status_id: "+params.getDelivery_status_id());
		System.out.println("invoice_no: "+params.getInvoice_no());
//		System.out.println("delivery_status_id: "+delivery_status_id);
//		System.out.println("invoice_no: "+invoice_no);
		return makerService.updateDelivering(funding_order_id,params);
	}
	
	//배송상태 업데이트 -> 배송완료, 수령완료, 구매확정
	@ResponseBody
	@RequestMapping("AJAXupdateDeliveryStatus")
	public int AJAXupdateDeliveryStatus(long funding_order_id, long delivery_status_id) {
		System.out.println(funding_order_id+" "+delivery_status_id);
		return makerService.updateDeliveryStatus(funding_order_id,delivery_status_id);
	}
	
	
//	펀딩 공지리스트 페이지 ------------------------------------------------------------------
	@RequestMapping("makerNoticeListPage")
	public String makerNoticeListPage() {
		return "www/maker/makerNoticeListPage";
	}
	
	//공지사항 리스트 조회
	@ResponseBody
	@RequestMapping("AJAXgetFundingNoticeList")
	public List<FundingNewsDto> AJAXgetFundingNoticeList(long funding_id){
		return makerService.getFundingNoticeList(funding_id);
	}
	
	//공지사항 댓글수 조회
	@ResponseBody
	@RequestMapping("AJAXgetNoticeReviewCount")
	public int AJAXgetNoticeReviewCount(long funding_notice_id) {
		return makerService.getNoticeReviewCount(funding_notice_id);
	}
	
	//공지사항 등록
	@ResponseBody
	@RequestMapping("AJAXinsertFundingNotice")
	public int AJAXinsertFundingNotice(FundingNewsDto params) {
		return makerService.insertFundingNotice(params);
	}
	
	//공지사항 조회
	@ResponseBody
	@RequestMapping("AJAXgetFundingNotice")
	public FundingNewsDto AJAXgetFundingNotice(long funding_notice_id) {
		return makerService.getFundingNotice(funding_notice_id);
	}
	
	//공지사항 수정
	@ResponseBody
	@RequestMapping("AJAXupdateFundingNotice")
	public int AJAXupdateFundingNotice(@RequestParam("funding_notice_id") long funding_notice_id, @RequestBody FundingNewsDto params) {

		return makerService.updateFundingNotice(funding_notice_id,params);
	}
	
	//공지사항 삭제
	@ResponseBody
	@RequestMapping("AJAXdeleteFundingNotice")
	public int AJAXdeleteFundingNotice(long funding_notice_id, @RequestBody FundingNewsDto params) {
		System.out.println(funding_notice_id);
		System.out.println(params.getUsed_fg());
		return makerService.deleteFundingNotice(funding_notice_id, params);
	}
	
//	펀딩 커뮤니티리스트 페이지 ------------------------------------------------------------------
	@RequestMapping("makerCommunityListPage")
	public String makerCommunityListPage() {
		return "www/maker/makerCommunityListPage";
	}
	
	//커뮤니티(리뷰) 리스트 조회
	@ResponseBody
	@RequestMapping("AJAXgetCommunityList")
	public List<FundingCommunityDto> AJAXgetCommunityList(long funding_id){
		return makerService.getCommunityList(funding_id);
	}
	
	//커뮤니티(리뷰) 작성자 조회
	@ResponseBody
	@RequestMapping("AJAXgetUser")
	public UserDto AJAXgetUser(long user_id) {
		return makerService.getUser(user_id);
	}
	
	//커뮤니티(리뷰) 댓글수 조회
	@ResponseBody
	@RequestMapping("AJAXgetCommunityReviewCount")
	public int AJAXgetCommunityReviewCount(long funding_review_id) {
		return makerService.getCommunityReviewCount(funding_review_id);
	}
	
	//커뮤니티 판매자 답글 존재 여부 조회
	@ResponseBody
	@RequestMapping("AJAXgetCommunityReviewExistCreatorUserId")
	public int AJAXgetCommunityReviewExistCreatorUserId(long funding_review_id,long user_creator_id) {
		return makerService.getCommunityReviewExistCreatorUserId(funding_review_id,user_creator_id);
	}
	
	//판매자 커뮤니티 답글 입력
	@ResponseBody
	@RequestMapping("AJAXinsertCommunityAnswer")
	public int AJAXinsertCommunityAnswer(@RequestBody FundingCommunityReviewDto params) {
		System.out.println(params.getThis_answer_id());
		return makerService.insertCommunityAnswer(params);
	}
	
	
//	펀딩 대시보드 페이지 ------------------------------------------------------------------
	@RequestMapping("makerDashBoardPage")
	public String makerDashBoardPage() {
		return "www/maker/makerDashBoardPage";
	}
	
	//펀딩 제목 조회
	@ResponseBody
	@RequestMapping(value = "AJAXgetFundingTitle" , method = RequestMethod.GET, produces = "text/html; charset=utf-8")
	public String AJAXgetFundingTitle(long funding_id) {
		return makerService.getFundingTitle(funding_id);
	}
	
	//펀딩 시작일 조회
	@ResponseBody
	@RequestMapping("AJAXgetFundingStartFromAndCloseAt")
	public FundingRewardDto AJAXgetFundingStartFromAndCloseAt(@RequestParam("funding_id") long funding_id) {
		return makerService.getFundingStartFromAndCloseAt(funding_id);
	}
	
	// 일별 주문합계 조회
	@ResponseBody
	@RequestMapping("AJAXgetDayChartData")
	public List<FundingOrderDto> AJAXgetDayChartData(long funding_id){
		return makerService.getDayChartData(funding_id);
	}
	
	// 누적 주문합계 조회
	@ResponseBody
	@RequestMapping("AJAXgetTotalChartData")
	public List<FundingOrderDto> AJAXgetTotalChartData(long funding_id){
		return makerService.getTotalChartData(funding_id);
	}
	
	// 총 후원금액 조회
	@ResponseBody
	@RequestMapping("AJAXgetTotalSupportPrice")
	public Integer AJAXgetTotalSupportPrice(long funding_id) {
		return makerService.getTotalSupportPrice(funding_id);
	}
	
	// 목표 달성금액 조회
	@ResponseBody
	@RequestMapping("AJAXgetTargetPrice")
	public int AJAXgetTargetPrice(long funding_id) {
		return makerService.getTargetPrice(funding_id);
	}
	
	// 후원자수 조회
	@ResponseBody
	@RequestMapping("AJAXgetSupportCount")
	public int AJAXgetSupportCount(long funding_id) {
		return makerService.getSupportCount(funding_id);
	}
	
	//남은 기간 조회
	@ResponseBody
	@RequestMapping("AJAXgetFundingDateDiff")
	public int AJAXgetFundingDateDiff(long funding_id) {
		return makerService.getFundingDateDiff(funding_id);
	}
	
	// 후원자 연령 퍼센트 조회
	@ResponseBody
	@RequestMapping("AJAXgetAgeChartData")
	public int[] AJAXgetAgeChartData(long funding_id) {
		return makerService.getAgeChartData(funding_id);
	}
	
	// 후원자 성별 퍼센트 조회
	@ResponseBody
	@RequestMapping("AJAXgetGenderChartData")
	public int[] AJAXgetGenderChartData(long funding_id) {
		return makerService.getGenderChartData(funding_id);
	}
	
	
}

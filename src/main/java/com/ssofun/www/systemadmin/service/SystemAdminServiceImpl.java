package com.ssofun.www.systemadmin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.dto.AdminDto;
import com.ssofun.dto.BizDto;
import com.ssofun.dto.FaqDto;
import com.ssofun.dto.FaqHelpStatusDto;
import com.ssofun.dto.FundingCategoryDto;
import com.ssofun.dto.FundingDto;
import com.ssofun.dto.QnaDto;
import com.ssofun.dto.Qna_ImageDto;
import com.ssofun.dto.UserCreatorDto;
import com.ssofun.dto.UserDto;
import com.ssofun.www.systemadmin.mapper.SystemAdminSqlMapper;

@Service
public class SystemAdminServiceImpl {
	
	@Autowired
	private SystemAdminSqlMapper systemAdminSqlMapper;
	
	
	public AdminDto getAdminByIdAndPw(AdminDto AdminDto) {
		AdminDto sessionSystemAdmin = systemAdminSqlMapper.getAdminByIdAndPw(AdminDto);
		
		return sessionSystemAdmin;
	}
	
	
//로그인관련
	
	//판매자로그인
	public AdminDto findShopAdminByIdAndPw(AdminDto adminDto) {
		return systemAdminSqlMapper.selectShopAdminByAndPw(adminDto);
	}
	
	//시스템관리자로그인
	public AdminDto findSystemAdminByIdAndPw(AdminDto adminDto) {
		return systemAdminSqlMapper.selectSystemAdminByAndPw(adminDto);
	}
	
	
	//adminlogin
	public AdminDto findAdminByIdAndPw(AdminDto adminDto) {
		
		AdminDto adminData = systemAdminSqlMapper.selectAdminByAndPw(adminDto);
		
		return adminData;
	}
	
	
	
	
	//미답변 qna리스트
	public List<Map<String, Object>> getUnansweredQnaList() {
		
		List<Map<String ,Object>> unanswerList = new ArrayList<>();
		
		List<QnaDto> getUnansweredQnaList = systemAdminSqlMapper.selectQnaByNonAnswer();
		//리스트받아온걸 for문 돌려서 해체한 다음 
		
		
		for(QnaDto qnaDto :getUnansweredQnaList) {
			Map<String, Object> map = new HashMap<>();
			
//			QnaDto qnaDto = systemAdminSqlMapper.
			int userId = qnaDto.getUser_id();
			
			UserDto userDto = systemAdminSqlMapper.selectUserDtoByUserId(userId);
			
			map.put("userDto", userDto);
			map.put("qnaDto",qnaDto);
		
			unanswerList.add(map);
		
		}
		
		
		return unanswerList;
	}
	
	
	//답변완료qnalist
	public List<Map<String, Object>> answerCompletedQnaList() {
		
		List<Map<String, Object>> answerCompleteList = new ArrayList<>();
		
		List<QnaDto> answerCompletedQnaList = systemAdminSqlMapper.selectQnaNotNullAnswer();
		
		for(QnaDto qnaDto:answerCompletedQnaList) {
			Map<String, Object> map = new HashMap<>();
			
			int userId = qnaDto.getUser_id();
			UserDto userDto = systemAdminSqlMapper.selectUserDtoByUserId(userId);
			
			map.put("userDto",userDto);
			map.put("qnaDto", qnaDto);
			
			answerCompleteList.add(map);
			
		}
		
		return answerCompleteList;
	}


	
	public Map<String, Object> getQnaData(int qna_id) {
		
		Map<String, Object> map = new HashMap<>();
		
		
//		UserDto userDto = systemAdminSqlMapper.;
		QnaDto qnaDto = systemAdminSqlMapper.selectQnaDataBYQnaId(qna_id);//qnaid에 해당되는 qna글정보를 가져옴
		UserDto userDto = systemAdminSqlMapper.selectUserDtoByUserId(qnaDto.getUser_id());//qnadto에 있는 uesrid를 userdto에 담아서 넘겨옴 
		
		
		List<Qna_ImageDto> Qna_ImageDtoList= systemAdminSqlMapper.selectQnaImageByQnaId(qna_id);
		
		map.put("UserDto", userDto);
		map.put("QnaDto", qnaDto);
		map.put("Qna_ImageDtoList", Qna_ImageDtoList);
		
	return map;
	}

	//qna답변 삽입(업데이트)
	public void updateQnaAnswer(QnaDto qnaDto) {
		systemAdminSqlMapper.updateQnaAnswer(qnaDto);
	}
	
	
	
	
	
	

//faq관련
	
	//faq글삽입
	public void systemAdminCreateFaq(FaqDto faqDto) {
		systemAdminSqlMapper.systemAdminCreateFaq(faqDto);
		System.out.println("service:"+faqDto.getTitle());
	}
	
	// faq 글목록
	public List<Map<String, Object>> getfaqList(){
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<FaqDto> faqDtoList = systemAdminSqlMapper.selectAllFaq();
		
		
		
		for(FaqDto faqDto : faqDtoList) {
			Map<String, Object> map = new HashMap<>();
			
			int adminId = faqDto.getAdmin_id();
			 
			AdminDto adminDto = systemAdminSqlMapper.selectAdminDtoByAdminId(adminId);
			 
			 
			 map.put("adminDto", adminDto);
			 map.put("faqDto",faqDto);
			 
			 list.add(map);
		}
		
		return list;
	}


	public Map<String, Object> getFaqData(int faqId){
		
		
		Map<String, Object> map = new HashMap<>();
		
		FaqDto faqDto = systemAdminSqlMapper.selectFaqDtoByfaqId(faqId);
		AdminDto adminDto = systemAdminSqlMapper.selectAdminDtoByAdminId(faqDto.getAdmin_id());
		
		map.put("faqDto", faqDto);
		map.put("adminDto", adminDto);
		return map;
	}

	//faq글수정
	public void updateFaqData(FaqDto faqDto) {
		systemAdminSqlMapper.updateFaqDataByFaqId(faqDto);
	}
	
	
	//faq글삭제

	public void deleteFaqData(int faqId) {
		systemAdminSqlMapper.deleteFaqDataByFaqId(faqId);
	}
	

	
	public void FaqHelpStatus(FaqHelpStatusDto faqHelpStatusDto) {
		
		systemAdminSqlMapper.insertFaqHelpStatus(faqHelpStatusDto);
		
		
		
	}
	
	
	
	
	
	
	
	
	//faq도움 상위10개의 리스트 
	public List<Map<String, Object>> selectTop10HelpfulFaqList() {
		
		List<Map<String, Object>> topFaqlist = new ArrayList<>();
		List<FaqDto> faqHelpStatusDtoList = systemAdminSqlMapper.selectTop10HelpfulFaq();
		
		for(FaqDto faqHelpStatusDto:faqHelpStatusDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			int faqId = faqHelpStatusDto.getFaq_id();
			
			FaqDto faqDto = systemAdminSqlMapper.selectFaqDtoByfaqId(faqId);
			System.out.println(faqDto);
			AdminDto adminDto = systemAdminSqlMapper.selectAdminDtoByAdminId(faqDto.getAdmin_id());
			
			map.put("faqDto",faqDto);
			map.put("adminDto", adminDto);
			map.put("faqHelpStatusDto", faqHelpStatusDto);
					
			topFaqlist.add(map);
			}
			return topFaqlist;
		}
		
		
		

//		List<Map<String ,Object>> unanswerList = new ArrayList<>();
//		
//		List<QnaDto> getUnansweredQnaList = systemAdminSqlMapper.selectQnaByNonAnswer();
//		//리스트받아온걸 for문 돌려서 해체한 다음 
//		
//		
//		for(QnaDto qnaDto :getUnansweredQnaList) {
//			Map<String, Object> map = new HashMap<>();
//			
//			QnaDto qnaDto = systemAdminSqlMapper.
//			int userId = qnaDto.getUser_id();
//			
//			UserDto userDto = systemAdminSqlMapper.selectUserDtoByUserId(userId);
//			
//			map.put("userDto", userDto);
//			map.put("qnaDto",qnaDto);
//		
//			unanswerList.add(map);
		
	
	
	
	
//companyManagement관련, 입점사관리
	
	//업체등록
	public void insertcreateCompanyAccount(BizDto bizDto) {
		systemAdminSqlMapper.createCompanyAccount(bizDto);
		
		};
	
	
	//입점사목록가져오기()
	public List<Map<String, Object>> getBizDtoListContainCount(){
		List<Map<String, Object>> bizList = new ArrayList<>();
		List<BizDto> bizDtoList	= systemAdminSqlMapper.bizDtoList();
		
		for(BizDto bizDto : bizDtoList) {
			Map<String, Object> map = new HashMap<>();
			int biz_id = bizDto.getBiz_id();
			int adminCount = systemAdminSqlMapper.countAdminByBizId(biz_id); 
			
			map.put("bizDto", bizDto);
			map.put("adminCount",adminCount);//biz_id에 해당하는 판매자수
			
			
			bizList.add(map);
		}
		
		return bizList; 
	}
	
	//입점회사목록가져오기
	public List<BizDto> getBizDtoList (){
		List<BizDto> bizList = systemAdminSqlMapper.bizDtoList();
		
		return bizList;
	}

	
	
	//biz_id로 해당되는 글정보가져오기
	public BizDto getBizData(int biz_id) {
		
		BizDto bizDto = systemAdminSqlMapper.selectBizDataBybizId(biz_id);
		System.out.println("service"+bizDto.getBiz_name());
		
		return bizDto;
		
	};
	
	//biz_id에 해당하는 판매자수 가져오기
	public int getAdminCount(int biz_id) {
		int adminCount = systemAdminSqlMapper.countAdminByBizId(biz_id);
		
		return adminCount;
	}
	
	
	//biz_id로 bizDto가져와서 입점업체정보수정
	public void updateCompanyData(BizDto bizDto) {
		systemAdminSqlMapper.updateCompanyData(bizDto);

	}
	
	
	
	
	
//판매자관리
	
	//bizid에 소속된 판매자리스트 
	public List<Map<String, Object>> getAdminDataByBizId(int biz_id){
		
		List<Map<String, Object>> adminDtoList = new ArrayList<>();
		
		List<AdminDto> adminDtoListByBizId = systemAdminSqlMapper.selectAdminDtoListByBizId(biz_id);
		
		BizDto bizDto = systemAdminSqlMapper.selectBizDataBybizId(biz_id);
		for(AdminDto adminDto:adminDtoListByBizId) {
			
			Map<String, Object> map = new HashMap<>();
			
			
			
			map.put("bizDto", bizDto);
			map.put("adminDto", adminDto);
			
			adminDtoList.add(map);
			}
			return adminDtoList;
		}
	
	//adminid로 판매자정보가져옴(bizid로 adminDto,bizDto엮음)
	public Map<String, Object> getAdminData(int admin_id){
		Map<String, Object> map = new HashMap<>();
		
		
		AdminDto adminDto = systemAdminSqlMapper.selectAdminDtoByAdminId(admin_id);
		
		int bizId = adminDto.getBiz_id(); 
		BizDto	bizDto = systemAdminSqlMapper.selectBizDataBybizId(bizId);

		
		map.put("bizDto", bizDto);
		map.put("adminDto", adminDto);
		
		return map;
	}
	
	//bizId로 해당되는 bizDto정보가져옴
	public Map<String, Object> selectBizDataBybizId(int bizId){
		
		Map<String, Object> map = new HashMap<>();

		
		
		BizDto bizDto = systemAdminSqlMapper.selectBizDataBybizId(bizId);
		
		map.put("bizDto", bizDto);
		
		return map;
	}
	

	
	//판매자등록
	public void createAdminAccount(AdminDto adminDto) {
		systemAdminSqlMapper.createVenderAccount(adminDto);
	}
	
	
	
	//전체판매자리스트(venderManagementMainPage)
	//bizid에 소속된 판매자리스트 
	public List<Map<String, Object>> getAllAdminList(){
		List<Map<String, Object>> adminList = new ArrayList<>();
		
		List<AdminDto> adminDtoList = systemAdminSqlMapper.selectAdminDtoList();

		for(AdminDto adminDto:adminDtoList) {
			Map<String, Object> map = new HashMap<>();
			int bizId = adminDto.getBiz_id();
			
			BizDto bizDto = systemAdminSqlMapper.selectBizDataBybizId(bizId);
			
			map.put("adminDto", adminDto);
			map.put("bizDto", bizDto);
			adminList.add(map);
		}
		
		return adminList ;
	}
	
	
	//admin_id로 adminDto정보 가져옴
	public AdminDto getAdminDataByAdminId(int admin_id) {
		
		AdminDto adminDto = systemAdminSqlMapper.getAdminDataByAdminId(admin_id);
		
		return adminDto;
	}
	
	
	//판매자계정활성화
	public void adminAccountActivation(int admin_id) {
		systemAdminSqlMapper.adminAccountActivation(admin_id);
	}
	
	
	
	//판매자계정비활성화
	public void adminAccountDeactivation(int admin_id) {
		systemAdminSqlMapper.adminAccountDeactivation(admin_id);
	}
	
	
	
	
	
//사이트관리
	
	
	//펀딩사이트관리, 미승인 리스트
	public List<Map<String, Object>> getUnauthorizedFunding(){
		
		List<Map<String, Object>> unauthorizedFundingList = new ArrayList<>();
		List<FundingDto> unauthorizedFundingDto = systemAdminSqlMapper.getUnauthorizedFunding();
		
		for(FundingDto fundingDto : unauthorizedFundingDto) {
			Map<String, Object> map = new HashMap<>();
			 
			int creatorId = (int) fundingDto.getUser_creator_id();
			UserCreatorDto userCreatorDto = (UserCreatorDto) systemAdminSqlMapper.fundingCreatorBycreatorId(creatorId);
			
	
			
			map.put("userCreatorDto", userCreatorDto);
			map.put("fundingDto", fundingDto);
			
			unauthorizedFundingList.add(map);
		}
		
		
		return unauthorizedFundingList;
	}

	
	
	
	
	//펀딩사이트관리, 승인리스트
	public List<Map<String, Object>> getauthorizedFunding(){
		
		List<Map<String, Object>> authorizedFundingList = new ArrayList<>();
		List<FundingDto> authorizedFundingDto = systemAdminSqlMapper.getFundingData();
		
		for(FundingDto fundingDto : authorizedFundingDto) {
			Map<String, Object> map = new HashMap<>();
			 
			int creatorId = (int) fundingDto.getUser_creator_id();
			UserCreatorDto userCreatorDto = (UserCreatorDto) systemAdminSqlMapper.fundingCreatorBycreatorId(creatorId);
			
			
			
			
			map.put("userCreatorDto", userCreatorDto);
			map.put("fundingDto", fundingDto);
			
			authorizedFundingList.add(map);
		}
		
		
		return authorizedFundingList;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//펀딩승인
	public void fundingApproval(int funding_id) {
	
		systemAdminSqlMapper.fundingApproval(funding_id);
	}
	
	

	
	
	
	
	
	//펀딩카테고리추가
	public void fundingCategoryAdd(FundingCategoryDto fundingCategoryDto) {
		systemAdminSqlMapper.fundingCategoryAdd(fundingCategoryDto);
		
	}
	
	//펀딩카테고리 목록가져옴
	public List<FundingCategoryDto> getFundingCategpryData(){
		List<FundingCategoryDto> fundingCategory = systemAdminSqlMapper.getFundingCategpryDto();
		return fundingCategory;
	}
	
	
	
	
	

	
	

	
	
	
	
	
}

package com.ssofun.www.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssofun.dto.FundingDto;
import com.ssofun.dto.FundingOrderDto;
import com.ssofun.dto.FundingRewardDto;
import com.ssofun.dto.FundingRewardOrderDto;
import com.ssofun.dto.FundingThumbnailDto;
import com.ssofun.dto.UserDto;

public interface UserSqlMapper {

//	카카오 로그인 및 회원가입 -----------------------------------------
	
	//---카카오 아이디로 계정정보 출력
	public UserDto selectUserByKakaoId(String id);
	//---연령대로 임시 출생년도 구하기
	public String selectBirthByAgeRange(String age);
	//---카카오계정으로 회원가입
	public long insertUserByKakao(UserDto userDto);
	
	
	
	//---유저아이디로 계정정보 출력
	public UserDto selectUserByUserId(long user_id);
	//---간편가입회원 이메일 정보 수정
	public void updateEmail(@Param("user_id") long user_id, @Param("userDto") UserDto userDto);
	//---간편가입회원 이름 및 마케팅 수신동의 수정
	public void updateUserNameAgree(@Param("user_id") long user_id, @Param("userDto") UserDto userDto);
	
	
	
	
	//---유저 이름 조회
	public String selectUserName(long user_id);
	//---이메일 회원가입
	public long insertEmailJoin(UserDto params);
	//---이메일 로그인
	public UserDto selectUserByEmailPassword(UserDto params);
	
	
	
	
	//---펀딩 주문목록 조회
	public List<FundingOrderDto> selectFundingOrderList(long user_id);
	//---펀딩 리워드 주문목록 조회
	public List<FundingRewardOrderDto> selectFundingRewardOrderList(long funding_order_id);
	//---펀딩 리워드 조회
	public FundingRewardDto selectFundingReward(long funding_reward_id);
	//---펀딩 조회
	public FundingDto selectFunding(long funding_id);
	//---펀딩 섬네일 목록 조회
	public List<FundingThumbnailDto> selectFundingThumbnailList(long funding_id);
	
	
	
	
	//---찜한 펀딩 목록 조회
	public List<FundingDto> selectLikeFundingList(long user_id);
	//---펀딩 카테고리명 조회
	public String selectFundingCategoryName(long funding_category_id);
	//---펀딩 달성액 조회
	public long selectAchievementPrice(long funding_id);
	//---남은 펀딩기간 조회
	public int selectDday(long funding_id);
	
	
	
	//---유저 핸드폰 번호 수정
	public void updateUserPhone(@Param("user_id") long user_id, @Param("userDto") UserDto userDto);
	//---창작자 아이디 출력
	public Long selectUserCreatorId(long user_id);
	


}

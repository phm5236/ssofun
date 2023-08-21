package com.ssofun.www.user.service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.ssofun.dto.FundingDto;
import com.ssofun.dto.FundingOrderDto;
import com.ssofun.dto.FundingRewardDto;
import com.ssofun.dto.FundingRewardOrderDto;
import com.ssofun.dto.FundingThumbnailDto;
import com.ssofun.dto.UserDto;
import com.ssofun.www.user.mapper.UserSqlMapper;

@Service
public class UserServiceImpl {
	
	@Autowired UserSqlMapper userSqlMapper;
	
	public String getKakaoApiUrl() {
		
		String client_id = "11bfe947a01b42a63dcfb6d3cbf9f8b2";
		String redirect_uri = "http://localhost:8181/www/user/kakaoOauthPage";
		String kakaoApiUrl 
		= "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="
		+client_id+"&redirect_uri="+redirect_uri+"&scope=age_range,gender";

		return kakaoApiUrl;
	}

	public String getKakaoAccessToken(String code) {
		String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        String client_id = "11bfe947a01b42a63dcfb6d3cbf9f8b2";
		String redirect_uri = "http://localhost:8181/www/user/kakaoOauthPage";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id="+client_id); // TODO REST_API_KEY 입력
            sb.append("&redirect_uri="+redirect_uri); // TODO 인가코드 받은 redirect_uri 입력
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON 타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            // Gson 라이브러리에 포함된 클래스로 JSON 파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;
    }
	
	public Map<String, Object> checkKakaoUser(String access_token) throws Exception {
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		Map<String, Object> map = new HashMap();
		
		UserDto userDto = null;
		String reloadUrl = null;
	    //access_token을 이용하여 사용자 정보 조회;
	    try {
	       URL url = new URL(reqURL);
	       HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	       conn.setRequestMethod("POST");
	       conn.setDoOutput(true);
	       conn.setRequestProperty("Authorization", "Bearer " + access_token); //전송할 header 작성, access_token전송

	       //결과 코드가 200이라면 성공
	       int responseCode = conn.getResponseCode();
	       System.out.println("responseCode : " + responseCode);

	       //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	       BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	       String line = "";
	       String result = "";

	       while ((line = br.readLine()) != null) {
	           result += line;
	       }
	       System.out.println("response body : " + result);

	       //Gson 라이브러리로 JSON파싱
	       JsonParser parser = new JsonParser();
	       JsonElement element = parser.parse(result);

	       String id = element.getAsJsonObject().get("id").getAsString(); //ID 가져오기
	       
	       userDto = userSqlMapper.selectUserByKakaoId(id);
	       

	       
	       if(userDto == null) {
	    	   
	    	   userDto = new UserDto();
	    	   
	    	   String nickname = element.getAsJsonObject().get("properties").getAsJsonObject().get("nickname").getAsString();
	    	   
	    	   boolean hasEmail = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_email").getAsBoolean();
	    	   String email = "";
	    	   if(hasEmail){
	    		   email = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("email").getAsString();
	    	   }
	    	   
	    	   
	    	   boolean hasGender = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_gender").getAsBoolean();
	    	   int gender = 0; // 0은 남자
	    	   if(hasGender) {
	    		   String temp = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("gender").getAsString();
	    		   if(temp.equals("female")) {
	    			   gender = 1; // 1은 여자
	    		   }
	    	   }	    	   
	    	   
	    	   boolean hasAgeRange = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_age_range").getAsBoolean();
	    	   String ageRange = "";
	    	   if(hasAgeRange) {
	    		   ageRange = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("age_range").getAsString();
	    	   }
	    	   
	    	   br.close();
	    	   
	    	   System.out.println("id : " + id); //tb_user -> token에 넣을값
	    	   System.out.println("nickname : " + nickname); //tb_user -> name, nickname에 넣을값
	    	   System.out.println("email : " + email); //tb_user -> email에 넣을값
	    	   System.out.println("gender : " + gender); //tb_user -> gender에 넣을값
	    	   System.out.println("ageRange : " + ageRange); //tb_user -> birth에 넣을값 -> 변환해서 넣어야함 연령대만 알면됨
	    	   
	    	   userDto.setToken(id);
	    	   userDto.setEmail(email);
	    	   userDto.setGender(gender);
	    	   userDto.setName(nickname);
	    	   userDto.setNickname(nickname);
	    	   
	    	   
	    	   String[] age = ageRange.split("~");
	    	   String birthOrgin = userSqlMapper.selectBirthByAgeRange(age[0].trim())+"-01-01"; // 출생년도만 추출하고 나머지는 임의값으로 대체
	    	   
	    	   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    	   Date birth = formatter.parse(birthOrgin);
	    	   
	    	   userDto.setBirth(birth);
	    	   
	    	   userSqlMapper.insertUserByKakao(userDto);
	    	   long user_id = userDto.getUser_id();
	    	   
	    	   userDto = userSqlMapper.selectUserByUserId(user_id);
	    	   reloadUrl = "http://localhost:8181/www/user/userSimpleJoinPage?user_id="+user_id;
	    	   
	    	   map.put("user", userDto);
	    	   map.put("url", reloadUrl);
	    	   
	       }else {
	    	   reloadUrl = "http://localhost:8181/www/funding/fundingMainPage";
	    	   map.put("user", userDto);
	    	   map.put("url", reloadUrl);
    	   
	       }


	       } catch (IOException e) {
	            e.printStackTrace();
	       }
	    
		return map;
		
	}
	
//	간편 가입페이지 -----------------------------------------------------------------------------------

//	유저정보 가져오기
	public UserDto getUserByUserId(long user_id) {
		return userSqlMapper.selectUserByUserId(user_id);
	}

//	이메일 변경
	public int updateEmail(long user_id, UserDto params) {
		userSqlMapper.updateEmail(user_id,params);
		
		UserDto userDto = userSqlMapper.selectUserByUserId(user_id);
		if(userDto.getEmail().equals(params.getEmail())) {
			return 1;			
		}
		return 0;
	}

//	이름 및 마케팅 수신 동의 변경
	public int updateUserNameAgree(long user_id, UserDto params) {
		userSqlMapper.updateUserNameAgree(user_id,params);
		
		UserDto userDto = userSqlMapper.selectUserByUserId(user_id);
		if(userDto.getName().equals(params.getName()) && userDto.getAgree_sms() == params.getAgree_sms()) {
			return 1;			
		}
		
		return 0;
	}

//	유저 이름 출력
	public String getUserName(long user_id) {
		String name = userSqlMapper.selectUserName(user_id);
		return name;
	}

	
//	이메일 간편가입 페이지 ---------------------------------------------------------------------------------------
	
	public long insertEmailJoin(UserDto params) {
		userSqlMapper.insertEmailJoin(params);
		long user_id = params.getUser_id();
		return user_id;
	}
	
	
//	이메일 로그인 
	public UserDto loginWithEmail(UserDto params) {
		UserDto userDto = userSqlMapper.selectUserByEmailPassword(params);
		if(userDto != null) {
			return userDto;
		}else {			
			return null;
		}
	}

	
	
	
	
//	펀딩 후원내역 조회
	public List<FundingOrderDto> getFundingOrderList(long user_id) {
		List<FundingOrderDto> orderList = userSqlMapper.selectFundingOrderList(user_id);
		List<FundingRewardOrderDto> rewardList = null;
		FundingRewardDto fundingRewardDto = null;

		
		for(FundingOrderDto fundingOrderDto :orderList) {
			long funding_order_id = fundingOrderDto.getFunding_order_id();
			rewardList = userSqlMapper.selectFundingRewardOrderList(funding_order_id);
			
			for(FundingRewardOrderDto fundingRewardOrderDto : rewardList) {
				long funding_reward_id = fundingRewardOrderDto.getFunding_reward_id();
				fundingRewardDto = userSqlMapper.selectFundingReward(funding_reward_id);
				
				fundingRewardOrderDto.setFundingRewardDto(fundingRewardDto);
				
				long funding_id = fundingRewardDto.getFunding_id();
				FundingDto fundingDto = userSqlMapper.selectFunding(funding_id);
				
				List<FundingThumbnailDto> thumbnailList = userSqlMapper.selectFundingThumbnailList(funding_id);
				
				fundingDto.setThumbnailList(thumbnailList);
				
				fundingOrderDto.setFundingDto(fundingDto);
			}
			fundingOrderDto.setRewardList(rewardList);
		}
		
		return orderList;
	}

	
//	펀딩 찜한 프로젝트 목록 조회
	public List<FundingDto> getLikeFundingList(long user_id) {
		List<FundingDto> fundingList = userSqlMapper.selectLikeFundingList(user_id);
		
		for(FundingDto fundingDto : fundingList) {
			long funding_id = fundingDto.getFunding_id();
			List<FundingThumbnailDto> thumbnailList = userSqlMapper.selectFundingThumbnailList(funding_id);
			
			fundingDto.setThumbnailList(thumbnailList);
		}
		return fundingList;
	}

//	펀딩 카테고리명 조회
	public String getFundingCategoryName(long funding_category_id) {
		return userSqlMapper.selectFundingCategoryName(funding_category_id);
	}

//	펀딩 달성 금액 조회
	public long getAchievementPrice(long funding_id) {
		return userSqlMapper.selectAchievementPrice(funding_id);
	}

	public int getDday(long funding_id) {
		return userSqlMapper.selectDday(funding_id);
	}

	
	// 핸드폰 번호 수정
	public int updateUserPhone(long user_id, UserDto params) {
		if(user_id != 0 && params != null) {
			userSqlMapper.updateUserPhone(user_id,params);
			return 1;
		}
		return 0;
	}
	
	
//	창작자 아이디 출력
	public Long getUserCreatorId(long user_id) {
		return userSqlMapper.selectUserCreatorId(user_id);
	}






}

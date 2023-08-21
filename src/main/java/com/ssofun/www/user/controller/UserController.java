package com.ssofun.www.user.controller;

import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssofun.dto.FundingDto;
import com.ssofun.dto.FundingOrderDto;
import com.ssofun.dto.UserDto;
import com.ssofun.www.user.service.UserServiceImpl;

@Controller
@RequestMapping("www/user/*")
public class UserController {
	
	@Autowired UserServiceImpl userService;
	
//	로그인 페이지
	@RequestMapping("userLoginPage")
	public String userLoginPage(){

		return "www/user/userLoginPage";
	}
	
//	@RequestMapping("adminLoginPage")
//	public String adminLoginPage() {
//		return "www/user/adminLoginPage";
//	}
	
//	카카오 로그인 영역 -----------------------------------------------------------------------------------------------
	
//	카카오 rest_api_key
	@ResponseBody
	@RequestMapping("AJAXkakaoLogin")
	public String AJAXkakaoLogin(){
		String kakaoApiUrl = userService.getKakaoApiUrl();
		return kakaoApiUrl;
	}
	
//	카카오 로그인 인증
	@RequestMapping("kakaoOauthPage")
	public String kakaoOauthPage(@RequestParam(required = false, defaultValue = "") String code) throws Exception{

		if(!code.equals("")) {
			String access_token = userService.getKakaoAccessToken(code);					
			System.out.println("access_token: "+access_token);
			return "redirect:../user/accessTokenPage?access_token="+access_token;
		}		
		return "";
	}
	
	
	@RequestMapping("accessTokenPage")
	public String accessTokenPage() {
		
		return "www/user/accessTokenPage";
	}
	
	@ResponseBody
	@RequestMapping("AJAXcheckKakaoUser")
	public String AJAXcheckKakaoUser(HttpSession session ,@RequestParam String access_token) throws Exception {		
		System.out.println(access_token);
		Map<String, Object> map = userService.checkKakaoUser(access_token);	
		session.setAttribute("user", (UserDto) map.get("user"));
		String url = (String) map.get("url");
		return url;
	}
	
	
//	SNS 회원가입자 추가 정보 페이지 --------------------------------------------------------------------------------------
	
	@RequestMapping("userSimpleJoinPage")
	public String userSimpleJoinPage() {
		return "www/user/userSimpleJoinPage";
	}
	
	@ResponseBody
	@RequestMapping("AJAXgetSimpleJoinUser")
	public UserDto AJAXgetSimpleJoinUser(long user_id) {
		return userService.getUserByUserId(user_id);
	}
	
	@ResponseBody
	@RequestMapping("AJAXgetUserInfo")
	public UserDto AJAXgetUserInfo(long user_id) {
		return userService.getUserByUserId(user_id);
	}
	
	//유저 이메일 변경
	@ResponseBody
	@RequestMapping("AJAXupdateEmail")
	public int AJAXupdateEmail(@RequestParam("user_id") long user_id, @RequestBody UserDto params) {

		return userService.updateEmail(user_id, params);
	}
	
	//유저 이름 및 마케팅 수신동의 변경
	@ResponseBody
	@RequestMapping("AJAXupdateUserNameAgree")
	public int AJAXupdateUserNameAgree(@RequestParam("user_id") long user_id, @RequestBody UserDto params) {
		System.out.println("user_id: "+user_id);
		System.out.println("name: "+params.getName());
		System.out.println("sms: "+params.getAgree_sms());
		return userService.updateUserNameAgree(user_id,params);
	}
	
//	회원가입 완료 페이지 -------------------------------------------------------------------------------------
	@RequestMapping("userJoinSuccessPage")
	public String userJoinSuccessPage(HttpSession session, long user_id) {
		session.setAttribute("user", userService.getUserByUserId(user_id));
		return "www/user/userJoinSuccessPage";
	}
	
	//유저 이름 조회
	@ResponseBody
	@RequestMapping(value="AJAXgetUserName", method = RequestMethod.GET, produces = "text/html; charset=utf-8")
	public String AJAXgetUserName(long user_id) {
		return userService.getUserName(user_id);
	}
	
	
//	회원가입 페이지 -------------------------------------------------------------------------------------------
	@RequestMapping("userJoinPage")
	public String userJoinPage() {
		return "www/user/userJoinPage";
	}
	
	@ResponseBody
	@RequestMapping("AJAXinsetEmailJoin")
	public long AJAXinsetEmailJoin(@RequestBody UserDto params) {
		return userService.insertEmailJoin(params);
	}
	
	
//	이메일 로그인 페이지 -------------------------------------------------------------------------------------------
	
	@ResponseBody
	@RequestMapping("AJAXloginWithEmail")
	public UserDto AJAXloginWithEmail(HttpSession session ,UserDto params) {	
		UserDto userDto = userService.loginWithEmail(params);
		session.setAttribute("user", userDto);
		
		return userDto;
	}
	
	@ResponseBody
	@RequestMapping("AJAXlogout")
	public int logout(HttpSession session) {
		UserDto userDto = (UserDto) session.getAttribute("user");
		if(userDto != null) {
			session.invalidate();
			return 1;
		}else {
			return 0;
		}
		
	}
	
	
	
//	세션 받아서 프론트로 보내기 ----------------------------------------------------------------------------------------------------------
	
	// 유저 세션 확인후 유저 아이디 보내기
	@ResponseBody
	@RequestMapping("AJAXgetUserSession")
	public Long AJAXgetUserSession(HttpSession session) {
		UserDto userDto =  (UserDto) session.getAttribute("user");
		if(userDto != null) {
			return userDto.getUser_id();
		}else {			
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping("AJAXsetUserSession")
	public int AJAXsetUserSession(HttpSession session) {
		UserDto userDto =  (UserDto) session.getAttribute("user");
		if(userDto != null) {
			session.setAttribute("user", userDto);
			return 1;
		}else {			
			return 0;
		}
	}
	
	@ResponseBody
	@RequestMapping("AJAXgetUserCreatorIdSessoin")
	public Long AJAXgetUserCreatorIdSessoin(HttpSession session) {
		UserDto userDto =  (UserDto) session.getAttribute("user");
		return userService.getUserCreatorId(userDto.getUser_id());
	}
	
	
	
//	마이페이지 펀딩영역 -----------------------------------------------------------------------------------------------
	
	@RequestMapping("userMyPage")
	public String userMyPage() {
		return "www/user/userMyPage";
	}
	
	//펀딩 후원 내역 페이지
	@RequestMapping("userMyFundingOrderListPage")
	public String userMyFundingOrderListPage() {
		return "www/user/userMyFundingOrderListPage";
	}
	
	//펀딩 후원 내역 조회
	@ResponseBody
	@RequestMapping("AJAXgetFundingOrderList")
	public List<FundingOrderDto> AJAXgetFundingOrderList(long user_id) {
		return userService.getFundingOrderList(user_id);
	}
	
	//펀딩 찜한 프로젝트 목록 페이지
	@RequestMapping("userMyFundingLikeListPage")
	public String userMyFundingLikeListPage() {
		return "www/user/userMyFundingLikeListPage";
	}
	
	
	@ResponseBody
	@RequestMapping("AJAXgetLikeFundingList")
	public List<FundingDto> AJAXgetLikeFundingList(long user_id){
		return userService.getLikeFundingList(user_id);
	}
	
	@ResponseBody
	@RequestMapping(value = "AJAXgetFundingCategoryName", method = RequestMethod.GET, produces = "text/html; charset=utf-8")
	public String AJAXgetFundingCategoryName(long funding_category_id) {
		return userService.getFundingCategoryName(funding_category_id);
	}
	
	@ResponseBody
	@RequestMapping("AJAXgetAchievementPrice")
	public long AJAXgetAchievementPrice(long funding_id) {
		return userService.getAchievementPrice(funding_id);
	}
	
	@ResponseBody
	@RequestMapping("AJAXgetDday")
	public int AJAXgetDday(long funding_id) {
		return userService.getDday(funding_id);
	}
	
	
	// 연락처 수정
	@ResponseBody
	@RequestMapping("AJAXupdateUserPhone")
	public int AJAXupdateUserPhone(@RequestParam("user_id") long user_id, @RequestBody UserDto params) {
		return userService.updateUserPhone(user_id,params);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

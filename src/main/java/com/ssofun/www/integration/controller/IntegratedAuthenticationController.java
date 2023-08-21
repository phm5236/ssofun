package com.ssofun.www.integration.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssofun.dto.AdminDto;
import com.ssofun.dto.UserDto;
import com.ssofun.www.integration.service.IntegratedAuthenticationService;

@Controller
public class IntegratedAuthenticationController {

	@Autowired
	private IntegratedAuthenticationService integratedAuthenticationService;
	
	//사용자 로그인
	@RequestMapping("www/loginPage")
	public String userLoginPage(HttpSession session) {
		
		if(session.getAttribute("user") != null) {
			return "redirect:./testHome";
		}
		
		return "integratedAuthentication/userLoginPage";
	}

	@RequestMapping("www/loginProcess")
	public String userLoginProcess(HttpSession session, UserDto params) {

		UserDto user = integratedAuthenticationService.findUserByIdAndPw(params);
		
		if(user == null) {
			return "integratedAuthentication/loginFailed";
		}
		
		
		session.setAttribute("user", user);
		
		return "redirect:./testHome";
	}
	
	//샵 관리자 로그인
	@RequestMapping("admin/loginPage")
	public String adminLoginPage(HttpSession session) {
		
		if(session.getAttribute("shopAdmin") != null) {
			return "redirect:./adminMainPage";
		}
		
		return "integratedAuthentication/shopAdminLoginPage";
	}
	
	@RequestMapping("admin/loginProcess")
	public String adminLoginProcess(HttpSession session, AdminDto params) {
		
		
		AdminDto shopAdmin = integratedAuthenticationService.findShopAdminByIdAndPw(params);
		
		if(shopAdmin == null) {
			return "integratedAuthentication/loginFailed";
		}
		
		session.setAttribute("shopAdmin", shopAdmin);
		
		return "redirect:./adminMainPage";
	}
	
	@RequestMapping("sysadmin/loginPage")
	public String sysadminLoginPage(HttpSession session) {

		if(session.getAttribute("systemAdmin") != null) {
			return "redirect:./testHome";
		}
		
		return "integratedAuthentication/systemAdminLoginPage";
	}
	
	@RequestMapping("sysadmin/loginProcess")
	public String systemAdminLoginProcess(HttpSession session, AdminDto params) {

		AdminDto systemAdmin = integratedAuthenticationService.findSystemAdminByIdAndPw(params);
		if(systemAdmin == null) {
			return "integratedAuthentication/loginFailed";
		}
		
		
		session.setAttribute("systemAdmin", systemAdmin);
		
		return "redirect:./testHome";
	}
	
	@RequestMapping("sysadmin/testHome")
	public String systemAdminTestHome() {
		
		return "integratedAuthentication/testSystemHome";
	}
	
	
	
	
	
}

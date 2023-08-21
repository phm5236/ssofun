package com.ssofun.www.store.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssofun.dto.UserDto;

@RestController
@RequestMapping("/store/*")
public class RestCustomerController {
	// 로그인이 되어있는지 확인
		@RequestMapping("getCustomerId")
		public Map<String, Object> getCustomerId(HttpSession session) {
			
			Map<String, Object> map = new HashMap<>();
			
			UserDto sessionUser = (UserDto) session.getAttribute("user");
			
			if (sessionUser == null) {
				map.put("result", "fail");	
				map.put("reason", "로그인이 되어있지 않습니다.");
			} else {
				map.put("result", "success");
				map.put("id", sessionUser.getUser_id());		
			}
			
			return map;
		}
}

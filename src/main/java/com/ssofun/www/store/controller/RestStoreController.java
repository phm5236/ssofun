package com.ssofun.www.store.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssofun.dto.ProductFavoritDto;
import com.ssofun.dto.ProductUserDto;
import com.ssofun.dto.UserDto;
import com.ssofun.www.store.service.StoreServiceImpl;

@RestController
@RequestMapping("www/store/*")
public class RestStoreController {
	
	@Autowired
	private StoreServiceImpl storeService;
	
	@RequestMapping("toggleLike")
	public Map<String , Object> toggleLike(HttpSession session, ProductFavoritDto  params){
		Map<String , Object> map = new HashMap<>();

		UserDto sessionUser = (UserDto) session.getAttribute("user");
		params.setUser_id((int) sessionUser.getUser_id());
		System.out.println(params.getUser_id());
		System.out.println(params.getProduct_id());
		storeService.toggleLike(params);
		
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("isLiked")
	public Map<String, Object> isLiked(HttpSession session, ProductFavoritDto  params){
		Map<String , Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("user");
		
		if(sessionUser == null) {
			map.put("result", "fail");
			map.put("reason", "로그인되어있지않습니다.");
			return map;
		}
		
		params.setUser_id((int) sessionUser.getUser_id());
		
		map.put("result", "success");
		map.put("isLiked", storeService.isLiked(params));
		
		return map;
	}
	
	
	@RequestMapping("getTotalLikeCount")
	public Map<String, Object> getTotalLikeCount(int ProductId){
		Map<String , Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("count", storeService.getTotalLike(ProductId));
		
		return map;
	}
	
}

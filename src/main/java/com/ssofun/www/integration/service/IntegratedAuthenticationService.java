package com.ssofun.www.integration.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.dto.AdminDto;
import com.ssofun.dto.UserDto;
import com.ssofun.www.integration.mapper.IntegratedAuthenticationSqlMapper;

@Service
public class IntegratedAuthenticationService {

	@Autowired
	private IntegratedAuthenticationSqlMapper integratedAuthenticationSqlMapper;
	
	public UserDto findUserByIdAndPw(UserDto params) {
		return integratedAuthenticationSqlMapper.selectUserByIdAndPw(params);  
	}
	public AdminDto findShopAdminByIdAndPw(AdminDto params) {
		return integratedAuthenticationSqlMapper.selectShopAdminByIdAndPw(params);  
	}
	public AdminDto findSystemAdminByIdAndPw(AdminDto params) {
		return integratedAuthenticationSqlMapper.selectSystemAdminByIdAndPw(params);  
	}
	
}

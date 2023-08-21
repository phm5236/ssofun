package com.ssofun.www.integration.mapper;

import com.ssofun.dto.AdminDto;
import com.ssofun.dto.UserDto;

public interface IntegratedAuthenticationSqlMapper {
	
	public UserDto selectUserByIdAndPw(UserDto params);
	public AdminDto selectShopAdminByIdAndPw(AdminDto params);
	public AdminDto selectSystemAdminByIdAndPw(AdminDto params);
	
	
}

package com.ssofun.www.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.dto.FaqDto;
import com.ssofun.dto.FaqHelpStatusDto;
import com.ssofun.www.systemadmin.mapper.SystemAdminSqlMapper;

@Service
public class FaqServiceImpl {

	@Autowired
	private SystemAdminSqlMapper systemAdminSqlMapper;
	
	public List<FaqDto> selectFaqFunding() {
		return systemAdminSqlMapper.selectFaqFunding();
	}
	
	
	public List<FaqDto> selectFaqStore() {
		return systemAdminSqlMapper.selectFaqStore();
	}
	
	public List<FaqDto> selectFaqShipping() {
		return systemAdminSqlMapper.selectFaqShipping();
	}
	
	public List<FaqDto> selectFaqUser() {
		return systemAdminSqlMapper.selectFaqUser();
	}
	
	public List<FaqDto> selectFaqCustomerService() {
		return systemAdminSqlMapper.selectFaqCustomerService();
	}
	
	
	public void insertFaqHelpStatus(FaqHelpStatusDto faqHelpStatusDto) {
		
		systemAdminSqlMapper.insertFaqHelpStatus(faqHelpStatusDto);
	}
}

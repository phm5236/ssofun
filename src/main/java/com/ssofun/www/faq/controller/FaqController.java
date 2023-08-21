package com.ssofun.www.faq.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssofun.dto.AdminDto;
import com.ssofun.dto.FaqDto;
import com.ssofun.dto.FaqHelpStatusDto;
import com.ssofun.dto.QnaDto;
import com.ssofun.www.faq.service.FaqServiceImpl;
import com.ssofun.www.systemadmin.service.SystemAdminServiceImpl;

@Controller
@RequestMapping("www/faq/*")
public class FaqController {

	@Autowired
	private FaqServiceImpl faqService;
	

	
	//faq메인페이지=top10
	@RequestMapping("faqMainPage")
	public String faqMainPage() {
		
		
		return"www/faq/faqTopMainPage";
	}
	
	
	@RequestMapping("faqTopMainPage")
	public String faqTopPage(Model model) {
		
		
		

		//여기부터
		
		
		
		
		
		
		return"www/faq/faqTopMainPage";
	}
	
	
	@RequestMapping("faqFundingPage")
	public String faqFundingPage(Model model) {
		
		List<FaqDto> faqList = faqService.selectFaqFunding();
		
		for(FaqDto faqDto:faqList) {
			String contents = faqDto.getContents();
			
			contents =  StringEscapeUtils.escapeHtml4(contents);
			contents = contents.replaceAll("\n", "<br>");
			
			faqDto.setContents(contents);
		}
		

		model.addAttribute("faqList",faqList);
		
		
		return"www/faq/faqFundingPage";
	}
	
	
	@RequestMapping("faqShippingPage")
	public String faqShippingPage(Model model) {
		
		List<FaqDto> faqList = faqService.selectFaqShipping();
			
		for(FaqDto faqDto:faqList) {
			String contents = faqDto.getContents();
			
			contents =  StringEscapeUtils.escapeHtml4(contents);
			contents = contents.replaceAll("\n", "<br>");
			
			faqDto.setContents(contents);
		}
		
		
		
		model.addAttribute("faqList", faqList);
		
		return"www/faq/faqShippingPage";
	}
	
	
	@RequestMapping("faqStorePage")
	public String faqStorePage(Model model) {
		
		List<FaqDto> faqList = faqService.selectFaqStore();
		
		for(FaqDto faqDto:faqList) {
			String contents = faqDto.getContents();
			
			contents =  StringEscapeUtils.escapeHtml4(contents);
			contents = contents.replaceAll("\n", "<br>");
			
			faqDto.setContents(contents);
		}
		
		
		
		
		model.addAttribute("faqList", faqList);
		
		return"www/faq/faqStorePage";
	}
	
	
	@RequestMapping("faqUserPage")
	public String faqUserPage(Model model) {
		
		
		List<FaqDto> faqList = faqService.selectFaqUser();
		
		for(FaqDto faqDto:faqList) {
			String contents = faqDto.getContents();
			
			contents =  StringEscapeUtils.escapeHtml4(contents);
			contents = contents.replaceAll("\n", "<br>");
			
			faqDto.setContents(contents);
		}
		
		
		model.addAttribute("faqList", faqList);
		
		return"www/faq/faqUserPage";
	}
	
	@RequestMapping("faqCustomerServicePage")
	public String faqCustomerServicePage(Model model) {
		
		
		List<FaqDto> faqList = faqService.selectFaqCustomerService();
		
		for(FaqDto faqDto:faqList) {
			String contents = faqDto.getContents();
			
			contents =  StringEscapeUtils.escapeHtml4(contents);
			contents = contents.replaceAll("\n", "<br>");
			
			faqDto.setContents(contents);
		}
		
		
		model.addAttribute("faqList", faqList);
		
		return"www/faq/faqCustomerServicePage";
	}
	
	

	
	//faq의견보내기
	@RequestMapping(value = "fundingHelpStatusProcess", method = RequestMethod.POST)
	public String fundingHelpStatusProcess(FaqHelpStatusDto faqHelpStatusDto) {
		
		faqService.insertFaqHelpStatus(faqHelpStatusDto);
		
		System.out.println(faqHelpStatusDto.getHelpStatus());
		return "redirect:./faqFundingPage";
	}
	
	@RequestMapping(value = "storeHelpStatusProcess", method = RequestMethod.POST)
	public String storeHelpStatusProcess(FaqHelpStatusDto faqHelpStatusDto) {
		
		faqService.insertFaqHelpStatus(faqHelpStatusDto);
		
		System.out.println(faqHelpStatusDto.getHelpStatus());
		return "redirect:./faqStorePage";
	}
	
	@RequestMapping(value = "shippingHelpStatusProcess", method = RequestMethod.POST)
	public String shippingHelpStatusProcess(FaqHelpStatusDto faqHelpStatusDto) {
		
		faqService.insertFaqHelpStatus(faqHelpStatusDto);
		
		System.out.println(faqHelpStatusDto.getHelpStatus());
		return "redirect:./faqShippingPage";
	}
	
	@RequestMapping(value = "customerServiceHelpStatusProcess", method = RequestMethod.POST)
	public String customerServiceHelpStatusProcess(FaqHelpStatusDto faqHelpStatusDto) {
		
		faqService.insertFaqHelpStatus(faqHelpStatusDto);
		
		System.out.println(faqHelpStatusDto.getHelpStatus());
		return "redirect:./faqCustomerServicePage";
	}
	
	@RequestMapping(value = "userHelpStatusProcess", method = RequestMethod.POST)
	public String userHelpStatusProcess(FaqHelpStatusDto faqHelpStatusDto) {
		
		faqService.insertFaqHelpStatus(faqHelpStatusDto);
		
		System.out.println(faqHelpStatusDto.getHelpStatus());
		return "redirect:./faqUserPage";
	}
	
	

	
}

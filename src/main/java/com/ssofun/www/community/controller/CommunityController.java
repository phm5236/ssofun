package com.ssofun.www.community.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssofun.dto.AdminDto;
import com.ssofun.dto.CommunityCommentDto;
import com.ssofun.dto.CommunityDto;
import com.ssofun.dto.CommunityNoticeDto;
import com.ssofun.dto.CommunityCategoryDto;
import com.ssofun.dto.UserDto;
import com.ssofun.www.community.service.CommunityService;
import com.ssofun.www.integration.service.IntegratedAuthenticationService;
import com.ssofun.www.qna.service.QnaServiceImpl;

@RequestMapping("www/community/*")
@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	// 커뮤니티 메인페이지 
	@RequestMapping("communityMainPage")
	public String communityMainPage(HttpSession session, Model model) {
		UserDto user = (UserDto)session.getAttribute("user");
		
		AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		

		
		List<Map<String, Object>> list = communityService.communityList();
		
		List<Map<String, Object>> communityNoticeListLimit3 = communityService.communityNoticeListLimit3(); // 공지사항 3개 리스트
		
		List<CommunityCategoryDto> communityCategoryList = communityService.communityCategoryList();
		
		
	    // list에 있는 각각의 CommunityDto에 대해 title을 HTML 이스케이프 처리
	    for (Map<String, Object> item : list) {
	        CommunityDto communityDto = (CommunityDto) item.get("communityDto");
	        String title = communityDto.getTitle();
	        title = StringEscapeUtils.escapeHtml4(title);
	        communityDto.setTitle(title);
	    }
	    
	    // 커뮤니티 글 작성일과 현재 시간 사이의 차이를 계산하여 "daysDiff"로 모델에 추가
	    for (Map<String, Object> item : list) {
	        CommunityDto communityDto = (CommunityDto) item.get("communityDto");
	        Date now = new Date();
	        long currentTime = now.getTime();
	        long createdTime = communityDto.getCreated_at().getTime();
	        long diffInMillies = currentTime - createdTime;
	        long daysDiff = diffInMillies / (1000 * 60 * 60 * 24);
	        item.put("daysDiff", daysDiff);
	    }
        
        
		model.addAttribute("list", list); 
		model.addAttribute("communityNoticeListLimit3", communityNoticeListLimit3);
		model.addAttribute("communityCategoryList", communityCategoryList);
		
		
		return "www/community/communityMainPage";
	}
	
	//커뮤니티 글쓰기 페이지
	@RequestMapping("communityWritePage")
	public String communityWritePage(Model model, HttpSession session) {
		
		UserDto user = (UserDto)session.getAttribute("user");
		
		AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		
		List<CommunityCategoryDto> communityCategoryList = communityService.communityCategoryList();
		
		model.addAttribute("communityCategoryList", communityCategoryList);
		
		if(user != null || shopAdmin != null) {
			return "www/community/communityWritePage";
		}
		
		return "redirect:../user/userLoginPage";
		
	}
	
	@RequestMapping("communityWriteProcess")
	public String communityWriteProcess(HttpSession session, CommunityDto communityDto
			, CommunityNoticeDto communityNoticeDto) {
		
		UserDto user = (UserDto)session.getAttribute("user");
		
		AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
		
		if(user != null) {
			long user_id = user.getUser_id();
			communityDto.setUser_id(user_id);
			
			communityService.communityWrite(communityDto);
		}else {
			int admin_id = shopAdmin.getAdmin_id();
			communityNoticeDto.setAdmin_id(admin_id);
			
			communityService.insertCommunityNotice(communityNoticeDto);
		}
		

		
		return "redirect:./communityMainPage";
	}
	
	
	//커뮤니티 글 내용 상세 페이지 
		@RequestMapping("communityReadPage")
		public String communityReadPage(Model model, int community_id, HttpSession session ) {
			communityService.increaseReadCount(community_id);
			UserDto user = (UserDto)session.getAttribute("user");
			
			
			Map<String,Object> map = communityService.getCommunity(community_id);
			
			List<CommunityCategoryDto> communityCategoryList = communityService.communityCategoryList();
			

//			// html escape 글 내용 
//			CommunityDto communityDto = (CommunityDto)map.get("communityDto");
//			String contents = communityDto.getContents();
//			contents = StringEscapeUtils.escapeHtml4(contents);
//			contents = contents.replaceAll("\n", "<br>");
//			communityDto.setContents(contents);
//			
//			// html escape 제목
//			String title = communityDto.getTitle();
//			title = StringEscapeUtils.escapeHtml4(title);
//			communityDto.setTitle(title);

			// 댓글 리스트
			List<Map<String, Object>> Commentlist = communityService.communitySelectCommentList(community_id);
			
		    // Commentlist에 있는 각각의 CommunityCommentDto에 대해 comment을 HTML 이스케이프 처리
		    for (Map<String, Object> item : Commentlist) {
		    	CommunityCommentDto communityCommentDto = (CommunityCommentDto) item.get("communityCommentDto");
		        String comment = communityCommentDto.getComment();
		        comment = StringEscapeUtils.escapeHtml4(comment);
		        communityCommentDto.setComment(comment);
		    }

			model.addAttribute("Commentlist", Commentlist);
			model.addAttribute("data", map);
			model.addAttribute("communityCategoryList", communityCategoryList);
			
			
			return "www/community/communityReadPage";
				
	
			}
	
		//글 삭제
		@RequestMapping("deleteProcess")
		public String deleteProcess(int community_id) {
			
			communityService.deleteContent(community_id);
			
			return "redirect:./communityMainPage";
		}
		
		// 글 수정
		@RequestMapping("communityUpdatePage")
		public String communityUpdatePage(Model model, int community_id) {
			
			Map<String, Object> map = communityService.getCommunity(community_id);
			List<CommunityCategoryDto> communityCategoryList = communityService.communityCategoryList();
			
			model.addAttribute("data", map);
			model.addAttribute("communityCategoryList", communityCategoryList);
			
			return "www/community/communityUpdatePage";
		}
		
		@RequestMapping("communityupdateProcess")
		public String updateContentProcess(CommunityDto communityDto) {
		
			communityService.contentsUpdate(communityDto);
			
			return "redirect:./communityMainPage";
		}
		
		
		// 댓글 등록 
		@RequestMapping("commentInsertProcess")
		public String commentInsert(CommunityCommentDto communityCommentDto) {
			communityService.commentInsert(communityCommentDto);
			
			return "redirect:./communityReadPage?community_id=" + communityCommentDto.getCommunity_id();
			// 리다이렉트 시 보이는 리드페이지를 구별하기 위해 커뮤니티 아이디를 넘기는 것. 
		}
		
		// 공지사항 관리 페이지
		@RequestMapping("communityNoticeManagePage")
		public String communityNoticeManagePage(Model model, HttpSession session) {
			AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
			
			List<Map<String, Object>> communityNoticeList = communityService.communityNoticeList();
			
			model.addAttribute("communityNoticeList", communityNoticeList);
			
			return "www/community/communityNoticeManagePage";
		}
		
		// 공지사항 상세보기 페이지
		@RequestMapping("communityNoticeDetailPage")
		public String communityNoticeDetailPage(Model model, HttpSession session, int community_notice_id) {
			
			
			communityService.increaseNoticeReadCount(community_notice_id);
			AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");
			
			List<CommunityCategoryDto> communityCategoryList = communityService.communityCategoryList();
			Map<String,Object> map = communityService.communityNoticeDetail(community_notice_id);
			
			
			
//
//			// html escape 글 내용 
//			CommunityNoticeDto communityNoticeDto = (CommunityNoticeDto)map.get("communityNoticeDto");
//			String contents = communityNoticeDto.getContents();
//			contents = StringEscapeUtils.escapeHtml4(contents);
//			contents = contents.replaceAll("\n", "<br>");
//			communityNoticeDto.setContents(contents);
//			
//			// html escape 제목
//			String title = communityNoticeDto.getTitle();
//			title = StringEscapeUtils.escapeHtml4(title);
//			communityNoticeDto.setTitle(title);
			
			model.addAttribute("data", map);
			model.addAttribute("communityCategoryList", communityCategoryList);
			
			return "www/community/communityNoticeDetailPage";
		}
		
		// 커뮤니티 카테고리별 페이지
		@RequestMapping("communityCategoryPage")
	    public String communityCategoryPage(HttpSession session, Model model, int community_category_id) {
	        UserDto user = (UserDto) session.getAttribute("user");
	        AdminDto shopAdmin = (AdminDto) session.getAttribute("shopAdmin");

	        List<Map<String, Object>> list = communityService.communityCategoryList(community_category_id);

	        List<Map<String, Object>> communityNoticeListLimit3 = communityService.communityNoticeListLimit3(); // 공지사항 3개 리스트

	        List<CommunityCategoryDto> communityCategoryList = communityService.communityCategoryList();

	        // list에 있는 각각의 CommunityDto에 대해 title을 HTML 이스케이프 처리
	        for (Map<String, Object> item : list) {
	            CommunityDto communityDto = (CommunityDto) item.get("communityDto");
	            String title = communityDto.getTitle();
	            title = StringEscapeUtils.escapeHtml4(title);
	            communityDto.setTitle(title);
	        }

	        // 커뮤니티 글 작성일과 현재 시간 사이의 차이를 계산하여 "daysDiff"로 모델에 추가
	        for (Map<String, Object> item : list) {
	            CommunityDto communityDto = (CommunityDto) item.get("communityDto");
	            Date now = new Date();
	            long currentTime = now.getTime();
	            long createdTime = communityDto.getCreated_at().getTime();
	            long diffInMillies = currentTime - createdTime;
	            long daysDiff = diffInMillies / (1000 * 60 * 60 * 24);
	            item.put("daysDiff", daysDiff);
	        }

	        model.addAttribute("list", list);
	        model.addAttribute("communityNoticeListLimit3", communityNoticeListLimit3);
	        model.addAttribute("communityCategoryList", communityCategoryList);

	        return "www/community/communityCategoryPage";
	    }
		
		
}

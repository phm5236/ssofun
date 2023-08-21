package com.ssofun.www.community.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.dto.CommunityCommentDto;
import com.ssofun.dto.CommunityDto;
import com.ssofun.dto.CommunityNoticeDto;
import com.ssofun.dto.AdminDto;
import com.ssofun.dto.CommunityCategoryDto;
import com.ssofun.dto.UserDto;
import com.ssofun.www.community.mapper.CommunitySqlMapper;
import com.ssofun.www.integration.mapper.IntegratedAuthenticationSqlMapper;

@Service
public class CommunityService {
	
	@Autowired
	private CommunitySqlMapper communitySqlMapper;
	
	// 커뮤니티 글 인서트
	public void communityWrite(CommunityDto communityDto) {
		communitySqlMapper.communityWriteInsert(communityDto);
		
	}
	
	// 커뮤니티 공지사항 등록
	public void insertCommunityNotice(CommunityNoticeDto communityNoticeDto) {
		communitySqlMapper.insertCommunityNotice(communityNoticeDto);
	}
	
	// 커뮤니트 공지사항 리스트3개
	public List<Map<String, Object>> communityNoticeListLimit3(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<CommunityNoticeDto> communityNoticeList = communitySqlMapper.communityNoticeListLimit3();
		
		for(CommunityNoticeDto communityNoticeDto : communityNoticeList) {
			
			Map<String, Object> map = new HashMap<>();
			
			int admin_id = communityNoticeDto.getAdmin_id();
			
			AdminDto adminDto = communitySqlMapper.selectByAdminId(admin_id);
			
			map.put("communityNoticeDto", communityNoticeDto);
			map.put("adminDto", adminDto);
			
			list.add(map);
		}
		
		return list;
	}
	
	// 커뮤니트 공지사항 리스트
	public List<Map<String, Object>> communityNoticeList(){
		
	    List<Map<String, Object>> list = new ArrayList<>();
	    
	    List<CommunityNoticeDto> communityNoticeList = communitySqlMapper.communityNoticeList();
	    
	    for(CommunityNoticeDto communityNoticeDto : communityNoticeList) {
	    	
	        Map<String, Object> map = new HashMap<>();
	        
	        int admin_id = communityNoticeDto.getAdmin_id();
	        AdminDto adminDto = communitySqlMapper.selectByAdminId(admin_id);
	        
	        map.put("communityNoticeDto", communityNoticeDto);
	        map.put("adminDto", adminDto);
	        
	        list.add(map); // 새로운 리스트에 맵을 추가하고, 원본 리스트를 수정하지 않습니다.
	    }
	    
	    return list;
	}

	
	
	
	// 커뮤니티 리스트 셀렉트
	
	public List<Map<String, Object>> communityList() { 
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<CommunityDto> communityDtoList = communitySqlMapper.communitySelectList();
		
		for(CommunityDto communityDto : communityDtoList) {
			
			Map<String, Object> map = new HashMap<>();
			
			long user_id = communityDto.getUser_id();
			
			int community_category_id = communityDto.getCommunity_category_id();
			
			UserDto userDto = communitySqlMapper.selectByUserId(user_id);
			
			CommunityCategoryDto communityCategoryDto = communitySqlMapper.selectByCommunityCategoryId(community_category_id);
			
			// 댓글 개수 조회
			int commentCount = communitySqlMapper.getCommentCount(communityDto.getCommunity_id());
	  
			map.put("userDto", userDto);
			map.put("communityDto", communityDto);
			map.put("communityCategoryDto", communityCategoryDto);
			map.put("commentCount", commentCount);
		  
		  list.add(map);
		}
		
		return list;
	}
	
	
	// 커뮤니티 상세글 보기
	  public Map<String,Object> getCommunity(int community_id){ 
		  
		  Map<String,Object> map = new HashMap<>();
		  CommunityDto communityDto = communitySqlMapper.selectByCommunityId(community_id);
		  UserDto userDto = communitySqlMapper.selectByUserId(communityDto.getUser_id());
		  CommunityCategoryDto communityCategoryDto = communitySqlMapper.selectByCommunityCategoryId(communityDto.getCommunity_category_id());
		  
		  
		  map.put("communityDto", communityDto);
		  map.put("userDto", userDto);
		  map.put("communityCategoryDto", communityCategoryDto);
		  
		  return map;
		  
	  
	  }
	  
		// 공지사항 상세보기
		public Map<String,Object> communityNoticeDetail(int community_notice_id) {
			
			Map<String,Object> map = new HashMap<>();
			
			CommunityNoticeDto communityNoticeDto = communitySqlMapper.selectByCommunityNoticeId(community_notice_id);
			AdminDto adminDto = communitySqlMapper.selectByAdminId(communityNoticeDto.getAdmin_id());
			
			map.put("communityNoticeDto", communityNoticeDto);
			map.put("adminDto", adminDto);
			
			return map;
		}
	 
	  // 조회수 증가
	  public void increaseReadCount(int community_id) {
		  communitySqlMapper.increaseReadCount(community_id);
		}
	  
	  // 공지사항 조회수 증가
	  public void increaseNoticeReadCount(int community_notice_id) {
		  communitySqlMapper.increaseNoticeReadCount(community_notice_id);
	  }
		
	  // 글 삭제 
		public void deleteContent(int community_id) {
			communitySqlMapper.deleteById(community_id);
		}
		
	 // 글 수정 
		public void contentsUpdate(CommunityDto communityDto) {
			communitySqlMapper.contentsUpdate(communityDto);
		}
	
		
	 // 댓글 등록
		public void commentInsert(CommunityCommentDto communityCommentDto) {
			communitySqlMapper.commentInsert(communityCommentDto);
		}
	
		
		// 댓글 리스트 셀렉트
//		public List<Map<String, Object>> community_commentList() {
//			
//			List<Map<String, Object>> Commentlist = new ArrayList<>();
//			
//			List<CommunityCommentDto> communityCommentDtoList = communitySqlMapper.communitySelectComment();
//			
//			for(CommunityCommentDto communityCommentDto : communityCommentDtoList) {
//				
//				Map<String, Object> map = new HashMap<>();
//				
//				long user_id = communityCommentDto.getUser_id();
//				
//				int community_id = communityCommentDto.getCommunity_id();
//				
//				UserDto userDto = communitySqlMapper.selectByUserId(user_id);
//				
//				CommunityDto communityDto = communitySqlMapper.selectByCommunityId(community_id);
//				  
//				map.put("userDto", userDto);
//				map.put("communityDto", communityDto);
//				map.put("communityCommentDto", communityCommentDto);
//			  
//				Commentlist.add(map);
//			}
//			
//			return Commentlist;
//		}
		
		// 하나의 게시글에 대한 댓글 리스트
		public List<Map<String, Object>> communitySelectCommentList(int community_id) {

		    List<Map<String, Object>> Commentlist = new ArrayList<>();
		    List<CommunityCommentDto> communityCommentDtoList = communitySqlMapper.communitySelectCommentList(community_id);

		    for (CommunityCommentDto communityCommentDto : communityCommentDtoList) {

		        Map<String, Object> map = new HashMap<>();
		        long user_id = communityCommentDto.getUser_id();
		        UserDto userDto = communitySqlMapper.selectByUserId(user_id);
		        CommunityDto communityDto = communitySqlMapper.selectByCommunityId(community_id);

		        map.put("userDto", userDto);
		        map.put("communityDto", communityDto);
		        map.put("communityCommentDto", communityCommentDto);

		        Commentlist.add(map);
		    }

		    return Commentlist;
		}
		
		// 커뮤니티 카테고리별 리스트
	    public List<Map<String, Object>> communityCategoryList(int community_category_id) {
	        List<Map<String, Object>> list = new ArrayList<>();

	        List<CommunityDto> communityDtoList = communitySqlMapper.communityCategoryListById(community_category_id);

	        for (CommunityDto communityDto : communityDtoList) {
	            Map<String, Object> map = new HashMap<>();

	            long user_id = communityDto.getUser_id();

	            UserDto userDto = communitySqlMapper.selectByUserId(user_id);

	            CommunityCategoryDto communityCategoryDto = communitySqlMapper.selectByCommunityCategoryId(community_category_id);

	            // 댓글 개수 조회
	            int commentCount = communitySqlMapper.getCommentCount(communityDto.getCommunity_id());

	            map.put("userDto", userDto);
	            map.put("communityDto", communityDto);
	            map.put("communityCategoryDto", communityCategoryDto);
	            map.put("commentCount", commentCount);

	            list.add(map);
	        }
	        return list;
			
		}

		// 공지사항 카테고리 리스트
		public List<CommunityCategoryDto> communityCategoryList(){
			List<CommunityCategoryDto> communityCategoryList = communitySqlMapper.communityCategoryList();
			return communityCategoryList;
		}		
		

}

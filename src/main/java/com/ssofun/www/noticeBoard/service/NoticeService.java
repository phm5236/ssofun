package com.ssofun.www.noticeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssofun.dto.NoticeCategoryDto;
import com.ssofun.dto.NoticeDto;
import com.ssofun.www.noticeBoard.mapper.NoticeMapper;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper; 
	
	public void insertNoticeBoard(NoticeDto noticeDto){
		noticeMapper.insertNoticeBoard(noticeDto);
	}

	public void insertNoticeCategory(NoticeCategoryDto noticeCategoryDto) {
		noticeMapper.insertNoticeCategory(noticeCategoryDto);
		
	}
		
}
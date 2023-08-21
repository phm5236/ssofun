package com.ssofun.www.noticeBoard.mapper;

import com.ssofun.dto.NoticeCategoryDto;
import com.ssofun.dto.NoticeDto;

public interface NoticeMapper {
	 
	public void insertNoticeBoard(NoticeDto noticeDto);
	public void insertNoticeCategory(NoticeCategoryDto noticeCategoryDto);
}
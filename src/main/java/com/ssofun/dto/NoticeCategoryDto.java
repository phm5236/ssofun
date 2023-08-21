package com.ssofun.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeCategoryDto {
	
	private int notice_category_id;
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date created_at;
	private int used_fg;
	public NoticeCategoryDto() {
		super();
	}
	public NoticeCategoryDto(int notice_category_id, String name, Date created_at, int used_fg) {
		super();
		this.notice_category_id = notice_category_id;
		this.name = name;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	public int getNotice_category_id() {
		return notice_category_id;
	}
	public void setNotice_category_id(int notice_category_id) {
		this.notice_category_id = notice_category_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public int getUsed_fg() {
		return used_fg;
	}
	public void setUsed_fg(int used_fg) {
		this.used_fg = used_fg;
	}
	
}

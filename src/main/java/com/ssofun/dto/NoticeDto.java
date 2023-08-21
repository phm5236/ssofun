package com.ssofun.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeDto {
	
	private int notice_id;
	private int admin_id;
	private int notice_category_id;
	private String title;
	private String contents;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date created_at;
	private int used_fg;
	public NoticeDto() {
		super();
	}
	public NoticeDto(int notice_id, int admin_id, int notice_category_id, String title, String contents,
			Date created_at, int used_fg) {
		super();
		this.notice_id = notice_id;
		this.admin_id = admin_id;
		this.notice_category_id = notice_category_id;
		this.title = title;
		this.contents = contents;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public int getNotice_category_id() {
		return notice_category_id;
	}
	public void setNotice_category_id(int notice_category_id) {
		this.notice_category_id = notice_category_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
package com.ssofun.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeReplyDto {

	private int notice_reply_id;
	private int notice_id;
	private int user_id;
	private int parent_id;
	private String contents;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date created_at;
	private int used_fg;
	public NoticeReplyDto() {
		super();
	}
	public NoticeReplyDto(int notice_reply_id, int notice_id, int user_id, int parent_id, String contents, Date created_at,
			int used_fg) {
		super();
		this.notice_reply_id = notice_reply_id;
		this.notice_id = notice_id;
		this.user_id = user_id;
		this.parent_id = parent_id;
		this.contents = contents;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	public int getNotice_reply_id() {
		return notice_reply_id;
	}
	public void setNotice_reply_id(int notice_reply_id) {
		this.notice_reply_id = notice_reply_id;
	}
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
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

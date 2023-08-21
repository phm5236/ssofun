package com.ssofun.dto;

import java.util.Date;

public class CommunityNoticeDto {
	private int community_notice_id;
	private int admin_id;
	private String title;
	private String contents;
	private int read_count;
	private Date created_at;
	private int used_fg;
	public int getCommunity_notice_id() {
		return community_notice_id;
	}
	public void setCommunity_notice_id(int community_notice_id) {
		this.community_notice_id = community_notice_id;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
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
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
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
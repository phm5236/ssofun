package com.ssofun.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CommunityDto {
	
	private int community_id;
	private int community_category_id;
	private long user_id;
	private String title;
	private String contents;
	private int read_count;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date created_at;
	private int used_fg;
	public CommunityDto() {
		super();
	}
	public CommunityDto(int community_id, long user_id, String title, String contents, int read_count,
			Date community_created_at, Date created_at, int used_fg) {
		super();
		this.community_id = community_id;
		this.user_id = user_id;
		this.title = title;
		this.contents = contents;
		this.read_count = read_count;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	public int getCommunity_id() {
		return community_id;
	}
	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}
	public int getCommunity_category_id() {
		return community_category_id;
	}
	public void setCommunity_category_id(int community_category_id) {
		this.community_category_id = community_category_id;
	}
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
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

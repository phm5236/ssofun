package com.ssofun.dto;

import java.util.Date;

public class CommunityLikeDto {
	private int community_like_id;
	private int community_id;
	private int user_id;
	private Date created_at;
	private int used_fg;
	public int getCommunity_like_id() {
		return community_like_id;
	}
	public void setCommunity_like_id(int community_like_id) {
		this.community_like_id = community_like_id;
	}
	public int getCommunity_id() {
		return community_id;
	}
	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
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

package com.ssofun.dto;

import java.util.Date;

public class CommunityCommentDto {
	private int community_comment_id;
	private int community_id;
	private int user_id;
	private int parent_id;
	private String comment;
	private Date created_at;
	private int used_fg;
	public int getCommunity_comment_id() {
		return community_comment_id;
	}
	public void setCommunity_comment_id(int community_comment_id) {
		this.community_comment_id = community_comment_id;
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
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
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

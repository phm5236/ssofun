package com.ssofun.dto;

import java.util.Date;

public class CommunityImageDto {
	private int community_image_id;
	private int community_id;
	private String url;
	private int order_list;
	private Date created_at;
	private int used_fg;
	public int getCommunity_image_id() {
		return community_image_id;
	}
	public void setCommunity_image_id(int community_image_id) {
		this.community_image_id = community_image_id;
	}
	public int getCommunity_id() {
		return community_id;
	}
	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getOrder_list() {
		return order_list;
	}
	public void setOrder_list(int order_list) {
		this.order_list = order_list;
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

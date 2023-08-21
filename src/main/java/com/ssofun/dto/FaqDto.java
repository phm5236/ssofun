package com.ssofun.dto;

import java.util.Date;

public class FaqDto {
	private int faq_id;
	private int admin_id;
	private int user_id;
	private String faq_category;
	private String title;
	private String contents;
	private Date created_at;
	private int used_fg;
	public FaqDto() {
		super();
	}
	public FaqDto(int faq_id, int admin_id, int user_id, String faq_category, String title, String contents,
			Date created_at, int used_fg) {
		super();
		this.faq_id = faq_id;
		this.admin_id = admin_id;
		this.user_id = user_id;
		this.faq_category = faq_category;
		this.title = title;
		this.contents = contents;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	public int getFaq_id() {
		return faq_id;
	}
	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
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
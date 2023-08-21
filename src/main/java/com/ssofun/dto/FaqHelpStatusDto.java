package com.ssofun.dto;

import java.util.Date;

public class FaqHelpStatusDto {
	
	private int faq_helpStatus_id;
	private int faq_id;
	private String helpStatus;
	private Date created_at;
	private int used_fg;
	public FaqHelpStatusDto() {
		super();
	}

	public FaqHelpStatusDto(int faq_helpStatus_id, int faq_id, String helpStatus, Date created_at, int used_fg) {
		super();
		this.faq_helpStatus_id = faq_helpStatus_id;
		this.faq_id = faq_id;
		this.helpStatus = helpStatus;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public int getFaq_helpStatus_id() {
		return faq_helpStatus_id;
	}
	public void setFaq_helpStatus_id(int faq_helpStatus_id) {
		this.faq_helpStatus_id = faq_helpStatus_id;
	}

	public int getFaq_id() {
		return faq_id;
	}

	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}

	public String getHelpStatus() {
		return helpStatus;
	}
	public void setHelpStatus(String helpStatus) {
		this.helpStatus = helpStatus;
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

package com.ssofun.dto;

import java.util.Date;

public class BizDto {
	private int biz_id;
	private String biz_name;
	private String biz_no;
	private String biz_phone;
	private String biz_ceo;
	private String biz_place;
	private Date created_at;
	private int used_fg;
	public BizDto() {
		super();
	}
	public BizDto(int biz_id, String biz_name, String biz_no, String biz_phone, String biz_ceo, String biz_place,
			Date created_at, int used_fg) {
		super();
		this.biz_id = biz_id;
		this.biz_name = biz_name;
		this.biz_no = biz_no;
		this.biz_phone = biz_phone;
		this.biz_ceo = biz_ceo;
		this.biz_place = biz_place;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	public int getBiz_id() {
		return biz_id;
	}
	public void setBiz_id(int biz_id) {
		this.biz_id = biz_id;
	}
	public String getBiz_name() {
		return biz_name;
	}
	public void setBiz_name(String biz_name) {
		this.biz_name = biz_name;
	}
	public String getBiz_no() {
		return biz_no;
	}
	public void setBiz_no(String biz_no) {
		this.biz_no = biz_no;
	}
	public String getBiz_phone() {
		return biz_phone;
	}
	public void setBiz_phone(String biz_phone) {
		this.biz_phone = biz_phone;
	}
	public String getBiz_ceo() {
		return biz_ceo;
	}
	public void setBiz_ceo(String biz_ceo) {
		this.biz_ceo = biz_ceo;
	}
	public String getBiz_place() {
		return biz_place;
	}
	public void setBiz_place(String biz_place) {
		this.biz_place = biz_place;
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

package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AdminDto {
	private int admin_id;
	private int biz_id;
	private String login_account;
	private String login_password;
	private String admin_nickname;
	private String admin_phone;
	private String admin_received_report;
	private String admin_report_description;
	@JsonFormat(pattern ="yyyy.MM.dd.HH.mm.ss", timezone = "Asia/Seoul")
	private Date created_at;
	private int used_fg;
	public AdminDto() {
		super();
	}
	public AdminDto(int admin_id, int biz_id, String login_account, String login_password, String admin_nickname,
			String admin_phone, String admin_received_report, String admin_report_description, Date created_at,
			int used_fg) {
		super();
		this.admin_id = admin_id;
		this.biz_id = biz_id;
		this.login_account = login_account;
		this.login_password = login_password;
		this.admin_nickname = admin_nickname;
		this.admin_phone = admin_phone;
		this.admin_received_report = admin_received_report;
		this.admin_report_description = admin_report_description;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public int getBiz_id() {
		return biz_id;
	}
	public void setBiz_id(int biz_id) {
		this.biz_id = biz_id;
	}
	public String getLogin_account() {
		return login_account;
	}
	public void setLogin_account(String login_account) {
		this.login_account = login_account;
	}
	public String getLogin_password() {
		return login_password;
	}
	public void setLogin_password(String login_password) {
		this.login_password = login_password;
	}
	public String getAdmin_phone() {
		return admin_phone;
	}
	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	public String getAdmin_received_report() {
		return admin_received_report;
	}
	public void setAdmin_received_report(String admin_received_report) {
		this.admin_received_report = admin_received_report;
	}
	public String getAdmin_report_description() {
		return admin_report_description;
	}
	public void setAdmin_report_description(String admin_report_description) {
		this.admin_report_description = admin_report_description;
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

	public String getAdmin_nickname() {
		return admin_nickname;
	}

	public void setAdmin_nickname(String admin_nickname) {
		this.admin_nickname = admin_nickname;
	}
	
}
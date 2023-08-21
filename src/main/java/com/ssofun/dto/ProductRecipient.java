package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductRecipient {
	private int delivery_recipient_id;
    private String name;
    private String phone;
    private String address_post;
    private String address_default;
    private String address_detail;
    private String request_message;
    @JsonFormat(pattern ="yyyy.MM.dd.HH.mm.ss", timezone = "Asia/Seoul")
    private Date created_at;
    private int used_fg;
    
	public ProductRecipient() {
		super();
	}
	
	public ProductRecipient(int delivery_recipient_id, String name, String phone, String address_post,
			String address_default, String address_detail, String request_message, Date created_at, int used_fg) {
		super();
		this.delivery_recipient_id = delivery_recipient_id;
		this.name = name;
		this.phone = phone;
		this.address_post = address_post;
		this.address_default = address_default;
		this.address_detail = address_detail;
		this.request_message = request_message;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	
	public int getDelivery_recipient_id() {
		return delivery_recipient_id;
	}
	public void setDelivery_recipient_id(int delivery_recipient_id) {
		this.delivery_recipient_id = delivery_recipient_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress_post() {
		return address_post;
	}
	public void setAddress_post(String address_post) {
		this.address_post = address_post;
	}
	public String getAddress_default() {
		return address_default;
	}
	public void setAddress_default(String address_default) {
		this.address_default = address_default;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getRequest_message() {
		return request_message;
	}
	public void setRequest_message(String request_message) {
		this.request_message = request_message;
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

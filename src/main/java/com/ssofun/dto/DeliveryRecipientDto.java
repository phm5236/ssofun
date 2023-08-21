package com.ssofun.dto;

public class DeliveryRecipientDto {
	private int default_fg;
	private long delivery_recipient_id;
	private long user_id;
	private String name;
	private String phone;
	private String address_post;
	private String address_default;
	private String address_detail;
	private String  request_message;
	
	public DeliveryRecipientDto() {
		super();
	}


	public DeliveryRecipientDto(int default_fg, long delivery_recipient_id, long user_id, String name, String phone,
			String address_post, String address_default, String address_detail, String request_message) {
		super();
		this.default_fg = default_fg;
		this.delivery_recipient_id = delivery_recipient_id;
		this.user_id = user_id;
		this.name = name;
		this.phone = phone;
		this.address_post = address_post;
		this.address_default = address_default;
		this.address_detail = address_detail;
		this.request_message = request_message;
	}


	public long getUser_id() {
		return user_id;
	}


	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}


	public int getDefault_fg() {
		return default_fg;
	}

	public void setDefault_fg(int default_fg) {
		this.default_fg = default_fg;
	}

	public long getDelivery_recipient_id() {
		return delivery_recipient_id;
	}

	public void setDelivery_recipient_id(long delivery_recipient_id) {
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
		

}

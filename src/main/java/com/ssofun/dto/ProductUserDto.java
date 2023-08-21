package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductUserDto {
	private long user_id;
	private long user_phone_auth_id;
	private int product_id;
	private String email;
	private String password;
	private String token;
	private String name;
	private String nickname;
	private int agreeSms;
	private String thumbnail_name;
	private String product_name;
	private String price;
	private int total_count;
	@JsonFormat(pattern ="yyyy.MM.dd.HH.mm.ss", timezone = "Asia/Seoul")
	private Date created_at;
	private int used_fg;
	
	public ProductUserDto() {
		super();
	}

	public ProductUserDto(long user_id, long user_phone_auth_id, int product_id, String email, String password,
			String token, String name, String nickname, int agreeSms, String thumbnail_name, String product_name,
			String price, int total_count, Date created_at, int used_fg) {
		super();
		this.user_id = user_id;
		this.user_phone_auth_id = user_phone_auth_id;
		this.product_id = product_id;
		this.email = email;
		this.password = password;
		this.token = token;
		this.name = name;
		this.nickname = nickname;
		this.agreeSms = agreeSms;
		this.thumbnail_name = thumbnail_name;
		this.product_name = product_name;
		this.price = price;
		this.total_count = total_count;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public long getUser_phone_auth_id() {
		return user_phone_auth_id;
	}

	public void setUser_phone_auth_id(long user_phone_auth_id) {
		this.user_phone_auth_id = user_phone_auth_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAgreeSms() {
		return agreeSms;
	}

	public void setAgreeSms(int agreeSms) {
		this.agreeSms = agreeSms;
	}

	public String getThumbnail_name() {
		return thumbnail_name;
	}

	public void setThumbnail_name(String thumbnail_name) {
		this.thumbnail_name = thumbnail_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
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

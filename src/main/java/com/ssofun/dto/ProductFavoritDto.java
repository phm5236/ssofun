package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductFavoritDto {
	private int product_favorit_id; // PK
	private int product_id; // FK
	private int user_id; // FK
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부
	
	public ProductFavoritDto() {
		super();
	}

	public ProductFavoritDto(int product_favorit_id, int product_id, int user_id, Date created_at, int used_fg) {
		super();
		this.product_favorit_id = product_favorit_id;
		this.product_id = product_id;
		this.user_id = user_id;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public int getProduct_favorit_id() {
		return product_favorit_id;
	}

	public void setProduct_favorit_id(int product_favorit_id) {
		this.product_favorit_id = product_favorit_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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

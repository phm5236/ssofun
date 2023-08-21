package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductThumbnailDto {
	private int product_thumbnail_id; // PK
	private int product_id; // FK
	private String name; // 파일명(확장자포함)
	private int order_list; // 높은 순서대로 보여짐
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부
	
	public ProductThumbnailDto() {
		super();
	}

	public ProductThumbnailDto(int product_thumbnail, int product_id, String name, int order_list, Date created_at,
			int used_fg) {
		super();
		this.product_thumbnail_id = product_thumbnail;
		this.product_id = product_id;
		this.name = name;
		this.order_list = order_list;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public int getProduct_thumbnail() {
		return product_thumbnail_id;
	}

	public void setProduct_thumbnail(int product_thumbnail_id) {
		this.product_thumbnail_id = product_thumbnail_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

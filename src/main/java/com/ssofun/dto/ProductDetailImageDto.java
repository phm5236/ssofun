package com.ssofun.dto;

import java.util.Date;

public class ProductDetailImageDto {
	private int product_detail_image_id; // PK
	private int product_id; // FK
	private String name; // 파일명
	private int order_list; // 리스트 순서
	private Date created_at; // 등록일
	private int used_fg; // 1
	

	public int getProduct_detail_image_id() {
		return product_detail_image_id;
	}

	public void setProduct_detail_image_id(int product_detail_image_id) {
		this.product_detail_image_id = product_detail_image_id;
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

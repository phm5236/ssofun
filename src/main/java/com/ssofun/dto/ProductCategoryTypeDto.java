package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductCategoryTypeDto {
	private int product_category_type_id; // PK
	private int this_parent_id; // 본인의 PK를 FK로 받음
	private int node; // 최상위 O
	private String name; // 카테고리명
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부
	
	public ProductCategoryTypeDto() {
		super();
	}

	public ProductCategoryTypeDto(int product_category_type_id, int this_parent_id, int node, String name,
			Date created_at, int used_fg) {
		super();
		this.product_category_type_id = product_category_type_id;
		this.this_parent_id = this_parent_id;
		this.node = node;
		this.name = name;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public int getProduct_category_type_id() {
		return product_category_type_id;
	}

	public void setProduct_category_type_id(int product_category_type_id) {
		this.product_category_type_id = product_category_type_id;
	}

	public int getThis_parent_id() {
		return this_parent_id;
	}

	public void setThis_parent_id(int this_parent_id) {
		this.this_parent_id = this_parent_id;
	}

	public int getNode() {
		return node;
	}

	public void setNode(int node) {
		this.node = node;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

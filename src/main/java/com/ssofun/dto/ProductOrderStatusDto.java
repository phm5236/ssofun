package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductOrderStatusDto {
	private int product_order_status_id; // PK
	private String name; // 상태이름
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부 
	
	public ProductOrderStatusDto() {
		super();
	}

	public ProductOrderStatusDto(int product_order_status_id, String name, Date created_at, int used_fg) {
		super();
		this.product_order_status_id = product_order_status_id;
		this.name = name;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public int getProduct_order_status_id() {
		return product_order_status_id;
	}

	public void setProduct_order_status_id(int product_order_status_id) {
		this.product_order_status_id = product_order_status_id;
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

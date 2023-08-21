package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductOrderDto {
	private int product_order_id; // PK
	private int user_id; // FK
	private int product_order_status_id; // FK
	private int code_status; // 코드상태?
	private int amount; // 주문의 총 가격(효율)
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부
	
	public ProductOrderDto() {
		super();
	}

	public ProductOrderDto(int product_order_id, int user_id, int product_order_status_id, int code_status, int amount,
			Date created_at, int used_fg) {
		super();
		this.product_order_id = product_order_id;
		this.user_id = user_id;
		this.product_order_status_id = product_order_status_id;
		this.code_status = code_status;
		this.amount = amount;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public int getProduct_order_id() {
		return product_order_id;
	}

	public void setProduct_order_id(int product_order_id) {
		this.product_order_id = product_order_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getProduct_order_status_id() {
		return product_order_status_id;
	}

	public void setProduct_order_status_id(int product_order_status_id) {
		this.product_order_status_id = product_order_status_id;
	}

	public int getCode_status() {
		return code_status;
	}

	public void setCode_status(int code_status) {
		this.code_status = code_status;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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

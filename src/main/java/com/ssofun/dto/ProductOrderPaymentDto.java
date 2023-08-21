package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductOrderPaymentDto {
	private int payment_id; // PK
	private int product_order_id; // FK
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부
	
	public ProductOrderPaymentDto() {
		super();
	}

	public ProductOrderPaymentDto(int payment_id, int product_order_id, Date created_at, int used_fg) {
		super();
		this.payment_id = payment_id;
		this.product_order_id = product_order_id;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	public int getProduct_order_id() {
		return product_order_id;
	}

	public void setProduct_order_id(int product_order_id) {
		this.product_order_id = product_order_id;
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

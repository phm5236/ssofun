package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductOrderItemRefundDto {
	private int product_order_item_refund_id; // PK
	private int product_order_item_id; // FK
	private String refund_reason; // 환불사유
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부
	
	public ProductOrderItemRefundDto() {
		super();
	}

	public ProductOrderItemRefundDto(int product_order_item_refund_id, int product_order_item_id, String refund_reason,
			Date created_at, int used_fg) {
		super();
		this.product_order_item_refund_id = product_order_item_refund_id;
		this.product_order_item_id = product_order_item_id;
		this.refund_reason = refund_reason;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public int getProduct_order_item_refund_id() {
		return product_order_item_refund_id;
	}

	public void setProduct_order_item_refund_id(int product_order_item_refund_id) {
		this.product_order_item_refund_id = product_order_item_refund_id;
	}

	public int getProduct_order_item_id() {
		return product_order_item_id;
	}

	public void setProduct_order_item_id(int product_order_item_id) {
		this.product_order_item_id = product_order_item_id;
	}

	public String getRefund_reason() {
		return refund_reason;
	}

	public void setRefund_reason(String refund_reason) {
		this.refund_reason = refund_reason;
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

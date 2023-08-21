package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductReviewDto {
	private int product_review_id; // PK
	private int product_order_item_id; // FK
	private int user_id; // FK
	private int rate; //별점
	private String contents; // 리뷰내용
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부
	
	public ProductReviewDto() {
		super();
	}

	public ProductReviewDto(int product_review_id, int product_order_item_id, int user_id, int rate, String contents,
			Date created_at, int used_fg) {
		super();
		this.product_review_id = product_review_id;
		this.product_order_item_id = product_order_item_id;
		this.user_id = user_id;
		this.rate = rate;
		this.contents = contents;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public int getProduct_review_id() {
		return product_review_id;
	}

	public void setProduct_review_id(int product_review_id) {
		this.product_review_id = product_review_id;
	}

	public int getProduct_order_item_id() {
		return product_order_item_id;
	}

	public void setProduct_order_item_id(int product_order_item_id) {
		this.product_order_item_id = product_order_item_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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

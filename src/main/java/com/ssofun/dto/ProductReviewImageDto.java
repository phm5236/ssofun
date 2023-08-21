package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductReviewImageDto {
	private int product_review_image_id; // PK
	private int product_review_id; // FK
	private String url; // 파일명
	private int order_list; // 표시되는 순서
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부
	
	public ProductReviewImageDto() {
		super();
	}

	public ProductReviewImageDto(int product_review_image_id, int product_review_id, String url, int order_list,
			Date created_at, int used_fg) {
		super();
		this.product_review_image_id = product_review_image_id;
		this.product_review_id = product_review_id;
		this.url = url;
		this.order_list = order_list;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public int getProduct_review_image_id() {
		return product_review_image_id;
	}

	public void setProduct_review_image_id(int product_review_image_id) {
		this.product_review_image_id = product_review_image_id;
	}

	public int getProduct_review_id() {
		return product_review_id;
	}

	public void setProduct_review_id(int product_review_id) {
		this.product_review_id = product_review_id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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

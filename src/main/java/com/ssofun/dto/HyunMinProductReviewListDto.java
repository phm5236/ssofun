package com.ssofun.dto;

import java.util.Date;

public class HyunMinProductReviewListDto {
	private int product_review_id; // 상품리뷰ID
	private String name; // 상품명
	private int review_cnt; // 리뷰갯수
	private Double review_avg_score; // 평점
	private int admin_id; // 관리자 ID
	private int product_id; // 상품ID
	private String contents; // 리뷰내용
	private int rate; // 별점
	private String nickname; // 유저 닉네임
	private Date created_at; // 리뷰 등록일
	
	public HyunMinProductReviewListDto() {
		super();
	}

	public HyunMinProductReviewListDto(String name, int review_cnt, int review_avg_score) {
		super();
		this.name = name;
		this.review_cnt = review_cnt;
		this.review_avg_score = (double) review_avg_score;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getReview_cnt() {
		return review_cnt;
	}

	public void setReview_cnt(int review_cnt) {
		this.review_cnt = review_cnt;
	}

	public Double getReview_avg_score() {
		return review_avg_score;
	}

	public void setReview_avg_score(Double review_avg_score) {
		this.review_avg_score = review_avg_score;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getProduct_review_id() {
		return product_review_id;
	}

	public void setProduct_review_id(int product_review_id) {
		this.product_review_id = product_review_id;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}

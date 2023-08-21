package com.ssofun.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FundingCommunityReviewAnswerDto {
	private long user_id;
	private String nickname;
	private int created_after;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date created_at;
	private String contents;
	private long funding_review_id; // 커뮤니티 댓글 아이디
	private long this_answer_id; //커뮤니티 댓글 아이디
	
	public FundingCommunityReviewAnswerDto() {
		super();
	}


	public FundingCommunityReviewAnswerDto(long user_id, String nickname, int created_after, Date created_at,
			String contents, long funding_review_id, long this_answer_id) {
		super();
		this.user_id = user_id;
		this.nickname = nickname;
		this.created_after = created_after;
		this.created_at = created_at;
		this.contents = contents;
		this.funding_review_id = funding_review_id;
		this.this_answer_id = this_answer_id;
	}


	public long getUser_id() {
		return user_id;
	}


	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}


	public int getCreated_after() {
		return created_after;
	}


	public void setCreated_after(int created_after) {
		this.created_after = created_after;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}


	public long getFunding_review_id() {
		return funding_review_id;
	}


	public void setFunding_review_id(long funding_review_id) {
		this.funding_review_id = funding_review_id;
	}


	public long getThis_answer_id() {
		return this_answer_id;
	}


	public void setThis_answer_id(long this_answer_id) {
		this.this_answer_id = this_answer_id;
	}


	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	
	
}

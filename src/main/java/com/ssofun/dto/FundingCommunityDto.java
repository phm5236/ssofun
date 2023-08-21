package com.ssofun.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FundingCommunityDto {
	private String nickname;
	private long user_id;
	private long funding_id;
	private int created_after;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date created_at;
	private String contents;
	private long funding_review_id;
	private int totalComment;
	private List<FundingCommunityReviewDto> reviewList;
	
	public FundingCommunityDto() {
		super();
	}






	public FundingCommunityDto(String nickname, long user_id, long funding_id, int created_after, Date created_at,
			String contents, long funding_review_id, int totalComment, List<FundingCommunityReviewDto> reviewList) {
		super();
		this.nickname = nickname;
		this.user_id = user_id;
		this.funding_id = funding_id;
		this.created_after = created_after;
		this.created_at = created_at;
		this.contents = contents;
		this.funding_review_id = funding_review_id;
		this.totalComment = totalComment;
		this.reviewList = reviewList;
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






	public long getUser_id() {
		return user_id;
	}



	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}



	public long getFunding_id() {
		return funding_id;
	}



	public void setFunding_id(long funding_id) {
		this.funding_id = funding_id;
	}



	public int getTotalComment() {
		return totalComment;
	}



	public void setTotalComment(int totalComment) {
		this.totalComment = totalComment;
	}



	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}


	public long getFunding_review_id() {
		return funding_review_id;
	}

	public void setFunding_review_id(long funding_review_id) {
		this.funding_review_id = funding_review_id;
	}



	public List<FundingCommunityReviewDto> getReviewList() {
		return reviewList;
	}



	public void setReviewList(List<FundingCommunityReviewDto> reviewList) {
		this.reviewList = reviewList;
	}

	
}

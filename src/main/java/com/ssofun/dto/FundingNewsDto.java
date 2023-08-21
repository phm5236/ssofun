package com.ssofun.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FundingNewsDto {
	private int created_after;
	private long funding_id;
	private String title;
	private String contents;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date created_at;
	private long funding_notice_id;
	private int totalComment;
	private List<FundingNewsReviewDto> reviewList;
	private int used_fg;
	
	public FundingNewsDto() {
		super();
	}



	



	public FundingNewsDto(int created_after, long funding_id, String title, String contents, Date created_at,
			long funding_notice_id, int totalComment, List<FundingNewsReviewDto> reviewList, int used_fg) {
		super();
		this.created_after = created_after;
		this.funding_id = funding_id;
		this.title = title;
		this.contents = contents;
		this.created_at = created_at;
		this.funding_notice_id = funding_notice_id;
		this.totalComment = totalComment;
		this.reviewList = reviewList;
		this.used_fg = used_fg;
	}







	public int getUsed_fg() {
		return used_fg;
	}







	public void setUsed_fg(int used_fg) {
		this.used_fg = used_fg;
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



	public long getFunding_notice_id() {
		return funding_notice_id;
	}

	public void setFunding_notice_id(long funding_notice_id) {
		this.funding_notice_id = funding_notice_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}




	public List<FundingNewsReviewDto> getReviewList() {
		return reviewList;
	}



	public void setReviewList(List<FundingNewsReviewDto> reviewList) {
		this.reviewList = reviewList;
	}

	
	
}

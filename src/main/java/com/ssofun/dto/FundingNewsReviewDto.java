package com.ssofun.dto;

import java.util.List;

public class FundingNewsReviewDto {
	private String nickname;
	private int created_at;
	private String contents;
	private int answer_count;
	private long funding_news_review_id;
	private List<FundingNewsReviewAnswerDto> answerList;
	private long funding_notice_id;
	
	public FundingNewsReviewDto() {
		super();
	}

	public FundingNewsReviewDto(String nickname, int created_at, String contents,
			List<FundingNewsReviewAnswerDto> answerList, long funding_notice_id, long funding_news_review_id,
			int answer_count) {
		super();
		this.nickname = nickname;
		this.created_at = created_at;
		this.contents = contents;
		this.answerList = answerList;
		this.funding_notice_id = funding_notice_id;
		this.funding_news_review_id = funding_news_review_id;
		this.answer_count = answer_count;
	}





	public int getAnswer_count() {
		return answer_count;
	}

	public void setAnswer_count(int answer_count) {
		this.answer_count = answer_count;
	}

	public long getFunding_news_review_id() {
		return funding_news_review_id;
	}



	public void setFunding_news_review_id(long funding_news_review_id) {
		this.funding_news_review_id = funding_news_review_id;
	}



	public List<FundingNewsReviewAnswerDto> getAnswerList() {
		return answerList;
	}

	public void setAnswerList(List<FundingNewsReviewAnswerDto> answerList) {
		this.answerList = answerList;
	}

	public long getFunding_notice_id() {
		return funding_notice_id;
	}

	public void setFunding_notice_id(long funding_notice_id) {
		this.funding_notice_id = funding_notice_id;
	}


	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}


	public int getCreated_at() {
		return created_at;
	}



	public void setCreated_at(int created_at) {
		this.created_at = created_at;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	
	
}

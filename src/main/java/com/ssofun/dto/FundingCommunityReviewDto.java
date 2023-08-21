package com.ssofun.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FundingCommunityReviewDto {
	private long user_id;
	private String nickname;
	private long funding_id;
	private int created_after; // 이거 바꿔놔야함ㅠ
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date created_at;
	private String contents;
	private int answer_count; //이것도.. 바꿔야함
	private long funding_review_id; // 커뮤니티 댓글 아이디
	private List<FundingCommunityReviewAnswerDto> answerList;
	private long this_answer_id; //커뮤니티 아이디
	
	public FundingCommunityReviewDto() {
		super();
	}





	public FundingCommunityReviewDto(long user_id, String nickname, long funding_id, int created_after, Date created_at,
			String contents, int answer_count, long funding_review_id, List<FundingCommunityReviewAnswerDto> answerList,
			long this_answer_id) {
		super();
		this.user_id = user_id;
		this.nickname = nickname;
		this.funding_id = funding_id;
		this.created_after = created_after;
		this.created_at = created_at;
		this.contents = contents;
		this.answer_count = answer_count;
		this.funding_review_id = funding_review_id;
		this.answerList = answerList;
		this.this_answer_id = this_answer_id;
	}





	public long getFunding_id() {
		return funding_id;
	}





	public void setFunding_id(long funding_id) {
		this.funding_id = funding_id;
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


	public int getAnswer_count() {
		return answer_count;
	}


	public void setAnswer_count(int answer_count) {
		this.answer_count = answer_count;
	}


	public List<FundingCommunityReviewAnswerDto> getAnswerList() {
		return answerList;
	}


	public void setAnswerList(List<FundingCommunityReviewAnswerDto> answerList) {
		this.answerList = answerList;
	}


	public long getFunding_review_id() {
		return funding_review_id;
	}


	public void setFunding_review_id(long funding_review_id) {
		this.funding_review_id = funding_review_id;
	}


	
	
}

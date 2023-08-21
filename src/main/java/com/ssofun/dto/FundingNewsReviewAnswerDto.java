package com.ssofun.dto;

public class FundingNewsReviewAnswerDto {
	private String nickname;
	private int created_at;
	private String contents;
	private long this_answer_id;
	
	public FundingNewsReviewAnswerDto() {
		super();
	}

	public FundingNewsReviewAnswerDto(String nickname, int created_at, String contents,
			long this_answer_id) {
		super();
		this.nickname = nickname;
		this.created_at = created_at;
		this.contents = contents;
		this.this_answer_id = this_answer_id;
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

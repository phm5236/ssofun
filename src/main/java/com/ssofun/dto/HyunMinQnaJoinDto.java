package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class HyunMinQnaJoinDto {
	private int qna_id; // PK
	private String biz_name; // 회사명
	private String email; // 유저아이디
	private String nickname; // 유저닉네임
	private String title; // 제목
	private String contents; // 문의내용
	private String answer_contents; // 답변내용
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date answer_created_at; // 답변등록일
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 문의등록일
	public int getQna_id() {
		return qna_id;
	}
	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}
	public String getBiz_name() {
		return biz_name;
	}
	public void setBiz_name(String biz_name) {
		this.biz_name = biz_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public String getAnswer_contents() {
		return answer_contents;
	}
	public void setAnswer_contents(String answer_contents) {
		this.answer_contents = answer_contents;
	}
	public Date getAnswer_created_at() {
		return answer_created_at;
	}
	public void setAnswer_created_at(Date answer_created_at) {
		this.answer_created_at = answer_created_at;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}

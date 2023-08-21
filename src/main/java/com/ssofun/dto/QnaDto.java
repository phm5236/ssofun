package com.ssofun.dto;

import java.util.Date;

public class QnaDto {
	private int qna_id;
	private int admin_id;
	private int user_id;
	private int biz_id;
	private String title;
	private String contents;
	private String answer_contents;
	private Date answer_created_at;
	private Date created_at;
	private int used_fg;
	public QnaDto() {
		super();
	}
	public QnaDto(int qna_id, int admin_id, int user_id, int biz_id, String title, String contents,
			String answer_contents, Date answer_created_at, Date created_at, int used_fg) {
		super();
		this.qna_id = qna_id;
		this.admin_id = admin_id;
		this.user_id = user_id;
		this.biz_id = biz_id;
		this.title = title;
		this.contents = contents;
		this.answer_contents = answer_contents;
		this.answer_created_at = answer_created_at;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	public int getQna_id() {
		return qna_id;
	}
	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getBiz_id() {
		return biz_id;
	}
	public void setBiz_id(int biz_id) {
		this.biz_id = biz_id;
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
	public int getUsed_fg() {
		return used_fg;
	}
	public void setUsed_fg(int used_fg) {
		this.used_fg = used_fg;
	}
	
	

}

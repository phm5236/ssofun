package com.ssofun.dto;

import java.util.Date;

public class Qna_ImageDto {
	private int qna_image_id;
	private int qna_id;
	private String original_filename;
	private String link;
	private Date created_at;
	private int used_fg;
	public Qna_ImageDto() {
		super();
	}
	public Qna_ImageDto(int qna_image_id, int qna_id, String original_filename, String link, Date created_at,
			int used_fg) {
		super();
		this.qna_image_id = qna_image_id;
		this.qna_id = qna_id;
		this.original_filename = original_filename;
		this.link = link;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	public int getQna_image_id() {
		return qna_image_id;
	}
	public void setQna_image_id(int qna_image_id) {
		this.qna_image_id = qna_image_id;
	}
	public int getQna_id() {
		return qna_id;
	}
	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}
	public String getOriginal_filename() {
		return original_filename;
	}
	public void setOriginal_filename(String original_filename) {
		this.original_filename = original_filename;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
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
	@Override
	public String toString() {
		return "Tb_Qna_ImageDto [qna_image_id=" + qna_image_id + ", qna_id=" + qna_id + ", original_filename="
				+ original_filename + ", link=" + link + ", created_at=" + created_at + ", used_fg=" + used_fg + "]";
	}
	
	
}
	


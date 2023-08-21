package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DeliveryCompanyDto {
	private int delivery_company_id; // PK
	private String code; // 택배사코드
	private String name; // 택배사이름
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 여부
	
	public DeliveryCompanyDto() {
		super();
	}

	public DeliveryCompanyDto(int delivery_company_id, String code, String name, Date created_at, int used_fg) {
		super();
		this.delivery_company_id = delivery_company_id;
		this.code = code;
		this.name = name;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}

	public int getDelivery_company_id() {
		return delivery_company_id;
	}

	public void setDelivery_company_id(int delivery_company_id) {
		this.delivery_company_id = delivery_company_id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

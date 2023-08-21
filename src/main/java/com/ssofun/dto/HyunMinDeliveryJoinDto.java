package com.ssofun.dto;

import java.util.Date;

public class HyunMinDeliveryJoinDto {
	private int delivery_id;
	private int delivery_recipient_id;
	private String name;
	private String invoice_no;
	private Date created_at;
	
	public HyunMinDeliveryJoinDto() {
		super();
	}

	public HyunMinDeliveryJoinDto(int delivery_id, String name, String invoice_no, Date created_at) {
		super();
		this.delivery_id = delivery_id;
		this.name = name;
		this.invoice_no = invoice_no;
		this.created_at = created_at;
	}

	public int getDelivery_id() {
		return delivery_id;
	}

	public void setDelivery_id(int delivery_id) {
		this.delivery_id = delivery_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInvoice_no() {
		return invoice_no;
	}

	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public int getDelivery_recipient_id() {
		return delivery_recipient_id;
	}

	public void setDelivery_recipient_id(int delivery_recipient_id) {
		this.delivery_recipient_id = delivery_recipient_id;
	}
}

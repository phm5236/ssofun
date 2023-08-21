package com.ssofun.dto;

public class FundingOrderStatusDto {
	private long funding_order_status_id;
	private String name;
	
	public FundingOrderStatusDto() {
		super();
	}

	public FundingOrderStatusDto(long funding_order_status_id, String name) {
		super();
		this.funding_order_status_id = funding_order_status_id;
		this.name = name;
	}

	public long getFunding_order_status_id() {
		return funding_order_status_id;
	}

	public void setFunding_order_status_id(long funding_order_status_id) {
		this.funding_order_status_id = funding_order_status_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}

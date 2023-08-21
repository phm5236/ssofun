package com.ssofun.dto;

public class DeliveryStatusDto {
	private long delivery_status_id;
	private String name;
	
	public DeliveryStatusDto() {
		super();
	}

	public DeliveryStatusDto(long delivery_status_id, String name) {
		super();
		this.delivery_status_id = delivery_status_id;
		this.name = name;
	}

	public long getDelivery_status_id() {
		return delivery_status_id;
	}

	public void setDelivery_status_id(long delivery_status_id) {
		this.delivery_status_id = delivery_status_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}

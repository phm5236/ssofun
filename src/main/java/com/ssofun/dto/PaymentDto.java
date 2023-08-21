package com.ssofun.dto;

public class PaymentDto {
	private long payment_id;
	private long amount;
	private String token;
	
	public PaymentDto() {
		super();
	}

	public PaymentDto(long payment_id, long amount, String token) {
		super();
		this.payment_id = payment_id;
		this.amount = amount;
		this.token = token;
	}

	public long getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(long payment_id) {
		this.payment_id = payment_id;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}	
	
}

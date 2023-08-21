package com.ssofun.dto;

import java.util.List;

public class FundingRewardOrderDto {
	private long funding_reward_order_id;
	private long funding_reward_id;
	private long funding_order_id;
	private FundingRewardDto fundingRewardDto;
	private long delivery_recipient_id;
	private int count;
	private int amount;
	private int status;
	private int used_fg;
	
	public FundingRewardOrderDto() {
		super();
	}


	public FundingRewardOrderDto(long funding_reward_order_id, long funding_reward_id, long funding_order_id,
			FundingRewardDto fundingRewardDto, long delivery_recipient_id, int count, int amount, int status,
			int used_fg) {
		super();
		this.funding_reward_order_id = funding_reward_order_id;
		this.funding_reward_id = funding_reward_id;
		this.funding_order_id = funding_order_id;
		this.fundingRewardDto = fundingRewardDto;
		this.delivery_recipient_id = delivery_recipient_id;
		this.count = count;
		this.amount = amount;
		this.status = status;
		this.used_fg = used_fg;
	}


	public int getUsed_fg() {
		return used_fg;
	}


	public void setUsed_fg(int used_fg) {
		this.used_fg = used_fg;
	}


	public FundingRewardDto getFundingRewardDto() {
		return fundingRewardDto;
	}


	public void setFundingRewardDto(FundingRewardDto fundingRewardDto) {
		this.fundingRewardDto = fundingRewardDto;
	}


	public long getFunding_reward_order_id() {
		return funding_reward_order_id;
	}

	public void setFunding_reward_order_id(long funding_reward_order_id) {
		this.funding_reward_order_id = funding_reward_order_id;
	}

	public long getFunding_reward_id() {
		return funding_reward_id;
	}

	public void setFunding_reward_id(long funding_reward_id) {
		this.funding_reward_id = funding_reward_id;
	}

	public long getFunding_order_id() {
		return funding_order_id;
	}

	public void setFunding_order_id(long funding_order_id) {
		this.funding_order_id = funding_order_id;
	}

	public long getDelivery_recipient_id() {
		return delivery_recipient_id;
	}

	public void setDelivery_recipient_id(long delivery_recipient_id) {
		this.delivery_recipient_id = delivery_recipient_id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}

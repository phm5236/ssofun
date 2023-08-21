package com.ssofun.dto;

public class FundingItemDto {
	private long funding_reward_item_id; 
	private long funding_reward_id;
	private String name; 
	private int count; //리워드별 상품 갯수
	
	public FundingItemDto() {
		super();
	}



	public FundingItemDto(long funding_reward_item_id, long funding_reward_id, String name, int count) {
		super();
		this.funding_reward_item_id = funding_reward_item_id;
		this.funding_reward_id = funding_reward_id;
		this.name = name;
		this.count = count;
	}



	public long getFunding_reward_id() {
		return funding_reward_id;
	}



	public void setFunding_reward_id(long funding_reward_id) {
		this.funding_reward_id = funding_reward_id;
	}



	public long getFunding_reward_item_id() {
		return funding_reward_item_id;
	}

	public void setFunding_reward_item_id(long funding_reward_item_id) {
		this.funding_reward_item_id = funding_reward_item_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}


	


	
}

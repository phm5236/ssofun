package com.ssofun.dto;

public class FundingFavoritDto {
	private long funding_favorit_id;
	private long funding_id;
	private long user_id;
	
	public FundingFavoritDto() {
		super();
	}

	public FundingFavoritDto(long funding_favorit_id, long funding_id, long user_id) {
		super();
		this.funding_favorit_id = funding_favorit_id;
		this.funding_id = funding_id;
		this.user_id = user_id;
	}

	public long getFunding_favorit_id() {
		return funding_favorit_id;
	}

	public void setFunding_favorit_id(long funding_favorit_id) {
		this.funding_favorit_id = funding_favorit_id;
	}

	public long getFunding_id() {
		return funding_id;
	}

	public void setFunding_id(long funding_id) {
		this.funding_id = funding_id;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	
	
}

package com.ssofun.dto;

public class FundingCategoryDto {
	private long funding_category_id;
	private String image_url;
	private String name;
	
	public FundingCategoryDto() {
		super();
	}

	public FundingCategoryDto(long funding_category_id, String name, String image_url) {
		super();
		this.funding_category_id = funding_category_id;
		this.name = name;
		this.image_url = image_url;
	}

	public long getFunding_category_id() {
		return funding_category_id;
	}

	public void setFunding_category_id(long funding_category_id) {
		this.funding_category_id = funding_category_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	
	
}

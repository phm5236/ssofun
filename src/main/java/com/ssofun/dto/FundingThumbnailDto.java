package com.ssofun.dto;

public class FundingThumbnailDto {
	private long funding_thumbnail_id;
	private long funding_id;
	private String url;
	private int image_order;
	
	public FundingThumbnailDto() {
		super();
	}

	public FundingThumbnailDto(long funding_thumbnail_id, long funding_id, String url, int image_order) {
		super();
		this.funding_thumbnail_id = funding_thumbnail_id;
		this.funding_id = funding_id;
		this.url = url;
		this.image_order = image_order;
	}

	public long getFunding_thumbnail_id() {
		return funding_thumbnail_id;
	}

	public void setFunding_thumbnail_id(long funding_thumbnail_id) {
		this.funding_thumbnail_id = funding_thumbnail_id;
	}

	public long getFunding_id() {
		return funding_id;
	}

	public void setFunding_id(long funding_id) {
		this.funding_id = funding_id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getImage_order() {
		return image_order;
	}

	public void setImage_order(int image_order) {
		this.image_order = image_order;
	}
	
	
}

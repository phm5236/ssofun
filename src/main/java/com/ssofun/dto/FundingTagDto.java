package com.ssofun.dto;

public class FundingTagDto {
	private long funding_tag_id;
	private String name;
	private int used_fg;
	
	public FundingTagDto() {
		super();
	}

	public FundingTagDto(long funding_tag_id, String name, int used_fg) {
		super();
		this.funding_tag_id = funding_tag_id;
		this.name = name;
		this.used_fg = used_fg;
	}

	public long getFunding_tag_id() {
		return funding_tag_id;
	}

	public void setFunding_tag_id(long funding_tag_id) {
		this.funding_tag_id = funding_tag_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUsed_fg() {
		return used_fg;
	}

	public void setUsed_fg(int used_fg) {
		this.used_fg = used_fg;
	}
	
	

}

package com.ssofun.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FundingOrderDto {
	private int used_fg;
	private long funding_order_id;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date created_at;
	private long user_id;
	private UserDto userDto;
	private FundingDto fundingDto;
	private long funding_order_status_id;
	private String funding_category; //추후 삭제해야함 -> fundingDto로 가져와야함
	private String title; //추후 삭제해야함 -> fundingDto로 가져와야함
	private String creator_name; // 나의 펀딩현황에서 사용 //추후 삭제해야함 -> fundingDto로 가져와야함
	private int price_support;
	private int open_name_fg;
	private int open_amount_fg;
	private int total_price;
	private List<FundingRewardOrderDto> rewardList;
	
	public FundingOrderDto() {
		super();
	}

	public FundingOrderDto(long funding_order_id, long user_id, long funding_order_status_id, UserDto userDto,
			FundingDto fundingDto, String funding_category, String title, String creator_name, int price_support,
			int open_name_fg, int open_amount_fg, int total_price, List<FundingRewardOrderDto> rewardList,
			Date created_at, int used_fg) {
		super();
		this.funding_order_id = funding_order_id;
		this.user_id = user_id;
		this.funding_order_status_id = funding_order_status_id;
		this.userDto = userDto;
		this.fundingDto = fundingDto;
		this.funding_category = funding_category;
		this.title = title;
		this.creator_name = creator_name;
		this.price_support = price_support;
		this.open_name_fg = open_name_fg;
		this.open_amount_fg = open_amount_fg;
		this.total_price = total_price;
		this.rewardList = rewardList;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}


	public UserDto getUserDto() {
		return userDto;
	}

	public void setUserDto(UserDto userDto) {
		this.userDto = userDto;
	}

	public FundingDto getFundingDto() {
		return fundingDto;
	}

	public void setFundingDto(FundingDto fundingDto) {
		this.fundingDto = fundingDto;
	}

	public String getFunding_category() {
		return funding_category;
	}

	public void setFunding_category(String funding_category) {
		this.funding_category = funding_category;
	}

	public String getTitle() {
		return title;
	}




	public void setTitle(String title) {
		this.title = title;
	}




	public String getCreator_name() {
		return creator_name;
	}




	public void setCreator_name(String creator_name) {
		this.creator_name = creator_name;
	}




	public int getUsed_fg() {
		return used_fg;
	}


	public void setUsed_fg(int used_fg) {
		this.used_fg = used_fg;
	}


	public List<FundingRewardOrderDto> getRewardList() {
		return rewardList;
	}


	public void setRewardList(List<FundingRewardOrderDto> rewardList) {
		this.rewardList = rewardList;
	}


	public Date getCreated_at() {
		return created_at;
	}



	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}



	public long getFunding_order_id() {
		return funding_order_id;
	}

	public void setFunding_order_id(long funding_order_id) {
		this.funding_order_id = funding_order_id;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public long getFunding_order_status_id() {
		return funding_order_status_id;
	}

	public void setFunding_order_status_id(long funding_order_status_id) {
		this.funding_order_status_id = funding_order_status_id;
	}

	public int getPrice_support() {
		return price_support;
	}

	public void setPrice_support(int price_support) {
		this.price_support = price_support;
	}

	public int getOpen_name_fg() {
		return open_name_fg;
	}

	public void setOpen_name_fg(int open_name_fg) {
		this.open_name_fg = open_name_fg;
	}

	public int getOpen_amount_fg() {
		return open_amount_fg;
	}

	public void setOpen_amount_fg(int open_amount_fg) {
		this.open_amount_fg = open_amount_fg;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	
}

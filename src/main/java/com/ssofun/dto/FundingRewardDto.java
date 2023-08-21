package com.ssofun.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FundingRewardDto {
	private long funding_reward_id;
	private long funding_id;
	private int price; //리워드 가격
	private String title; //리워드 제목
	private String description; // 리워드 설명
	private FundingDto fundingDto;
	private List<FundingItemDto> itemList; //리워드별 상품 리스트
	private int stock_max; //최대재고
	private int buy_count; //1인당 최대 구매 개수
	private int delivery_price; //배송비
	@JsonFormat(pattern="yyyy.MM.dd")
	@DateTimeFormat(pattern = "yy.MM.dd")
	private Date start_from; //리워드 시작일
	@JsonFormat(pattern="yyyy.MM.dd")
	@DateTimeFormat(pattern = "yy.MM.dd")
	private Date close_at; //리워드 종료일
	@JsonFormat(pattern="yyyy. MM. dd. EEEE")
	@DateTimeFormat(pattern = "yy.MM.dd")
	private Date delivery_from; //배송 시작일
	
	public FundingRewardDto() {
		super();
	}


	public FundingRewardDto(long funding_reward_id, long funding_id, int price, String title, String description,
			FundingDto fundingDto, List<FundingItemDto> itemList, int stock_max, int buy_count, int delivery_price,
			Date start_from, Date close_at, Date delivery_from) {
		super();
		this.funding_reward_id = funding_reward_id;
		this.funding_id = funding_id;
		this.price = price;
		this.title = title;
		this.description = description;
		this.fundingDto = fundingDto;
		this.itemList = itemList;
		this.stock_max = stock_max;
		this.buy_count = buy_count;
		this.delivery_price = delivery_price;
		this.start_from = start_from;
		this.close_at = close_at;
		this.delivery_from = delivery_from;
	}



	public FundingDto getFundingDto() {
		return fundingDto;
	}


	public void setFundingDto(FundingDto fundingDto) {
		this.fundingDto = fundingDto;
	}


	public int getBuy_count() {
		return buy_count;
	}



	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}


	public long getFunding_reward_id() {
		return funding_reward_id;
	}

	public void setFunding_reward_id(long funding_reward_id) {
		this.funding_reward_id = funding_reward_id;
	}

	public long getFunding_id() {
		return funding_id;
	}

	public void setFunding_id(long funding_id) {
		this.funding_id = funding_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<FundingItemDto> getItemList() {
		return itemList;
	}

	public void setItemList(List<FundingItemDto> itemList) {
		this.itemList = itemList;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDelivery_price() {
		return delivery_price;
	}

	public void setDelivery_price(int delivery_price) {
		this.delivery_price = delivery_price;
	}

	public int getStock_max() {
		return stock_max;
	}

	public void setStock_max(int stock_max) {
		this.stock_max = stock_max;
	}

	public Date getStart_from() {
		return start_from;
	}

	public void setStart_from(Date start_from) {
		this.start_from = start_from;
	}

	public Date getClose_at() {
		return close_at;
	}

	public void setClose_at(Date close_at) {
		this.close_at = close_at;
	}

	public Date getDelivery_from() {
		return delivery_from;
	}

	public void setDelivery_from(Date delivery_from) {
		this.delivery_from = delivery_from;
	}

	

}

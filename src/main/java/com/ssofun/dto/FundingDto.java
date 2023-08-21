package com.ssofun.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FundingDto {
	private long funding_id;
	private List<FundingThumbnailDto> thumbnailList; //섬네일 리스트
	private long funding_category_id;
	private long funding_tag_id;
	private long user_creator_id;
	private String funding_code;
	private String creator_name; //이거 삭제해야함
	private String title;
	private String description;
	private String contents; //상세설명 HTML로 입력되야함
	private long target_price;
	private int adult_fg;
	private int confirm_fg;
	private int favorit; //좋아요 -> 이것도 삭제해야함 favoritDto로 바꿔야함
	private List<FundingNewsDto> newsList; //공지사항 리스트
	private List<FundingCommunityDto> reviewList; //커뮤니티 리스트
	private List<FundingRewardDto> rewardList; // 리워드 리스트
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date start_from; //펀딩 시작일 -> 이거 삭제해아함
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd EEEE")
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date close_at; //펀딩 종료일 -> 이거 삭제해야함
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy년 MM월 dd일")
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date delivery_from; //배송 시작 예정일
	
	public FundingDto() {
		super();
	}


	public long getUser_creator_id() {
		return user_creator_id;
	}


	public void setUser_creator_id(long user_creator_id) {
		this.user_creator_id = user_creator_id;
	}


	public String getFunding_code() {
		return funding_code;
	}


	public void setFunding_code(String funding_code) {
		this.funding_code = funding_code;
	}


	public long getFunding_tag_id() {
		return funding_tag_id;
	}





	public void setFunding_tag_id(long funding_tag_id) {
		this.funding_tag_id = funding_tag_id;
	}





	public int getAdult_fg() {
		return adult_fg;
	}



	public void setAdult_fg(int adult_fg) {
		this.adult_fg = adult_fg;
	}



	public int getConfirm_fg() {
		return confirm_fg;
	}




	public void setConfirm_fg(int confirm_fg) {
		this.confirm_fg = confirm_fg;
	}




	public long getTarget_price() {
		return target_price;
	}




	public void setTarget_price(long target_price) {
		this.target_price = target_price;
	}




	public long getFunding_category_id() {
		return funding_category_id;
	}






	public void setFunding_category_id(long funding_category_id) {
		this.funding_category_id = funding_category_id;
	}






	public List<FundingCommunityDto> getReviewList() {
		return reviewList;
	}


	public void setReviewList(List<FundingCommunityDto> reviewList) {
		this.reviewList = reviewList;
	}


	public List<FundingNewsDto> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<FundingNewsDto> newsList) {
		this.newsList = newsList;
	}

	public List<FundingRewardDto> getRewardList() {
		return rewardList;
	}

	public void setRewardList(List<FundingRewardDto> rewardList) {
		this.rewardList = rewardList;
	}

	public long getFunding_id() {
		return funding_id;
	}

	public void setFunding_id(long funding_id) {
		this.funding_id = funding_id;
	}


	public String getCreator_name() {
		return creator_name;
	}

	public void setCreator_name(String creator_name) {
		this.creator_name = creator_name;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getFavorit() {
		return favorit;
	}

	public void setFavorit(int favorit) {
		this.favorit = favorit;
	}

	public List<FundingThumbnailDto> getThumbnailList() {
		return thumbnailList;
	}

	public void setThumbnailList(List<FundingThumbnailDto> thumbnailList) {
		this.thumbnailList = thumbnailList;
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

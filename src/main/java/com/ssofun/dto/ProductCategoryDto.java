package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductCategoryDto {
	private int product_category_type_id; // FK
	private int product_id; // FK
	@JsonFormat(pattern = "yyyy-MM-dd:HH.mm.ss",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부
	private int admin_id; // 관리자테이블 id
	private String category_type_name; // 카테고리타입명
	private String product_name; // 상품이름
	private String thumbnail_name; // 썸네일이름
	private int price; // 상품가격
	private int price_sale; // 상품할인가
	private String contents; // 상품 상세내용
	private int order_list; // 썸네일 테이블
	private int product_used_fg;
	private String biz_name;
	
	public ProductCategoryDto() {
		super();
	}
	

	@Override
	public String toString() {
		return "ProductCategoryDto [product_category_type_id=" + product_category_type_id + ", product_id=" + product_id
				+ ", created_at=" + created_at + ", used_fg=" + used_fg + ", admin_id=" + admin_id
				+ ", category_type_name=" + category_type_name + ", product_name=" + product_name + ", thumbnail_name="
				+ thumbnail_name + ", price=" + price + ", price_sale=" + price_sale + ", contents=" + contents
				+ ", order_list=" + order_list + ", product_used_fg=" + product_used_fg + "]";
	}


	public ProductCategoryDto(int product_category_type_id, int product_id, Date created_at, int used_fg,
			int admin_id, String category_type_name, String product_name, String thumbnail_name, int price,
			int price_sale, String contents, int order_list, int product_used_fg,String biz_name) {
		super();
		this.product_category_type_id = product_category_type_id;
		this.product_id = product_id;
		this.created_at = created_at;
		this.used_fg = used_fg;
		this.admin_id = admin_id;
		this.category_type_name = category_type_name;
		this.product_name = product_name;
		this.thumbnail_name = thumbnail_name;
		this.price = price;
		this.price_sale = price_sale;
		this.contents = contents;
		this.order_list = order_list;
		this.product_used_fg = product_used_fg;
		this.biz_name = biz_name;
	}

	public int getProduct_category_type_id() {
		return product_category_type_id;
	}

	public void setProduct_category_type_id(int product_category_type_id) {
		this.product_category_type_id = product_category_type_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public int getUsed_fg() {
		return used_fg;
	}

	public void setUsed_fg(int used_fg) {
		this.used_fg = used_fg;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public String getCategory_type_name() {
		return category_type_name;
	}

	public void setCategory_type_name(String category_type_name) {
		this.category_type_name = category_type_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getThumbnail_name() {
		return thumbnail_name;
	}

	public void setThumbnail_name(String thumbnail_name) {
		this.thumbnail_name = thumbnail_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPrice_sale() {
		return price_sale;
	}

	public void setPrice_sale(int price_sale) {
		this.price_sale = price_sale;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getOrder_list() {
		return order_list;
	}

	public void setOrder_list(int order_list) {
		this.order_list = order_list;
	}

	public int getProduct_used_fg() {
		return product_used_fg;
	}

	public void setProduct_used_fg(int product_used_fg) {
		this.product_used_fg = product_used_fg;
	}


	public String getBiz_name() {
		return biz_name;
	}


	public void setBiz_name(String biz_name) {
		this.biz_name = biz_name;
	}
	
}

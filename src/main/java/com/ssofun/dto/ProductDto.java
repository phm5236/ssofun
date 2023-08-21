package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductDto {
	private int product_id; // PK
	private int admin_id; // FK
	private String name; // 상품명
	private int price; // 가격
	private int price_sale; // 할인가
	private String contents; // 상세보기 내용
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부
	private String tname; // 썸네일 테이블의 썸네일명
	private String thumbnail_name; // 썸네일 파일명
	private String category_type_name; // 카테고리타입명
	private String product_name; // 상품명
    private String biz_name; // 브랜드명
    // 귀찮아서 그냥 여기다가 추가함
    // 대시보드꺼
    private int product_order_item_id;
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd",  timezone = "Asia/Seoul") //데이터 포맷 변환
    private Date order_created_at;
    private String delivery_recipient_name;
    private int count;
       
	public ProductDto() {
		super();
	}
	public ProductDto(int product_id, int admin_id, String name, int price, int price_sale, String contents,
			Date created_at, int used_fg, String tname, String thumbnail_name, String category_type_name,
			String product_name, String biz_name) {
		super();
		this.product_id = product_id;
		this.admin_id = admin_id;
		this.name = name;
		this.price = price;
		this.price_sale = price_sale;
		this.contents = contents;
		this.created_at = created_at;
		this.used_fg = used_fg;
		this.tname = tname;
		this.thumbnail_name = thumbnail_name;
		this.category_type_name = category_type_name;
		this.product_name = product_name;
		this.biz_name = biz_name;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getThumbnail_name() {
		return thumbnail_name;
	}
	public void setThumbnail_name(String thumbnail_name) {
		this.thumbnail_name = thumbnail_name;
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
	public String getBiz_name() {
		return biz_name;
	}
	public void setBiz_name(String biz_name) {
		this.biz_name = biz_name;
	}
	public int getProduct_order_item_id() {
		return product_order_item_id;
	}
	public void setProduct_order_item_id(int product_order_item_id) {
		this.product_order_item_id = product_order_item_id;
	}
	public Date getOrder_created_at() {
		return order_created_at;
	}
	public void setOrder_created_at(Date order_created_at) {
		this.order_created_at = order_created_at;
	}
	public String getDelivery_recipient_name() {
		return delivery_recipient_name;
	}
	public void setDelivery_recipient_name(String delivery_recipient_name) {
		this.delivery_recipient_name = delivery_recipient_name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}

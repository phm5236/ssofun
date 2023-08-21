package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductOrderItemDto {
	private int product_order_item_id; // PK
	private int product_order_id; // FK
	private int product_id; // FK
	private int product_order_status_id; // FK
	private int delivery_recipient_id; // FK
	private int user_id; // FK
	private int count; // 개수
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd",  timezone = "Asia/Seoul") //데이터 포맷 변환
	private Date created_at; // 등록일
	private int used_fg; // 사용여부
	private String biz_name; // 브랜드명
	private String category_type_name; // 카테고리명
	private String product_name; // 상품명
	private String thumbnail_name; // 파일명
	private int price; // 가격
	private int price_sale; // 할인가
	private String order_status_name; // 상태명
	private String recipient_name; // 수령인
	private String recipient_phone;
	private String address_post; // 우편번호
	private String address_default; // 기본주소
	private String address_detail; // 상세주소
	private String request_message; // 배송요청사항
	private int admin_id; // 관리자ID
	private int biz_id; // bizID 
	private int delivery_id; // 발송ID
	private String invoice_no; // 운송장번호
	private Date delivery_created_at; // 발송일
	private String delivery_company_name; // 택배사명
	
	public ProductOrderItemDto() {
		super();
	}

	public ProductOrderItemDto(int product_order_item_id, int product_order_id, int product_id,
			int product_order_status_id, int delivery_recipient_id, int user_id, int count, Date created_at,
			int used_fg, String biz_name, String category_type_name, String product_name, String thumbnail_name,
			int price, int price_sale, String order_status_name, String recipient_name, String recipient_phone,
			String address_post, String address_default, String address_detail, String request_message, int admin_id,
			int biz_id, int delivery_id, String invoice_no, Date delivery_created_at, String delivery_company_name) {
		super();
		this.product_order_item_id = product_order_item_id;
		this.product_order_id = product_order_id;
		this.product_id = product_id;
		this.product_order_status_id = product_order_status_id;
		this.delivery_recipient_id = delivery_recipient_id;
		this.user_id = user_id;
		this.count = count;
		this.created_at = created_at;
		this.used_fg = used_fg;
		this.biz_name = biz_name;
		this.category_type_name = category_type_name;
		this.product_name = product_name;
		this.thumbnail_name = thumbnail_name;
		this.price = price;
		this.price_sale = price_sale;
		this.order_status_name = order_status_name;
		this.recipient_name = recipient_name;
		this.recipient_phone = recipient_phone;
		this.address_post = address_post;
		this.address_default = address_default;
		this.address_detail = address_detail;
		this.request_message = request_message;
		this.admin_id = admin_id;
		this.biz_id = biz_id;
		this.delivery_id = delivery_id;
		this.invoice_no = invoice_no;
		this.delivery_created_at = delivery_created_at;
		this.delivery_company_name = delivery_company_name;
	}

	public int getProduct_order_item_id() {
		return product_order_item_id;
	}

	public void setProduct_order_item_id(int product_order_item_id) {
		this.product_order_item_id = product_order_item_id;
	}

	public int getProduct_order_id() {
		return product_order_id;
	}

	public void setProduct_order_id(int product_order_id) {
		this.product_order_id = product_order_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getProduct_order_status_id() {
		return product_order_status_id;
	}

	public void setProduct_order_status_id(int product_order_status_id) {
		this.product_order_status_id = product_order_status_id;
	}

	public int getDelivery_recipient_id() {
		return delivery_recipient_id;
	}

	public void setDelivery_recipient_id(int delivery_recipient_id) {
		this.delivery_recipient_id = delivery_recipient_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	public String getBiz_name() {
		return biz_name;
	}

	public void setBiz_name(String biz_name) {
		this.biz_name = biz_name;
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

	public String getOrder_status_name() {
		return order_status_name;
	}

	public void setOrder_status_name(String order_status_name) {
		this.order_status_name = order_status_name;
	}

	public String getRecipient_name() {
		return recipient_name;
	}

	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}

	public String getRecipient_phone() {
		return recipient_phone;
	}

	public void setRecipient_phone(String recipient_phone) {
		this.recipient_phone = recipient_phone;
	}

	public String getAddress_post() {
		return address_post;
	}

	public void setAddress_post(String address_post) {
		this.address_post = address_post;
	}

	public String getAddress_default() {
		return address_default;
	}

	public void setAddress_default(String address_default) {
		this.address_default = address_default;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getRequest_message() {
		return request_message;
	}

	public void setRequest_message(String request_message) {
		this.request_message = request_message;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public int getBiz_id() {
		return biz_id;
	}

	public void setBiz_id(int biz_id) {
		this.biz_id = biz_id;
	}

	public int getDelivery_id() {
		return delivery_id;
	}

	public void setDelivery_id(int delivery_id) {
		this.delivery_id = delivery_id;
	}

	public String getInvoice_no() {
		return invoice_no;
	}

	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
	}

	public Date getDelivery_created_at() {
		return delivery_created_at;
	}

	public void setDelivery_created_at(Date delivery_created_at) {
		this.delivery_created_at = delivery_created_at;
	}

	public String getDelivery_company_name() {
		return delivery_company_name;
	}

	public void setDelivery_company_name(String delivery_company_name) {
		this.delivery_company_name = delivery_company_name;
	}

	
	
	
	
}

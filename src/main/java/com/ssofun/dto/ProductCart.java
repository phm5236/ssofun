package com.ssofun.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductCart {
	private int cart_id;
    private int user_id;
    private int product_id;
    private int count;
    @JsonFormat(pattern ="yyyy.MM.dd.HH.mm.ss", timezone = "Asia/Seoul")
    private Date created_at;
    private int used_fg;
    
	public ProductCart() {
		super();
	}
	
	public ProductCart(int cart_id, int user_id, int product_id, int count, Date created_at, int used_fg) {
		super();
		this.cart_id = cart_id;
		this.user_id = user_id;
		this.product_id = product_id;
		this.count = count;
		this.created_at = created_at;
		this.used_fg = used_fg;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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
    
    
}

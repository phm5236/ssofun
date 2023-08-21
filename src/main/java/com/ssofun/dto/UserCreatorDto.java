package com.ssofun.dto;

public class UserCreatorDto {
	private long user_creator_id;
	private long user_id;
	private String name;
	private String email;
	private String phone;
	private int creator_type;
	private String biz_no;
	private UserCreatorBankDto userCreatorBankDto;
	
	public UserCreatorDto() {
		super();
	}



	public UserCreatorDto(long user_creator_id, long user_id, String name, String email, String phone, int creator_type,
			String biz_no, UserCreatorBankDto userCreatorBankDto) {
		super();
		this.user_creator_id = user_creator_id;
		this.user_id = user_id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.creator_type = creator_type;
		this.biz_no = biz_no;
		this.userCreatorBankDto = userCreatorBankDto;
	}



	public UserCreatorBankDto getUserCreatorBankDto() {
		return userCreatorBankDto;
	}



	public void setUserCreatorBankDto(UserCreatorBankDto userCreatorBankDto) {
		this.userCreatorBankDto = userCreatorBankDto;
	}



	public long getUser_creator_id() {
		return user_creator_id;
	}

	public void setUser_creator_id(long user_creator_id) {
		this.user_creator_id = user_creator_id;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCreator_type() {
		return creator_type;
	}

	public void setCreator_type(int creator_type) {
		this.creator_type = creator_type;
	}

	public String getBiz_no() {
		return biz_no;
	}

	public void setBiz_no(String biz_no) {
		this.biz_no = biz_no;
	}
	
	
}

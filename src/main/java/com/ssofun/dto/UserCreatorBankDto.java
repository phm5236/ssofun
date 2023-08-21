package com.ssofun.dto;

public class UserCreatorBankDto {
	private long user_creator_bank_id;
	private long user_creator_id;
	private int bank_type;
	private String account_no;
	private String account_name;
	
	public UserCreatorBankDto() {
		super();
	}



	public UserCreatorBankDto(long user_creator_bank_id, long user_creator_id, int bank_type, String account_no,
			String account_name) {
		super();
		this.user_creator_bank_id = user_creator_bank_id;
		this.user_creator_id = user_creator_id;
		this.bank_type = bank_type;
		this.account_no = account_no;
		this.account_name = account_name;
	}

	


	public int getBank_type() {
		return bank_type;
	}



	public void setBank_type(int bank_type) {
		this.bank_type = bank_type;
	}



	public long getUser_creator_bank_id() {
		return user_creator_bank_id;
	}

	public void setUser_creator_bank_id(long user_creator_bank_id) {
		this.user_creator_bank_id = user_creator_bank_id;
	}

	public long getUser_creator_id() {
		return user_creator_id;
	}

	public void setUser_creator_id(long user_creator_id) {
		this.user_creator_id = user_creator_id;
	}

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	
	

}

package com.kiri.dto;

import java.util.Date;

public class Login_TypeDTO {
	private int seq_type;
	private String user_email;
	private String type;
	private String social_id;
	private Date signup_date;
	
	public Login_TypeDTO() {}

	public Login_TypeDTO(int seq_type, String user_email, String type, String social_id, Date signup_date) {
		super();
		this.seq_type = seq_type;
		this.user_email = user_email;
		this.type = type;
		this.social_id = social_id;
		this.signup_date = signup_date;
	}

	public int getSeq_type() {
		return seq_type;
	}

	public void setSeq_type(int seq_type) {
		this.seq_type = seq_type;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getSignup_date() {
		return signup_date;
	}

	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}

	public String getSocial_id() {
		return social_id;
	}

	public void setSocial_id(String social_id) {
		this.social_id = social_id;
	}

	@Override
	public String toString() {
		return seq_type + " : " + user_email + " : " + type
				+ " : " + social_id + " : " + signup_date;
	}
	
	
	
	
}

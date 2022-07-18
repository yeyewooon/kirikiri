package com.kiri.dto;

public class TableJoinDTO {
	private String access;
	private String user_nickname;
	private String user_intro;
	private String user_gender;
	private String user_email;
	
	public TableJoinDTO() {}

	public TableJoinDTO(String access, String user_nickname, String user_intro, String user_gender, String user_email) {
		super();
		this.access = access;
		this.user_nickname = user_nickname;
		this.user_intro = user_intro;
		this.user_gender = user_gender;
		this.user_email = user_email;
	}

	public String getAccess() {
		return access;
	}

	public void setAccess(String access) {
		this.access = access;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_intro() {
		return user_intro;
	}

	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	@Override
	public String toString() {
		return "TableJoinDTO [access=" + access + ", user_nickname=" + user_nickname + ", user_intro=" + user_intro
				+ ", user_gender=" + user_gender + ", user_email=" + user_email + "]";
	}
	
	
	
}

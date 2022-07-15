package com.kiri.dto;

public class MemberDTO {
	private String user_email;
	private String user_pw;
	private String user_name;
	private String user_nickname;
	private String user_phone;
	private String user_bd;
	private String user_gender;
	private String user_job;
	private String user_intro;
	private String user_image;
	private String user_blacklist;
	private String user_delete;
	
	public MemberDTO(){}

	public MemberDTO(String user_email, String user_pw, String user_name, String user_nickname, String user_phone,
			String user_bd, String user_gender, String user_job, String user_intro, String user_image,
			String user_blacklist, String user_delete) {
		super();
		this.user_email = user_email;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
		this.user_phone = user_phone;
		this.user_bd = user_bd;
		this.user_gender = user_gender;
		this.user_job = user_job;
		this.user_intro = user_intro;
		this.user_image = user_image;
		this.user_blacklist = user_blacklist;
		this.user_delete = user_delete;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_bd() {
		return user_bd;
	}

	public void setUser_bd(String user_bd) {
		this.user_bd = user_bd;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_job() {
		return user_job;
	}

	public void setUser_job(String user_job) {
		this.user_job = user_job;
	}

	public String getUser_intro() {
		return user_intro;
	}

	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public String getUser_blacklist() {
		return user_blacklist;
	}

	public void setUser_blacklist(String user_blacklist) {
		this.user_blacklist = user_blacklist;
	}

	public String getUser_delete() {
		return user_delete;
	}

	public void setUser_delete(String user_delete) {
		this.user_delete = user_delete;
	}

	@Override
	public String toString() {
		return "MemberDTO [user_email=" + user_email + ", user_pw=" + user_pw + ", user_name=" + user_name
				+ ", user_nickname=" + user_nickname + ", user_phone=" + user_phone + ", user_bd=" + user_bd
				+ ", user_gender=" + user_gender + ", user_job=" + user_job + ", user_intro=" + user_intro
				+ ", user_image=" + user_image + ", user_blacklist=" + user_blacklist + ", user_delete=" + user_delete
				+ "]";

	}
	
	
}

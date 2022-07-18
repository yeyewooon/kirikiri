package com.kiri.dto;

import java.util.Date;

public class BlackListDTO {
	private int seq_bl;
	private String user_email;
	private Date date_bl; 
	private String bl_reason;
	
	public BlackListDTO() {}

	public BlackListDTO(int seq_bl, String user_email, Date date_bl, String bl_reason) {
		super();
		this.seq_bl = seq_bl;
		this.user_email = user_email;
		this.date_bl = date_bl;
		this.bl_reason = bl_reason;
	}

	public int getSeq_bl() {
		return seq_bl;
	}

	public void setSeq_bl(int seq_bl) {
		this.seq_bl = seq_bl;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public Date getDate_bl() {
		return date_bl;
	}

	public void setDate_bl(Date date_bl) {
		this.date_bl = date_bl;
	}

	public String getBl_reason() {
		return bl_reason;
	}

	public void setBl_reason(String bl_reason) {
		this.bl_reason = bl_reason;
	}

	@Override
	public String toString() {
		return "BlackListDTO [seq_bl=" + seq_bl + ", user_email=" + user_email + ", date_bl=" + date_bl + ", bl_reason="
				+ bl_reason + "]";
	}
	
}

package com.kiri.dto;

public class SiteDTO {
	private int seq_site;
	private String user_email;
	private String area;
	public SiteDTO() {
		super();
	}
	public SiteDTO(int seq_site, String user_email, String area) {
		super();
		this.seq_site = seq_site;
		this.user_email = user_email;
		this.area = area;
	}
	public int getSeq_site() {
		return seq_site;
	}
	public void setSeq_site(int seq_site) {
		this.seq_site = seq_site;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	@Override
	public String toString() {
		return "SiteDTO [seq_site=" + seq_site + ", user_email=" + user_email + ", area=" + area + "]";
	}
	
	
	
}

package com.kiri.dto;

public class HobbyDTO {
	private int seq_hobby;
	private String user_email;
	private String category;
	private String hobby;
	
	public HobbyDTO() {}
	public HobbyDTO(int seq_hobby, String user_email, String category, String hobby) {
		super();
		this.seq_hobby = seq_hobby;
		this.user_email = user_email;
		this.category = category;
		this.hobby = hobby;
	}
	public int getSeq_hobby() {
		return seq_hobby;
	}
	public void setSeq_hobby(int seq_hobby) {
		this.seq_hobby = seq_hobby;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	@Override
	public String toString() {
		return "HobbyDTO [seq_hobby=" + seq_hobby + ", user_email=" + user_email + ", category=" + category + ", hobby="
				+ hobby + "]";
	}
	
}

package com.kiri.dto;

import java.util.Date;

public class Group_ApplyDTO {
	private int seq_apply;
	private String user_email;
	private int seq_group;
	private String user_nickname;
	private String user_bd;
	
	public Group_ApplyDTO() {}

	public Group_ApplyDTO(int seq_apply, String user_email, int seq_group, String user_nickname, String user_bd) {
		super();
		this.seq_apply = seq_apply;
		this.user_email = user_email;
		this.seq_group = seq_group;
		this.user_nickname = user_nickname;
		this.user_bd = user_bd;
	}

	public int getSeq_apply() {
		return seq_apply;
	}

	public void setSeq_apply(int seq_apply) {
		this.seq_apply = seq_apply;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getSeq_group() {
		return seq_group;
	}

	public void setSeq_group(int seq_group) {
		this.seq_group = seq_group;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_bd() {
		return user_bd;
	}

	public void setUser_bd(String user_bd) {
		this.user_bd = user_bd;
	}

	@Override
	public String toString() {
		return "Group_ApplyDTO [seq_apply=" + seq_apply + ", user_email=" + user_email + ", seq_group=" + seq_group
				+ ", user_nickname=" + user_nickname + ", user_bd=" + user_bd + "]";
	}
	
	
	
	
}

package com.kiri.dto;

public class Group_MemberDTO {
	private int seq_member;
	private String user_email;
	private int seq_group;
	private String user_nickname;
	private String access;
	
	public Group_MemberDTO() {
		super();
	}

	public Group_MemberDTO(int seq_member, String user_email, int seq_group, String user_nickname, String access) {
		super();
		this.seq_member = seq_member;
		this.user_email = user_email;
		this.seq_group = seq_group;
		this.user_nickname = user_nickname;
		this.access = access;
	}
	public int getSeq_member() {
		return seq_member;
	}
	public void setSeq_member(int seq_member) {
		this.seq_member = seq_member;
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
	public String getAccess() {
		return access;
	}
	public void setAccess(String access) {
		this.access = access;
	}
	@Override
	public String toString() {
		return "Group_MemberDTO [seq_member=" + seq_member + ", user_email=" + user_email + ", seq_group=" + seq_group
				+ ", user_nickname=" + user_nickname + ", access=" + access + "]";
	}
	
}

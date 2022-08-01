package com.kiri.dto;

public class Group_Board_LikeDTO {
	private int seq_gboard_like;
	private int seq_group_board;
	private int seq_group;
	private String user_email;
	private int gboard_likecheck;
	
	public Group_Board_LikeDTO() {}
	public Group_Board_LikeDTO(int seq_gboard_like, int seq_group_board, int seq_group, String user_email,
			int gboard_likecheck) {
		super();
		this.seq_gboard_like = seq_gboard_like;
		this.seq_group_board = seq_group_board;
		this.seq_group = seq_group;
		this.user_email = user_email;
		this.gboard_likecheck = gboard_likecheck;
	}
	public int getSeq_gboard_like() {
		return seq_gboard_like;
	}
	public void setSeq_gboard_like(int seq_gboard_like) {
		this.seq_gboard_like = seq_gboard_like;
	}
	public int getSeq_group_board() {
		return seq_group_board;
	}
	public void setSeq_group_board(int seq_group_board) {
		this.seq_group_board = seq_group_board;
	}
	public int getSeq_group() {
		return seq_group;
	}
	public void setSeq_group(int seq_group) {
		this.seq_group = seq_group;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getGboard_likecheck() {
		return gboard_likecheck;
	}
	public void setGboard_likecheck(int gboard_likecheck) {
		this.gboard_likecheck = gboard_likecheck;
	}
	@Override
	public String toString() {
		return "Group_Board_LikeDTO [seq_gboard_like=" + seq_gboard_like + ", seq_group_board=" + seq_group_board
				+ ", seq_group=" + seq_group + ", user_email=" + user_email + ", gboard_likecheck=" + gboard_likecheck
				+ "]";
	}
}

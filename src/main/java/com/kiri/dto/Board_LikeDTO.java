package com.kiri.dto;

public class Board_LikeDTO {
	private int seq_like;
	private int seq_board;
	private String user_email;
	private int board_like;
	
	public Board_LikeDTO() {}
	public Board_LikeDTO(int seq_like, int seq_board, String user_email, int board_like) {
		super();
		this.seq_like = seq_like;
		this.seq_board = seq_board;
		this.user_email = user_email;
		this.board_like = board_like;
	}
	
	public int getSeq_like() {
		return seq_like;
	}
	public void setSeq_like(int seq_like) {
		this.seq_like = seq_like;
	}
	public int getSeq_board() {
		return seq_board;
	}
	public void setSeq_board(int seq_board) {
		this.seq_board = seq_board;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	
	@Override
	public String toString() {
		return "Board_LikeDTO [seq_like=" + seq_like + ", seq_board=" + seq_board + ", user_email=" + user_email
				+ ", board_like=" + board_like + "]";
	}	
}

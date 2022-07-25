package com.kiri.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BoardDTO {
	private int seq_board;
	private String user_email;
	private String user_nickname;
	private String board_category;
	private String board_title;
	private String board_content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date board_date;
	private int board_count;
	private int likehit;

	public BoardDTO() {}
	public BoardDTO(int seq_board, String user_email, String user_nickname, String board_category, String board_title,
			String board_content, Date board_date, int board_count, int likehit) {
		super();
		this.seq_board = seq_board;
		this.user_email = user_email;
		this.user_nickname = user_nickname;
		this.board_category = board_category;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_count = board_count;
		this.likehit = likehit;
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
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public int getLikehit() {
		return likehit;
	}
	public void setLikehit(int likehit) {
		this.likehit = likehit;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [seq_board=" + seq_board + ", user_email=" + user_email + ", user_nickname=" + user_nickname
				+ ", board_category=" + board_category + ", board_title=" + board_title + ", board_content="
				+ board_content + ", board_date=" + board_date + ", board_count=" + board_count + ", likehit=" + likehit
				+ "]";
	}	
}
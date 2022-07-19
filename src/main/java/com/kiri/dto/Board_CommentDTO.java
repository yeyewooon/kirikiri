package com.kiri.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Board_CommentDTO {
	private int seq_comment;
	private int seq_board;
	private String user_email;
	private String user_nickname;
	private String comment;
	private String comment_date;
	
	public Board_CommentDTO() {}
	public Board_CommentDTO(int seq_comment, int seq_board, String user_email, String user_nickname, String comment,
			String comment_date) {
		super();
		this.seq_comment = seq_comment;
		this.seq_board = seq_board;
		this.user_email = user_email;
		this.user_nickname = user_nickname;
		this.comment = comment;
		this.comment_date = comment_date;
	}
	// date -> String 생성자
	public Board_CommentDTO(int seq_comment, int seq_board, String user_email, String user_nickname, String comment,
			Date comment_date) {
		super();
		this.seq_comment = seq_comment;
		this.seq_board = seq_board;
		this.user_email = user_email;
		this.user_nickname = user_nickname;
		this.comment = comment;
		this.comment_date = getStringDate(comment_date);
	}
	
	// date -> String
	public String getStringDate(Date date) {
		String rs = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm:ss");
			rs = sdf.format(date);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public int getSeq_comment() {
		return seq_comment;
	}
	public void setSeq_comment(int seq_comment) {
		this.seq_comment = seq_comment;
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	
	@Override
	public String toString() {
		return "Board_CommentDTO [seq_comment=" + seq_comment + ", seq_board=" + seq_board + ", user_email="
				+ user_email + ", user_nickname=" + user_nickname + ", comment=" + comment + ", comment_date="
				+ comment_date + "]";
	}	
}

package com.kiri.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Group_BoardDTO {
	private int seq_group_board;
	private int seq_group;
	private String user_email;
	private String user_nickname;
	private String category;
	private String title;
	private String content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date written_date;
	private int view_count;
	
	public Group_BoardDTO() {}
	public Group_BoardDTO(int seq_group_board, int seq_group, String user_email, String user_nickname, String category,
			String title, String content, Date written_date, int view_count) {
		super();
		this.seq_group_board = seq_group_board;
		this.seq_group = seq_group;
		this.user_email = user_email;
		this.user_nickname = user_nickname;
		this.category = category;
		this.title = title;
		this.content = content;
		this.written_date = written_date;
		this.view_count = view_count;
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
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWritten_date() {
		return written_date;
	}
	public void setWritten_date(Date written_date) {
		this.written_date = written_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	@Override
	public String toString() {
		return "Group_BoardDTO [seq_group_board=" + seq_group_board + ", seq_group=" + seq_group + ", user_email="
				+ user_email + ", user_nickname=" + user_nickname + ", category=" + category + ", title=" + title
				+ ", content=" + content + ", written_date=" + written_date + ", view_count=" + view_count + "]";
	}
}

package com.kiri.dto;

public class Board_FileDTO {
	private int seq_file;
	private int seq_board;
	private String sys_name;
	
	public Board_FileDTO() {}
	public Board_FileDTO(int seq_file, int seq_board, String sys_name) {
		super();
		this.seq_file = seq_file;
		this.seq_board = seq_board;
		this.sys_name = sys_name;
	}
	
	public int getSeq_file() {
		return seq_file;
	}
	public void setSeq_file(int seq_file) {
		this.seq_file = seq_file;
	}
	public int getSeq_board() {
		return seq_board;
	}
	public void setSeq_board(int seq_board) {
		this.seq_board = seq_board;
	}
	public String getSys_name() {
		return sys_name;
	}
	public void setSys_name(String sys_name) {
		this.sys_name = sys_name;
	}
	
	@Override
	public String toString() {
		return "Board_FileDTO [seq_file=" + seq_file + ", seq_board=" + seq_board + ", sys_name=" + sys_name + "]";
	}	
}

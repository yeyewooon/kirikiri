package com.kiri.dto;

public class Group_Board_FileDTO {
	private int seq_group_file;
	private int seq_group_board;
	private int seq_group;
	private String sys_name;
	
	public Group_Board_FileDTO() {}
	public Group_Board_FileDTO(int seq_group_file, int seq_group_board, int seq_group, String sys_name) {
		super();
		this.seq_group_file = seq_group_file;
		this.seq_group_board = seq_group_board;
		this.seq_group = seq_group;
		this.sys_name = sys_name;
	}
	public int getSeq_group_file() {
		return seq_group_file;
	}
	public void setSeq_group_file(int seq_group_file) {
		this.seq_group_file = seq_group_file;
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
	public String getSys_name() {
		return sys_name;
	}
	public void setSys_name(String sys_name) {
		this.sys_name = sys_name;
	}
	@Override
	public String toString() {
		return "Group_Board_FileDTO [seq_group_file=" + seq_group_file + ", seq_group_board=" + seq_group_board
				+ ", seq_group=" + seq_group + ", sys_name=" + sys_name + "]";
	}
	
	
}

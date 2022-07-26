package com.kiri.dto;

public class AdminMainDTO {

	private int seq_group_cal;
	private int seq_group;
	private String user_email;
	private String title;
	private String start;
	private String gcal_name;
	private String gcal_content;
	private String gcal_place;
	private String gcal_latitude;
	private String gcal_longitude;
	private String group_title;
	private String group_cal_cnt;
	
	public AdminMainDTO() {}

	public AdminMainDTO(int seq_group_cal, int seq_group, String user_email, String title, String start,
			String gcal_name, String gcal_content, String gcal_place, String gcal_latitude, String gcal_longitude,
			String group_title, String group_cal_cnt) {
		super();
		this.seq_group_cal = seq_group_cal;
		this.seq_group = seq_group;
		this.user_email = user_email;
		this.title = title;
		this.start = start;
		this.gcal_name = gcal_name;
		this.gcal_content = gcal_content;
		this.gcal_place = gcal_place;
		this.gcal_latitude = gcal_latitude;
		this.gcal_longitude = gcal_longitude;
		this.group_title = group_title;
		this.group_cal_cnt = group_cal_cnt;
	}

	public int getSeq_group_cal() {
		return seq_group_cal;
	}

	public void setSeq_group_cal(int seq_group_cal) {
		this.seq_group_cal = seq_group_cal;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getGcal_name() {
		return gcal_name;
	}

	public void setGcal_name(String gcal_name) {
		this.gcal_name = gcal_name;
	}

	public String getGcal_content() {
		return gcal_content;
	}

	public void setGcal_content(String gcal_content) {
		this.gcal_content = gcal_content;
	}

	public String getGcal_place() {
		return gcal_place;
	}

	public void setGcal_place(String gcal_place) {
		this.gcal_place = gcal_place;
	}

	public String getGcal_latitude() {
		return gcal_latitude;
	}

	public void setGcal_latitude(String gcal_latitude) {
		this.gcal_latitude = gcal_latitude;
	}

	public String getGcal_longitude() {
		return gcal_longitude;
	}

	public void setGcal_longitude(String gcal_longitude) {
		this.gcal_longitude = gcal_longitude;
	}

	public String getGroup_title() {
		return group_title;
	}

	public void setGroup_title(String group_title) {
		this.group_title = group_title;
	}

	public String getGroup_cal_cnt() {
		return group_cal_cnt;
	}

	public void setGroup_cal_cnt(String group_cal_cnt) {
		this.group_cal_cnt = group_cal_cnt;
	}

	@Override
	public String toString() {
		return "AdminMapDTO [seq_group_cal=" + seq_group_cal + ", seq_group=" + seq_group + ", user_email=" + user_email
				+ ", title=" + title + ", start=" + start + ", gcal_name=" + gcal_name + ", gcal_content="
				+ gcal_content + ", gcal_place=" + gcal_place + ", gcal_latitude=" + gcal_latitude + ", gcal_longitude="
				+ gcal_longitude + ", group_title=" + group_title + ", group_cal_cnt=" + group_cal_cnt + "]";
	}
	
	
	
	
	
}

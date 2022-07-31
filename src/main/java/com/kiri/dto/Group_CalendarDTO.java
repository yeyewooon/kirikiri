package com.kiri.dto;

import java.sql.Date;

public class Group_CalendarDTO {
	private int seq_group_cal;
	private int seq_group;
	private String user_email;
	private String title;
	private String start;
	private String end;
	private String gcal_content;
	private String gcal_place;
	private String gcal_latitude;
	private String gcal_longitude;
	private String group_time;
	
	public Group_CalendarDTO() {
		super();
	}

	public Group_CalendarDTO(int seq_group_cal, int seq_group, String user_email, String title, String start, String end, String gcal_content, String gcal_place, String gcal_latitude, String gcal_longitude, String group_time) {
		super();
		this.seq_group_cal = seq_group_cal;
		this.seq_group = seq_group;
		this.user_email = user_email;
		this.title = title;
		this.start = start;
		this.end = end;
		this.gcal_content = gcal_content;
		this.gcal_place = gcal_place;
		this.gcal_latitude = gcal_latitude;
		this.gcal_longitude = gcal_longitude;
		this.group_time = group_time;
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

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
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

	public String getGroup_time() {
		return group_time;
	}

	public void setGroup_time(String group_time) {
		this.group_time = group_time;
	}

	@Override
	public String toString() {
		return "Group_CalendarDTO [seq_group_cal=" + seq_group_cal + ", seq_group=" + seq_group + ", user_email=" + user_email + ", title=" + title + ", start=" + start + ", end=" + end + ", gcal_content=" + gcal_content + ", gcal_place=" + gcal_place + ", gcal_latitude=" + gcal_latitude + ", gcal_longitude=" + gcal_longitude + ", group_time=" + group_time + "]";
	}
	
	
	
	
	
}

package com.kiri.dto;

public class Tbl_GroupDTO {
	private int seq_group;
	private String user_email;
	private String group_title;
	private String group_info;
	private String group_category;
	private String group_site;
	private int group_people;
	private String ori_name;
	private String sys_name;
	
<<<<<<< HEAD
=======
	public Tbl_GroupDTO() {
		super();
	}

	public Tbl_GroupDTO(int seq_group, String user_email, String group_title, String group_info, String group_category,
			String group_site, int group_people, String ori_name, String sys_name) {
		super();
		this.seq_group = seq_group;
		this.user_email = user_email;
		this.group_title = group_title;
		this.group_info = group_info;
		this.group_category = group_category;
		this.group_site = group_site;
		this.group_people = group_people;
		this.ori_name = ori_name;
		this.sys_name = sys_name;
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

	public String getGroup_title() {
		return group_title;
	}

	public void setGroup_title(String group_title) {
		this.group_title = group_title;
	}

	public String getGroup_info() {
		return group_info;
	}

	public void setGroup_info(String group_info) {
		this.group_info = group_info;
	}

	public String getGroup_category() {
		return group_category;
	}

	public void setGroup_category(String group_category) {
		this.group_category = group_category;
	}

	public String getGroup_site() {
		return group_site;
	}

	public void setGroup_site(String group_site) {
		this.group_site = group_site;
	}

	public int getGroup_people() {
		return group_people;
	}

	public void setGroup_people(int group_people) {
		this.group_people = group_people;
	}

	public String getOri_name() {
		return ori_name;
	}

	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}

	public String getSys_name() {
		return sys_name;
	}

	public void setSys_name(String sys_name) {
		this.sys_name = sys_name;
	}

	@Override
	public String toString() {
		return "Tbl_GroupDTO [seq_group=" + seq_group + ", user_email=" + user_email + ", group_title=" + group_title
				+ ", group_info=" + group_info + ", group_category=" + group_category + ", group_site=" + group_site
				+ ", group_people=" + group_people + ", ori_name=" + ori_name + ", sys_name=" + sys_name + "]";
	}
	
	
	
	
	
	
	
	
>>>>>>> 811b2f1e80664298b397fe202e26bc7034218d16
}


package com.kiri.dto;

public class Login_LogDTO {
	private String user_email;
	private String login_status;
	private String login_time; // 테이블에는 date 타입이 맞음
	private int loginCnt;
	
	public Login_LogDTO() {
	}

	public Login_LogDTO(String user_email, String login_status, String login_time, int loginCnt) {
		super();
		this.user_email = user_email;
		this.login_status = login_status;
		this.login_time = login_time;
		this.loginCnt = loginCnt;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getLogin_status() {
		return login_status;
	}

	public void setLogin_status(String login_status) {
		this.login_status = login_status;
	}

	public String getLogin_time() {
		return login_time;
	}

	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}

	public int getLoginCnt() {
		return loginCnt;
	}

	public void setLoginCnt(int loginCnt) {
		this.loginCnt = loginCnt;
	}

	@Override
	public String toString() {
		return "Login_LogDTO [user_email=" + user_email + ", login_status=" + login_status + ", login_time="
				+ login_time + ", loginCnt=" + loginCnt + "]";
	}
	
	
}

package com.kiri.dto;

public class ReportDTO {
	private int seq_report;
	private String user_email;
	private String report_reason;
	
	public ReportDTO() {}
	public ReportDTO(int seq_report, String user_email, String report_reason) {
		super();
		this.seq_report = seq_report;
		this.user_email = user_email;
		this.report_reason = report_reason;
	}
	public int getSeq_report() {
		return seq_report;
	}
	public void setSeq_report(int seq_report) {
		this.seq_report = seq_report;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getReport_reason() {
		return report_reason;
	}
	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}
	@Override
	public String toString() {
		return "ReportDTO [seq_report=" + seq_report + ", user_email=" + user_email + ", report_reason=" + report_reason
				+ "]";
	}
	
	
}

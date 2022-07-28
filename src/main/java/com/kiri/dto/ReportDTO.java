package com.kiri.dto;

public class ReportDTO {
   private int seq_report;
   private String report_send;
   private String report_receive;
   private String report_reason;
   private String report_date;
   
   public ReportDTO() {}

   public ReportDTO(int seq_report, String report_send, String report_receive, String report_reason,
         String report_date) {
      super();
      this.seq_report = seq_report;
      this.report_send = report_send;
      this.report_receive = report_receive;
      this.report_reason = report_reason;
      this.report_date = report_date;
   }

   public int getSeq_report() {
      return seq_report;
   }

   public void setSeq_report(int seq_report) {
      this.seq_report = seq_report;
   }

   public String getReport_send() {
      return report_send;
   }

   public void setReport_send(String report_send) {
      this.report_send = report_send;
   }

   public String getReport_receive() {
      return report_receive;
   }

   public void setReport_receive(String report_receive) {
      this.report_receive = report_receive;
   }

   public String getReport_reason() {
      return report_reason;
   }

   public void setReport_reason(String report_reason) {
      this.report_reason = report_reason;
   }

   public String getReport_date() {
      return report_date;
   }

   public void setReport_date(String report_date) {
      this.report_date = report_date;
   }

   @Override
   public String toString() {
      return "ReportDTO [seq_report=" + seq_report + ", report_send=" + report_send + ", report_receive="
            + report_receive + ", report_reason=" + report_reason + ", report_date=" + report_date + "]";
   }

   
   
}
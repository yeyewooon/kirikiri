package com.kiri.dto;

public class MessageDTO {   
   
   private int seq_message;
   private String user_send;
   private String user_receive;
   private String msgContent;
   private String date;
   private int view_count;
   
   public MessageDTO() {}

   public MessageDTO(int seq_message, String user_send, String user_receive, String msgContent, String date,
         int view_count) {
      super();
      this.seq_message = seq_message;
      this.user_send = user_send;
      this.user_receive = user_receive;
      this.msgContent = msgContent;
      this.date = date;
      this.view_count = view_count;
   }

   public int getSeq_message() {
      return seq_message;
   }

   public void setSeq_message(int seq_message) {
      this.seq_message = seq_message;
   }

   public String getUser_send() {
      return user_send;
   }

   public void setUser_send(String user_send) {
      this.user_send = user_send;
   }

   public String getUser_receive() {
      return user_receive;
   }

   public void setUser_receive(String user_receive) {
      this.user_receive = user_receive;
   }

   public String getMsgContent() {
      return msgContent;
   }

   public void setMsgContent(String msgContent) {
      this.msgContent = msgContent;
   }

   public String getDate() {
      return date;
   }

   public void setDate(String date) {
      this.date = date;
   }

   public int getView_count() {
      return view_count;
   }

   public void setView_count(int view_count) {
      this.view_count = view_count;
   }

   @Override
   public String toString() {
      return "MessageDTO [seq_message=" + seq_message + ", user_send=" + user_send + ", user_receive=" + user_receive
            + ", msgContent=" + msgContent + ", date=" + date + ", view_count=" + view_count + "]";
   }


   

}
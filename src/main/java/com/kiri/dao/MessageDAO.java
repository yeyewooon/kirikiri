package com.kiri.dao;

import java.util.List;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.MessageDTO;

@Repository
public class MessageDAO {
   @Autowired 
   private BasicDataSource bds;
   
   @Autowired
   private SqlSession session;
   
   
   // 쪽지 보내기
   public String sendMessage(MessageDTO MessageDTO) throws Exception{
      int rs = session.insert("messageMapper.insertMessage", MessageDTO);
      if(rs > 0) return "success";
      else return "fail";
   }
   
   // 내가 받은 쪽지 보기
   public List<MessageDTO> selectReMessage(String user_receive) throws Exception{
      return session.selectList("messageMapper.selectReMessage", user_receive);
   }
   
   // 내가 보낸 쪽지 보기
   public List<MessageDTO> selectSendMessage(String user_send) throws Exception{
      return session.selectList("messageMapper.selectSendMessage", user_send);
   }
   
   
   

}
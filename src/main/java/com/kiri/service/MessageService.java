package com.kiri.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.MessageDAO;
import com.kiri.dto.MessageDTO;

@Service
public class MessageService {
   
   @Autowired
   private MessageDAO MessageDAO;
   
   // 쪽지 보내기
   public String sendMessage(MessageDTO MessageDTO) throws Exception{
      return MessageDAO.sendMessage(MessageDTO);
   }
   
   // 내가 받은 쪽지 보기
   public List<MessageDTO> selectReMessage(String user_receive) throws Exception{
      return MessageDAO.selectReMessage(user_receive);
   }
   
   // 내가 보낸 쪽지 보기
   public List<MessageDTO> selectSendMessage(String user_send) throws Exception{
      return MessageDAO.selectSendMessage(user_send);
   }
   
   // 쪽지 삭제하기
   public void deleteMessage(List<String> message) throws Exception {
     Map<String, Object> param = new HashMap<>();
     param.put("message", message);
     MessageDAO.deleteMessage(param);
   }
   
   
   
   
}
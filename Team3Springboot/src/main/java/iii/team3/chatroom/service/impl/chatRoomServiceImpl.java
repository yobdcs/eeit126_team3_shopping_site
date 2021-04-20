package iii.team3.chatroom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iii.team3.chatroom.dao.handlingChatMsgDao;
import iii.team3.chatroom.model.MessageModel;
import iii.team3.chatroom.service.chatRoomService;

@Service("chatservice")
public class chatRoomServiceImpl implements chatRoomService{
	@Autowired
	private handlingChatMsgDao chatdao;
	
	@Override
	public void insertChatMsg(MessageModel messagemodel) {
		chatdao.insertComment(messagemodel);
	}
	
	@Override
	public List<MessageModel> queryHistory(String mailer){
		return  chatdao.queryChatHistory(mailer);
	}
}

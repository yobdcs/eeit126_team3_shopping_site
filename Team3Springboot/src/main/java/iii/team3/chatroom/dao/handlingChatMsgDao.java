package iii.team3.chatroom.dao;

import java.util.List;

import iii.team3.chatroom.model.MessageModel;

public interface handlingChatMsgDao {

	void insertComment(MessageModel messagemodel);

	List<MessageModel> queryChatHistory(String mailer);
	
	
}

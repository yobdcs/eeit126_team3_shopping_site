package iii.team3.chatroom.service;

import java.util.List;

import iii.team3.chatroom.model.MessageModel;


public interface chatRoomService {

	void insertChatMsg(MessageModel messagemodel);

	List<MessageModel> queryHistory(String mailer);

}

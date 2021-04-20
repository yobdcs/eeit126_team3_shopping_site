package iii.team3.MessageBoard.service;

import java.util.List;

import iii.team3.MessageBoard.model.MessageBean;

public interface CommentService {

	void insertComment(MessageBean commentBean);

	List<MessageBean> updateMessage(MessageBean message);

	List<MessageBean> selectAllComment();

	List<MessageBean> deleteOneComment(Integer id);
	
	public List <MessageBean> selectOneComment(Integer productid);

	void insertReplyProcess(Integer id, String content, String time,String account);

	List<MessageBean> notifyMember(Integer memberId);
}

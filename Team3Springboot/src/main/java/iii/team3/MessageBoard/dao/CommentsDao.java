package iii.team3.MessageBoard.dao;

import java.util.List;

import iii.team3.MessageBoard.model.MessageBean;

public interface CommentsDao {

	void insertComment(MessageBean commentBean);

	void insertReplyProcess(Integer id, String content, String time,String account);

	List<MessageBean> selectAllComment();

	List<MessageBean> deleteOneComment(Integer id);
	
	public List <MessageBean> selectOneComment(Integer productid);

	List<MessageBean> updateMessage(MessageBean message);

	List<MessageBean> notifyMember(Integer userName);
}

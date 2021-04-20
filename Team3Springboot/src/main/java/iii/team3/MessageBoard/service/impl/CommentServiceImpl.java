package iii.team3.MessageBoard.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iii.team3.MessageBoard.dao.CommentsDao;
import iii.team3.MessageBoard.model.MessageBean;
import iii.team3.MessageBoard.service.CommentService;

@Service("commentService")
@Transactional
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentsDao commentsDoDao;

	@Override
	public void insertComment(MessageBean commentBean) {
		commentsDoDao.insertComment(commentBean);
	}

	@Override
	public void insertReplyProcess(Integer id,String content, String time,String account) {
		commentsDoDao.insertReplyProcess(id, content, time,account);
	}


	@Override
	public List<MessageBean> selectAllComment() {

		return commentsDoDao.selectAllComment();
	}

	@Override
	public List<MessageBean> deleteOneComment(Integer id) {

		return commentsDoDao.deleteOneComment(id);
	}

	@Override
	public List<MessageBean> updateMessage(MessageBean message) {
		return commentsDoDao.updateMessage(message);

	}

	@Override
	public List<MessageBean> selectOneComment(Integer productid) {
		return commentsDoDao.selectOneComment(productid);
	}

	@Override
	public List<MessageBean> notifyMember(Integer memberId) {
		
		return commentsDoDao.notifyMember(memberId);
	}
	
	

}

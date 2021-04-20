package iii.team3.chatroom.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import iii.team3.chatroom.dao.handlingChatMsgDao;
import iii.team3.chatroom.model.MessageModel;

@Repository("chatdao")
@Transactional
public class handlingChatMsgDaoImpl implements  handlingChatMsgDao{
	
	@Autowired
	private EntityManager em;
	 
	@Override
	public void insertComment(MessageModel messagemodel) {
		if (messagemodel != null) {
			em.persist(messagemodel);
		}
		
	}
	
	//查詢單筆
	@SuppressWarnings("unchecked")
	@Override
	public List <MessageModel> queryChatHistory(String mailer){		

		String hql="FROM MessageModel c  where c.fromLogin = :user";
		List <MessageModel> mb = null;
		
		mb = em.createQuery(hql).setParameter("user", mailer).getResultList();			
		
		return mb;
			
	} 
	
}

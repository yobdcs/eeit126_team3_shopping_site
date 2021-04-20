package iii.team3.MessageBoard.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import iii.team3.MessageBoard.dao.CommentsDao;
import iii.team3.MessageBoard.model.MessageBean;
import iii.team3.MessageBoard.model.SubMessageBean;

@Repository("commentsDoDao")
@Transactional
public class CommentsDaoImpl implements CommentsDao {
//	@Autowired
//	private SessionFactory factory;
//	private Session session;
	
	@Autowired
	private EntityManager em;
	
	//新增提問
	@Override
	public void insertComment(MessageBean commentBean) {
//		session = factory.getCurrentSession();
		if (commentBean != null) {
//			session.save(commentBean);
			em.persist(commentBean);
		}
	}
	
	//新增回覆
	@Override
	public void insertReplyProcess(Integer id, String content, String time,String account) {
//		session = factory.getCurrentSession();
//		var msgBean = session.get(MessageBean.class, id);
		var msgBean = em.find(MessageBean.class, id);
		msgBean.getMsgList().add(new SubMessageBean(content, time,account));
//		session.merge(msgBean);
		em.merge(msgBean);
	}
	
	//查詢單筆
	@SuppressWarnings("unchecked")
	@Override
	public List <MessageBean> selectOneComment(Integer productid){		
//		session = factory.getCurrentSession();	
		String hql="FROM MessageBean c where  c.productId = :pid";
		List <MessageBean> mb = null;
//		mb = session.createQuery(hql).setParameter("pid", productid).getResultList();			
		mb = em.createQuery(hql).setParameter("pid", productid).getResultList();			
		
		return mb;
			
	}
	
	
	//查詢全部
	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> selectAllComment() {
//		session = factory.getCurrentSession();
		String hql = "FROM MessageBean ";
		List<MessageBean> mBeans = null;
//		mBeans = session.createQuery(hql).getResultList();
		mBeans = em.createQuery(hql).getResultList();
		
		return mBeans;
	}
	
	//管理者刪除
	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> deleteOneComment(Integer id) {

//		session = factory.getCurrentSession();
//		session.delete(session.get(MessageBean.class, id));
		em.remove(em.find(MessageBean.class, id));
		String hql = "FROM MessageBean ";
		List<MessageBean> mb = null;
//		mb = session.createQuery(hql).getResultList();
		mb = em.createQuery(hql).getResultList();
		return mb;
	}
	
	//管理者修改
	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> updateMessage(MessageBean message) {
//		session = factory.getCurrentSession();
//		session.update(message);
		em.merge(message);
		String hql = "FROM MessageBean";
		List<MessageBean> mb = null;
//		mb = session.createQuery(hql).getResultList();
		mb = em.createQuery(hql).getResultList();
		return mb;
	}
	
	//會員通知
	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> notifyMember(Integer userName) {
//		session = factory.getCurrentSession();
//		session.update(message);
		
		String hql="FROM MessageBean c where  c.sellerid = :seller";
		List<MessageBean> mb = null;
//		mb = session.createQuery(hql).getResultList();
		mb = em.createQuery(hql).setParameter("seller", userName).getResultList();
		return mb;
	}
	
	
}

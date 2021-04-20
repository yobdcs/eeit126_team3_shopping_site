package iii.team3.member.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import iii.team3.member.model.MemberBean;

@Repository
@Transactional
public class MemberDAO {
//	@Autowired
//	private SessionFactory factory;
	
	@Autowired
	private EntityManager em;
	
	public MemberDAO() {
	}
	
	public void inserData(MemberBean b) {
//		Session session = factory.getCurrentSession();
//		session.save(b);
		em.persist(b);
	}
	
	public MemberBean findByID(Integer id) {
		MemberBean idBean = null;
//		Session session = factory.getCurrentSession();
//		idBean = session.get(MemberBean.class, id);
		idBean =  em.find(MemberBean.class, id);
		
		return idBean;
	}
	
	public void updateData(MemberBean b) {
//		Session session = factory.getCurrentSession();
//		session.merge(b);
		em.merge(b);
	}
	
	public void deleteData(Integer id) {
//		Session session = factory.getCurrentSession();
		MemberBean delBean = new MemberBean(id);
//		session.delete(delBean);
		em.remove(delBean);
	}
	
	public String findPwByAccount(String acc) {
		String clickPw=null;
		String hql = "SELECT m.password FROM MemberBean m WHERE m.account = :macc";
//		Session session = factory.getCurrentSession();
		try {			
//			clickPw = (String)session.createQuery(hql).setParameter("macc", acc).getSingleResult();
			clickPw = (String) em.createQuery(hql).setParameter("macc", acc).getSingleResult();
		} catch (NoResultException e) {
			clickPw = null;
		}
		return clickPw;
	}
	
	public MemberBean findByAccount(String acc) {
		MemberBean sessionBean = null;
		String hql = "FROM MemberBean m WHERE m.account = :macc";
//		Session session = factory.getCurrentSession();
		try {			
//			sessionBean = (MemberBean) session.createQuery(hql).setParameter("macc", acc).getSingleResult();
			sessionBean = (MemberBean) em.createQuery(hql).setParameter("macc", acc).getSingleResult();
		} catch (NoResultException e) {
			em = null;
		}
		return sessionBean;
	}
	
	@SuppressWarnings("unchecked")
	public List<MemberBean> findAllBeans(){
		String hql = "FROM MemberBean";
//		Session session = factory.getCurrentSession();
//		List<MemberBean> MBeans = session.createQuery(hql).getResultList();
		List<MemberBean> MBeans = em.createQuery(hql).getResultList();
		return MBeans;
	}

}

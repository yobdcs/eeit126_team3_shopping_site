package iii.team3.act.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iii.team3.act.entity.ActMain;

@Repository
public class ActMainDAOImpl implements ActMainDAO {

//	@Autowired
//	private SessionFactory sessionFactory;
	
	@Autowired
	private EntityManager em;

	@Override
	public List<ActMain> getActMains() {

//		Session currentSession = sessionFactory.getCurrentSession();

//		Query<ActMain> theQuery = currentSession.createQuery("from ActMain", ActMain.class);
		
		String hql = "from ActMain";
		
		@SuppressWarnings("unchecked")
		List<ActMain> actMains = em.createQuery(hql).getResultList();

//		List<ActMain> actMains = theQuery.getResultList();

		return actMains;

	}

	@Override
	public void saveActMain(ActMain theActMain) {

//		Session currentSession = sessionFactory.getCurrentSession();

//		currentSession.saveOrUpdate(theActMain);
		em.merge(theActMain);

	}

	@Override
	public ActMain getActMains(int theId) {

//		Session currentSession = sessionFactory.getCurrentSession();

//		ActMain theActMain = currentSession.get(ActMain.class, theId);
		ActMain theActMain = em.find(ActMain.class, theId);

		return theActMain;
	}

	@Override
	public void deleteActMain(int theId) {

//		Session currentSession = sessionFactory.getCurrentSession();

//		Query theQuery = currentSession.createQuery("delete from ActMain where id=:actMainId");
		em.createQuery("delete from ActMain where id=:actMainId").setParameter("actMainId", theId).executeUpdate();
//		theQuery.setParameter("actMainId", theId);

//		theQuery.executeUpdate();
	}

}

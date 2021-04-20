package iii.team3.product.dao;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import iii.team3.member.model.MemberBean;
import iii.team3.product.model.ProductBean;
import iii.team3.product.model.ReportBean;
import iii.team3.shoppingCart.dao.ShoppingCartJpaRepository;

@Repository
@Transactional
public class ProductDAO implements ProductDAOInterface {

//	@Autowired
//	private SessionFactory sessionFactory;
	
	@Autowired
	private EntityManager em;
	
	@Autowired
	private ShoppingCartJpaRepository scJpaRepository;

	@Override
	public void createImage(HttpServletRequest request) throws SQLException, IOException {
//		Session session = sessionFactory.getCurrentSession();
		String saveDir = request.getSession().getServletContext().getRealPath("/") + "WEB-INF\\image";
		File saveFileDir = new File(saveDir);
		
		System.out.println(saveDir);
		
		saveFileDir.mkdirs();
		FileOutputStream fout = null;
		
//		String hqlString = "from ProductBean";
		
//		List<ProductBean> list = (List<ProductBean>) session.createQuery(hqlString).getResultList();
//		List<ProductBean> list = (List<ProductBean>) em.createQuery(hqlString).getResultList();
		var list = scJpaRepository.findAll();
		
		for(ProductBean bean : list){
			fout = new FileOutputStream(saveDir + "/" + bean.getUserName() + bean.getProductName() + ".jpg");
			InputStream is = new ByteArrayInputStream(bean.getProductImgLink());
			byte[] b = new byte[1024 * 1024];
			int length = 0;
			while ((length = is.read(b)) != -1) {
				fout.write(b, 0, length);
				fout.flush();
//				fout.close();
			}
		}
	}	
	
	@Override
	public ProductBean insertProduct(ProductBean beanData) {
//		Session session = sessionFactory.getCurrentSession();
		if (beanData != null) {
//			session.save(beanData);
			em.persist(beanData);
		}
		return beanData;
	}

	@Override
	public ProductBean loadProduct(Integer pk) {
		ProductBean productBean;
//		Session session = sessionFactory.getCurrentSession();
//		productBean = session.get(ProductBean.class, pk);
		productBean = em.find(ProductBean.class, pk);		
		System.out.println(productBean.getPayTpyeList().get(0).getPayId());
		System.out.println(productBean.getPayTpyeList().get(0).getPayType());
		productBean.getPayTpyeList().clear();
		productBean.getShipTypeList().clear();
		return productBean;
	}
	
	@Override
	public void updateProduct(ProductBean beanData) {
//		Session session = sessionFactory.getCurrentSession();
		if (beanData != null) {
//			session.merge(beanData);
			em.merge(beanData);
		}
	}

	@Override
	public void deleteProduct(Integer id) {
		String hql = "UPDATE ProductBean SET product_vision = :vision WHERE product_id =:id";
//		Session session = sessionFactory.getCurrentSession();
//		session.createQuery(hql).setParameter("productId", id).executeUpdate();
		em.createQuery(hql).setParameter("vision", 2).setParameter("id", id).executeUpdate();
	}
	
	@Override
	public void setProductVision(Integer vision, Integer id) {
		String hql = "UPDATE ProductBean SET product_vision = :vision WHERE product_id =:id";
//		Session session = sessionFactory.getCurrentSession();
//		session.createQuery(hql).setParameter("vision", vision).setParameter("id", id).executeUpdate();
		em.createQuery(hql).setParameter("vision", vision).setParameter("id", id).executeUpdate();
	}
	
	@Override
	public void setReportVision(Integer vision, Integer id) {
		String hql = "UPDATE ReportBean SET report_vision = :vision WHERE product_id =:id";
		em.createQuery(hql).setParameter("vision", vision).setParameter("id", id).executeUpdate();
	}
	
	@Override
	public ProductBean gotoSearch(Integer productId) {
//		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM ProductBean WHERE product_id = : productId";
//		ProductBean productBean = (ProductBean) session.createQuery(hql).setParameter("productId", productId).getSingleResult();
		ProductBean productBean = (ProductBean) em.createQuery(hql).setParameter("productId", productId).getSingleResult();
		productBean.getPayTpyeList().size();
		productBean.getShipTypeList().size();
		return productBean;
	}
	
//---------------------------------Member Product List--------------------------------------------
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> gotoUserList(Integer id) {
//		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM ProductBean where userName = :userid and Product_Vision = :int1 or Product_Vision = :int2" ;
//		List<ProductBean> list = session.createQuery(hql).setParameter("userid", id).getResultList();
		List<ProductBean> list = em.createQuery(hql).setParameter("userid", id).setParameter("int1", 0).setParameter("int2", 1).getResultList();
		for (ProductBean productBean : list) {
			productBean.getPayTpyeList().size();
			productBean.getShipTypeList().size();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> gotoReportProductEdit(Integer id) {
		String hql = "FROM ProductBean where productId = :productid" ;
		List<ProductBean> list = em.createQuery(hql).setParameter("productid", id).getResultList();
		for (ProductBean productBean : list) {
			productBean.getPayTpyeList().size();
			productBean.getShipTypeList().size();
		}
		return list;
	}
	
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<ProductBean> searchUserListByUser(String sellAccount) {
////		Session session = sessionFactory.getCurrentSession();
//		String hql = "FROM ProductBean WHERE user_name = :userName";
////		List<ProductBean> listByUser = session.createQuery(hql).setParameter("userName", sellAccount).getResultList();
//		List<ProductBean> listByUser = em.createQuery(hql).setParameter("userName", sellAccount).getResultList();
//		for (ProductBean productBean : listByUser) {
//			productBean.getPayTpyeList().size();
//			productBean.getShipTypeList().size();
//		}
//		
//		return listByUser;
//	}

//	@SuppressWarnings("unchecked")
//	@Override
//	public List<ProductBean> searchUserListByProduct(String sellProduct) {
////		Session session = sessionFactory.getCurrentSession();
//		String hql = "FROM ProductBean WHERE product_name like  :productName ";
////		List<ProductBean> listByProduct = session.createQuery(hql).setParameter("productName", "%" + sellProduct + "%")
//		List<ProductBean> listByProduct = em.createQuery(hql).setParameter("productName", "%" + sellProduct + "%")
//				.getResultList();
//		for (ProductBean productBean : listByProduct) {
//			productBean.getPayTpyeList().size();
//			productBean.getShipTypeList().size();
//		}
//		return listByProduct;
//	}
//---------------------------------Customer Product List------------------------------------
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> gotoCustomerList(Integer vision) {
//		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM ProductBean Where productVision = :productVision";
//		List<ProductBean> list = session.createQuery(hql).setParameter("productVision", vision).getResultList();
		List<ProductBean> list = em.createQuery(hql).setParameter("productVision", vision).getResultList();
		
		for (ProductBean productBean : list) {
			productBean.getPayTpyeList().size();
			productBean.getShipTypeList().size();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> gotoCustomerListByUser(String sellAccount,Integer vision) {
//		Session session = sessionFactory.getCurrentSession();
		String hql1 = "FROM MemberBean WHERE ACCOUNT = :userName";
		List<MemberBean> memberBeans= em.createQuery(hql1).setParameter("userName", sellAccount).getResultList();
		Integer memberId = memberBeans.get(0).getMemberId();
		String hql = "FROM ProductBean WHERE user_name = :userName AND product_vision =: productVision";
//		List<ProductBean> listByUser = session.createQuery(hql).setParameter("userName", sellAccount)
		List<ProductBean> listByUser = em.createQuery(hql).setParameter("userName", memberId)
											  .setParameter("productVision", vision).getResultList();
		for (ProductBean productBean : listByUser) {
			productBean.getPayTpyeList().size();
			productBean.getShipTypeList().size();
		}

		return listByUser;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> gotoCustomerListByProduct(String sellProduct,Integer vision) {
//		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM ProductBean WHERE product_name like  :productName AND product_vision =: productVision";
//		List<ProductBean> listByProduct = session.createQuery(hql).setParameter("productName", "%" + sellProduct + "%")
		List<ProductBean> listByProduct = em.createQuery(hql).setParameter("productName", "%" + sellProduct + "%")
												 .setParameter("productVision", vision).getResultList();
		for (ProductBean productBean : listByProduct) {
			productBean.getPayTpyeList().size();
			productBean.getShipTypeList().size();
		}
		return listByProduct;
	}


//----------------------------------Search Category--------------------------
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> goCategoryList(String category, Integer vision) {
		String hql = "FROM ProductBean WHERE product_category = :productCatrgory AND product_vision =: productVision";
		List<ProductBean> goCategoryList = em.createQuery(hql).setParameter("productCatrgory", category).setParameter("productVision", vision).getResultList();
		
		for (ProductBean productBean : goCategoryList) {
			productBean.getPayTpyeList().size();
			productBean.getShipTypeList().size();
		}
		return goCategoryList;
	}
//----------------------------------------------------------------------------------------------------------
	@SuppressWarnings("unchecked")
	@Override
	public String getMemberAcount(Integer id) {
		String hql = "FROM MemberBean WHERE MEMBER_ID = :userId";
		List<MemberBean> memberBeans= em.createQuery(hql).setParameter("userId", id).getResultList();
		String member = memberBeans.get(0).getAccount();
		return member;
	}
//-----------------------------------ReportProduct---------------------------------------------------
	@Override
	public ReportBean insertReportData(ReportBean reportData) {
		if (reportData != null) { 
			em.merge(reportData);
		}
		return reportData;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ReportBean> getAllReportData() {
		String hql = "FROM ReportBean";
		List<ReportBean> reportList = em.createQuery(hql).getResultList();
		return reportList;
	}
	
	@Override
	public void deleteReport(Integer eventId) {
		String hql = "DELETE ReportBean WHERE event_id =:eventId";
		em.createQuery(hql).setParameter("eventId", eventId).executeUpdate();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ReportBean> alertReport(Integer userId) {
		String hql = "From ReportBean WHERE user_id =:userId AND report_vision =:vision";
		var alertList = em.createQuery(hql).setParameter("userId", userId).setParameter("vision", 2).getResultList();
		return alertList;
	}
}
package iii.team3.shoppingCart.dao.impl;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import iii.team3.shoppingCart.dao.TransactionDAO;
import iii.team3.shoppingCart.model.Order;
import iii.team3.shoppingCart.model.Order_description;

@Repository
public class TransactionSQLServer implements TransactionDAO{

	@Autowired
	private EntityManager em;
	
	@Override @Transactional
	public void writeTransLogAndUpdateStockToDb(Order newOrder) {
		String hqlGetPrewStock = "select productAmount from ProductBean where productId = :productID";
		String hqlUpdateStock = "update ProductBean set productAmount = :newStock where productId = :productID";
		
		em.persist(newOrder);
		
		for(Order_description od : newOrder.getItemList()) {
			int prewStock = (int) em.createQuery(hqlGetPrewStock).setParameter("productID", od.getProduct().getProductId()).getSingleResult();

			em.createQuery(hqlUpdateStock).setParameter("newStock", prewStock - od.getQuantity())
											   .setParameter("productID", od.getProduct().getProductId()).executeUpdate();
		}
	}
	
//	@SuppressWarnings("unchecked")
//	@Override @Transactional
//	public List<Order> getTransLogDefault(Integer userID) {
//		String hqlGetLogDefault = "from Order where buyerID = :bID";
//		List<Order> list = em.createQuery(hqlGetLogDefault).setParameter("bID", userID).getResultList();
//
//		for(int i = 0 ; i < list.size() ; i ++) {
//			for(int j = 0 ; j < list.get(i).getItemList().size() ; j ++) {
//				list.get(i).getItemList().get(j).getProduct().getPayTpyeList().size();
//				list.get(i).getItemList().get(j).getProduct().getShipTypeList().size();
//			}
//		}
		
//		return em.createQuery(hqlGetLogDefault).setParameter("bID", userID).getResultList();
//	}
	
//	@SuppressWarnings("unchecked")
//	@Override @Transactional
//	public List<Order> getTransLogByUserIDAndDate(Integer userID, String date, String productName) {
//		String hqltest1 = "from Order where buyerID = :bID and datetime between :date1 and :date2";
//		String hqltest2 = "select productId from ProductBean where productName like :pName";
//		
//		var list = (List<Order>) em.createQuery(hqltest1).setParameter("bID", userID)
//									.setParameter("date1", LocalDate.now().minusMonths(Integer.parseInt(date)).toString())
//									.setParameter("date2", LocalDate.now().plusDays(1).toString()).getResultList();
//		
//		for(int i = 0 ; i < list.size() ; i ++) {
//			for(int j = 0 ; j < list.get(i).getItemList().size() ; j ++) {
//				list.get(i).getItemList().get(j).getProduct().getPayTpyeList().size();
//				list.get(i).getItemList().get(j).getProduct().getShipTypeList().size();
//			}
//		}
//
//		var productIDs = (List<Integer>)em.createQuery(hqltest2).setParameter("pName", "%"+ productName +"%").getResultList();
//
//		return comparator(list, productIDs);
//	}
//
//	private List<Order> comparator(List<Order> list, List<Integer> productIDs){
//		var resultList = new ArrayList<Order>();
//		var newItemList = new ArrayList<Order_description>();
//		
//		for(Order order : list) {
//			for(Order_description od : order.getItemList()) {
//				for(Integer n : productIDs) {		
//					if(od.getProduct().getProductId() == n)
//						newItemList.add(od);
//				}
//			}
//
//			if(newItemList.size() != 0) {
//				order.setItemList(newItemList);
//				resultList.add(order);
//				newItemList = new ArrayList<Order_description>();
//			}
//			
//		}
//		return resultList;
//	}

}

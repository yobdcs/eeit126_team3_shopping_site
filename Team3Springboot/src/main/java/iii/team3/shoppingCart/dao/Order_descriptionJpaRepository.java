package iii.team3.shoppingCart.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import iii.team3.shoppingCart.model.Order_description;

public interface Order_descriptionJpaRepository extends JpaRepository<Order_description, Integer> {

	@Query(value = "select * from order_description where seller_id = ?1", nativeQuery = true)
	public List<Order_description> findBySellerId(Integer sellerId);
	
	@Query(value = "select * from order_description where fk_order_overview_id = ?1", nativeQuery = true)
	public List<Order_description> findByOrderId(Integer orderId);

}

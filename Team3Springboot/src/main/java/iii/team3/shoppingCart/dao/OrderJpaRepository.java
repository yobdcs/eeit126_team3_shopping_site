package iii.team3.shoppingCart.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import iii.team3.shoppingCart.model.Order;

public interface OrderJpaRepository extends JpaRepository<Order, Integer> {

	@Query(value = "select * from order_overview where buyer_id = ?1", nativeQuery = true)
	public List<Order> findByBuyerId(Integer buyerId);
	
	@Query(value = "select * from order_overview where buyer_id = ?1 and datetime between ?2 and ?3", nativeQuery = true)
	public List<Order> findByBuyerIdAndDate(Integer userID, String date1, String date2);
}

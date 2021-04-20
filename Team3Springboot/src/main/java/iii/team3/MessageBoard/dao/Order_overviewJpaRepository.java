package iii.team3.MessageBoard.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import iii.team3.shoppingCart.model.Order;

public interface Order_overviewJpaRepository extends JpaRepository<Order, Integer> {
	
	@Query(value = "select datetime from Order")
	public List<String> findAllDate();
	
	
//	@Query(value = "select gender from MemberBean")
//	public List<String> findGender();
	
	@Query(value ="from Order")
	public List<Order> findBuyer();

}

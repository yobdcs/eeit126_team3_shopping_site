package iii.team3.shoppingCart.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import iii.team3.shoppingCart.model.Order_return;

public interface ReturnJpaRepository extends JpaRepository<Order_return, Integer> {
	
	@Query(value = "from Order_return where buyerID = ?1")
	public List<Order_return> findByMemberId(Integer buyerID);
	
	@Query(value = "from Order_return where sellerID = ?1 and status = 0")
	public List<Order_return> findByMemberIdAndStatus(Integer memberId);

	@Query(value = "select * from order_return where fk_order_id = ?1 and fk_product_id = ?2", nativeQuery = true)
	public Order_return findByFkId(Integer oid, Integer pid);
	
	@Query(value = "from Order_return")
	public List<Order_return> findAll();
	
	@Query(value = "from Order_return where sellerID = ?1 and status = 0")
	public List<Order_return> findByMemberIdStatus(Integer sellerID);
	
}

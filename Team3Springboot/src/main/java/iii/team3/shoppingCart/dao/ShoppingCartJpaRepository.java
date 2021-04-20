package iii.team3.shoppingCart.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import iii.team3.product.model.ProductBean;

public interface ShoppingCartJpaRepository extends JpaRepository<ProductBean, Integer> {
	
	@Query(value = "select productAmount from ProductBean where productId = ?1")
	public Integer findStockByProductId(Integer productId);
	
	@Query(value = "select Product_Id from product where Product_Name like ?1", nativeQuery = true)
	public List<Integer> findProductIdByName(String pName);
}

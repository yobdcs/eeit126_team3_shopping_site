package iii.team3.shoppingCart.service;

import java.util.List;

import iii.team3.product.model.ProductBean;
import iii.team3.shoppingCart.model.ShoppingCartBean;

public interface ShoppingCartBackEndService {

	public void addItemToCart(Integer buyerID, List<ProductBean> list, int quantity, int indexInList);
	
	public void modifyQuantityOnOneItemInCart(int modify, int indexInCart);
	
	public void removeOneItemFromCart(int indexInCart);
	
	public List<ShoppingCartBean> getCart();

	public List<ProductBean> getList();
	
	public void cartInitialize();
	
}

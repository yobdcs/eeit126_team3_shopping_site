package iii.team3.shoppingCart.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iii.team3.product.model.ProductBean;
import iii.team3.shoppingCart.dao.ShoppingCartJpaRepository;
import iii.team3.shoppingCart.model.ShoppingCartBean;
import iii.team3.shoppingCart.service.ShoppingCartBackEndService;

@Service
public class ShoppingCartService implements ShoppingCartBackEndService{
	
	@Autowired
	private ShoppingCartJpaRepository scJpaRepository;

	private Integer duplicatedIndex = 0;
	private List<ProductBean> list;
	private List<ShoppingCartBean> cart;
	
	@Override
	public void addItemToCart(Integer buyerID, List<ProductBean> list, int quantity, int indexInList) {
		this.list = list;
		
		if(cart == null)
			cart = new ArrayList<ShoppingCartBean>();

		if(itemIsDuplicated(cart, list.get(indexInList).getProductId(), 0)) {

			if(cart.get(duplicatedIndex).getQuantity() + quantity > getRealStock(list.get(indexInList).getProductId()))
				return;

			cart.get(duplicatedIndex).setQuantity(cart.get(duplicatedIndex).getQuantity() + quantity);
			cart.get(duplicatedIndex).setStock(cart.get(duplicatedIndex).getStock() - quantity);
			cart.get(duplicatedIndex).setPrice(cart.get(duplicatedIndex).getPrice() + quantity * list.get(indexInList).getProductPrice());		
		} else
			cart.add(new ShoppingCartBean(list.get(indexInList).getProductId(), list.get(indexInList).getUserName(),
										  list.get(indexInList).getProductName(), quantity,
										  list.get(indexInList).getProductAmount(), list.get(indexInList).getProductPrice(),
										  list.get(indexInList).getPayTpyeList(), list.get(indexInList).getShipTypeList(),
										  indexInList));

		stockUpdate(indexInList, quantity);
		
		duplicatedIndex = 0;
	}

	@Override
	public void modifyQuantityOnOneItemInCart(int modify, int indexInCart) {
		if(cart.get(indexInCart).getQuantity() - modify > getRealStock(list.get(cart.get(indexInCart).getIndexInList()).getProductId()))
			return;
		
		cart.get(indexInCart).setQuantity(cart.get(indexInCart).getQuantity() - modify);
		cart.get(indexInCart).setStock(cart.get(indexInCart).getStock() + modify);
		cart.get(indexInCart).setPrice(cart.get(indexInCart).getPrice() - modify * list.get(cart.get(indexInCart).getIndexInList()).getProductPrice());
		
		stockUpdate(cart.get(indexInCart).getIndexInList(), - modify);
	}
	
	@Override
	public void removeOneItemFromCart(int indexInCart) {
		int indexInList = cart.get(indexInCart).getIndexInList();

		stockRollBack(indexInList, indexInCart);
		cart.remove(indexInCart);
		
		if(cart.size() == 0)
			cartInitialize();
	}

	@Override
	public List<ShoppingCartBean> getCart(){
		return cart;
	}
	
	@Override
	public void cartInitialize() {
		cart = null;
	}
	
	public List<ProductBean> getList(){
		return this.list;
	}
	
	private Integer getRealStock(Integer productId) {
		return scJpaRepository.findStockByProductId(productId);
	}
	
	private boolean itemIsDuplicated(List<ShoppingCartBean> cart, int productID, int duplicatedIndex) {		
		if(duplicatedIndex == cart.size())
			return false;
		
		if(productID == cart.get(duplicatedIndex).getProductID()) {
			this.duplicatedIndex = duplicatedIndex;
			return true;			
		}
		
		return itemIsDuplicated(cart, productID, duplicatedIndex + 1);		
	}
	
	private void stockUpdate(int indexInList, int quantity) {		
		list.get(indexInList).setProductAmount(list.get(indexInList).getProductAmount() - quantity);
	}
	
	private void stockRollBack(int indexInList, int indexInCart) {
		list.get(indexInList).setProductAmount(cart.get(indexInCart).getStock() + cart.get(indexInCart).getQuantity());
	}
}

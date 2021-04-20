package iii.team3.shoppingCart.dao;

import iii.team3.shoppingCart.model.Order;

public interface TransactionDAO {

	public void writeTransLogAndUpdateStockToDb(Order newOrder);
	
//	public List<Order> getTransLogDefault(Integer userID);
	
//	public List<Order> getTransLogByUserIDAndDate(Integer userID, String date, String productName);

}

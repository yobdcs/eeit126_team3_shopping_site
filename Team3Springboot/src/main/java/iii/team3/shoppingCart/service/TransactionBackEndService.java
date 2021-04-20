package iii.team3.shoppingCart.service;

import java.util.List;
import java.util.Map;

import iii.team3.member.model.MemberBean;
import iii.team3.shoppingCart.model.Order;
import iii.team3.shoppingCart.model.Order_description;
import iii.team3.shoppingCart.model.Order_return;
import iii.team3.shoppingCart.model.ShoppingCartBean;

public interface TransactionBackEndService {
	
	public void orderCreate(Integer buyerID, List<ShoppingCartBean> cart);
	
	public Integer addPayTypeAndShipType(Integer[] pArray, Integer[] sArray);
	
	public Order_description transDescCreate(Integer orderID, Integer sellerID, Integer productID, List<Order> logOverview);
	
	public Order_description transOrderDescCreate(List<Order_description> orders, Integer productID, Integer orderID);
	
	public Integer calcPageEnd(List<Order> logOverview);
	
	public Order getOrder();
	
	public int getTotalAmount();

	public void transInitialize();
	
	public boolean writeTransLogAndUpdateStockToDb();
	
	public String ecpayProcess();
	
	public List<Order> getTransLogDefault(Integer userID);
	
	public List<Order> getTransLogByUserIDAndDate(Integer userID, String date, String productName);

	public List<Order_description> getTransOrderDefault(Integer sellerId);

	public String createReturnCase(Map<String, String> returnDesc);
	
	public String updateReturnCase_sellerConfirm(Map<String, String> returnDesc);

	public Integer checkReturnStatus(Integer memberID, Order_description desc);

	public String getReturnDate();

	public Integer getReturnCaseID();

	public Order_return getOrder_return(Integer oid, Integer pid);
	
	public MemberBean getMember(Integer buyerID);

	public Order_return getOrder_returnByCaseID(Integer caseID);

	public List<Order_return> getReturnCaseByMemberId(Integer memberId);

	public Order getOrder_descriptions(Integer memberId, Integer orderId);

}

package iii.team3.shoppingCart.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import iii.team3.member.dao.MemberJpaRepository;
import iii.team3.member.model.MemberBean;
import iii.team3.product.model.ProductBean;
import iii.team3.product.model.ProductPay;
import iii.team3.product.model.ProductShip;
import iii.team3.shoppingCart.dao.OrderJpaRepository;
import iii.team3.shoppingCart.dao.Order_descriptionJpaRepository;
import iii.team3.shoppingCart.dao.ReturnJpaRepository;
import iii.team3.shoppingCart.dao.ShoppingCartJpaRepository;
import iii.team3.shoppingCart.dao.TransactionDAO;
import iii.team3.shoppingCart.dao.TransactionJpaRepository;
import iii.team3.shoppingCart.model.Order;
import iii.team3.shoppingCart.model.Order_description;
import iii.team3.shoppingCart.model.Order_return;
import iii.team3.shoppingCart.model.Order_status;
import iii.team3.shoppingCart.model.Shipping_status;
import iii.team3.shoppingCart.model.ShoppingCartBean;
import iii.team3.shoppingCart.service.TransactionBackEndService;

@Service
public class TransactionService implements TransactionBackEndService{
	
	private final int TRANS_LOG_PAGE_MAX_ITEM = 3;
	
	@Autowired
	private TransactionDAO transactionSQLServer;
	
	@Autowired
	private TransactionJpaRepository tJpaRepository;
	
	@Autowired
	private ReturnJpaRepository rJpaRepository;
	
	@Autowired
	private Order_descriptionJpaRepository odJpaRepository;
	
	@Autowired
	private MemberJpaRepository mJpaRepository;
	
	@Autowired
	private OrderJpaRepository oJpaRepository;
	
	@Autowired
	private ShoppingCartJpaRepository scJpaRepository;
	private Order newOrder;
	private List<Order_description> itemInOrder;
	private Integer totalAmount = 0;
	private Integer shipping = 0;
	private String returnDate;
	private Integer returnCaseID;

//	transaction create, write into DB, 
	
	@Override
	public void orderCreate(Integer buyerID, List<ShoppingCartBean> cart) {
		cart = cartDescOrderSorting(cart);
		
		transInitialize();
		totalAmountCalculate(cart);

		itemInOrder = new ArrayList<Order_description>();
		newOrder = new Order(getCommitDatetime(), buyerID, totalAmount, itemInOrder);
		
		for(int i = 0 ; i < cart.size(); i ++)
			itemInOrder.add(new Order_description(cart.get(i).getSellerID(), 
												  new ProductBean(cart.get(i).getProductID(), cart.get(i).getProductName(), cart.get(i).getStock()),
					  							  cart.get(i).getQuantity(), cart.get(i).getPrice(), new Order_status(0),
					  							  new Shipping_status(0), newOrder, cart.get(i).getpList(), cart.get(i).getsList()));	
	}
	
	@Override
	public Integer addPayTypeAndShipType(Integer[] pArray, Integer[] sArray) {
		shipping = 0;
		
		int i = 0;
		for(var item : newOrder.getItemList()) {
			switch (pArray[i]) {
			case 0:
				shipping += 50;
				break;
			case 1:
				shipping += 60;
				break;
			default:
				break;
			}
			
			item.setPayType(new ProductPay(pArray[i]));
			item.setShippingType(new ProductShip(sArray[i]));
			i ++;
		}
		return shipping;
	}
	
	@Override
	public boolean writeTransLogAndUpdateStockToDb() {
		for(Order_description od : newOrder.getItemList()) {
			if(od.getQuantity() > getRealStock(od.getProduct().getProductId()))
				return false;
		}
		
		newOrder.setShippingFee(shipping);
		transactionSQLServer.writeTransLogAndUpdateStockToDb(newOrder);
		return true;		
	}
	
	@Override
	public Order getOrder() {
		return newOrder;
	}
	
	@Override
	public int getTotalAmount() {
		return totalAmount;
	}

	@Override
	public void transInitialize() {
		totalAmount = 0;
		newOrder = null;
		itemInOrder = null;
	}
	
//	transaction log/orders create
	
	@Transactional
	public List<Order> getTransLogDefault(Integer userID) {
		var log = oJpaRepository.findByBuyerId(userID);
		for(Order order : log) {
			for(Order_description od : order.getItemList()) {
				od.getProduct().getPayTpyeList().size();
				od.getProduct().getShipTypeList().size();
			}
		}
		return log;
	}
	
	@Transactional
	public List<Order> getTransLogByUserIDAndDate(Integer userID, String date, String productName) {
		var list = oJpaRepository.findByBuyerIdAndDate(userID, LocalDate.now().minusMonths(Integer.parseInt(date)).toString(), LocalDate.now().plusDays(1).toString());
		var productIDs = scJpaRepository.findProductIdByName("%"+ productName +"%");
		
		return comparator(list, productIDs);
	}

	@Override
	public Order getOrder_descriptions(Integer memberId, Integer orderId) {
		return oJpaRepository.findById(orderId).get();
	}

	@Override
	@Transactional
	public List<Order_description> getTransOrderDefault(Integer sellerId){
		return odJpaRepository.findBySellerId(sellerId);
	}
	
	@Override
	public Order_description transDescCreate(Integer orderID, Integer sellerID, Integer productID, List<Order> logOverview) {
		return targetOnSelectedOD(orderID, sellerID, productID, logOverview);
	}
	
	@Override
	public Order_description transOrderDescCreate(List<Order_description> orders, Integer productID, Integer orderID) {
		return targetOnSelectedOrder(orders, productID, orderID);
	}
	
//	return case handle

	@Override
	@Transactional
	public String createReturnCase(Map<String, String> returnDesc) {
		rJpaRepository.save(new Order_return(Integer.parseInt(returnDesc.get("buyerID")),
											Integer.parseInt(returnDesc.get("sellerID")),
											Integer.parseInt(returnDesc.get("orderID")), 
											Integer.parseInt(returnDesc.get("productID")), 
											returnDesc.get("reason")));
		return "申請成功，請待流程完成!";
	}
	
	@Override
	@Transactional
	public Integer checkReturnStatus(Integer buyerID, Order_description desc) {
		var list = rJpaRepository.findByMemberId(buyerID);
		for(int i = 0 ; i < list.size() ; i ++) {
			if(list.get(i).getOrder().getOrderID().equals(desc.getOrder().getOrderID()) && list.get(i).getProduct().getProductId().equals(desc.getProduct().getProductId()) && list.get(i).getStatus() == 1) {
				returnDate = list.get(i).getDatetime();
				returnCaseID = list.get(i).getCaseID();
				return 1;
			}
				
			if(list.get(i).getOrder().getOrderID().equals(desc.getOrder().getOrderID()) && list.get(i).getProduct().getProductId().equals(desc.getProduct().getProductId())) {
				returnDate = list.get(i).getDatetime();
				returnCaseID = list.get(i).getCaseID();
				return 0;
			}
		}
		return -1;
	}

	@Override
	@Transactional
	public String updateReturnCase_sellerConfirm(Map<String, String> returnDesc) {
		var returnBean = getOrder_returnByCaseID(Integer.parseInt(returnDesc.get("caseID")));
		returnBean.setSellerConfirm(returnDesc.get("sellerConfirm"));
		
		rJpaRepository.save(returnBean);
		return "確認完成，後續將由管理端接手流程!";
	}

	@Override
	public Order_return getOrder_return(Integer oid, Integer pid) {
		return rJpaRepository.findByFkId(oid, pid);
	}

	@Override
	public Order_return getOrder_returnByCaseID(Integer caseID) {
		var optional = rJpaRepository.findById(caseID);
		return optional.get();
	}

	@Override
	public MemberBean getMember(Integer buyerID) {
		var optional = mJpaRepository.findById(buyerID);
		return optional.get();
	}

	@Override
	public String getReturnDate() {
		return returnDate;
	}
	
	@Override
	public Integer getReturnCaseID() {
		return returnCaseID;
	}
	
	@Override
	public List<Order_return> getReturnCaseByMemberId(Integer memberId){
		return rJpaRepository.findByMemberIdAndStatus(memberId);
	}
	
//	page end at transaction log page
	
	@Override
	public Integer calcPageEnd(List<Order> logOverview) {
		int end = logOverview.size() / TRANS_LOG_PAGE_MAX_ITEM;
		if(logOverview.size() % TRANS_LOG_PAGE_MAX_ITEM != 0)
			end ++;
		return end;
	}

//	ecpay process
	
	@Override
	public String ecpayProcess() {
		AllInOne allInOne = new AllInOne("");
		AioCheckOutALL aioCheckOutALL = new AioCheckOutALL();

		String transactionNumber = "";
		while (transactionNumber.length() <= 9) {
			int num = (int) ((Math.random() * (90 - 48 + 1)) + 48);
			if (num <= 57 || num >= 65) {
				transactionNumber += (char) num;
			}
		}

		StringBuffer sb = new StringBuffer();
		for (Order_description od : newOrder.getItemList())
			sb.append(od.getProduct().getProductName() + " " + od.getPrice() + " " + od.getQuantity() + "#");

		aioCheckOutALL.setMerchantTradeNo(transactionNumber);
		aioCheckOutALL.setMerchantTradeDate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		aioCheckOutALL.setTotalAmount(totalAmount + "");
		aioCheckOutALL.setTradeDesc("obaju e-commerce");
		aioCheckOutALL.setItemName(sb.toString());
		aioCheckOutALL.setReturnURL("http://localhost:8080/Team03ShoppingSite");
		aioCheckOutALL.setClientBackURL("http://localhost:8080/Team03ShoppingSite");
		aioCheckOutALL.setNeedExtraPaidInfo("N");
		String form = allInOne.aioCheckOut(aioCheckOutALL, null);
		
		return form;
	}

//	private method
	
	private Integer getRealStock(Integer productId) {
		return tJpaRepository.findStockByProductId(productId);
	}
	
	private void totalAmountCalculate(List<ShoppingCartBean> cart) {
		for(ShoppingCartBean item : cart)
			this.totalAmount += item.getPrice();
	}

	private String getCommitDatetime() {
		return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Timestamp(System.currentTimeMillis()));
	}

	private List<ShoppingCartBean> cartDescOrderSorting(List<ShoppingCartBean> cart){
		for(int i = 1 ; i < cart.size() ; i ++) {
			var temp = cart.get(i);
			int j = i - 1;
			while(j >= 0 && temp.getSellerID() < cart.get(j).getSellerID()) {
				cart.set(j + 1, cart.get(j));
				j --;
			}
			cart.set(j + 1, temp);
		}
		return cart;
	}
	
	private Order_description targetOnSelectedOD(Integer orderID, Integer sellerID, Integer productID, List<Order> logOverview) {
		for(Order o : logOverview) {
			if(o.getOrderID().equals(orderID)) {	
				for(Order_description od : o.getItemList()) {
					if(od.getSeller().getMemberId().equals(sellerID) && od.getProduct().getProductId().equals(productID)) {	
							return od;
					}
				}
			}	
		}
		return null;
	}
	
	private Order_description targetOnSelectedOrder(List<Order_description> orders, Integer productID, Integer orderID) {
		for(Order_description od : orders) {
			if(od.getProduct().getProductId().equals(productID) && od.getOrder().getOrderID().equals(orderID))
				return od;
		}
		return null;
	}
	
	private List<Order> comparator(List<Order> list, List<Integer> productIDs){
		var resultList = new ArrayList<Order>();
		var newItemList = new ArrayList<Order_description>();
		
		for(Order order : list) {
			for(Order_description od : order.getItemList()) {
				for(Integer n : productIDs) {		
					if(od.getProduct().getProductId().equals(n))
						newItemList.add(od);
				}
			}

			if(newItemList.size() != 0) {
				order.setItemList(newItemList);
				resultList.add(order);
				newItemList = new ArrayList<Order_description>();
			}
			
		}
		return resultList;
	}

}

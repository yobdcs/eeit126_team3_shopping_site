package iii.team3.shoppingCart.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import iii.team3.member.model.MemberBean;
import iii.team3.shoppingCart.model.Order;
import iii.team3.shoppingCart.model.Order_description;
import iii.team3.shoppingCart.model.Order_return;
import iii.team3.shoppingCart.model.ShoppingCartBean;
import iii.team3.shoppingCart.service.TransactionBackEndService;

@Controller @SessionAttributes(names = {"cart", "loginBean", "newOrder", "totalAmount", "logOverview",
										"end", "orders", "orderIDs", "datetimes", "buyerIDs"})
@RequestMapping(path = "/shoppingCart")
public class TransactionBackEnd {
	
	@Autowired
	private TransactionBackEndService transactionService;

//	transaction handle
	
	@PostMapping(path = "/transactionBack/create")
	public String processTransactionCreate(@SessionAttribute("cart") List<ShoppingCartBean> cart, @SessionAttribute("loginBean") MemberBean loginBean, Model model) {	
		transactionService.orderCreate(loginBean.getMemberId(), cart);

		model.addAttribute("newOrder", transactionService.getOrder());
		model.addAttribute("totalAmount", transactionService.getTotalAmount());

		cart.clear();
		
		return "shoppingCart/TransactionPage";
	}

	@PostMapping(path =  "/transactionBack/AddType")
	public @ResponseBody Integer processTransactionAddType(@RequestParam("pArray") Integer[] pArray, @RequestParam("sArray") Integer[] sArray) {
		return transactionService.addPayTypeAndShipType(pArray, sArray);
	}
	
	@GetMapping(path = "/transactionBack/commit")
	public String processTransactionCommit(SessionStatus sessionStatus) {
		if(transactionService.writeTransLogAndUpdateStockToDb())
			return "redirect:pay";		
		return "/home";
	}
	
	@GetMapping(path = "/transactionBack/pay")
	public @ResponseBody String processPay() {
		return transactionService.ecpayProcess();
	}
	
//	transaction logs/orders handle
	
	@GetMapping(path = "/transactionBack/overview")
	public String processTransactionOverview(@SessionAttribute("loginBean") MemberBean loginBean, Model model) {
		var logOverview = transactionService.getTransLogDefault(loginBean.getMemberId());

		model.addAttribute("end", transactionService.calcPageEnd(logOverview));
		model.addAttribute("logOverview", logOverview);
		
		return "shoppingCart/TransactionCheckPage";
	}
	
	@GetMapping(path = "/transactionBack/orderOverview")
	public String processTransactionOrderOverview(@SessionAttribute("loginBean") MemberBean loginBean, Model model) {
		var orders = transactionService.getTransOrderDefault(loginBean.getMemberId());
		
		List<Integer> orderIDs = new ArrayList<Integer>();
		List<Integer> buyerIDs = new ArrayList<Integer>();
		List<String> datetimes = new ArrayList<String>();
		for(int i = 0 ; i < orders.size() ; i ++) {
			orderIDs.add(orders.get(i).getOrder().getOrderID());
			buyerIDs.add(orders.get(i).getOrder().getBuyer().getMemberId());
			datetimes.add(orders.get(i).getOrder().getDatetime());
		}
		
		model.addAttribute("orders", orders);
		model.addAttribute("orderIDs", orderIDs);
		model.addAttribute("buyerIDs", buyerIDs);
		model.addAttribute("datetimes", datetimes);
		
		return "shoppingCart/TransactionOrderCheckPage";
	}

	@PostMapping(path = "/transactionBack/getLog")
	public @ResponseBody List<Order> processTransactionGetLog(@SessionAttribute("loginBean") MemberBean loginBean, @RequestParam("date") String date,
															  @RequestParam("pName") String productName, @SessionAttribute("logOverview") List<Order> logOverview, Model model) {		
		logOverview = transactionService.getTransLogByUserIDAndDate(loginBean.getMemberId(), date, productName);
		
		model.addAttribute("end", transactionService.calcPageEnd(logOverview));
		model.addAttribute("logOverview", logOverview);
		
		return logOverview;
	}
	
	@PostMapping(path = "/transactionBack/getOrder")
	public @ResponseBody Order processTransactionGetOrder(@SessionAttribute("loginBean") MemberBean loginBean, @RequestParam("orderId") Integer orderId){
		return transactionService.getOrder_descriptions(loginBean.getMemberId(), orderId);
	}

	@PostMapping(path = "/transactionBack/gotoDesc")
	public String processTransactionGoToDesc(@SessionAttribute("loginBean") MemberBean loginBean, @RequestParam("orderID") Integer orderID, @RequestParam("sellerID") Integer sellerID,
											 @RequestParam("productID") Integer productID, @SessionAttribute("logOverview") List<Order> logOverview, Model model) {		
		var desc = transactionService.transDescCreate(orderID, sellerID, productID, logOverview);

		model.addAttribute("desc", desc);
		model.addAttribute("flag", transactionService.checkReturnStatus(loginBean.getMemberId(), desc));
		model.addAttribute("date", transactionService.getReturnDate());
		model.addAttribute("caseID", transactionService.getReturnCaseID());

		return "shoppingCart/TransactionDetails";
	}
	
	@PostMapping(path = "/transactionBack/orderDesc")
	public String processTransactionOrderDesc(@SessionAttribute("orders") List<Order_description> orders, @RequestParam("orderID") Integer orderID, @RequestParam("buyerID") Integer buyerID, 
											  @RequestParam("productID") Integer productID, Model model) {
		var orderOD = transactionService.transOrderDescCreate(orders, productID, orderID);
		
		model.addAttribute("buyerBean", transactionService.getMember(buyerID));
		model.addAttribute("flag", transactionService.checkReturnStatus(buyerID, orderOD));
		model.addAttribute("date", transactionService.getReturnDate());
		
		var caseID = transactionService.getReturnCaseID();
		model.addAttribute("caseID", caseID);
		model.addAttribute("checkText", transactionService.getOrder_return(orderID, productID));
		model.addAttribute("orderDate", orderOD.getOrder().getDatetime());
		model.addAttribute("orderDesc", orderOD);
		
		return "shoppingCart/TransactionOrderDetails";
	}

//	return case handle
	
	@PostMapping(path = "/transactionBack/returnClientSide")
	public @ResponseBody String processReturnClientSide(@RequestBody Map<String, String> returnDesc) {
		return transactionService.createReturnCase(returnDesc);
	}
	
	@PostMapping(path = "/transactionBack/returnSellerSide")
	public @ResponseBody String processReturnSellerSide(@RequestBody Map<String, String> returnDesc) {
		return transactionService.updateReturnCase_sellerConfirm(returnDesc);
	}
	
	@PostMapping(path = "/transactionBack/checkReturnCase")
	public @ResponseBody List<Order_return> processCheckReturnCase(@RequestParam("mid") Integer memberId){
		return transactionService.getReturnCaseByMemberId(memberId);
	}

//	page handle
	
	@PostMapping(path = "/transactionBack/page")
	public @ResponseBody List<Order> processPageChange(@SessionAttribute("logOverview") List<Order> logOverview, @RequestParam("index") Integer index, Model model) {
		return logOverview;
	}
	
}
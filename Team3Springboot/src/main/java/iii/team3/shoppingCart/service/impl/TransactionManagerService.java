package iii.team3.shoppingCart.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iii.team3.shoppingCart.dao.ReturnJpaRepository;
import iii.team3.shoppingCart.model.Order_description;
import iii.team3.shoppingCart.model.Order_return;
import iii.team3.shoppingCart.model.Shipping_status;

@Service
public class TransactionManagerService {

	@Autowired
	private ReturnJpaRepository rJpaRepository;

	@Autowired
	private TransactionService transactionService;
	
	@Transactional
	public List<Order_return> findAll(){
		var list = rJpaRepository.findAll();
		for(Order_return or : list) {
			or.getProduct().getPayTpyeList().size();
			or.getProduct().getShipTypeList().size();
		}
		return list;
	}
	
	@Transactional
	public String updateReturnCase_managerConfirm(Integer caseID) {
		var returnBean = transactionService.getOrder_returnByCaseID(caseID);
		returnBean.setStatus(1);
		returnBean.setDatetime(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		
		for(Order_description od : returnBean.getOrder().getItemList()) {
			if(od.getProduct().getProductId() == returnBean.getProduct().getProductId()) {
				od.setShipping_status(new Shipping_status(2));
				break;
			}
		}

		rJpaRepository.save(returnBean);

		return "退貨流程完成!";
	}
}

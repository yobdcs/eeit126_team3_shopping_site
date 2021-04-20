package iii.team3.shoppingCart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import iii.team3.shoppingCart.model.Order_return;
import iii.team3.shoppingCart.service.impl.TransactionManagerService;

@Controller @SessionAttributes(names = {"loginBean", "orList"})
@RequestMapping(path = "/shoppingCart")
public class TransactionManagerBackEnd {

	@Autowired
	private TransactionManagerService transactionManagerService;
	
	@GetMapping(path = "/TransactionManager/returnCases")
	public String  processReturnManager(Model model) {
		model.addAttribute("orList", transactionManagerService.findAll());
		return "shoppingCart/ReturnManagerPage";
	}
	
	@PostMapping(path = "/TransactionManager/caseDesc")
	public @ResponseBody Order_return processCaseDesc(@RequestParam("index") Integer index, @SessionAttribute("orList") List<Order_return> orList, Model model) {
		return orList.get(index);
	}
	
	@PostMapping(path = "/TransactionManager/caseComplete")
	public @ResponseBody String processCaseComplete(@RequestParam("caseID") Integer caseID) {
		return transactionManagerService.updateReturnCase_managerConfirm(caseID);
	}
	
}

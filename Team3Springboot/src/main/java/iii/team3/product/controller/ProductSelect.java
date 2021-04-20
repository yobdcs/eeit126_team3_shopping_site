package iii.team3.product.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import iii.team3.member.model.MemberBean;
import iii.team3.product.dao.ProductDAOInterface;
import iii.team3.product.model.ProductBean;

@Controller @RequestMapping(path = "/product") @SessionAttributes({"loginBean", "customerList", "trigger","pagenum","memberAllProduct"})
public class ProductSelect {
	@Autowired
	private ProductDAOInterface productDAO;
	
	@GetMapping(path = "/listPage")
	public String listPage(Model model,HttpServletRequest request) throws SQLException, IOException {
//		var pList = productDAO.gotoCustomerList(0);
//		productDAO.createImage(request);
//		model.addAttribute("customerList", pList);
//		var pagenum = pList.size() / 12;
//		if (pList.size() % 12 != 0) {
//			pagenum++;
//		}
//		System.out.println(pagenum);
//		model.addAttribute("pagenum",pagenum);
		model.addAttribute("trigger", 0);
		
		return "webProduct/productCustomerList";
	}
	
	@PostMapping(path = "/listPageThi")
	@ResponseBody 
	public List<ProductBean> listPageThi(@SessionAttribute("customerList") List<ProductBean> pageList,@RequestParam("index") Integer index) {
		return pageList;
	}
	
	@GetMapping(path = "/listPageSec")
	public String listPageSec(Model model) {
		model.addAttribute("trigger", 0);
		return "webProduct/productCustomerList";
	}

	@GetMapping(path = "/memberListPage")
	public String memberProductPage(@SessionAttribute("loginBean") MemberBean loginBean, Model model,HttpServletRequest request) throws SQLException, IOException {	
		productDAO.createImage(request);
		var pList = productDAO.gotoUserList(loginBean.getMemberId());
		model.addAttribute("pList", pList);
		return "webProduct/productList";
	}
	
	@GetMapping(path = "/goAddProduct")
	public String goAddProduct() {
		return "webProduct/productLunch";
	}

}

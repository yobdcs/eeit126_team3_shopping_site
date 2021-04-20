package iii.team3.shoppingCart;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import iii.team3.product.model.ProductBean;

@Controller @SessionAttributes(names = {"buyerID", "trigger", "customerList", "ranindexCart"}) 
@RequestMapping(path = "/shoppingCart")
public class Redirect {
	
	private final int CART_PAGE_RANDOM_MAX_ITEMS = 3;
	
	@GetMapping(path = "/start")
	public String start() {
		return "shoppingCart/DemoUserPage";
	}
	
	@GetMapping(path = "/gotoShoppingCartPage")
	public String gotoShoppingCartPage(@SessionAttribute("customerList") List<ProductBean> pList, Model model) {
		model.addAttribute("ranindexCart", randomIndex(pList));
		return "shoppingCart/ShoppingCartPage";
	}

	@GetMapping(path = "/gotoProductPage")
	public String gotoProductPage(@SessionAttribute("trigger") Integer trigger, Model m) {
		m.addAttribute("trigger", 0);
		return "webProduct/productCustomerList";
	}
	
	@GetMapping(path = "/gotoTransCheckPage")
	public String gotoTransCheckPage() {
		return "shoppingCart/TransactionCheckPage";
	}
	
	@GetMapping(path = "/gotoTransOrderCheckPage")
	public String gotoTransOrderCheckPage() {
		return "shoppingCart/TransactionOrderCheckPage";
	}

	private List<Integer> randomIndex(List<ProductBean> pList){
		List<Integer> ranindex = new ArrayList<Integer>();
		for(int i = 0 ; i < CART_PAGE_RANDOM_MAX_ITEMS ; i ++) {
			int rannum = ThreadLocalRandom.current().nextInt(0, pList.size());
			if(ranindex.contains(rannum)) {
				i --;
				continue;
			}
			ranindex.add(rannum);
		}
		return ranindex;
	}
	
}

package iii.team3.shoppingCart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import iii.team3.member.model.MemberBean;
import iii.team3.product.model.ProductBean;
import iii.team3.shoppingCart.model.ShoppingCartBean;
import iii.team3.shoppingCart.service.ShoppingCartBackEndService;

@Controller @SessionAttributes(names = {"loginBean", "cart", "customerList"})
@RequestMapping(path = "/shoppingCart")
public class ShoppingCartBackEnd {

	@Autowired
	private ShoppingCartBackEndService shoppingCartService;

	@PostMapping(path = "/shoppingCartBack/add")
	public @ResponseBody Integer processShoppingCartAdd(@RequestParam(name = "index") Integer index, @RequestParam(name = "quantity") Integer quantity,
							@SessionAttribute("customerList") List<ProductBean> list, @SessionAttribute("loginBean") MemberBean loginBean, Model model) {
		shoppingCartService.addItemToCart(loginBean.getMemberId(), list, quantity, index);
		model.addAttribute("cart", shoppingCartService.getCart());

		return list.get(index).getProductAmount();
	}

	@PostMapping(path = "/shoppingCartBack/mod")
	public @ResponseBody Map<String, Integer> processShoppingCartMod(@RequestParam(name = "index") Integer index, @RequestParam(name = "num") Integer num, Model model) {
		shoppingCartService.modifyQuantityOnOneItemInCart(num, index);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("quantity", shoppingCartService.getCart().get(index).getQuantity());
		map.put("stock", shoppingCartService.getCart().get(index).getStock());
		map.put("price", shoppingCartService.getCart().get(index).getPrice());
		
		return map;
	}
	
	@PostMapping(path = "/shoppingCartBack/remove")
	public @ResponseBody List<ShoppingCartBean> processShoppingCartRemove(@RequestParam(name = "index") Integer index) {		
		shoppingCartService.removeOneItemFromCart(index);

		return shoppingCartService.getCart();
	}

}

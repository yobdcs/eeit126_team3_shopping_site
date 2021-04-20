package iii.team3.member.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import iii.team3.product.dao.ProductDAOInterface;
import iii.team3.product.model.ProductBean;
import iii.team3.shoppingCart.test.AutoCompletionBackEndProcess;

@Controller @SessionAttributes({"customerList", "trigger", "pagenum", "ranindex", "rancate", "loginBean"})
public class MemberViewController {
	
	private final int PRODUCT_PAGE_MAX_ITEMS = 12;
	private final int HOME_PAGE_RANDOM_MAX_ITEMS = 10;
	private final String[] CATEGORY_ARRAY = {"3C", "clothes", "furnitures", "foods", "exercise", 
											 "cosmetics", "luxuries", "pets", "toys", "others"};
	@Autowired
	private AutoCompletionBackEndProcess a;
	
	@Autowired
	private ProductDAOInterface productDAO;

	@GetMapping("/loginMain.controller")
	public String processLogin() {
		return "member/Login";
	}
	
	@GetMapping("/ShowAll.controller")
	public String processManagerAll() {
		return "member/ManagerAll";
	}

	@GetMapping("/insertpage.controller")
	public String processInsertPage() {
		return "member/Registered";
	}
	
	@GetMapping("/updatepage.controller")
	public String processUpdatePage() {
		return "member/Updatepage";
	}
	
	@GetMapping(path = "/manager/memberInfo/{key}", produces = { "application/json" })
	public String processMemberInfo( @PathVariable Integer key, Model m ) {
		m.addAttribute("pk",key);
		return "member/ManagerOne";
	}
	
	@GetMapping(path = "/template")
	public String processTemplate() {
		return "paper-dashboard-master/testinclude";
	}
	
	@PostMapping(path = "/FrontTemplate")
	public String processPostFrontTemplate() {
		return "member/FrontTemplate";
	}
	
	@GetMapping(path = "/FrontTemplate")
	public String processFrontTemplate() {
		return "member/FrontTemplate";
	}
	
	@GetMapping(path = "/")
	public String processIndex(Model model, HttpServletRequest request) throws SQLException, IOException {
		a.getProductsNameAndCreateTextFileOnServer();

		var pList = productDAO.gotoCustomerList(0);
		productDAO.createImage(request);
		
		var pagenum = pList.size() / PRODUCT_PAGE_MAX_ITEMS;
		if (pList.size() % PRODUCT_PAGE_MAX_ITEMS != 0)
			pagenum++;
		
		model.addAttribute("customerList", pList);
		model.addAttribute("pagenum",pagenum);
		model.addAttribute("ranindex", randomIndex(pList));
		model.addAttribute("rancate", CATEGORY_ARRAY[ThreadLocalRandom.current().nextInt(0, CATEGORY_ARRAY.length)]);
		model.addAttribute("trigger", 0);

		return "shoppingCart/Home";
	}
	
	@GetMapping(path = "/home")
	public String processHome(@SessionAttribute("customerList") List<ProductBean> pList, Model model, HttpServletRequest request) {
		model.addAttribute("ranindex", randomIndex(pList));
		model.addAttribute("rancate", CATEGORY_ARRAY[ThreadLocalRandom.current().nextInt(0, CATEGORY_ARRAY.length)]);
		model.addAttribute("trigger", 0);
		
		return "shoppingCart/Home";
	}
	
//	@GetMapping(path = "/checkrcase")
//	public @ResponseBody List<Order_return> checkReturnCase(@SessionAttribute("loginBean") MemberBean loginBean){
//		return rJpaRepository.findByMemberIdStatus(loginBean.getMemberId());
//	}
	
	@GetMapping("/ForgetPassword")
	public String processTest() {
		return "member/ForgetPw";
	}
	
	@GetMapping(path = "/resetPw/{key}", produces = { "application/json" })
	public String processRestPw( @PathVariable Integer key, Model m ) {
		m.addAttribute("pk",key);
		return "member/ResetPw";
	}
	
	private List<Integer> randomIndex(List<ProductBean> pList){
		List<Integer> ranindex = new ArrayList<Integer>();
		for(int i = 0 ; i < HOME_PAGE_RANDOM_MAX_ITEMS ; i ++) {
			int rannum = ThreadLocalRandom.current().nextInt(0, pList.size());
			if(ranindex.contains(rannum)) {
				i --;
				continue;
			}
			ranindex.add(rannum);
		}
		return ranindex;
	}

	@GetMapping("/googleLogin")
	public String processGoogleLogin() {
		return "member/GoogleTest";
	}
}

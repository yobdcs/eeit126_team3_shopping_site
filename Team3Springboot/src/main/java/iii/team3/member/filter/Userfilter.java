package iii.team3.member.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import iii.team3.member.model.MemberBean;

@WebFilter({"/updatepage.controller", "/shoppingCart/transactionBack/*", "/shoppingCart/shoppingCartBack/*",
			"/shoppingCart/gotoShoppingCartPage", "/shoppingCart/gotoTransCheckPage", "/product/goAddProduct","/product/memberListPage",
			"/MessageBoard/insertSuccessAjax","/gotochathistory","/gotochat"})
public class Userfilter extends HttpFilter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = req.getSession();
		MemberBean memberBean = (MemberBean) session.getAttribute("loginBean");
		if(memberBean != null) {
			chain.doFilter(req, res);
		}else {
			System.out.println("filter");
//			req.getRequestDispatcher("/").forward(req, res);
			res.sendRedirect(req.getContextPath() + "/home");	
		}
	}

}

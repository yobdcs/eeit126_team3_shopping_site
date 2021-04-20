package iii.team3.member.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import iii.team3.member.model.MemberBean;

//@WebFilter("/ShowAll.controller")
public class TestFilter extends HttpFilter {

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
			System.out.println("testfilter "+memberBean.getAccount());
			chain.doFilter(req, res);
		}else {
			req.getRequestDispatcher("/loginMain.controller").forward(req, res);
		}
	}
	
	

}

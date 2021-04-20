package iii.team3.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import iii.team3.member.model.MemberBean;
import iii.team3.member.service.MemberJpaService;
//import iii.team3.member.service.MemberService;
import iii.team3.member.test.SendEmail;

@Controller
@SessionAttributes(names = {"loginBean", "logOverview", "orders", "cart", "newOrder", "totalAmount"})
public class MemberController {
//	@Autowired
//	private MemberService memberService;
	
	@Autowired
	private MemberJpaService memberJpaService;
	
	private SendEmail sendEmail = new SendEmail();
	
	@PostMapping(path = "/checkAccPw.controller")
	public @ResponseBody String checkAccPw(@RequestParam(value = "account") String account, @RequestParam(value = "password") String password,Model m) {
		String chkpwd;
		chkpwd = memberJpaService.findPwByAccount(account);
		MemberBean loginBean = memberJpaService.findByAccount(account);
		//System.out.println(loginBean.getPassword());
		if(chkpwd==null) return "no found";
		if(password.contentEquals(chkpwd)) {
			m.addAttribute("loginBean", loginBean);
			return "sucess";
		}
		return "error";
	}
	
	@GetMapping(path = "/showAllMember")
	public @ResponseBody List<MemberBean> processAllMember() {
		List<MemberBean> list = memberJpaService.findAllBeans();
		return list;
	}
	
	@PostMapping(path ="/insert")
	public @ResponseBody String processInsert(@RequestBody MemberBean member) {
		MemberBean checkBean = memberJpaService.findByAccount(member.getAccount());
		if(checkBean != null) {
			return "error";
		}else {
			member.setAuthority(1);
			memberJpaService.inserData(member);
			sendEmail.sendMail("註冊成功","感謝您註冊會員。");
			return "sucess";
		}
	}
	
	@GetMapping("/members/{key}")
	public @ResponseBody MemberBean showEditMember(@PathVariable Integer key) {
		MemberBean memberBean = memberJpaService.findById(key);
		return memberBean;
	}
	
	@PutMapping(path = "/members/{key}",consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody String processMemberUpdate(@RequestBody MemberBean member, @PathVariable Integer key) {
		memberJpaService.updateData(member);
		return "sucess";
	}
	
	@DeleteMapping("/members/{key}")
	public @ResponseBody String processMemberDelete(@PathVariable Integer key) {
		memberJpaService.deleteData(key);
		return "sucess";
	}
	
	@GetMapping("/logout.controller")
	public @ResponseBody String processLogOut(@ModelAttribute String account, SessionStatus status,HttpSession session) {
		session.removeAttribute("account");
		status.setComplete();
		account = null;
		return "sucess";
	}
	
	@PostMapping("/checkOldPw")
	public @ResponseBody String checkOldPw(@RequestParam(name = "password") String password, @SessionAttribute("loginBean") MemberBean userBean) {
		if(userBean.getPassword().equals(password)) {
			return "sucess";
		}
		return "";
	}
	
	@PostMapping("/restPassword")
	public @ResponseBody String restPassword(@RequestParam(name = "password") String password, @SessionAttribute("loginBean") MemberBean userBean) {
		userBean.setPassword(password);
		memberJpaService.updateData(userBean);
		sendEmail.sendMail("密碼修改通知信","您的密碼已更新完成");
		return "sucess";
	}
	
	@PostMapping("/checkAccExis")
	public @ResponseBody String checkAccExis(@RequestParam(name = "account") String account) {
		System.out.println("account"+account);
		MemberBean checkBean = memberJpaService.findByAccount(account);
		if(checkBean != null) {
			return "error";
		}else {
			return "sucess";
		}
	}
	
	@PostMapping("/testPhoto")
	public @ResponseBody String testPhoto(@RequestBody Map<String, String> map) {
		//System.out.println(map.get("photo"));
		String photo = map.get("photo");
		return photo;
	}
	
	@PostMapping("/checkAccOrEmail")
	public @ResponseBody String checkAccOrEmail(@RequestParam(value = "accOrmail") String accOrmail) {
		int am = accOrmail.indexOf("@");
		StringBuffer sb = new StringBuffer();
		sb.append("請點選連結重設密碼\n http://localhost:8080/Team03ShoppingSite/resetPw/");
		if(am == -1) {
			MemberBean forgetBean = memberJpaService.findByAccount(accOrmail);
			if(forgetBean != null) {
				sb.append(forgetBean.getMemberId());
				sendEmail.sendMail("重設密碼通知",sb.toString());
				return "acc";
			}else {
				return "error";
			}
		}else {
			List<MemberBean> forgetBeans = memberJpaService.findByEmail(accOrmail);
			if(forgetBeans.size() != 0) {
				sendEmail.sendMail("重設密碼通知",sb.toString());
				return "email";
			}else {
				return "error";
			}
		}
	}
	
	@PostMapping("/resetPw/{key}")
	public @ResponseBody String forgetAndResetPw(@PathVariable Integer key,@RequestParam(value = "newPassword") String newPassword) {
		MemberBean restBean = memberJpaService.findById(key);
		restBean.setPassword(newPassword);
		memberJpaService.updateData(restBean);
		return "sucess";
	}
	
//	@RequestMapping(path = "/showAllMember.controller", method = RequestMethod.POST)
//	public @ResponseBody String processShowAllMember(@RequestParam(name = "account") String account, @RequestParam(name = "password") String password, Model m) {
//		String chkpwd;
//		chkpwd = memberService.findPwByAccount(account);
//		if(password.contentEquals(chkpwd)) {
//			List<MemberBean> list = memberService.findAllBeans();
//			m.addAttribute("account", account);
//			m.addAttribute("allMembers", list);
//			return "member/ManagerAll";
//		}
//		return "member/Login";
//	}
//	
//	@RequestMapping(path = "/logout.controller", method = RequestMethod.GET)
//	public@ResponseBody String processLogOut(@ModelAttribute String account, SessionStatus status,HttpSession session) {
//		session.removeAttribute("account");
//		status.setComplete();
//		return "logout:" + account+"session:"+session.getAttribute("account");
//	}
//	
//	@RequestMapping(path = "/manager.controller", method = RequestMethod.POST, params = "select")
//	public String processSelectOne(@RequestParam Integer selectID, Model m) {
//		MemberBean selBean=memberService.findByID(selectID);
//		m.addAttribute("selBean", selBean);
//		return "member/SelectOne";
//	}
//	
//	@RequestMapping(path = "/manager.controller", method = RequestMethod.POST, params = "delete")
//	public String processDelete(@RequestParam Integer deleteID, Model m) {
//		memberService.deleteData(deleteID);
//		List<MemberBean> list = memberService.findAllBeans();
//		m.addAttribute("allMembers", list);
//		return "member/ManagerAll";
//	}
//	
//	@RequestMapping(path = "/manager.controller", method = RequestMethod.POST, params = "update")
//	public String processUpdate(@RequestParam Integer updateID, Model m) {
//		MemberBean updBean=memberService.findByID(updateID);
//		m.addAttribute("updBean", updBean);
//		return "member/Updatepage";
//	}
//	
//	@RequestMapping(path = "/update.controller", method = RequestMethod.POST)
//	public String processUpdateData(@RequestParam Integer memberId,@RequestParam String account,@RequestParam String password,@RequestParam String memberName,
//			@RequestParam String gender,@RequestParam String memberBirth,@RequestParam String email,@RequestParam String address,Model m) {
//		MemberBean updBean = new MemberBean(account, password, memberName, gender, memberBirth, email, address);
//		updBean.setMemberId(memberId);
//		memberService.updateData(updBean);
//		List<MemberBean> list = memberService.findAllBeans();
//		m.addAttribute("allMembers", list);
//		return "member/ManagerAll";
//	}
	
}

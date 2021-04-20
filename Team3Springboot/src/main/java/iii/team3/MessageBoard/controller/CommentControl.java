package iii.team3.MessageBoard.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import iii.team3.MessageBoard.dao.Order_overviewJpaRepository;
import iii.team3.MessageBoard.model.MessageBean;
import iii.team3.MessageBoard.service.CommentService;
import iii.team3.member.model.MemberBean;
import iii.team3.shoppingCart.dao.TransactionJpaRepository;
import iii.team3.shoppingCart.model.Order;


@Controller
@SessionAttributes(names = { "list", "id", "title", "username", "content", "time", "commentBean", "list2","loginBean" })
@EnableTransactionManagement
public class CommentControl {

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private Order_overviewJpaRepository ooJpaRepository;
	
	@Autowired
	private TransactionJpaRepository tJpaRepository;
	
//	@Autowired
//	private MemberJpaRepository mJpaRepository;
	
	private String msgTime;



	// 新增留言
	@PostMapping(value = "/MessageBoard/insertSuccessAjax", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String gotoCreateProcess(@RequestParam(name = "content") String content,
			@RequestParam(name="productId")Integer productid,@RequestParam(name="userName")Integer userName,
			@RequestParam(name="product")String product,
			@SessionAttribute(name="loginBean")MemberBean memberBean) {

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		msgTime = sdf.format(date);
		commentService.insertComment(new MessageBean(content, msgTime,productid,memberBean.getAccount(),userName,product));

		return "新增成功跳轉";
	}

	// 新增回覆
	@GetMapping(value = "/MessageBoard/insertReplyAjax", produces = "text/plain;charset=UTF-8")
	public  @ResponseBody Map<String, Object> insertReplyProcess(@RequestParam(name = "id") Integer id,
			@RequestParam(name = "content") String content,
			@SessionAttribute(name="loginBean")MemberBean memberBean) {

			Map<String, Object> map = new HashMap<>();
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			msgTime = sdf.format(date);
			commentService.insertReplyProcess(id, content, msgTime,memberBean.getAccount());
			map.put("success", "新增成功");
		
		return null;
	}

	// 查詢全部留言
	@RequestMapping(path = "/MessageBoard/GetAllMsg.controller", method = RequestMethod.POST)
	public String goSearchAllProcess(Model m) {

		var mb = commentService.selectAllComment();
		m.addAttribute("list", mb);

		return "MessageBoardapps/MsgBoard";
	}
	
	//管理者留言圖表
	@GetMapping(value = "/MessageBoard/getMsgChart.controller")
	public String ChartMsg() {		
		return "MessageBoardapps/StatisticMsg";
	}
	//長條圖
	@GetMapping(value = "/MessageBoard/getOrders.controller")
	public @ResponseBody List<String> getOrders(){
		return ooJpaRepository.findAllDate();
	}
	//圓餅圖
	@GetMapping(value = "/MessageBoard/getProducts.controller")
	public @ResponseBody List<String> getProducts(){
		return tJpaRepository.findAllCate();
	}
	//雷達圖
	@GetMapping(value = "/MessageBoard/getGender.controller")
	public @ResponseBody List<Order> getBuyer(){
//		List<MemberBean> members = new ArrayList<MemberBean>();
//		for(Integer id : ooJpaRepository.findBuyer())
//			members.add(mJpaRepository.findById(id).get());
		
//		var opj = ooJpaRepository.findBuyer();
//		for (int i = 0; i <opj.size();i++) {
//			System.out.println(opj.get(i).getBuyer().getMemberId());
//			for(Order_description od : opj.get(i).getItemList())
//				System.out.println(od.getProduct().getProductCategory());
//		}
		
		return ooJpaRepository.findBuyer();		
	}
	
	
	// 管理者查詢全部留言
	@GetMapping(value = "/MessageBoard/adminSearchAllAjax.controller", produces = "text/plain;charset=UTF-8")
	public String AdmingoSearchAllProcess(Model m) {

		var mb = commentService.selectAllComment();
		m.addAttribute("list2", mb);

		return "MessageBoardapps/manager";
	}

	// 管理者刪除留言
	@PostMapping(value = "/MessageBoard/adminDeleteOneAjax")
	@ResponseBody
	public List<MessageBean> AdminDeleteOneProcess(@RequestParam(name = "id") Integer id) {
		var mb = commentService.deleteOneComment(id);

		return mb;
	}
	
	//管理者修改
	@PostMapping(value = "/MessageBoard/adminUpdateOneProcess")
	public @ResponseBody List<MessageBean> AdminUpdateOneProcess(@RequestBody HashMap<String, String> bb) {
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		msgTime = sdf.format(date);
		
		var mb3 = new MessageBean(Integer.parseInt(bb.get("id")), bb.get("content"), msgTime);
		mb3.setAccount(bb.get("acc"));
		mb3.setProductId(Integer.parseInt(bb.get("pid")));
		var mb = commentService.updateMessage(mb3);

		return mb;

	}
	//使用者查詢單筆
	@PostMapping(value = "/MessageBoard/selectOneAjax")
	@ResponseBody
	public List<MessageBean> selectOneComment(@RequestParam(name = "productId")Integer productid, Model m){
		
		var mb=commentService.selectOneComment(productid);

		m.addAttribute("productComment", mb);
		
		return mb;
	}
	//賣家通知
	@PostMapping(path = "/MessageBoard/checkProductMsg")
	public @ResponseBody List<MessageBean> processCheckReturnCase(@RequestParam("LoginMemberId") Integer memberId){
		return commentService.notifyMember(memberId);
	}
}
package iii.team3.product.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
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
import org.springframework.web.multipart.MultipartFile;

import iii.team3.MessageBoard.service.CommentService;
import iii.team3.member.model.MemberBean;
import iii.team3.product.dao.ProductDAOInterface;
import iii.team3.product.model.ProductBean;
import iii.team3.product.model.ProductPay;
import iii.team3.product.model.ProductShip;
import iii.team3.product.model.ReportBean;
import iii.team3.product.service.ProductService;


@Controller
@SessionAttributes(names = {"sellAccount", "sellProduct","pInfo","pList","bean","customerList","loginBean",
							"trigger","pagenum","memberAcount","reportList"})
@RequestMapping(path = "/product")
@MultipartConfig
public class CRUDServlet {

	@Autowired
	private ProductDAOInterface productDAO;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ProductService productService;
	
	@PostMapping(path = "/selectMethod")
	public String selectMethod(
			@RequestParam(name = "productUpdateOrDelete") String productUpdateOrDelete,
			@RequestParam(name = "pId") Integer pId, @SessionAttribute("loginBean") MemberBean memberBean,
			@RequestParam(name = "pAccount") Integer pAccount, @RequestParam(name = "uName") String uName,
			@RequestParam(name = "uCategory") String uCategory, @RequestParam(name = "uImgLink") MultipartFile uImgLink,
			@RequestParam(name = "uPrice") Integer uPrice, @RequestParam(name = "uAmount") Integer uAmount,
			@RequestParam(name = "uType") String uType, @RequestParam(name = "uDescription") String uDescription,
			@RequestParam(name = "uLocation") String uLocation, @RequestParam(name = "upayType") Integer[] upayType,
			@RequestParam(name = "ushipType") Integer[] ushipType, @RequestParam(name = "oldName") String oldName,
			Model model , HttpServletRequest request) throws IOException, SQLException{

		 if (productUpdateOrDelete.equals("更新")) {
			return gotoUpdate(memberBean,pId, pAccount, uName, uCategory, uImgLink, uPrice, uAmount, uType, uDescription,
					uLocation, upayType, ushipType, oldName, model, request);	
		} else if (productUpdateOrDelete.equals("刪除")) {
			return gotoDelete(pAccount, oldName, pId, request, memberBean, model);
		} else if (productUpdateOrDelete.equals("上架")) {
			return gotoVision(memberBean,0,pId,model);
		} else if (productUpdateOrDelete.equals("下架")) {
			return gotoVision(memberBean,1,pId,model);
		}
		return "";
	}
//--------------------------------Reported Product--------------------------------------------
	@PostMapping(path = "/reportProduct")
	@ResponseBody
	public String reportProduct(@RequestParam(value = "reportType") String reportType, @RequestParam(value = "productId") Integer id,
								@RequestParam(value = "reportDescription") String reportDescription, @RequestParam(value = "productName") String productName,
								@RequestParam(value = "userId") Integer userId ,Model model) {
		if(reportDescription == "") {
			return "error";
		}
		List<ProductBean> productBean = productDAO.gotoReportProductEdit(id);
		Integer vision = productBean.get(0).getProductVision();
		ReportBean reportBean = new ReportBean(null,id,productName,userId,reportType,reportDescription,vision);
		productDAO.insertReportData(reportBean);
		return "reportSuccess";
	}
	
	@GetMapping(path = "/getAllReportedProduct")
	public String getAllReportedProduct(Model model) {
		var reportList = productDAO.getAllReportData();
		model.addAttribute("reportList",reportList);
		return "webProduct/backsideProductManage";
	}
	
	@GetMapping(path = "/editReportVision")
	public String editReportVision(@RequestParam(value = "vision") Integer vision, @RequestParam(value = "id") Integer id,Model model) {
		if(vision == 1) {
			productDAO.setProductVision(vision, id);
			productDAO.setReportVision(vision, id);
		}else if (vision == 2) {
			productDAO.setProductVision(vision, id);
			productDAO.setReportVision(vision, id);
		}else if (vision == 0) {
			productDAO.setProductVision(vision, id);
			productDAO.setReportVision(vision, id);
		}
		var reportList = productDAO.getAllReportData();
		model.addAttribute("reportList",reportList);
		return "webProduct/backsideProductManage";
	}
	
	@GetMapping(path = "/deleteReportEvent")
	public String deleteReportEvent(@RequestParam(value = "eventId") Integer eventId,Model model) {
		productDAO.deleteReport(eventId);
		var reportList = productDAO.getAllReportData();
		model.addAttribute("reportList",reportList);
		return "webProduct/backsideProductManage";
	}
	
	@PostMapping(path = "/alertReportToMember")
	@ResponseBody
	public List<ReportBean> alertReportToMember( @RequestParam("mid") Integer mid) {
		return productDAO.alertReport(mid);
	}
	//------------------------------------------------------------------------------------------------
	@GetMapping(path = "/editProduct")
	public String toUpdate(
			@RequestParam(value = "editId") Integer editId,Model model){
			ProductBean bean = productDAO.gotoSearch(editId);
			model.addAttribute("bean",bean);
			return "webProduct/productUpdate";
	}

	@GetMapping(path = "/infoProduct")
	public String toInfo(
						 @RequestParam(value = "infoId") Integer infoId,
						 @RequestParam(value = "index") Integer index,
						 @RequestParam(value = "uid") Integer id,
						 @SessionAttribute("customerList") List<ProductBean> list, Model model) {
//		ProductBean pInfo = productDAO.gotoSearch(infoId);

		var mb = commentService.selectOneComment(infoId);
		String memberAcount = productDAO.getMemberAcount(id);

		if (mb.size() == 0)
			mb = null;
		else {
			for (int i = 0; i < mb.size(); i++) {
				StringBuilder sb = new StringBuilder();
				sb.append(mb.get(i).getAccount().substring(0, 2));

				for (int j = 1; j < mb.get(i).getAccount().substring(2).length(); j++)
					sb.append("*");

				mb.get(i).setAccount(sb.toString());
			}
		}
		
		if(index >= 0) {
			list.get(index).setProductDescription(productService.EOLspliter(list.get(index).getProductDescription()));
			model.addAttribute("pInfo", list.get(index));
		}else {
			for(int i = 0 ; i < list.size() ; i ++) {
				if(list.get(i).getProductId().equals(infoId)) {
					list.get(i).setProductDescription(productService.EOLspliter(list.get(i).getProductDescription()));
					model.addAttribute("pInfo", list.get(i));
					break;
				}
			}
		}
		model.addAttribute("memberAcount", memberAcount);
		model.addAttribute("index", index);
		model.addAttribute("productComment", mb);
		
		return "webProduct/productInfo";
	}
	
	@GetMapping(path = "/goCostumerListByCategory")
	public String goCostumerListByCategory(@RequestParam(value = "category") String category, @SessionAttribute(value = "trigger") Integer trigger, Model model) {
//		List<ProductBean> customerList = null;
		model.addAttribute("trigger", 1);
		
		if (category.equals("3C")) {
			model.addAttribute("cate", "3C");
//			customerList = productDAO.goCategoryList("3C", 0);	
		}else if(category.equals("衣服")){
			model.addAttribute("cate", "clothes");
//			customerList = productDAO.goCategoryList("clothes", 0);
		}else if(category.equals("家電")){
			model.addAttribute("cate", "furnitures");
//			customerList = productDAO.goCategoryList("furnitures", 0);
		}else if(category.equals("食品")){
			model.addAttribute("cate", "foods");
//			customerList = productDAO.goCategoryList("foods", 0);
		}else if(category.equals("運動")){
			model.addAttribute("cate", "exercise");
//			customerList = productDAO.goCategoryList("exercise", 0);
		}else if(category.equals("美妝")){
			model.addAttribute("cate", "cosmetics");
//			customerList = productDAO.goCategoryList("cosmetics", 0);
		}else if(category.equals("精品")){
			model.addAttribute("cate", "luxuries");
//			customerList = productDAO.goCategoryList("luxuries", 0);
		}else if(category.equals("寵物")){
			model.addAttribute("cate", "pets");
//			customerList = productDAO.goCategoryList("pets", 0);
		}else if(category.equals("玩具")){
			model.addAttribute("cate", "toys");
//			customerList = productDAO.goCategoryList("toys", 0);
		}else if(category.equals("其他")){
			model.addAttribute("cate", "others");
//			customerList = productDAO.goCategoryList("others", 0);
		}
//		model.addAttribute("customerList", customerList);
		return "webProduct/productCustomerList";
	}
//--------------------------------------ProductCRUD--------------------------------
	@PostMapping(path = "/lunchProduct")
	public String lunchProduct(@SessionAttribute("loginBean") MemberBean memberBean,
//			@RequestParam(name = "pAccount") Integer pAccount,
			@RequestParam(name = "pName") String pName, @RequestParam(name = "pCategory") String pCategory,
			@RequestParam(name = "pImgLink") MultipartFile pImgLink, @RequestParam(name = "pPrice") Integer pPrice,
			@RequestParam(name = "pAmount") Integer pAmount, @RequestParam(name = "pType") String pType,
			@RequestParam(name = "pDescription") String pDescription,
			@RequestParam(name = "pLocation") String pLocation, @RequestParam(name = "payType") Integer[] payType,
			@RequestParam(name = "shipType") Integer[] shipType, Model model,HttpServletRequest request ) throws IOException, SQLException{
		
		List<ProductPay> payList = new ArrayList<ProductPay>();
		for (int i = 0; i < payType.length; i++) {
			payList.add(new ProductPay(payType[i]));
		}
		List<ProductShip> shipList = new ArrayList<ProductShip>();
		for (int i = 0; i < shipType.length; i++) {
			shipList.add(new ProductShip(shipType[i]));
		}
		byte[] newImg = pImgLink.getBytes();
		ProductBean productBean = new ProductBean(null, memberBean.getMemberId(), pName, pCategory, newImg, pPrice, pAmount,
				pType, pDescription, pLocation, payList, shipList,0);
		productDAO.insertProduct(productBean);
		
		productDAO.createImage(request);
		var pList = productDAO.gotoUserList(memberBean.getMemberId());
		model.addAttribute("pList", pList);
		return "webProduct/productList";
	}
	
	public String gotoUpdate(MemberBean memberBean,Integer pId, Integer pAccount, String uName, String uCategory, MultipartFile uImgLink,
			Integer uPrice, Integer uAmount, String uType, String uDescription, String uLocation, Integer[] upayType,
			Integer[] ushipType, String oldName, Model model,HttpServletRequest request) throws IOException, SQLException{
		var productBean = productDAO.loadProduct(pId);
		for (int i = 0; i < upayType.length; i++)
			productBean.getPayTpyeList().add(new ProductPay(upayType[i]));
		for (int i = 0; i < ushipType.length; i++)		
			productBean.getShipTypeList().add(new ProductShip(ushipType[i]));
		byte[] updateImg = uImgLink.getBytes();
		for (int i = 0; i < productBean.getPayTpyeList().size(); i++) {
			System.out.println(productBean.getPayTpyeList().get(i).getPayId());
		}
		productBean.setProductId(pId);
		productBean.setUserName(pAccount);
		productBean.setProductName(uName);
		productBean.setProductCategory(uCategory);
		productBean.setProductImgLink(updateImg);
		productBean.setProductPrice(uPrice);
		productBean.setProductAmount(uAmount);
		productBean.setProductType(uType);
		productBean.setProductDescription(uDescription);
		productBean.setProductLocation(uLocation);
		productBean.setProductVision(0);
		productDAO.updateProduct(productBean);
		productDAO.createImage(request);
		var pList = productDAO.gotoUserList(memberBean.getMemberId());
		model.addAttribute("pList", pList);
		return "webProduct/productList";
	}

	public String gotoDelete(Integer pAccount, String oldName,Integer id ,HttpServletRequest request, MemberBean memberBean, Model model) {
		
		String fileName = pAccount + oldName + ".jpg";	
		String fileDir = request.getSession().getServletContext().getRealPath("/") + "WEB-INF\\image";
		File delFileDir = new File(fileDir);
		File delFilePath = new File(delFileDir, fileName);
		delFilePath.delete();

		productDAO.deleteProduct(id);
		var pList = productDAO.gotoUserList(memberBean.getMemberId());
		model.addAttribute("pList", pList);
		return "webProduct/productList";
	}
	
	public String gotoVision(MemberBean memberBean, Integer vision, Integer id,Model model) {
		productDAO.setProductVision(vision, id);
		var pList = productDAO.gotoUserList(memberBean.getMemberId());
		model.addAttribute("pList", pList);
		return "webProduct/productList";
	}
	
//-------------------Search bar-----------------------------	
//	@PostMapping(path = "/ListPage")
//	public String searchList(@RequestParam(name = "searchSelect") String searchSelect ,
//			@RequestParam(name = "searchListSubmit") String searchListSubmit,
//			@RequestParam(name = "searchList") String searchList,
//			@SessionAttribute("loginBean") MemberBean loginBean,
//			Model model){
//		if (searchSelect.equals("searchUser")) {
//			return searchListByUser(searchList, model);
//		}else if(searchSelect.equals("searchProduct")){
//			return searchListByProduct(searchList, model);
//		}else {
//			return gotoList(model,loginBean.getMemberId());
//		}
//	}
//	
	@PostMapping(path = "/CustomerProductList")
	public String customerSearchList(@SessionAttribute("customerList") List<ProductBean> pList, @RequestParam(name = "searchCustomerSelect") String searchCustomerSelect,
			@RequestParam(name = "myProduct") String myProduct, HttpServletRequest request,
			Model model) throws SQLException, IOException{
		productDAO.createImage(request);
		if (searchCustomerSelect.equals("searchUser")) {
			return searchCustomerListByUser(myProduct, model);
		}else if(searchCustomerSelect.equals("searchProduct")){
			return searchCustomerListByProduct(pList, myProduct, model);
		}
		return "";
	}
//-----------------Search Member Product List--------------------
//	public String gotoList(Model model,Integer id) {
//		var pList = productDAO.gotoUserList(id);
//		model.addAttribute("pList", pList);
//		return "webProduct/productList";
//	}
//	
//	public String searchListByUser(String searchList, Model model) {
//		
//		var userList = productDAO.searchUserListByUser(searchList);
//		model.addAttribute("pList", userList);
//		return "webProduct/productList";
//	}
//	
//	public String searchListByProduct(String searchList, Model model) {
//		
//		var productList = productDAO.searchUserListByProduct(searchList);
//		model.addAttribute("pList",productList);
//		return "webProduct/productList";
//	}	
	
//-----------------Search Customer Product List--------------------
//	public String gotoCustomerList(Model model) {
//
//		var customerList = productDAO.gotoCustomerList(0);
//		model.addAttribute("customerList", customerList);
//		model.addAttribute("trigger", 0);
//		return "webProduct/productCustomerList";
//	}
	
	public String searchCustomerListByUser(String myProduct, Model model) {
		
		var customerListByUser = productDAO.gotoCustomerListByUser(myProduct,0);
		model.addAttribute("customerList", customerListByUser);
		model.addAttribute("trigger", 0);
		var pagenum = customerListByUser.size() / 12;
		if (customerListByUser.size() % 12 != 0) {
			pagenum++;
		}
		System.out.println(pagenum);
		model.addAttribute("pagenum",pagenum);
		return "webProduct/productCustomerList";
	}
	
	public String searchCustomerListByProduct(List<ProductBean> pList , String myProduct, Model model) {
		var customerListByProduct = productDAO.gotoCustomerListByProduct(myProduct,0);
//		model.addAttribute("customerList",customerListByProduct);
//		model.addAttribute("trigger", 0);
//		var pagenum = customerListByProduct.size() / 12;
//		if (customerListByProduct.size() % 12 != 0) {
//			pagenum++;
//		}
//		System.out.println(pagenum);
//		model.addAttribute("pagenum",pagenum);
//		return "webProduct/productCustomerList";
		int infoId = 0;
		int id = 0;
		int index = 0;
		for(int i = 0 ; i < pList.size() ; i ++) {
			if(pList.get(i).getProductName().equals(customerListByProduct.get(0).getProductName())) {
				infoId = pList.get(i).getProductId();
				id = pList.get(i).getUserName();
				index = i;
				pList.get(i).setProductDescription(productService.EOLspliter(pList.get(i).getProductDescription()));
				model.addAttribute("pInfo", pList.get(i));
				break;
			}	
		}

		var mb = commentService.selectOneComment(infoId);
		String memberAcount = productDAO.getMemberAcount(id);

		if (mb.size() == 0)
			mb = null;
		else {
			for(int i = 0; i < mb.size(); i++) {
				StringBuilder sb = new StringBuilder();
				sb.append(mb.get(i).getAccount().substring(0, 2));

				for (int j = 1; j < mb.get(i).getAccount().substring(2).length(); j++)
					sb.append("*");

				mb.get(i).setAccount(sb.toString());
			}
		}

		model.addAttribute("memberAcount", memberAcount);
		model.addAttribute("index", index);
		model.addAttribute("productComment", mb);
		
		return "webProduct/productInfo";
	}	
}

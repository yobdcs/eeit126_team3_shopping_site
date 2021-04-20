package iii.team3.product.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import iii.team3.product.model.ProductBean;
import iii.team3.product.model.ReportBean;



public interface ProductDAOInterface {
	public ProductBean insertProduct(ProductBean beanData);
	public void updateProduct(ProductBean beanData);
	public void deleteProduct(Integer id);
	public void setProductVision(Integer vision, Integer id);
	public ProductBean loadProduct(Integer pk);
	public ProductBean gotoSearch(Integer productId);
	public void createImage(HttpServletRequest request) throws SQLException, IOException;
	public List<ProductBean> gotoUserList(Integer id);
	public List<ProductBean> gotoReportProductEdit(Integer id);
	public List<ProductBean> gotoCustomerListByProduct(String sellProduct, Integer vision);
	public List<ProductBean> gotoCustomerListByUser(String sellAccount, Integer vision);
	public List<ProductBean> gotoCustomerList(Integer vision);
	public List<ProductBean> goCategoryList(String category, Integer vision);
	public String getMemberAcount(Integer id);
	public ReportBean insertReportData(ReportBean reportData);
	public List<ReportBean> getAllReportData();
	public void setReportVision(Integer vision, Integer id);
	public void deleteReport(Integer eventId);
	public List<ReportBean> alertReport(Integer userId);
}

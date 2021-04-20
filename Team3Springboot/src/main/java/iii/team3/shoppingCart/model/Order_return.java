package iii.team3.shoppingCart.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import iii.team3.product.model.ProductBean;

@SuppressWarnings("serial")

@Entity @Component
@Table(name = "ORDER_RETURN")
public class Order_return implements Serializable{
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CASE_ID")
	private Integer caseID;
	
	@Column(name = "BUYER_ID")
	private Integer buyerID;

	@Column(name = "SELLER_ID")
	private Integer sellerID;
	
	@Column(name = "DATETIME", columnDefinition="DATETIME")
	private String datetime;
	
	@OneToOne @JoinColumn(name = "FK_ORDER_ID")
	private Order order;
	
	@OneToOne @JoinColumn(name = "FK_PRODUCT_ID")
	private ProductBean product;
	
	@Column(name = "REASON")
	private String reason;
	
	@Column(name = "SELLER_CONFIRM")
	private String sellerConfirm;
	
	@Column(name = "STATUS")
	private Integer status;

	public Order_return(Integer buyerID, Integer sellerID, Integer orderID, Integer productID, String reason) {
		this.buyerID = buyerID;
		this.sellerID = sellerID;
		this.datetime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
		this.order = new Order(orderID);
		this.product = new ProductBean(productID);
		this.reason = reason;
		this.status = 0;
	}
	
	public Order_return(Integer caseID, String sellerConfirm) {
		this.sellerConfirm = sellerConfirm;
	}
	
	public Order_return() {
	}
	
	public Integer getCaseID() {
		return caseID;
	}

	public void setCaseID(Integer caseID) {
		this.caseID = caseID;
	}

	public Integer getBuyerID() {
		return buyerID;
	}

	public void setBuyerID(Integer buyerID) {
		this.buyerID = buyerID;
	}

	public Integer getSellerID() {
		return sellerID;
	}

	public void setSellerID(Integer sellerID) {
		this.sellerID = sellerID;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public ProductBean getProduct() {
		return product;
	}

	public void setProduct(ProductBean product) {
		this.product = product;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getSellerConfirm() {
		return sellerConfirm;
	}

	public void setSellerConfirm(String sellerConfirm) {
		this.sellerConfirm = sellerConfirm;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}

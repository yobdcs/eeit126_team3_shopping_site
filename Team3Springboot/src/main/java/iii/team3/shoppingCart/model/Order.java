package iii.team3.shoppingCart.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import iii.team3.member.model.MemberBean;

@SuppressWarnings("serial")

@Entity @Component
@Table(name = "ORDER_OVERVIEW")
public class Order implements Serializable{
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ORDER_ID")
	private Integer orderID;
	
	@Column(name = "DATETIME", columnDefinition="DATETIME")
	private String datetime;

	@OneToOne @JoinColumn(name = "BUYER_ID")
	private MemberBean buyer;
	
	@Column(name = "TOTAL_AMOUNT")
	private Integer totalAmount;
	
	@Column(name = "SHIPPING_FEE")
	private Integer shippingFee;
	
	@OneToMany(mappedBy = "order", cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
	private List<Order_description> itemList;
	
	public Order(String datetime, Integer buyerID, Integer totalAmount, List<Order_description> itemList) {
		this.datetime = datetime;
		this.buyer = new MemberBean(buyerID);
		this.totalAmount = totalAmount;
		this.itemList = itemList;
	}
	
	public Order(Integer orderID) {
		this.orderID = orderID;
	}
	
	public Order() {
	}
	
	public Integer getOrderID() {
		return orderID;
	}
	
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	
	public String getDatetime() {
		return datetime;
	}
	
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	
	public MemberBean getBuyer() {
		return buyer;
	}
	
	public void setBuyer(MemberBean buyer) {
		this.buyer = buyer;
	}
	
	public Integer getTotalAmount() {
		return totalAmount;
	}
	
	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Integer getShippingFee() {
		return shippingFee;
	}

	public void setShippingFee(Integer shippingFee) {
		this.shippingFee = shippingFee;
	}

	public List<Order_description> getItemList() {
		return itemList;
	}

	public void setItemList(List<Order_description> itemList) {
		this.itemList = itemList;
	}

}

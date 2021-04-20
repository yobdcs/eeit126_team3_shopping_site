package iii.team3.shoppingCart.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import iii.team3.member.model.MemberBean;
import iii.team3.product.model.ProductBean;
import iii.team3.product.model.ProductPay;
import iii.team3.product.model.ProductShip;

@SuppressWarnings("serial")

@Entity @Component
@Table(name = "ORDER_DESCRIPTION")
public class Order_description implements Serializable{

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Integer id;
	
	@OneToOne @JoinColumn(name = "SELLER_ID")
	private MemberBean seller;
	
	@OneToOne @JoinColumn(name = "FK_PRODUCT_ID")
	private ProductBean product;
	
	@Column(name = "QUANTITY")
	private Integer quantity;
	
	@Column(name = "PRICE")
	private Integer price;
	
	@OneToOne @JoinColumn(name = "FK_PAY_TYPE_ID")
	private ProductPay payType;
	
	@OneToOne @JoinColumn(name = "FK_SHIPPING_TYPE_ID")
	private ProductShip shippingType;
	
	@OneToOne @JoinColumn(name = "FK_ORDER_STATUS_ID")
	private Order_status order_status;
	
	@OneToOne @JoinColumn(name = "FK_SHIPPING_STATUS_ID")
	private Shipping_status shipping_status;
	
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL) @JoinColumn(name = "FK_ORDER_OVERVIEW_ID")
	private Order order;
	
	@Transient @JsonIgnore
	private List<ProductPay> pList;
	
	@Transient @JsonIgnore
	private List<ProductShip> sList;

	public Order_description(Integer sellerID, ProductBean product, Integer quantity, Integer price,
								Order_status order_status, Shipping_status shipping_status, Order order, 
								List<ProductPay> pList, List<ProductShip> sList) {
		this.seller = new MemberBean(sellerID);
		this.product = product;
		this.quantity = quantity;
		this.price = price;
		this.order_status = order_status;
		this.shipping_status = shipping_status;
		this.order = order;
		this.pList = pList;
		this.sList = sList;
	}
	
	public Order_description() {
	}

	public MemberBean getSeller() {
		return seller;
	}

	public void setSellerID(MemberBean seller) {
		this.seller = seller;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public ProductBean getProduct() {
		return product;
	}

	public void setProduct(ProductBean product) {
		this.product = product;
	}

	public ProductPay getPayType() {
		return payType;
	}

	public void setPayType(ProductPay payType) {
		this.payType = payType;
	}

	public ProductShip getShippingType() {
		return shippingType;
	}

	public void setShippingType(ProductShip shippingType) {
		this.shippingType = shippingType;
	}

	public Order_status getOrder_status() {
		return order_status;
	}

	public void setOrder_status(Order_status order_status) {
		this.order_status = order_status;
	}

	public Shipping_status getShipping_status() {
		return shipping_status;
	}

	public void setShipping_status(Shipping_status shipping_status) {
		this.shipping_status = shipping_status;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public List<ProductPay> getpList() {
		return pList;
	}

	public void setpList(List<ProductPay> pList) {
		this.pList = pList;
	}

	public List<ProductShip> getsList() {
		return sList;
	}

	public void setsList(List<ProductShip> sList) {
		this.sList = sList;
	}
	
}

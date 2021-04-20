package iii.team3.shoppingCart.model;

import java.io.Serializable;
import java.util.List;

import iii.team3.product.model.ProductPay;
import iii.team3.product.model.ProductShip;

@SuppressWarnings("serial")
public class ShoppingCartBean implements Serializable{

	private Integer productID;
	private Integer sellerID;
	private String productName;
	private Integer quantity;
	private Integer stock;
	private Integer price;
	private List<ProductPay> pList;
	private List<ProductShip> sList;
	private Integer indexInList;

	public ShoppingCartBean(Integer productID, Integer sellerID, String productName, Integer quantity, Integer stock,
							Integer price, List<ProductPay> pList, List<ProductShip> sList, Integer indexInList) {
		this.productID = productID;
		this.sellerID = sellerID;
		this.productName = productName;
		this.quantity = quantity;
		this.stock = stock - quantity;
		this.price = quantity * price;
		this.pList = pList;
		this.sList = sList;
		this.indexInList = indexInList;
	}

	public ShoppingCartBean() {
	}
	
	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public Integer getSellerID() {
		return sellerID;
	}

	public void setSellerID(Integer sellerID) {
		this.sellerID = sellerID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
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

	public Integer getIndexInList() {
		return indexInList;
	}

	public void setIndexInList(Integer indexInList) {
		this.indexInList = indexInList;
	}
}
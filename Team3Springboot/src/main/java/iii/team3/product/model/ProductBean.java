package iii.team3.product.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@SuppressWarnings("serial")
@Entity
@Table(name = "product")
@Component
public class ProductBean implements java.io.Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private Integer productId;
	
	@Column(name = "user_name")
	private Integer userName;
	
	@Column(name = "product_name")
	private String productName;
	
	@Column(name = "product_category")
	private String productCategory;
	
	@Column(name = "product_imglink", columnDefinition = "VARBINARY(MAX)")
	private byte[] productImgLink;
	
	@Column(name = "product_price")
	private Integer productPrice;
	
	@Column(name = "product_amount")
	private Integer productAmount;
	
	@Column(name = "product_type") // product states
	private String productType;
	
	@Column(name = "product_description", columnDefinition = "VARCHAR(MAX)")
	private String productDescription;
	
	@Column(name = "product_location")
	private String productLocation;
	
	@Column(name = "product_vision")
	private Integer productVision;

	@ManyToMany(cascade =  CascadeType.MERGE) @JsonIgnore
	@JoinTable(name = "product_pay" , joinColumns = {@JoinColumn(name = "fk_product_id" , referencedColumnName = "product_id")}
									, inverseJoinColumns = {@JoinColumn(name = "fk_pay_id" , referencedColumnName = "pay_id")})
	private List<ProductPay> PayTpyeList;
	
	
	@ManyToMany(cascade =  CascadeType.MERGE) @JsonIgnore
	@JoinTable(name = "product_ship" , joinColumns = {@JoinColumn(name = "fk_product_id" , referencedColumnName = "product_id")}  
									 ,inverseJoinColumns= {@JoinColumn(name = "fk_ship_id" , referencedColumnName = "ship_id")} )
	private List<ProductShip> ShipTypeList;

	public ProductBean() {
	}

	public ProductBean(Integer productId, Integer userName, String productName, String productCategory,
			byte[] productImgLink, Integer productPrice, Integer productAmount, String productType,
			String productDescription, String productLocation, List<ProductPay> PayTpyeList,
			List<ProductShip> ShipTypeList,Integer productVision
			) {
		this.productId = productId;
		this.userName = userName;
		this.productName = productName;
		this.productCategory = productCategory;
		this.productImgLink = productImgLink;
		this.productPrice = productPrice;
		this.productAmount = productAmount;
		this.productType = productType;
		this.productDescription = productDescription;
		this.productLocation = productLocation;
		this.PayTpyeList = PayTpyeList;
		this.ShipTypeList = ShipTypeList;
		this.productVision = productVision;
	}
	
	public ProductBean(Integer productId, String productName, Integer productAmount) {
		this.productId = productId;
		this.productName = productName;
		this.productAmount = productAmount;
	}
	
	public ProductBean(Integer productID) {
		this.productId = productID;
	}

	public Integer getUserName() {
		return userName;
	}

	public void setUserName(Integer userName) {
		this.userName = userName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public byte[] getProductImgLink() {
		return productImgLink;
	}

	public void setProductImgLink(byte[] productImgLink) {
		this.productImgLink = productImgLink;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(Integer productAmount) {
		this.productAmount = productAmount;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductLocation() {
		return productLocation;
	}

	public void setProductLocation(String productLocation) {
		this.productLocation = productLocation;
	}

	public List<ProductPay> getPayTpyeList() {
		return PayTpyeList;
	}

	public void setPayTpyeList(List<ProductPay> payTpyeList) {
		PayTpyeList = payTpyeList;
	}

	public List<ProductShip> getShipTypeList() {
		return ShipTypeList;
	}

	public void setShipTypeList(List<ProductShip> shipTypeList) {
		ShipTypeList = shipTypeList;
	}
	
	public Integer getProductVision() {
		return productVision;
	}

	public void setProductVision(Integer productVision) {
		this.productVision = productVision;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

}

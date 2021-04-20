package iii.team3.product.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name="product_pay_type")
public class ProductPay {
	@Id
	@Column(name = "pay_id")
	private Integer payId;
	
	@Column(name = "pay_type", updatable = false)
	private String payType;

	@ManyToMany(mappedBy = "PayTpyeList") @JsonIgnore
	private List<ProductBean> productsPay;
	
	public ProductPay() {
	}
	
	public ProductPay(Integer payId) {
		this.payId = payId;
	}
	
	public Integer getPayId() {
		return payId;
	}
	public void setPayId(Integer payId) {
		this.payId = payId;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public List<ProductBean> getProductsPay() {
		return productsPay;
	}
	public void setProductsPay(List<ProductBean> productsPay) {
		this.productsPay = productsPay;
	}
}

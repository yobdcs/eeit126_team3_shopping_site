package iii.team3.product.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name="product_ship_type")
public class ProductShip {
	@Id
	@Column(name = "ship_id")
	private Integer shipId;

	@Column(name = "ship_type", updatable = false)
	private String shipType;

	@ManyToMany(mappedBy = "ShipTypeList") @JsonIgnore
	private List<ProductBean> productsShip;
	
	public ProductShip() {
	}
	public ProductShip(Integer shipId) {
		this.shipId = shipId;
	}
	public Integer getShipId() {
		return shipId;
	}
	public void setShipId(Integer shipId) {
		this.shipId = shipId;
	}
	public String getShipType() {
		return shipType;
	}
	public void setShipType(String shipType) {
		this.shipType = shipType;
	}
	public List<ProductBean> getProductsShip() {
		return productsShip;
	}
	public void setProductsShip(List<ProductBean> productsShip) {
		this.productsShip = productsShip;
	}

}

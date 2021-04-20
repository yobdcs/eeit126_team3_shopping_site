package iii.team3.act.entity;

import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "act_cross_product")
public class ActCrossProduct {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_acp")
	private int id_acp;

	@Column(name = "id_product_acp")
	private String id_product_acp;

	@Column(name = "promotion_prodcutbyid")
	private BigDecimal promotion_prodcutById;

	@Column(name = "promotion_productbycate")
	private BigDecimal promotion_productByCate;

//	@OneToOne(mappedBy = "actCrossProduct")
	@OneToOne(mappedBy = "actCrossProduct", cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,CascadeType.REFRESH })
	private ActMain actMain;

	// 看看 登元 的 table 名稱 & 資料路徑
	// 對應二個 table: product & product_category
	// 要用 @OneToMany
//	@OneToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
//	@JoinColumn(name="product_id")
//	private Product product;

//	@OneToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH })
//	@JoinColumn(name="product_category_id")
//	private Product_Category product_category;

	public ActCrossProduct() {

	}

	public ActMain getActMain() {
		return actMain;
	}

	public void setActMain(ActMain actMain) {
		this.actMain = actMain;
	}

	public ActCrossProduct(String id_product_acp, BigDecimal promotion_prodcutById,
			BigDecimal promotion_productByCate) {
		this.id_product_acp = id_product_acp;
		this.promotion_prodcutById = promotion_prodcutById;
		this.promotion_productByCate = promotion_productByCate;
	}

	public int getId_acp() {
		return id_acp;
	}

	public void setId_acp(int id_acp) {
		this.id_acp = id_acp;
	}

	public String getId_product_acp() {
		return id_product_acp;
	}

	public void setId_product_acp(String id_product_acp) {
		this.id_product_acp = id_product_acp;
	}

	public BigDecimal getPromotion_prodcutById() {
		return promotion_prodcutById;
	}

	public void setPromotion_prodcutById(BigDecimal promotion_prodcutById) {
		this.promotion_prodcutById = promotion_prodcutById;
	}

	public BigDecimal getPromotion_productByCate() {
		return promotion_productByCate;
	}

	public void setPromotion_productByCate(BigDecimal promotion_productByCate) {
		this.promotion_productByCate = promotion_productByCate;
	}

	@Override
	public String toString() {
		return "ActCrossProduct [id_acp=" + id_acp + ", id_product_acp=" + id_product_acp + ", promotion_prodcutById="
				+ promotion_prodcutById + ", promotion_productByCate=" + promotion_productByCate + "]";
	}

}

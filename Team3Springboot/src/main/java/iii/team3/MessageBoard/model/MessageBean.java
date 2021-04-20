package iii.team3.MessageBoard.model;

import java.io.Serializable;
import java.util.LinkedList;
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
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "comments")
public class MessageBean implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MSG_ID")
	private Integer id;


	@Column(name = "CONTENT")
	private String content;

	@Column(name = "TIME")
	private String time;
	
	@Column(name = "PRODUCT_ID")
	private Integer productId;
	
	@Column(name = "ACCOUNT")
	private String account;
	
	@Column(name ="SELLER_ID")
	private Integer sellerid;
	
	@Column(name = "WANANA_PRODUCT")
	private String product;
	
	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public Integer getSellerid() {
		return sellerid;
	}

	public void setSellerid(Integer sellerid) {
		this.sellerid = sellerid;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "MESSAGE_FK", referencedColumnName = "MSG_ID")
	private List<SubMessageBean> msgList = new LinkedList<>();
	
	public MessageBean(Integer id, String content, String time,
			List<SubMessageBean> msgList, Integer productId,String account) {
		this.id = id;
		this.content = content;
		this.time = time;
		this.msgList = msgList;
		this.productId = productId;
		this.account = account;
	}

	public MessageBean(Integer id, String content, String time,
			List<SubMessageBean> msgList) {
		super();
		this.id = id;
		this.content = content;
		this.time = time;
		this.msgList = msgList;

	}

	public MessageBean() {

	}
	public MessageBean(String content, String time,Integer productId,String account,Integer sellerid,String product) {
		this.account = account;
		this.content = content;
		this.time = time;
		this.productId = productId;
		this.sellerid = sellerid;
		this.product = product;
	} 
	public MessageBean(Integer id, String title, String username, String content, String time) {
		this.id = id;
		this.content = content;
		this.time = time;

	}

	public MessageBean(String content, String time) {


		this.content = content;
		this.time = time;

	}

	public MessageBean(Integer id,String content, String time) {
		this.id = id;
		this.content = content;
		this.time = time;

	}

	public MessageBean(Integer id) {
		this.id = id;
	}

	public MessageBean(String content, String time, Integer productid) {
		

		this.content = content;
		this.time = time;
		this.productId = productid;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<SubMessageBean> getMsgList() {
		return msgList;
	}

	public void setMsgList(List<SubMessageBean> msgList) {
		this.msgList = msgList;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getAccount() {
		return account;
	}
	
	public void setAccount(String account) {
		this.account = account;
	}
	
}

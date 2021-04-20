package iii.team3.MessageBoard.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "sub_comments")
public class SubMessageBean implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "CONTENT")
	private String content;

	@Column(name = "TIME")
	private String time;
	
	@Column(name ="ACCOUNT")
	private String account;
	
	public SubMessageBean() {
		super();
	}

	public SubMessageBean(String content, String time,String account) {
		super();
		this.account = account;
		this.content = content;
		this.time = time;
	}

	public SubMessageBean(Integer id, String content, String time) {
		super();
		this.id = id;
		this.content = content;
		this.time = time;
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

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
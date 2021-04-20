package iii.team3.shoppingCart.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@SuppressWarnings("serial")

@Entity @Component
@Table(name = "SHIPPING_STATUS")
public class Shipping_status implements Serializable{
	
	@Id @Column(name = "STATUS_ID")
	private int statusID;
	
	@Column(name = "STATUS_NAME")
	private String status;
	
	public Shipping_status(int statusID) {
		this.statusID = statusID;
	}
	
	public Shipping_status() {
	}
	
	public int getStatusID() {
		return statusID;
	}
	
	public void setStatusID(int statusID) {
		this.statusID = statusID;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}

}

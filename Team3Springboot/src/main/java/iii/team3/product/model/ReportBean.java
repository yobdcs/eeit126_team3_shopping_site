package iii.team3.product.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@SuppressWarnings("serial")
@Entity
@Table(name = "ReportProduct")
@Component
public class ReportBean implements java.io.Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "event_id")
	private Integer eventId;
	
	@Column(name = "product_id")
	private Integer productId;
	
	@Column(name = "product_name")
	private String productName;
	
	@Column(name = "user_id")
	private Integer userId;
	
	@Column(name = "report_type")
	private String reportType;
	
	@Column(name = "report_description")
	private String reportDescription;
	
	@Column(name = "report_vision")
	private Integer reportVision;
	public ReportBean() {
		
	}
	
	public ReportBean(Integer eventId, Integer productId, String productName, Integer userId, String reportType,
			String reportDescription, Integer reportVision) {
		super();
		this.eventId = eventId;
		this.productId = productId;
		this.productName = productName;
		this.userId = userId;
		this.reportType = reportType;
		this.reportDescription = reportDescription;
		this.reportVision = reportVision;
	}

	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getReportDescription() {
		return reportDescription;
	}

	public void setReportDescription(String reportDescription) {
		this.reportDescription = reportDescription;
	}

	public Integer getReportVision() {
		return reportVision;
	}

	public void setReportVision(Integer reportVision) {
		this.reportVision = reportVision;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	
	
}

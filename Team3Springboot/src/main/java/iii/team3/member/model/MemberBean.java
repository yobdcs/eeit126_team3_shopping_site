package iii.team3.member.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Component
@Entity
@Table(name = "MEMBER")
public class MemberBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "MEMBER_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberId;
	private String account;
	private String password;
	@Column(name = "MEMBER_NAME")
	private String memberName;
	private String gender;
	@Column(name = "MEMBER_BIRTH")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private String memberBirth;
	private String email;
	@Column(name = "ADDR")
	private String address;
	@Column(name = "MEMBER_PHOTO")
	private String memberPhoto;
	private Integer authority;

	public MemberBean() {

	}

	public MemberBean(Integer memberId) {
		this.memberId = memberId;
	}

	public MemberBean(String account, String password, String memberName, String gender, String memberBirth,
			String email, String address) {
		this.account = account;
		this.password = password;
		this.memberName = memberName;
		this.gender = gender;
		this.memberBirth = memberBirth;
		this.email = email;
		this.address = address;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String mpassword) {
		this.password = mpassword;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMemberPhoto() {
		return memberPhoto;
	}

	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}

	public Integer getAuthority() {
		return authority;
	}

	public void setAuthority(Integer authority) {
		this.authority = authority;
	}

}

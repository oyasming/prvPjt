package com.prv.pjt.user;

import javax.persistence.Column;
import javax.persistence.Entity;
//import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="users")
public class User {

	@Id
	@Column(name = "seq")
	private Integer seq;
	
	@Column(name = "username")
	@Length(min=6, message="아이디를 6글자 이상 입력해 주십시오.")
    @NotEmpty(message = "*Please provide an username")
	private String username;

	@Column(name = "password")
	@Length(min=6, message="비밀번호를 6글자 이상 입력해 주십시오.")
    @NotEmpty(message = "*Please provide an password")
//	@Pattern(regexp="/^(?=.*\\d)(?=.*[a-zA-Z])(?=.*[\\d!@@#$%^&amp;+=]).*$/")
//	@Transient
	private String password;

	@Column(name = "name")
    @NotEmpty(message = "*Please provide an name")
	private String name;
	
	@Column(name = "position")
    @NotEmpty(message = "*Please provide an position")
	private String position;

	@Column(name = "authority")
	private int authority;

	@Column(name = "phone_no")
	//@Pattern(regexp="^\\d{2,3}+-+\\d{3,4}+-+\\d{4}$", message="Invalid phone number!!")
	private String phone_no;
	
	@Column(name = "mobile_no")
	@Pattern(regexp="^(01)\\d{1}-\\d{3,4}-\\d{4}$", message="Invalid mobile number!!")
	private String mobile_no;

	@Column(name = "email")
	@Email
	//@Pattern(regexp="^[_0-9a-zA-Z-]+@[0-9a-zA-Z]+(.[_0-9a-zA-Z-]+)*$", message="Invalid email address!")
	private String email;

	@Column(name = "post")
	private String post;
	
	@Column(name = "address1")
	private String address1;
	
	@Column(name = "address2")
	private String address2;
		
	public User() {
//		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(int seq, String username, String password, String name, String position, int authority) {
//		super();
		this.seq = seq;
		this.username = username;
		this.password = password;
		this.name = name;
		this.position = position;
		this.authority = authority;
	}
	
	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	@Override
	public String toString() {
		return this.seq + this.username + this.password + this.name + this.position + this.authority;
	}
}

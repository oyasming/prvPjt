package com.prv.pjt.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.Transient;


@Entity
@Table(name="users")
public class User {

	@Id
	@GeneratedValue
	private Integer index;
	
	@Column(name = "username")
	@Length(min=6, message="6글자 이상 입력해 주십시오.")
    @NotEmpty(message = "*Please provide an email")
	private String username;

	@Column(name = "password")
	@Length(min=6, message="6글자 이상 입력해 주십시오.")
    @NotEmpty(message = "*Please provide an email")
//	@Transient
	private String password;

	@Column(name = "name")
	private String name;
	
	@Column(name = "position")
	private String position;

	@Column(name = "authority")
	private int authority;
	
	public User() {
//		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(String username, String password, String name, String position, int authority) {
//		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.position = position;
		this.authority = authority;
	}
	
	
	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
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
	
	@Override
	public String toString() {
		return this.index + this.username + this.password + this.name + this.position + this.authority;
	}
}

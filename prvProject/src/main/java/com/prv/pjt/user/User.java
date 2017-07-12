package com.prv.pjt.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="users")
public class User {

	@Id
	@GeneratedValue
	private Integer index;
	
	@Column(name = "id")
	private String id;

	@Column(name = "pw")
	private String pw;

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
	
	public User(String id, String pw, String name, String position, int authority) {
//		super();
		this.id = id;
		this.pw = pw;
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

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
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
		return this.id + this.pw + this.name + this.position + this.authority;
	}
}

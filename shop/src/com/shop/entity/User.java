package com.shop.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 用户管理类
 * @类名	User.java
 * @作者	xyn
 * @Emial	xyn.java@foxmail.com
 * @日期 2014-7-13
 * @版本 V 1.0
 */
public class User implements Serializable {

	private static final long serialVersionUID = 252841811851125164L;
	private int id; // 主键
	private String username; // 用户名
	private String password; // 密码
	private String old; // 临时存储旧密码
	private String name; // 收货人
	private String phone; // 电话
	private String address; // 地址
	private Date createDate; // 创建时间
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getOld() {
		return old;
	}
	public void setOld(String old) {
		this.old = old;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}

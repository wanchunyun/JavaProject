package com.shop.entity;

import java.io.Serializable;

import com.shop.util.NumberUtil;

/**
 * 订单详情类
 * @类名	OrderItem.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-9-17
 * @版本 V 1.0
 */
public class OrderItem implements Serializable{

	private static final long serialVersionUID = 7669951336610808614L;
	private int id;
	private int pid;// 商品id
	private String title;// 商品名称
	private String img;// 商品图片
	private double price;// 价格
	private int count;// 数量
	private Order order;
	
	public OrderItem() {
		super();
	}
	public OrderItem(int count, Product product) {
		super();
		this.count = count;
		this.title = product.getTitle();
		this.img = product.getImg();
		this.price = product.getPriceShop();
		this.pid = product.getId();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public double getPrice() {
		return NumberUtil.format(price);
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
}
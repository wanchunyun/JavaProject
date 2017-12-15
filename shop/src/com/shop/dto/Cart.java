package com.shop.dto;

import com.shop.entity.Product;

/**
 * 购物车
 * @类名	Cart.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-9-17
 * @版本 V 1.0
 */
public class Cart {

	private int pid;// 产品id
	private Product product;//　产品
	private int count;// 数量
	private double price;// 价格
	
	public Cart() {
		super();
	}
	public Cart(Product product, int count) {
		super();
		this.pid = product.getId();
		this.product = product;
		this.count = count;
		this.price = product.getPriceShop();;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
}
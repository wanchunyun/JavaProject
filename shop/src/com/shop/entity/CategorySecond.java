package com.shop.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 二级分类
 * @类名	CategorySecond.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-9-14
 * @版本 V 1.0
 */
public class CategorySecond implements Serializable {

	private static final long serialVersionUID = 8153856644889800879L;
	private int id;// 主键
	private String name;// 名称
	private Category category;
	private Set<Product> products = new HashSet<Product>();
	
	public CategorySecond() {
		super();
	}
	public CategorySecond(int id) {
		super();
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
}
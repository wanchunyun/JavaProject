package com.shop.entity;

import java.io.Serializable;

import com.shop.util.NumberUtil;

public class Product implements Serializable{

	private static final long serialVersionUID = 2639857067716934889L;

	private int id;// 主键
	private String title;// 标题
	private String desc;// 描述
	private double priceMarket;// 市场价格
	private double priceShop;// 销售价格
	private boolean hot;// 是否热销
	private String img;// 图片
	private CategorySecond categorySecond;// 二级分类
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
	public double getPriceMarket() {
		return NumberUtil.format(priceMarket);
	}
	public void setPriceMarket(double priceMarket) {
		this.priceMarket = priceMarket;
	}
	public double getPriceShop() {
		return NumberUtil.format(priceShop);
	}
	public void setPriceShop(double priceShop) {
		this.priceShop = priceShop;
	}
	public CategorySecond getCategorySecond() {
		return categorySecond;
	}
	public void setCategorySecond(CategorySecond categorySecond) {
		this.categorySecond = categorySecond;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public boolean isHot() {
		return hot;
	}
	public void setHot(boolean hot) {
		this.hot = hot;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
}

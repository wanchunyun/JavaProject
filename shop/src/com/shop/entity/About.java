package com.shop.entity;

import java.io.Serializable;


/**
 * 关于我们
 * @类名	About.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-11-23
 * @版本 V 1.0
 */
public class About implements Serializable {

	private static final long serialVersionUID = -9165225869649765082L;
	private int id;// 主键
	private String name;// 名称
	private String key;// key
	private String content;// content
	
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
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
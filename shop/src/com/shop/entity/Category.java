package com.shop.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * 一级分类
 * @类名	Category.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-9-14
 * @版本 V 1.0
 */
public class Category implements Serializable{

	private static final long serialVersionUID = -9165225869649765082L;
	private int id;// 主键
	private String name;// 名称
	private Set<CategorySecond> seconds = new HashSet<CategorySecond>();
	private List<CategorySecond> secondsList = null;
	
	public Category() {
		super();
	}
	public Category(int id) {
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
	public Set<CategorySecond> getSeconds() {
		return seconds;
	}
	public void setSeconds(Set<CategorySecond> seconds) {
		this.seconds = seconds;
	}
	public String getList() {
		if (seconds.size() == 0){
			return null;
		}
		StringBuffer buffer = new StringBuffer("(");
		for (CategorySecond c : seconds) {
			buffer.append(c.getId());
			buffer.append(",");
		}
		buffer.deleteCharAt(buffer.length()-1);  
		buffer.append(")");
		return buffer.toString();
	}
	public List<CategorySecond> getSecondsList() {
		secondsList = new ArrayList<CategorySecond>();
		secondsList.addAll(seconds);
		Collections.sort(secondsList, new IdComparator());
		return secondsList;
	}
	public void setSecondsList(List<CategorySecond> secondsList) {
		this.secondsList = secondsList;
	}
	// 自定义比较器：按分类的id进行排序  
    static class IdComparator implements Comparator<CategorySecond> {  
        public int compare(CategorySecond o1, CategorySecond o2) {// 实现接口中的方法  
            return o1.getId() - o2.getId();  
        }  
    } 
}
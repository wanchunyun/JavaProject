package com.shop.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.shop.dto.DwzRender;
import com.shop.entity.Category;
import com.shop.util.StringUtil;

/**
 * 一级分类管理
 * @类名	CategoryAction.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-9-14
 * @版本 V 1.0
 */
public class CategoryAction extends BaseAction{
	private static Logger logger = Logger.getLogger(CategoryAction.class);
	private static final long serialVersionUID = 7888987779606060946L;
	private Category category;
	
	/**
	 * list
	 * @return
	 */
	public String list(){
		logger.info("-------list-------------");
		String hql = " from Category where 1=1";
		if (category != null){
			// 搜索查询
			String name = category.getName();
			if (!StringUtil.isEmpty(name)){
				hql += " and name like '%" + name + "%'";
			}
		}
		ActionContext.getContext().put("entity", category);
		ActionContext.getContext().put("entitys", baseService.findList(hql));
		ActionContext.getContext().put("url","admin/category/list.jsp");
		return "url";
	}
	
	/**
	 * 
	 * 去添加页面
	 * @return
	 */
	public String toAdd(){
		logger.info("-------toAdd-------------");
		ActionContext.getContext().put("url","admin/category/add.jsp");
		return "url";
	}
	
	/**
	 *	添加
	 * @return
	 */
	public String add(){
		logger.info("-------add-------------");
		baseService.save(category);
		DwzRender dwz = DwzRender.closeCurrentAndRefresh("main");
		return toUrl(dwz);
	}
	
	/** 
	 *	删除
	 * @return
	 */
	public String delete(){
		logger.info("-------delete-------------");
		DwzRender dwz = null;
		try {
			baseService.delete(category);
			dwz = DwzRender.closeCurrentAndRefresh("main");
		} catch (Exception e) {
			dwz = DwzRender.error("对不起，目录下还有二级目录，请先清空二级目录");
			dwz.setCallbackType("closeCurrent");
		}
		return toUrl(dwz);
	}
	
	/** 
	 *	去修改页面
	 * @return
	 */
	public String toUpdate(){
		logger.info("-------toUpdate-------------");
		ActionContext.getContext().put("entity",baseService.findById(Category.class,category.getId()));
		ActionContext.getContext().put("url","admin/category/fetch.jsp");
		return "url";
	}
	
	/**
	 *	修改  
	 * @return
	 */
	public String update(){
		logger.info("-------update-------------");
		Category entity = (Category) baseService.findById(Category.class,category.getId());
		entity.setName(category.getName());
		baseService.update(entity);
		DwzRender dwz = DwzRender.closeCurrentAndRefresh("main");
		return toUrl(dwz);
	}
	// get set -----------------------TODO--------------------------------
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}

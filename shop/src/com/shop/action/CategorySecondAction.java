package com.shop.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.shop.dto.DwzRender;
import com.shop.entity.Category;
import com.shop.entity.CategorySecond;

/**
 * 二级分类管理
 * @类名	CategorySecondAction.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-9-14
 * @版本 V 1.0
 */
public class CategorySecondAction extends BaseAction{
	private static Logger logger = Logger.getLogger(CategorySecondAction.class);
	private static final long serialVersionUID = 7888987779606060946L;
	private CategorySecond categorySecond;
	private Category category;
	private static String session_cid = "s_cid";
	
	/**
	 * list
	 * @return
	 */
	public String list(){
		logger.info("-------list-------------");
		ActionContext.getContext().put("entity", categorySecond);
		session.put(session_cid,  category.getId());
		String hql = " from CategorySecond where category.id = " + category.getId();
		ActionContext.getContext().put("entitys", baseService.findList(hql));
		ActionContext.getContext().put("url","admin/categorySecond/list.jsp");
		return "url";
	}
	
	/**
	 * 
	 * 去添加页面
	 * @return
	 */
	public String toAdd(){
		logger.info("-------toAdd-------------");
		ActionContext.getContext().put("url","admin/categorySecond/add.jsp");
		return "url";
	}
	
	/**
	 *	添加
	 * @return
	 */
	public String add(){
		logger.info("-------add-------------");
		categorySecond.setCategory(initCategory());
		baseService.save(categorySecond);
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
			baseService.delete(categorySecond);
			dwz = DwzRender.closeCurrentAndRefresh("main");
		} catch (Exception e) {
			dwz = DwzRender.error("对不起，目录下还有商品，请先清空对应商品");
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
		ActionContext.getContext().put("entity",baseService.findById(CategorySecond.class,categorySecond.getId()));
		ActionContext.getContext().put("url","admin/categorySecond/fetch.jsp");
		return "url";
	}
	
	/**
	 *	修改  
	 * @return
	 */
	public String update(){
		logger.info("-------update-------------");
		CategorySecond entity = (CategorySecond) baseService.findById(CategorySecond.class,categorySecond.getId());
		entity.setName(categorySecond.getName());
		entity.setCategory(initCategory());
		baseService.update(entity);
		DwzRender dwz = DwzRender.closeCurrentAndRefresh("main");
		return toUrl(dwz);
	}
	
	/**
	 * 组件Category
	 * @return
	 */
	private Category initCategory(){
		int cid = (Integer) session.get(session_cid);
		return new Category(cid);
	}
	// get set -----------------------TODO--------------------------------
	public CategorySecond getCategorySecond() {
		return categorySecond;
	}
	public void setCategorySecond(CategorySecond categorySecond) {
		this.categorySecond = categorySecond;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}

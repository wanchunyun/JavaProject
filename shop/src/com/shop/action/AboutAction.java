package com.shop.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.shop.dto.DwzRender;
import com.shop.entity.About;

/**
 * 关于我们管理
 * @类名	AboutAction.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-11-23
 * @版本 V 1.0
 */
public class AboutAction extends BaseAction{
	private static Logger logger = Logger.getLogger(AboutAction.class);
	private static final long serialVersionUID = 7888987779606060946L;
	private About about;
	
	/**
	 * list
	 * @return
	 */
	public String list(){
		logger.info("-------list-------------");
		String hql = " from About";
		ActionContext.getContext().put("entitys", baseService.findList(hql));
		ActionContext.getContext().put("url","admin/about/list.jsp");
		return "url";
	}
	
	/** 
	 *	去修改页面
	 * @return
	 */
	public String toUpdate(){
		logger.info("-------toUpdate-------------");
		ActionContext.getContext().put("entity",baseService.findById(About.class,about.getId()));
		ActionContext.getContext().put("url","admin/about/fetch.jsp");
		return "url";
	}
	
	/**
	 *	修改  
	 * @return
	 */
	public String update(){
		logger.info("-------update-------------");
		About entity = (About) baseService.findById(About.class,about.getId());
		entity.setContent(about.getContent());
		baseService.update(entity);
		DwzRender dwz = DwzRender.closeCurrentAndRefresh("main");
		return toUrl(dwz);
	}
	// get set -----------------------TODO--------------------------------
	public About getAbout() {
		return about;
	}

	public void setAbout(About about) {
		this.about = about;
	}
}

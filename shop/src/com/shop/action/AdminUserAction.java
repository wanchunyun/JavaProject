package com.shop.action;

import java.util.Date;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.shop.action.BaseAction;
import com.shop.dto.DwzRender;
import com.shop.entity.User;
import com.shop.util.StringUtil;

/**
 * 用户管理
 * @类名	AdminUserAction.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-9-14
 * @版本 V 1.0
 */
public class AdminUserAction extends BaseAction{
	private static Logger logger = Logger.getLogger(AdminUserAction.class);
	private static final long serialVersionUID = 7888987779606060946L;
	private User user;
	
	/**
	 * list
	 * @return
	 */
	public String list(){
		logger.info("-------list-------------");
		String hql = " from User where 1=1";
		if (user != null){
			// 搜索查询
			String username = user.getUsername();
			if (!StringUtil.isEmpty(username)){
				hql += " and username like '%" + username + "%'";
			}
		}
		hql += " order by id desc";
		ActionContext.getContext().put("entity", user);
		ActionContext.getContext().put("pager", baseService.find(hql));
		ActionContext.getContext().put("url","admin/user/list.jsp");
		return "url";
	}
	
	/**
	 * 
	 * 去添加页面
	 * @return
	 */
	public String toAdd(){
		logger.info("-------toAdd-------------");
		ActionContext.getContext().put("url","admin/user/add.jsp");
		return "url";
	}
	
	/**
	 * 检查用户名是否存在
	 * @param username
	 * @return
	 */
	private boolean checkUser(String username){
		String sql = "select count(*) from User where 1=1 and username = '" + username + "'";
		Long i = (Long) baseService.findFirst(sql);
		// 0 为可以注册
		return i == 0;
	}
	
	/**
	 *	添加
	 * @return
	 */
	public String add(){
		logger.info("-------add-------------");
		DwzRender dwz = null;
		if (checkUser(user.getUsername())){
			// 可以注册
			user.setCreateDate(new Date());
			baseService.save(user);
			dwz = DwzRender.success();
			dwz.setCallbackType("closeCurrent");
		} else {
			dwz = DwzRender.error("用户名已存在！");
		}
		return toUrl(dwz);
	}
	
	/** 
	 *	删除
	 * @return
	 */
	public String delete(){
		logger.info("-------delete-------------");
		return _delete(user);
	}
	
	/** 
	 *	去修改页面
	 * @return
	 */
	public String toUpdate(){
		logger.info("-------toUpdate-------------");
		ActionContext.getContext().put("entity",baseService.findById(User.class,user.getId()));
		ActionContext.getContext().put("url","admin/user/fetch.jsp");
		return "url";
	}
	
	/**
	 *	修改   TODO
	 * @return
	 */
	public String update(){
		logger.info("-------update-------------");
		DwzRender dwz = null;
		if (user.getOld().equals(user.getUsername()) || checkUser(user.getUsername())){
			// 可以注册
			User entity = (User) baseService.findById(User.class, user.getId());
			entity.setUsername(user.getUsername());
			entity.setPassword(user.getPassword());
			entity.setName(user.getName());
			entity.setPhone(user.getPhone());
			entity.setAddress(user.getAddress());
			baseService.update(entity);
			dwz = DwzRender.success();
			dwz.setCallbackType("closeCurrent");
		} else {
			dwz = DwzRender.error("用户名已存在！");
		}
		return toUrl(dwz);
	}
	// get set -----------------------TODO--------------------------------
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}

package com.shop.action;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.shop.action.BaseAction;
import com.shop.dto.DwzRender;
import com.shop.entity.Admin;

/**
 * 管理员管理
 * @类名	IndexAction.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-9-14
 * @版本 V 1.0
 */
public class AdminIndexAction extends BaseAction{
	private static Logger logger = Logger.getLogger(AdminIndexAction.class);
	private static final long serialVersionUID = 7888987779606060946L;
	private Admin user;
	private static String session_user = "admin";
	
	/**
	 * 用户首页
	 * @return
	 */
	public String index(){
		logger.info("-------index-------------");
		if (session.get(session_user) != null){
			ActionContext.getContext().put("url","admin/main.jsp");
		} else {
			ActionContext.getContext().put("url","admin/login.jsp");
		}
		return "url";
	}
	
	/**
	 * 用户登录
	 * @return
	 */
	public String login(){
		logger.info("-------login-------------");
		if (user != null){
			String username = user.getUsername();
			String password = user.getPassword();
			String hql = "From Admin where 1=1";
			hql += " and username = binary('" + username + "')";
			hql += " and password = binary('" + password + "')";
			user = (Admin) baseService.findFirst(hql);
			if (user != null){
				session.put(session_user, user);
			} else {
				ActionContext.getContext().put("msg","账号或密码错误！");
			}
		}
		return index();
	}
	
	/**
	 *用户退出
	 * @return
	 */
	public String logout(){
		logger.info("-------logout-------------");
		session.clear();
		ActionContext.getContext().put("url","admin/login.jsp");
		return "url";
	}
	
	/**
	 *用户详情
	 * @return
	 */
	public String info(){
		logger.info("-------info-------------");
		ActionContext.getContext().put("url","admin/info/info.jsp");
		return "url";
	}
	
	/**
	 * 去修改密码页面
	 * @return
	 */
	public String toPsw(){
		logger.info("-------toPsw-------------");
		ActionContext.getContext().put("url","admin/info/psw.jsp");
		return "url";
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	public String updatePsw(){
		logger.info("-------updatePsw-------------");
		Admin entity = (Admin) baseService.findById(Admin.class, user.getId());
		DwzRender dwz = null;
		
		if (entity.getPassword().equals(user.getUsername())){
			// 旧密码对了，可以更新
			entity.setPassword(user.getPassword());
			baseService.update(entity);
			dwz = DwzRender.success();
			dwz.setCallbackType("closeCurrent");
		} else {
			// 旧密码错误，不能更新
			dwz = DwzRender.error("旧密码错误");
		}
		ActionContext.getContext().put("msg",new Gson().toJson(dwz));
		ActionContext.getContext().put("url","admin/common/json.jsp");
		return "url";
	}
	// get set -----------------------TODO--------------------------------
	public void setUser(Admin user) {
		this.user = user;
	}
	public Admin getUser() {
		return user;
	}
}

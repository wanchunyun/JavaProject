package com.shop.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.shop.dto.DwzRender;
import com.shop.entity.Order;
import com.shop.util.StringUtil;

/**
 * 订单管理
 * @类名	OrderAction.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-9-17
 * @版本 V 1.0
 */
public class OrderAction extends BaseAction{
	private static Logger logger = Logger.getLogger(OrderAction.class);
	private static final long serialVersionUID = 7888987779606060946L;
	private Order order;
	
	/**
	 * list
	 * @return
	 */
	public String list(){
		logger.info("-------list-------------");
		String hql = " from Order where 1=1 ";
		if (order != null){
			String name = order.getName();
			if (!StringUtil.isEmpty(name)){
				hql += " and name like '%" + name + "%'";
			}
			String phone = order.getPhone();
			if (!StringUtil.isEmpty(phone)){
				hql += " and phone like '%" + phone + "%'";
			}
			String address = order.getAddress();
			if (!StringUtil.isEmpty(address)){
				hql += " and address like '%" + address + "%'";
			}
		}
		hql += " order by id desc";
		ActionContext.getContext().put("entity", order);
		ActionContext.getContext().put("pager", baseService.find(hql));
		ActionContext.getContext().put("url","admin/order/list.jsp");
		return "url";
	}
	
	/** 
	 *	去修改页面
	 * @return
	 */
	public String toUpdate(){
		logger.info("-------toUpdate-------------");
		ActionContext.getContext().put("entity",baseService.findById(Order.class,order.getId()));
		ActionContext.getContext().put("url","admin/order/fetch.jsp");
		return "url";
	}
	
	/**
	 *	修改  
	 * @return
	 */
	public String update(){
		logger.info("-------update-------------");
		Order entity = (Order) baseService.findById(Order.class,order.getId());
		entity.setName(order.getName());
		entity.setPhone(order.getPhone());
		entity.setAddress(order.getAddress());
		baseService.update(entity);
		DwzRender dwz = DwzRender.closeCurrentAndRefresh("main");
		return toUrl(dwz);
	}
	
	/** 
	 *	查看详情
	 * @return
	 */
	public String toInfo(){
		logger.info("-------toInfo-------------");
		ActionContext.getContext().put("entity",baseService.findById(Order.class,order.getId()));
		ActionContext.getContext().put("url","admin/order/info.jsp");
		return "url";
	}
	// get set -----------------------TODO--------------------------------
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
}

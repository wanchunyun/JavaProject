package com.shop.action;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.shop.dto.DwzRender;
import com.shop.entity.Product;
import com.shop.util.StringUtil;

/**
 * 产品管理
 * @类名	ProductAction.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-9-14
 * @版本 V 1.0
 */
public class ProductAction extends BaseAction{
	private static Logger logger = Logger.getLogger(ProductAction.class);
	private static final long serialVersionUID = 7888987779606060946L;
	private Product product;
	private static String session_cs = "s_cs";
	
	/**
	 * list
	 * @return
	 */
	public String toList(){
		logger.info("-------toList-------------");
		String hql = " from CategorySecond order by category.id";
		session.put(session_cs, baseService.findList(hql));
		return list();
	}
	
	/**
	 * list
	 * @return
	 */
	public String list(){
		logger.info("-------list-------------");
		String hql = " from Product where 1=1";
		if (product != null){
			// 搜索查询
			String title = product.getTitle();
			if (!StringUtil.isEmpty(title)){
				hql += " and title like '%" + title + "%'";
			}
			String desc = product.getDesc();
			if (!StringUtil.isEmpty(title)){
				hql += " and desc_ like '%" + desc + "%'";
			}
		}
		hql += " order by categorySecond.id, id desc";
		ActionContext.getContext().put("entity", product);
		ActionContext.getContext().put("pager", baseService.find(hql));
		ActionContext.getContext().put("url","admin/product/list.jsp");
		return "url";
	}
	
	/**
	 * 
	 * 去添加页面
	 * @return
	 */
	public String toAdd(){
		logger.info("-------toAdd-------------");
		ActionContext.getContext().put("url","admin/product/add.jsp");
		return "url";
	}
	
	/**
	 *	添加
	 * @return
	 */
	public String add(){
		logger.info("-------add-------------");
		String img = _upload();
		if (StringUtil.isEmpty(img)){
			img = "resources/demo.jpg";
		}
		product.setImg(img);
		baseService.save(product);
		DwzRender dwz = DwzRender.closeCurrentAndRefresh("main");
		return toUrl(dwz);
	}
	
	/** 
	 *	删除
	 * @return
	 */
	public String delete(){
		logger.info("-------delete-------------");
		baseService.delete(product);
		DwzRender dwz = DwzRender.closeCurrentAndRefresh("main");
		return toUrl(dwz);
	}
	
	/** 
	 *	去修改页面
	 * @return
	 */
	public String toUpdate(){
		logger.info("-------toUpdate-------------");
		ActionContext.getContext().put("entity",baseService.findById(Product.class,product.getId()));
		ActionContext.getContext().put("url","admin/product/fetch.jsp");
		return "url";
	}
	
	/**
	 *	修改  
	 * @return
	 */
	public String update(){
		logger.info("-------update-------------");
		Product entity = (Product) baseService.findById(Product.class,product.getId());
		String img = _upload();
		if (!StringUtil.isEmpty(img)){
			entity.setImg(img);
		}
		entity.setTitle(product.getTitle());
		entity.setDesc(product.getDesc());
		entity.setPriceMarket(product.getPriceMarket());
		entity.setPriceShop(product.getPriceShop());
		entity.setHot(product.isHot());
		entity.setCategorySecond(product.getCategorySecond());
		baseService.update(entity);
		DwzRender dwz = DwzRender.closeCurrentAndRefresh("main");
		return toUrl(dwz);
	}
	// get set -----------------------TODO--------------------------------
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}

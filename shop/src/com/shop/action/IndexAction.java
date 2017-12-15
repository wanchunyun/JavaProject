package com.shop.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.shop.dto.Cart;
import com.shop.entity.Category;
import com.shop.entity.Order;
import com.shop.entity.OrderItem;
import com.shop.entity.Product;
import com.shop.entity.User;
import com.shop.util.StringUtil;

/**
 * 用户首页
 * @类名	IndexAction.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-9-16
 * @版本 V 1.0
 */
public class IndexAction extends BaseAction{
	private static Logger logger = Logger.getLogger(IndexAction.class);
	private static final long serialVersionUID = 7888987779606060946L;
	private static String session_user = "s_user"; // 用户信息
	private static String session_cart = "s_cart"; //购物车
	private static int pageSize = 12; // 每页总数
	private User user;
	private Product product;
	private Cart cart;
	private Order order;
	private String id;
	
	/**
	 * 网站首页
	 * @return
	 */
	public String index(){
		logger.info("-------index-------------");
		initHot();
		initNew();
		ActionContext.getContext().put("url","web/index.jsp");
		return "url";
	}
	
	/**
	 * 初始化菜单
	 */
	public void menu(){
		logger.info("-------menu-------------");
		String hql = " from Category";
		session.put("s_category", baseService.findList(hql));
	}
	
	/**
	 * 初始化热门商城
	 */
	private void initHot(){
		logger.info("-------initHot-------------");
		String hql = " from Product where hot = 1 order by id desc";
		ActionContext.getContext().put("hList", baseService.find(hql));
	}
	
	/**
	 * 初始化新商品
	 */
	private void initNew(){
		logger.info("-------initNew-------------");
		String hql = " from Product order by id desc";
		ActionContext.getContext().put("nList", baseService.find(hql));
	}
	
	/**
	 * 去登陆页面
	 * @return
	 */
	public String toLogin(){
		logger.info("-------toLogin-------------");
		ActionContext.getContext().put("url","web/login.jsp");
		return "url";
	}
	
	/**
	 * 去注册页面
	 * @return
	 */
	public String toRegister(){
		logger.info("-------toRegister-------------");
		ActionContext.getContext().put("url","web/register.jsp");
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
			String hql = "From User where 1=1";
			hql += " and username = binary('" + username + "')";
			hql += " and password = binary('" + password + "')";
			User entity = (User) baseService.findFirst(hql);
			if (entity != null){
				session.put(session_user, entity);
			} else {
				ActionContext.getContext().put("entity", user);
				ActionContext.getContext().put("msg","账号或密码错误！");
				return toLogin();
			}
		}
		return index();
	}
	
	/**
	 * 用户注册
	 * @return
	 */
	public String register(){
		logger.info("-------register-------------");
		if (user != null){
			String username = user.getUsername();
			if (checkUser(username)){// 可以注册
				user.setCreateDate(new Date());
				baseService.save(user);
				ActionContext.getContext().put("msg","注册成功，请登陆！");
			} else {
				ActionContext.getContext().put("entity", user);
				ActionContext.getContext().put("msg","对不起，账号已经被占用！");
			}
		}
		return toRegister();
	}
	
	/**
	 * 检查用户名是否存在
	 * @param username
	 * @return
	 */
	private boolean checkUser(String username){
		String sql = "select count(*) from User where username = binary('" + username + "')";
		Long i = (Long) baseService.findFirst(sql);
		// 0 为可以注册
		return i == 0;
	}
	
	/**
	 *用户退出
	 * @return
	 */
	public String logout(){
		logger.info("-------logout-------------");
		session.remove(session_user);
		ActionContext.getContext().put("msg","退出成功！");
		return toLogin();
	}
	
	/**
	 * 通过id找到商品
	 * @return
	 */
	public String findByPid(){
		logger.info("-------findByPid-------------");
		ActionContext.getContext().put("entity", baseService.findById(Product.class, product.getId()));
		ActionContext.getContext().put("url","web/product.jsp");
		return "url";
	}
	
	/**
	 * 通过一级目录找到商品
	 * @return
	 */
	public String findByCid(){
		logger.info("-------findByCid-------------");
		Category category = (Category) baseService.findById(Category.class, product.getId());
		if (category != null){
			String q = category.getList();
			if (!StringUtil.isEmpty(q)){
				String hql = "from Product where categorySecond.id in " + q;
				ActionContext.getContext().put("pager", baseService.find(hql, pageSize));
			}
		}
		ActionContext.getContext().put("url_type","findByCid");
		ActionContext.getContext().put("url","web/productList.jsp");
		return "url";
	}
	
	/**
	 * 通过二级目录找到商品
	 * @return
	 */
	public String findByCsid(){
		logger.info("-------findByCsid-------------");
		String hql = "from Product where categorySecond.id = " + product.getId();
		ActionContext.getContext().put("pager", baseService.find(hql, pageSize));
		ActionContext.getContext().put("url_type", "findByCsid");
		ActionContext.getContext().put("url","web/productList.jsp");
		return "url";
	}

	/**
	 * 去购物车
	 * @return
	 */
	public String toCart(){
		ActionContext.getContext().put("url","web/cart.jsp");
		return "url";
	}
	
	/**
	 * 加入购物车
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String joinCart(){
		// 取出产品
		Product entity = (Product) baseService.findById(Product.class, cart.getPid());
		// 取出session中的购物车
		List<Cart> carts = (List<Cart>) session.get(session_cart);
		int count = cart.getCount();
		if (carts == null || carts.isEmpty()){
			carts = new ArrayList<Cart>();// 新建购物车
			carts.add(new Cart(entity, count));// 存入购物车
			session.put(session_cart, carts);
		} else {
			boolean isExist = false;
			for (Cart cart : carts) {
				if (cart.getPid() == entity.getId()){
					cart.setCount(cart.getCount() + count);
					isExist = true;
					break;
				}
			}
			if (!isExist){
				carts.add(new Cart(entity, count));// 存入购物车
			}
		}
		return toCart();
	}
	
	/**
	 * 减少购物车
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String removeCart(){
		// 取出session中的购物车
		List<Cart> carts = (List<Cart>) session.get(session_cart);
		for (Cart cart : carts) {
			if (cart.getPid() == product.getId()){
				carts.remove(cart);
				break;
			}
		}
		return toCart();
	}
	
	/**
	 * 清空购物车
	 * @return
	 */
	public String clearCart(){
		session.remove(session_cart);
		return toCart();
	}
	
	/**
	 * 查看订单
	 * @return
	 */
	public String viewOrder(){
		if (session.get(session_user) == null){
			ActionContext.getContext().put("msg","对不起，请先登陆！");
			return toLogin();
		}
		ActionContext.getContext().put("url","web/order.jsp");
		return "url";
	}
	
	/**
	 * 提交订单
	 * @return
	 */
	public String submitOrder(){
		initOrder(); // 制作订单
		baseService.save(order);// 保存订单
		session.remove(session_cart);
		ActionContext.getContext().put("msg","提交订单成功！");
		return orderList();
	}
	
	/**
	 * 生成订单号
	 * @return
	 */
	private String initNum(){
		Calendar calendar = Calendar.getInstance();
		return String.valueOf(calendar.getTimeInMillis());
	}
	
	/**
	 * 初始化订单
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private void initOrder(){
		User user = (User) session.get(session_user);
		List<Cart> carts = (List<Cart>) session.get(session_cart);
		if (user != null && carts != null && !carts.isEmpty()){
			double price = 0;
			for (Cart cart : carts) {
				OrderItem item = new OrderItem(cart.getCount(), cart.getProduct());
				item.setOrder(order);
				order.getItems().add(item);
				price += item.getCount() * item.getPrice();
			}
			order.setNum(initNum());
			order.setUid(user.getId());
			order.setPrice(price);
			order.setCreateDate(new Date());
			System.err.println(order.getItems().size());
		}
	}
	
	/**
	 * 订单列表
	 * @return
	 */
	public String orderList(){
		User user = (User) session.get(session_user);
		if (user == null){
			ActionContext.getContext().put("msg","对不起，请先登陆！");
			return toLogin();
		}
		String hql = "from Order where uid = " + user.getId() + " order by id desc";
		ActionContext.getContext().put("pager", baseService.find(hql));
		ActionContext.getContext().put("url","web/orderList.jsp");
		return "url";
	}
	
	/**
	 * 关于我们
	 * @return
	 */
	public String about(){
		String hql = "from About where key = " + id;
		ActionContext.getContext().put("entity", baseService.findFirst(hql));
		ActionContext.getContext().put("url","web/about.jsp");
		return "url";
	}
	// get set -----------------------TODO--------------------------------
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}

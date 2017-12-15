package com.shop.service;

import java.util.List;

import org.hibernate.Query;

import com.shop.dao.BaseDao;
import com.shop.dto.Pager;

/**
 * 基础服务类
 * @类名	BaseService.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-3-22
 * @版本 V 1.0
 */
public class BaseService<T> {

	private BaseDao<T> baseDao;

	public BaseDao<T> getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(BaseDao<T> baseDao) {
		this.baseDao = baseDao;
	}
	
	/**
	 * 保存
	 * @param entity
	 */
	public void save(Object entity) {
		baseDao.save(entity);
	}
	
	/**
	 * 保存或更新
	 * @param entity
	 */
	public void saveOrUpdate(Object entity) {
		baseDao.saveOrUpdate(entity);
	}
	
	/**
	 * 删除
	 * @param entity
	 */
	public void delete(Object entity) {
		baseDao.delete(entity);
	}

	/**
	 * 更新
	 * @param entity
	 */
	public void update(Object entity) {
		baseDao.update(entity);
	}
	
	/**
	 * 通过ID 查询
	 * @param c
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Object findById(Class c, int id) {
		return baseDao.findById(c, id);
	}
	
	/**
	 * 分页查询
	 * @param hql
	 * @return
	 */
	public Pager<T> find(String hql) {
		return baseDao.find(hql);
	}
	
	/**
	 * 分页查询
	 * @param hql
	 * @return
	 */
	public Pager<T> find(String hql, int pageSize) {
		return baseDao.find(hql, pageSize);
	}
	// -------------------------------------------------------
	/*
	 * 查询list
	 */
	public List<?> findList(String sql) {
		Query q = baseDao.getSession().createQuery(sql);
		return q.list();
	}
	
	/*
	 * 查询第一个
	 */
	public Object findFirst(String sql) {
		List<?> list = findList(sql);
		if (list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	
	/*
	 * 查询最后一个
	 */
	public Object findLast(String sql) {
		List<?> list = findList(sql);
		if (list != null && list.size() > 0){
			return list.get(list.size() - 1);
		}
		return null;
	}
	
	/*
	 * 随机查询
	 */
	public Object random(String sql) {
		return baseDao.random(sql);
	}
	
	/*
	 * 统计计数器
	 */
	public long findCount(String sql) {
		return baseDao.findCount(sql);
	}
}

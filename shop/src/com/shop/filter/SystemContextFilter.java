package com.shop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.shop.dto.SystemContext;

/**
 * 分页管理
 * @类名	SystemContextFilter.java
 * @作者	xyn
 * @Emial	xyn.java@foxmail.com
 * @日期 2015-3-4
 * @版本 V 1.0
 */
public class SystemContextFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		try {
			int pageOffset = 1;
			try {
				pageOffset = Integer.parseInt(request.getParameter("pageNum"));
			} catch (NumberFormatException e) {}
				SystemContext.setPageOffset(pageOffset);
				chain.doFilter(request, response);
		} finally {
		}
	}

	@Override
	public void init(FilterConfig cfg) throws ServletException {
		try {
		} catch (NumberFormatException e) {
		}
	}
}

package com.shop.dto;

/**
 * 分页计算器
 * @类名	SystemContext.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-3-17
 * @版本 V 1.0
 */
public class SystemContext {
	
	private static int pageOffset 	=1;
	private static int pageNum 	= 10;
	public static int getPageOffset() {
		return pageOffset;
	}
	public static void setPageOffset(int pageOffset) {
		SystemContext.pageOffset = pageOffset;
	}
	public static void setPageOffset(String pageOffset) {
		int i = 1;
		try {
			i = Integer.valueOf(pageOffset);
		} catch (Exception e) {
			i = 1;
		}
		SystemContext.pageOffset = i;
	}
	public static int getPageNum() {
		return pageNum;
	}
	public static void setPageNum(int pageNum) {
		SystemContext.pageNum = pageNum;
	}
}
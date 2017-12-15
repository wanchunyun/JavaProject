package com.shop.util;

import java.text.DecimalFormat;

/**
 * 数字转换
 * @类名	NumberUtil.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-9-17
 * @版本 V 1.0
 */
public class NumberUtil {

	public static double format(double num){
		DecimalFormat df = new DecimalFormat("0.00");
		return Double.valueOf(df.format(num));
	}
}

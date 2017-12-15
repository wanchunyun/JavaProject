package com.shop.util;

import javax.servlet.http.HttpServletRequest;

/**
 * StringUtil  工具类
 * @类名	StringUtil.java
 * @作者	xyn
 * @Emial	xyn.java@foxmail.com
 * @日期 2015-10-13
 * @版本 V 1.0
 */
public class StringUtil {

	public static boolean isEmpty(String str) {
        return str == null || "".equals(str.trim());
    }
	
	public static int getInt(HttpServletRequest request, String param){
        return getInt(request, param, -1);
    }
	
	public static int getInt(HttpServletRequest request, String param, int defaultVal) {
        try {
            return Integer.valueOf(getString(request, param));
        } catch(Exception ex) {
            return defaultVal;
        }
    }
	
	public static String getString(HttpServletRequest request, String param) {
        String val = request.getParameter(param);
        if (!StringUtil.isEmpty(val)) {
            val = val.trim();
        }
        return val;
    }
}

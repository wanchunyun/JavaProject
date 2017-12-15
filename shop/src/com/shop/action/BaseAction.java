package com.shop.action;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shop.dto.DwzRender;
import com.shop.service.BaseService;

/**
 * 控制层的基类
 * @类名	BaseAction.java
 * @作者	cola
 * @Emial	xyn.java@foxmail.com
 * @QQ	939313737
 * @日期 2016-6-23
 * @版本 V 1.0
 */
public class BaseAction extends ActionSupport implements SessionAware, ServletContextAware{

	private static final long serialVersionUID = 1981025827988820445L;
	protected Map<String, Object> session;
	protected BaseService<Object> baseService;
	
	// 上传才需要
	private ServletContext context; // 重要
	private File image;
	private String imageFileName;
	
	/**
	 * 文件上传
	 * @return
	 */
	public String _upload(){
		String fileName = null;
		if (image != null){
			try {
				String path = context.getRealPath("/upload");// 重要：斜杠不能少
			    // 文件扩展名
			    fileName = System.currentTimeMillis() + imageFileName.substring(imageFileName.lastIndexOf("."));// txt;
			    /*将文件上传到upload文件夹下*/
			    File savefile = new File(path, fileName);
			    FileUtils.copyFile(image, savefile);
			} catch (IOException e) {
				e.printStackTrace();
			}	
			fileName = "upload/" + fileName;
		}
		return fileName;
	}
	
	/** 
	 *	删除
	 * @return
	 */
	public String _delete(Object object){
		baseService.delete(object);
		DwzRender dwz = DwzRender.success();
		dwz.setCallbackType("closeCurrent");
		return toUrl(dwz);
	}
	
	public String toUrl(DwzRender dwz){
		ActionContext.getContext().put("msg",new Gson().toJson(dwz));
		ActionContext.getContext().put("url","admin/common/json.jsp");
		return "url";
	}
	// get set -----------------------TODO--------------------------------
	@Override
	public void setServletContext(ServletContext context) {
		this.context = context;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public BaseService<Object> getBaseService() {
		return baseService;
	}
	public void setBaseService(BaseService<Object> baseService) {
		this.baseService = baseService;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	
}

package com.xiaojie.cons;

public class Sys {
	/*静态内部类，来标志系统状态常量，方便修改*/
	public static String http="http://localhost:8080/Myjfinal";
	
	
	public static class Common{
		/*100，ajax返回成功*/
		public static Integer AJAX_SYCC=100;
		/*0，禁用*/
		public static Integer NO_USE=0;
		/*1，启用*/
		public static Integer USE=1;
		/*1，启用*/
		public static Integer PAGESIZE=10;
		  
	} 
	
	public static class Upimgs{
		/*总图片文件夹,由jfinal自动创建*/
		public static String upload="/upload";  
		
		/*单张图片大小限制,10M以内*/
		public static Integer imgsize=10*1024*1024;
		
		/*菜单图片上传路径，分文件夹*/
		public static String menuItems="/menuItems";  
		/*菜品，食物图片上传路径，分文件夹*/
		public static String foods="/foods";  
		/*菜品，食物详情里面的图片*/
		public static String fdesc="/fdesc"; 
		/*广告*/
		public static String ad="/ad"; 
		/*头像*/
		public static String face="/face"; 
		/*默认头像*/
		public static String defaultFace="/upload/face.png";
		 
	} 
}

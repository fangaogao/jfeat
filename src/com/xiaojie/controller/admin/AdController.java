package com.xiaojie.controller.admin;




 

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.upload.UploadFile;
import com.xiaojie.bean.Ad;
import com.xiaojie.cons.Sys;
import com.xiaojie.untils.DateUtils;
import com.xiaojie.untils.Pages;
import com.xiaojie.untils.UpFile;
 

public class AdController extends Controller{
	 public void list(){
		 	String sql="select * from ad where 1=1 ";
			String sqlc="select count(aid) from ad where 1=1 ";
			 
			 
			
			int pageNo=1;
			if(StringUtils.isNotBlank(this.getPara("pageNo"))){
				pageNo=Integer.parseInt(this.getPara("pageNo"));
			}
			int pageSize=Sys.Common.PAGESIZE;
			if(StringUtils.isNotBlank(this.getPara("pageSize"))){
				pageSize=Integer.parseInt(this.getPara("pageSize"));
			}
			sql+=" order by cts desc limit "+(pageNo-1)*pageSize+","+pageSize;
			 
			
			List<Ad> li=Ad.dao.find(sql);
			Long count=Db.queryLong(sqlc);
			 
			this.setAttr("li", li);
			/*用于分页*/
			this.setAttr("count", count);
			this.setAttr("pageNo", pageNo);
			this.setAttr("pageSize", pageSize);
			this.setAttr("pages", Pages.getPages(count, pageSize));
			
			/*便于参数回显*/
			 
			/*跳转页面*/
			this.render("/admin/ad_list.jsp");
	 }
	 public void toAdd(){
		 this.render("/admin/ad_add.jsp");
	 }
	 public void add(){
		 UploadFile uf=this.getFile("adimg", Sys.Upimgs.ad, Sys.Upimgs.imgsize,"UTF-8");
		 String adimg=UpFile.changeFileName(uf.getFile().getAbsolutePath(), uf.getFileName(),Sys.Upimgs.ad);
	 	 String adurl=this.getPara("adurl");
	 	 String adesc=this.getPara("adesc");
	 	 String cts=DateUtils.DateTimeToString(new Date());
	 	 Db.update("insert into ad (adurl,adimg,adesc,cts)values(?,?,?,?)",
	 			 new Object[]{adurl,adimg,adesc,cts});
	 	 list();
	 }
	
 
}

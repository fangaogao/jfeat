package com.xiaojie.controller.admin;


import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.upload.UploadFile;
import com.xiaojie.bean.MenuItems;
import com.xiaojie.cons.Sys;
import com.xiaojie.untils.DateUtils;
import com.xiaojie.untils.Pages;
import com.xiaojie.untils.UpFile;
 
 

public class MenuItemsController extends Controller{
	 
	 
	public void list(){
		String sql="select * from menuItems where 1=1 ";
		String sqlc="select count(mid) from menuItems where 1=1 ";
		 
		String mname=this.getPara("mname");
		if(StringUtils.isNotBlank(mname)){
			sql+=" and mname like '%"+mname+"%'";
			sqlc+=" and mname like '%"+mname+"%'";
		}
		
		
		int pageNo=1;
		if(StringUtils.isNotBlank(this.getPara("pageNo"))){
			pageNo=Integer.parseInt(this.getPara("pageNo"));
		}
		int pageSize=Sys.Common.PAGESIZE;
		if(StringUtils.isNotBlank(this.getPara("pageSize"))){
			pageSize=Integer.parseInt(this.getPara("pageSize"));
		}
		
		String sort=this.getPara("sort");
		if(StringUtils.isNoneBlank(sort)){
			sql+=" order by "+sort+" desc limit ";
		}else{
			sql+=" order by cts desc limit ";
		}
		sql+=(pageNo-1)*pageSize+","+pageSize;
		 
		
		List<MenuItems> li=MenuItems.dao.find(sql);
		Long count=Db.queryLong(sqlc);
		 
		this.setAttr("li", li);
		/*用于分页*/
		this.setAttr("count", count);
		this.setAttr("pageNo", pageNo);
		this.setAttr("pageSize", pageSize);
		this.setAttr("pages", Pages.getPages(count, pageSize));
		
		/*便于参数回显*/
		this.setAttr("sort", sort);
		this.setAttr("mname", mname);
		 
		/*跳转页面*/
		this.render("/admin/menuitems_list.jsp");
	}
	
	public void toAdd(){
		this.render("/admin/menuitems_add.jsp");
	}
	
	public void add() throws Exception{
		
		/*jfinal自动上传到upload文件，upload是jfinal自动创建的,不超过10M,设置编码
		  */
		UploadFile uf = this.getFile("icon", Sys.Upimgs.menuItems,Sys.Upimgs.imgsize,"UTF-8"); 
		
		/*修改文件名称，避免出现中文命名*/
		String imgp=UpFile.changeFileName(uf.getFile().getAbsolutePath(), uf.getFileName(),Sys.Upimgs.menuItems);
 	 
		/*等图片上传完毕后才可以this.getPara取到参数值
		 * */
		String mname=this.getPara("mname");
		String msort=this.getPara("msort");
		
		Db.update("insert into menuItems (mname,msort,cts,icon) values (?,?,?,?)",
				new Object[]{mname,msort,DateUtils.DateTimeToString(new Date()),imgp});
		list();
	} 
	
 
}

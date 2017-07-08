package com.xiaojie.controller.admin;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.upload.UploadFile;
import com.xiaojie.bean.MenuItems;
import com.xiaojie.bean.Unit;
import com.xiaojie.cons.Sys;
import com.xiaojie.untils.DateUtils;
import com.xiaojie.untils.Pages;
import com.xiaojie.untils.UpFile;
 
 

public class UnitController extends Controller{
	 
	 
	public void list(){
		String sql="select * from unit where 1=1 ";
		String sqlc="select count(nid) from unit where 1=1 ";
		
		/*此处拼接sql条件查询*/
		 
		 
		
		int pageNo=1;
		if(StringUtils.isNotBlank(this.getPara("pageNo"))){
			pageNo=Integer.parseInt(this.getPara("pageNo"));
		}
		int pageSize=Sys.Common.PAGESIZE;
		if(StringUtils.isNotBlank(this.getPara("pageSize"))){
			pageSize=Integer.parseInt(this.getPara("pageSize"));
		}
		 
		sql+=" order by cts desc limit "+(pageNo-1)*pageSize+","+pageSize;
		 
		List<Unit> li=Unit.dao.find(sql);
		Long count=Db.queryLong(sqlc);
		 
		this.setAttr("li", li);
		/*用于分页*/
		this.setAttr("count", count);
		this.setAttr("pageNo", pageNo);
		this.setAttr("pageSize", pageSize);
		this.setAttr("pages", Pages.getPages(count, pageSize));
		
		/*便于参数回显*/
		 
		 
		/*跳转页面*/
		this.render("/admin/unit_list.jsp"); 
	}
	
	public void toAdd(){
		this.render("/admin/unit_add.jsp");
	}
	
	public void add() throws Exception{
		String unit=this.getPara("unit");
		Db.update("insert into unit(unit,cts)values(?,?)"
				,new Object[]{unit,DateUtils.DateTimeToString(new Date())});
		list(); 
	} 
	
 
}

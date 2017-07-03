package com.xiaojie.controller.admin;



import java.util.Date;

 

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.xiaojie.bean.Cmg;
import com.xiaojie.untils.DateUtils;
 

public class CmgController extends Controller{
	 
	 
	public void login(){
		this.render("/admin/login.jsp");
	}
	
	public void loginIn(){
		String cname=this.getPara("cname");
		String pwd=this.getPara("pwd");
		Cmg cmg=Cmg.dao.findFirst("select * from cmg where cname=? and pwd=?", 
				new Object[]{cname,pwd});
		if(cmg==null){
			this.setAttr("msg", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
			this.render("/admin/login.jsp");
		}else{
			Db.update("update cmg set loginTs=? where cid=?",
					new Object[]{DateUtils.DateTimeToString(new Date()),cmg.getInt("cid")});
			this.getRequest().getSession().setAttribute("admin", cmg);
			index();
		}
	}
	
	public void index(){
		this.render("/admin/index.jsp");
	}
	
 
}

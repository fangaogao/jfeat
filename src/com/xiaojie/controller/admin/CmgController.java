package com.xiaojie.controller.admin;



import java.util.Date;

import org.apache.catalina.Session;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.xiaojie.bean.Cmg;
import com.xiaojie.cons.Sys;
import com.xiaojie.untils.DateUtils;
 

public class CmgController extends Controller{
	 
	 
	public void login(){
		this.render("/"+Sys.adminUrl+"/login.jsp");
	}
	
	public void loginIn(){
		String cname=this.getPara("cname");
		String pwd=this.getPara("pwd");
		Cmg cmg=Cmg.dao.findFirst("select * from cmg where cname=? and pwd=?", 
				new Object[]{cname,pwd});
		if(cmg==null){
			this.setAttr("msg", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
			this.render("/"+Sys.adminUrl+"/login.jsp");
		}else{
			Db.update("update cmg set loginTs=? where cid=?",
					new Object[]{DateUtils.DateTimeToString(new Date()),cmg.getInt("cid")});
			this.getRequest().getSession().setAttribute("admin", cmg);
			index();
		}
	}
	
	public void index(){
		this.render("/"+Sys.adminUrl+"/index.jsp");
	}
	
 
}

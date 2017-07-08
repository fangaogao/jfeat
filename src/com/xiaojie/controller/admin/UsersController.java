package com.xiaojie.controller.admin;



 
 
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.xiaojie.bean.Users;
import com.xiaojie.cons.Sys;
import com.xiaojie.untils.DateUtils;
import com.xiaojie.untils.Pages;
 
 

public class UsersController extends Controller{
	 
	 
	public void list(){
		String sql="select * from users where 1=1 ";
		String sqlc="select count(uid) from users where 1=1 ";
		 
		String mobile=this.getPara("mobile"); 
		String nickname=this.getPara("nickname");
		 
		if(StringUtils.isNotBlank(nickname)){
			sql+=" and nickname like '%"+nickname+"%' ";
			sqlc+=" and nickname like  '%"+nickname+"%' ";
		}
		if(StringUtils.isNotBlank(mobile)){
			sql+=" and mobile like  '%"+mobile+"%' ";
			sqlc+=" and mobile like  '%"+mobile+"%' ";
		}
		
		int pageNo=1;
		if(StringUtils.isNotBlank(this.getPara("pageNo"))){
			pageNo=Integer.parseInt(this.getPara("pageNo"));
		}
		int pageSize=Sys.Common.PAGESIZE;
		if(StringUtils.isNotBlank(this.getPara("pageSize"))){
			pageSize=Integer.parseInt(this.getPara("pageSize"));
		}
		sql+=" order by cts desc limit "+(pageNo-1)*pageSize+","+pageSize;
		 
		
		List<Users> li=Users.dao.find(sql);
		Long count=Db.queryLong(sqlc);
		 
		this.setAttr("li", li);
		/*用于分页*/
		this.setAttr("count", count);
		this.setAttr("pageNo", pageNo);
		this.setAttr("pageSize", pageSize);
		this.setAttr("pages", Pages.getPages(count, pageSize));
		
		/*便于参数回显*/
		this.setAttr("mobile", mobile);
		this.setAttr("nickname", nickname);
		/*跳转页面*/
		this.render("/admin/users_list.jsp");
	}
	public void toAdd(){
		this.render("/admin/users_add.jsp");
	}
	public void add(){
		//dao  对象只能用于查询不能用于承载数据
		String mobile=this.getPara("mobile"); 
		Users u=Users.dao.findFirst("select * from users where mobile=?", new Object[]{mobile});
		if(u==null){
			String pwd=mobile.substring(0, 6);
			String nickname=mobile.replace(mobile.substring(3, 7), "*****");
			Db.update("insert into users(pwd, nickname, cts, mobile,userfrom) values(?, ?, ?, ?,?)",
					new Object[]{pwd,nickname,DateUtils.DateTimeToString(new Date()),mobile,0});
			list();
		}else{
			this.setAttr("msg", "已经注册过");
			this.render("/admin/users_add.jsp");
		}
		
	}
	public void toUpdate(){
		//dao  对象只能用于查询不能用于承载数据
		int uid=Integer.parseInt(this.getPara("uid")); 
		Users u=Users.dao.findFirst("select * from users where uid=?", new Object[]{uid});
		if(u!=null){
			this.setAttr("users", u);
			this.render("/admin/users_update.jsp"); 
		}else{
			list();
		}
		
	}
	public void update(){
		//dao  对象只能用于查询不能用于承载数据
		int uid=Integer.parseInt(this.getPara("uid")); 
		String mobile=this.getPara("mobile"); 
		Users u=Users.dao.findFirst("select * from users where mobile=?", new Object[]{mobile});
		if(u==null||(u!=null&&uid==u.getInt("uid"))){
			Db.update("update users set mobile=? where uid=?",
					new Object[]{mobile,uid});
			list();
		}else{
			this.setAttr("msg", mobile+"已经注册");
			toUpdate(); 
		}
	}
	 
	
	public void initPwd(){
		//dao  对象只能用于查询不能用于承载数据
		String uid=this.getPara("uid"); 
		 
		Users u=Users.dao.findFirst("select * from users where uid=?", new Object[]{uid});
		if(u!=null){
			String pwd=u.getStr("mobile").substring(0,6);
			Db.update("update users set pwd=? where uid=?",
					new Object[]{pwd,uid});
		} 
		list();
	}
	
	public void changeStatus(){
		//dao  对象只能用于查询不能用于承载数据
		String uid=this.getPara("uid"); 
		 
		Users u=Users.dao.findFirst("select * from users where uid=?", new Object[]{uid});
		if(u!=null){
			Integer status=0;
			if(u.getInt("status").equals(Sys.Common.USE))
				status=Sys.Common.NO_USE;
			else 
				status=Sys.Common.USE;
			Db.update("update users set status=? where uid=?",
					new Object[]{status,uid});
		} 
		list();
	}
	
	public void useIds(){
		String ids=this.getPara("ids");
		String[] idarr=ids.split(",");
		for(String id:idarr){
			Db.update("update users set status=? where uid=?",
					new Object[]{Sys.Common.USE,id});
		}
		list();
	}
	
	public void nouseIds(){
		String ids=this.getPara("ids");
		String[] idarr=ids.split(",");
		for(String id:idarr){
			Db.update("update users set status=? where uid=?",
					new Object[]{Sys.Common.NO_USE,id});
		}
		list();
	}
	
	public void initPwdIds(){
		String ids=this.getPara("ids");
		String[] idarr=ids.split(",");
		for(String id:idarr){
			Users u=Users.dao.findFirst("select * from users where uid=?", new Object[]{id});
			if(u!=null){
				String pwd=u.getStr("mobile").substring(0,6);
				Db.update("update users set pwd=? where uid=?",
						new Object[]{pwd,id});
			}
		}
		list();
	}
 
}

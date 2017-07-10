package com.xiaojie.config;

 

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;
import com.xiaojie.Interceptor.ToLoginInterceptor;
import com.xiaojie.bean.Ad;
import com.xiaojie.bean.Cmg;
import com.xiaojie.bean.Foods;
import com.xiaojie.bean.MenuItems;
import com.xiaojie.bean.Unit;
import com.xiaojie.bean.Users;
import com.xiaojie.controller.admin.AdController;
import com.xiaojie.controller.admin.CmgController;
import com.xiaojie.controller.admin.FoodsController;
import com.xiaojie.controller.admin.MenuItemsController;
import com.xiaojie.controller.admin.UnitController;
import com.xiaojie.controller.admin.UsersController;
import com.xiaojie.controller.front.DetailController;
import com.xiaojie.controller.front.IndexController;
import com.xiaojie.controller.front.MemberController;


public class MyJfinalConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		me.setDevMode(true);
		me.setEncoding("utf-8");
		me.setViewType(ViewType.JSP);
		
		PropKit.use("config.properties");
		
	}

	@Override
	public void configRoute(Routes me) {
		/*****admin******/
		me.add("admin/cmg", CmgController.class);
		me.add("admin/users", UsersController.class);
		me.add("admin/menuitems", MenuItemsController.class);
		me.add("admin/foods", FoodsController.class);
		me.add("admin/unit", UnitController.class);
		me.add("admin/ad", AdController.class);
		
		/*****front******/
		me.add("jsp/index", IndexController.class);
		me.add("jsp/detail", DetailController.class);
		me.add("jsp/member", MemberController.class);
	}

	@Override
	public void configEngine(Engine me) {
		
	}

	@Override
	public void configPlugin(Plugins me) {
		DruidPlugin  druidPlugin = new DruidPlugin(PropKit.get("url"), PropKit.get("uname").trim(), PropKit.get("pwd").trim(), PropKit.get("driver"));
				
		me.add(druidPlugin);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);    
		arp.setShowSql(true);   
		 
		arp.addMapping("cmg",Cmg.class);//客服
		arp.addMapping("users",Users.class);//用户
		arp.addMapping("menuItems",MenuItems.class);//菜单
		arp.addMapping("foods",Foods.class);//食物
		arp.addMapping("unit",Unit.class);//单位
		arp.addMapping("ad",Ad.class);//单位
		
		//arp.setDialect(new PostgreSqlDialect());
		
		me.add(arp);
	}

	@Override
	public void configInterceptor(Interceptors me) {
	     me.add(new ToLoginInterceptor());
	}

	@Override
	public void configHandler(Handlers me) {
		me.add(new ContextPathHandler("basePath"));
	}
	
}

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
import com.xiaojie.bean.Cmg;
import com.xiaojie.cons.Sys;
import com.xiaojie.controller.admin.CmgController;
import com.xiaojie.controller.front.IndexController;


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
		/*配置controll，admin是后台，front是前台*/
		/*****admin******/
		me.add(Sys.adminUrl, CmgController.class);
		
		
		/*****front******/
		me.add(Sys.frontUrl, IndexController.class);
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
		arp.addMapping("cmg",Cmg.class);//表与实体对应
		
		//arp.setDialect(new PostgreSqlDialect());
		
		me.add(arp);
	}

	@Override
	public void configInterceptor(Interceptors me) {
	     me.add(new ToLoginInterceptor());/*admin的全局拦截器*/
	}

	@Override
	public void configHandler(Handlers me) {
		me.add(new ContextPathHandler("basePath"));
	}
	
}

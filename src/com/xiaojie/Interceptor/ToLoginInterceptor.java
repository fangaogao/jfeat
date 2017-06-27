package com.xiaojie.Interceptor;



import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.xiaojie.bean.Cmg;
import com.xiaojie.cons.Sys;

public class ToLoginInterceptor  implements Interceptor{

	@Override
	public void intercept(Invocation inv) {
		System.out.println("全局拦截器-开始-----");
		
		if(inv.getActionKey().startsWith(Sys.adminUrl)){
			if(!inv.getMethodName().equals("login")){
				Cmg cmg=inv.getController().getSessionAttr("admin") ;
				if(cmg==null){
					inv.getController().render("/admin/login.jsp");
				} 
			}
		}
		
		inv.invoke();
		System.out.println("全局拦截器-结束-----");
	}

	 
}

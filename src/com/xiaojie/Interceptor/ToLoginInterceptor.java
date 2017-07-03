package com.xiaojie.Interceptor;



import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.xiaojie.bean.Cmg;


public class ToLoginInterceptor  implements Interceptor{

	@Override
	public void intercept(Invocation inv) {
		System.out.println("ȫ��������-��ʼ-----");
		
		if(inv.getActionKey().startsWith("admin")){
			if(!inv.getMethodName().equals("login")){
				Cmg cmg=inv.getController().getSessionAttr("admin") ;
				if(cmg==null){
					inv.getController().render("/admin/login.jsp");
				} 
			}
		}
		
		inv.invoke();
		System.out.println("ȫ��������-����-----");
	}

	 
}

package com.xiaojie.Interceptor;



import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.xiaojie.bean.Cmg;


public class ToLoginInterceptor  implements Interceptor{

	@Override
	public void intercept(Invocation inv) {
		System.out.println("ȫ��������-��ʼ-----"+inv.getActionKey()+"  "+inv.getMethodName());
		if(inv.getActionKey().startsWith("/admin")){
			if(inv.getMethodName().equals("login")||inv.getMethodName().equals("loginIn")){
				System.out.println("admin not null");
				inv.invoke();
			}else{
				Cmg cmg=inv.getController().getSessionAttr("admin") ;
				if(cmg==null){
					System.out.println("admin is null");
					inv.getController().render("/admin/login.jsp");
				} else{
					inv.invoke();
				}
			}
		}else{
			inv.invoke();
		}
		
		System.out.println("ȫ��������-����-----");
	}

	 
}

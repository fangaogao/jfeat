package com.xiaojie.Interceptor;



 

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.xiaojie.bean.Cmg;


public class CharsetInterceptor  implements Interceptor{

	@Override
	public void intercept(Invocation inv) {
		System.out.println("±àÂëÀ¹½ØÆ÷-¿ªÊ¼-----");
		
		 
		try {
			inv.getController().getRequest().setCharacterEncoding("UTF-8");;
			inv.getController().getResponse().setCharacterEncoding("UTF-8");
			 
			inv.invoke();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		
		
		System.out.println("±àÂëÀ¹½ØÆ÷-½áÊø-----");
	}

	 
}

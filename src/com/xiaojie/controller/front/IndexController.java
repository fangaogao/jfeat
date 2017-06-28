package com.xiaojie.controller.front;



 


import com.jfinal.core.Controller;
 
import com.xiaojie.cons.Sys;
 
 

public class IndexController extends Controller{
	 
	 
	public void index(){
		this.render("/"+Sys.frontUrl+"/index.jsp");
	}
	
	
	
 
}

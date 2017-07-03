package com.xiaojie.untils;

 
public class Pages {
	 public static Integer getPages(Long count1,Integer pageSize1) {
		int p=new Integer(count1+"")%pageSize1;
		if(p==0)return  new Integer(count1+"")/pageSize1;
		else return new Integer(count1+"")/pageSize1+1; 
	}
	 
	 
		 
}

package com.xiaojie.controller.front;




import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.core.Controller;
import com.xiaojie.bean.Foods;
import com.xiaojie.bean.MenuItems;
import com.xiaojie.cons.Sys;

 
 
 
 

/**
 * @author gf
 *
 */
public class IndexController extends Controller{
	 
	 
	public void index(){
		getMunuAndFoods();
		this.render("/jsp/index.jsp");
	}
	/*
	 * 获取菜单和食物
	 * 返回结构list{menu,list<foods>}
	 * */
	private void getMunuAndFoods() { 
		List<MenuItems> menuli=MenuItems.dao.find("select mid,mname,icon from menuItems where status=? order by msort desc",
				new Object[]{Sys.Common.USE});
		List<Foods> foodli=Foods.dao.find("select fid,foodimg1,price,unit,fname,mid from foods where status=? and putaway=?",
				new Object[]{Sys.Common.USE,Sys.Common.USE});
		//避免循环查询，手动合并菜单
		Map<Integer, List<Foods>> foodsMap=new HashMap<Integer, List<Foods>>();
		for(int i=0;i<foodli.size();i++){
			Foods f=foodli.get(i);
			List<Foods> li=null;
			 if(foodsMap.get(f.getInt("mid"))==null){
				 li=new ArrayList<Foods>();
			 }else{
				 li=foodsMap.get(f.getInt("mid"));
			 }
			 li.add(f);
			 foodsMap.put(f.getInt("mid"), li);
		}
		List<Object> mfli=new ArrayList<Object>();
		for(int i=0;i<menuli.size();i++){
			MenuItems menu=menuli.get(i);
			if(foodsMap.get(menu.getInt("mid"))!=null){
				Map<String, Object> map=new HashMap<String, Object>(); 
				map.put("menu",menu);
				map.put("foodsli", foodsMap.get(menu.getInt("mid")));
				mfli.add(map);
			}
		}
		this.setAttr("mfli", mfli);
	}
	
	 
}
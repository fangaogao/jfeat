package com.xiaojie.controller.front;




import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.core.Controller;
import com.xiaojie.bean.Foods;
 

 
 
 
 

/**
 * @author gf
 *
 */
public class DetailController extends Controller{
	 
	 
	public void desc(){
		String fid=this.getPara("id");
		Foods foods=Foods.dao.findFirst("select * from foods where fid=?",new Object[]{fid});
		this.setAttr("foods", foods);
		this.render("/jsp/detail.jsp");
	}
	 
	
	 
}
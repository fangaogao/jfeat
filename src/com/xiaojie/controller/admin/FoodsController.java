package com.xiaojie.controller.admin;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.upload.UploadFile;
import com.xiaojie.bean.Foods;
import com.xiaojie.bean.MenuItems;
import com.xiaojie.bean.Unit;
import com.xiaojie.cons.Sys;
import com.xiaojie.untils.DateUtils;
import com.xiaojie.untils.Pages;
import com.xiaojie.untils.UpFile;
 
 

public class FoodsController extends Controller{
	 
	 
	public void list(){
		String sql="select f.*,m.mname from foods f left join menuItems m on f.mid=m.mid where 1=1 ";
		String sqlc="select count(fid) from foods where 1=1 ";
		 
		 
		
		int pageNo=1;
		if(StringUtils.isNotBlank(this.getPara("pageNo"))){
			pageNo=Integer.parseInt(this.getPara("pageNo"));
		}
		int pageSize=Sys.Common.PAGESIZE;
		if(StringUtils.isNotBlank(this.getPara("pageSize"))){
			pageSize=Integer.parseInt(this.getPara("pageSize"));
		}
		sql+=" order by f.cts desc limit "+(pageNo-1)*pageSize+","+pageSize;
		 
		
		List<Foods> li=Foods.dao.find(sql);
		Long count=Db.queryLong(sqlc);
		 
		this.setAttr("li", li);
		/*用于分页*/
		this.setAttr("count", count);
		this.setAttr("pageNo", pageNo);
		this.setAttr("pageSize", pageSize);
		this.setAttr("pages", Pages.getPages(count, pageSize));
		
		/*便于参数回显*/
		 
		/*跳转页面*/
		this.render("/admin/foods_list.jsp");
	}
	
	public void toAdd(){
		List<Unit> unitli=Unit.dao.find("select unit from unit where status=?", Sys.Common.USE);
		this.setAttr("unitli", unitli);
		List<MenuItems> menuli=MenuItems.dao.find("select mname,mid from menuItems where status=?", Sys.Common.USE);
		this.setAttr("menuli", menuli);
		this.render("/admin/foods_add.jsp");
	}
	
	public void add() throws Exception{
		/*多图片上传input name=""name不能相同，否则list没有值*/
		String foodimg1="";
		String foodimg2="";	
		String foodimg3="";	
		String foodimg4="";	
		String foodimg5="";	
		String foodimg6="";	
		String foodimg7="";
		String foodimg8="";
		List<UploadFile> ufli = this.getFiles(Sys.Upimgs.foods,8*Sys.Upimgs.imgsize,"UTF-8");
		
		for(int i=0;i<ufli.size();i++){
			UploadFile uf=ufli.get(i);
			
			/*修改文件名称，避免出现中文命名*/
			String imgp=UpFile.changeFileName(uf.getFile().getAbsolutePath(), uf.getFileName(),Sys.Upimgs.foods);
			if(uf.getParameterName().equals("foodimg1"))foodimg1=imgp;
			if(uf.getParameterName().equals("foodimg2"))foodimg2=imgp;
			if(uf.getParameterName().equals("foodimg3"))foodimg3=imgp;
			if(uf.getParameterName().equals("foodimg4"))foodimg4=imgp;
			if(uf.getParameterName().equals("foodimg5"))foodimg5=imgp;
			if(uf.getParameterName().equals("foodimg6"))foodimg6=imgp;
			if(uf.getParameterName().equals("foodimg7"))foodimg7=imgp;
			if(uf.getParameterName().equals("foodimg8"))foodimg8=imgp;
		}
		
		String fname=this.getPara("fname");
		String price=this.getPara("price");
		String unit=this.getPara("unit");
		String mid=this.getPara("mid");
		String fdesc=this.getPara("fdesc");
		String note=this.getPara("note");
		String ts=DateUtils.DateTimeToString(new Date());
		
		
		Db.update("insert into foods(foodimg1,foodimg2,foodimg3,foodimg4,foodimg5,foodimg6,foodimg7,foodimg8,fname,price,unit,mid,fdesc,note,cts,pts)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
				,new Object[]{foodimg1,foodimg2,foodimg3,foodimg4,foodimg5,foodimg6,foodimg7,foodimg8,fname,price,unit,mid,fdesc,note,ts,ts});
		list(); 
	} 
	
	/**
	 * 上传商品详情图片
	 */
	public void upFdescImg(){
		List<UploadFile> ufli = this.getFiles(Sys.Upimgs.fdesc,Sys.Upimgs.imgsize,"UTF-8");
		String imgp="";
		for(int i=0;i<ufli.size();i++){
			UploadFile uf=ufli.get(i);
			/*修改文件名称，避免出现中文命名*/
			imgp=Sys.http+UpFile.changeFileName(uf.getFile().getAbsolutePath(), uf.getFileName(),Sys.Upimgs.fdesc);
		}
		renderJson("imgp",imgp);
	}
	
 
}

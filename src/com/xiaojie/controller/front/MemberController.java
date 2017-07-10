package com.xiaojie.controller.front;


 

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.upload.UploadFile;
import com.xiaojie.cons.Sys;
import com.xiaojie.untils.UpFile;
 
 

 
 
 
 

/**
 * @author gf
 *
 */
public class MemberController extends Controller{
	 
	 
	public void upfaceimg(){
		List<UploadFile> ufli = this.getFiles(Sys.Upimgs.face,Sys.Upimgs.imgsize,"UTF-8");
		String imgp="";
		for(int i=0;i<ufli.size();i++){
			UploadFile uf=ufli.get(i);
			/*修改文件名称，避免出现中文命名*/
			imgp=UpFile.changeFileName(uf.getFile().getAbsolutePath(), uf.getFileName(),Sys.Upimgs.face);
		}
		Db.update("update users set imgface=? where uid=?",new Object[]{imgp,18});
		this.renderJson();
	}
	 
	
	 
}
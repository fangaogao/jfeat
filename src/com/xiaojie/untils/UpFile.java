package com.xiaojie.untils;

import java.io.File;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import com.xiaojie.cons.Sys;

public class UpFile {
	 
	 public static String getFileName(){   
		 return UUID.randomUUID().toString().replace("-", "").substring(0, 12);
     } 
	 
	 public static String changeFileName(String oldFilePath,String oldFileNme,String pack){
		File file = new File(oldFilePath); // 指定文件名及路径
		String oldStr = oldFileNme.substring(0,oldFileNme.lastIndexOf("."));
		String format = oldFileNme.substring(oldFileNme.lastIndexOf("."));
		String newFileName=getFileName();
		String newFilePath = oldFilePath.replace(oldStr,newFileName );
	 
		file.renameTo(new File(newFilePath)); // 改名
		return  Sys.Upimgs.upload+pack+"/"+newFileName+format;
     }    
 
	 public static void deleteFile(HttpServletRequest request,String path){   
		 String abPath= request.getRealPath("")+path;
		 File f=new File(abPath);
		 if(f.exists())f.delete();
     }  
}

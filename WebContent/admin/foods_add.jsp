<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>菜品管理</title>
<%@ include file="common.jsp"%>
<!--富文本剪辑器st-->		
<link rel="stylesheet" type="text/css" href="${ctx }/simditor-1.0.5/styles/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/simditor-1.0.5/styles/simditor.css" />
<!--富文本剪辑器end-->
<style type="text/css">
table {
	background: #ffffff;
}
</style>
</head>

<body  style="background: none;background: #ededed;">
	<div class="container-fluid">
				 
				<!-- add start -->
				<div class="info-center-title"  style="background: #ffffff;padding: 10px 10px;">
					<h4 style="border-left: 5px solid green;padding-left: 20px;font-weight: 600;">添加菜品</h4>
					<form action="${ctx}/foods/add" method="post" onsubmit="return add_sub()" enctype="multipart/form-data">
						<table style="width:60%;">
							<tr  style="height: 50px;">
								<td>菜品名称：</td>
								<td><input type="text" name="fname" class="form-control" placeholder="请输入菜品名称" required="required" maxlength="20"></td>
								<td style="color:red;">20字以内</td>
								<td colspan="2" style="text-align: center;"></td>
							</tr>
							<tr style="height: 50px;">
								<td>价格：</td>
								<td><input type="number" name="price" class="form-control" placeholder="请输入菜品价格" required="required" min="1" max="10000" step="0.01"></td>
								<td style="color:red;">10字以内</td>
								<td colspan="2" style="text-align: center;"></td>
							</tr>
							<tr style="height: 50px;">
								<td>单位：</td>
								<td>
									<select required="required" class="form-control" name="unit">
										<c:forEach  var="item" items="${unitli}" varStatus="status">
											<option value="${item.unit}">${item.unit }</option>
										</c:forEach>
									</select>
								</td>
								<td style="color:red;">*</td>
								<td colspan="2" style="text-align: center;"></td>
							</tr>
							<tr style="height: 50px;">
								<td>所属菜单：</td>
								<td>
									<select required="required" class="form-control" name="mid">
										<c:forEach  var="item" items="${menuli}" varStatus="status">
											<option value="${item.mid}">${item.mname }</option>
										</c:forEach>
									</select>
								</td>
								<td style="color:red;">*</td>
								<td colspan="2" style="text-align: center;"></td>
							</tr>
							<tr  style="height: 50px;">
								<td>备注：</td>
								<td colspan="3" ><textarea name="note" class="form-control" placeholder="请输入备注"   maxlength="128" style="margin-top:20px;height:100px;"></textarea></td>
								<td style="color:red;">128字以内，可选</td>
							</tr>
							<tr style="height: 50px;">
								<td colspan="5" style="text-align: left;">
									<p>至少上传一张图片，<span style="color:red">第一张(500*500)</span>必须上传</p>
								</td>
							</tr>
							<tr style="height: 50px;" class="imgup">
								<td style="text-align: center;">
									<img src="${ctx }/img/upf.jpg" style="width:100px;" id="firstimg">
									<input type="file" name="foodimg1"  style="display: none;" accept="image/*">
								</td>
								<td style="text-align: center;">
									<img src="${ctx }/img/upf.jpg" style="width:100px;">
									<input type="file" name="foodimg2"   style="display: none;" accept="image/*">
								</td>
								<td style="text-align: center;">
									<img src="${ctx }/img/upf.jpg" style="width:100px;">
									<input type="file" name="foodimg3"  style="display: none;" accept="image/*">
								</td>
								<td style="text-align: center;">
									<img src="${ctx }/img/upf.jpg" style="width:100px;">
									<input type="file" name="foodimg4" style="display: none;" accept="image/*">
								</td>
								<td id="firstimg_error"  style="color:red;"></td>
							</tr>
							<tr style="height: 10px;"></tr>
							<tr style="height: 50px;"  class="imgup">
								<td style="text-align: center;">
									<img src="${ctx }/img/upf.jpg" style="width:100px;">
									<input type="file" name="foodimg5"   style="display: none;" accept="image/*">
								</td>
								<td style="text-align: center;">
									<img src="${ctx }/img/upf.jpg" style="width:100px;">
									<input type="file" name="foodimg6"  style="display: none;" accept="image/*">
								</td>
								<td style="text-align: center;">
									<img src="${ctx }/img/upf.jpg" style="width:100px;">
									<input type="file" name="foodimg7"  style="display: none;" accept="image/*">
								</td>
								<td style="text-align: center;">
									<img src="${ctx }/img/upf.jpg" style="width:100px;">
									<input type="file" name="foodimg8"   style="display: none;" accept="image/*">
								</td>
								<td style="color:red;"></td>
							</tr>
							<tr style="height: 50px;">
								<td colspan="5" style="text-align: left;">
									<p style="line-height: 50px;">请输入菜品详情</p>
								</td>
							</tr>
							<tr style="height: 50px;">
								<td colspan="4" style="text-align: left;">
									<textarea name="fdesc2" id="fdesc2"></textarea>
									<textarea name="fdesc" id="fdesc" style="display:none;"></textarea>
								</td>
								<td style="color:red;">可选</td>
							</tr>
							<tr style="height: 10px;"></tr>
							 <tr style="height: 50px;">
								<td colspan="5" style="text-align: center;">
									<button class="btn btn-success" type="submit">提交</button>
									<button class="btn btn-info" type="button" onclick="javascript:history.go(-1)">返回</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<!-- add end -->
				
				 
			</div>
			<div style="margin:10px 10px;">
				<h4>说明</h4>
				<p>
					<img src="${ctx}/sayimg/foods1.jpg">
					<img src="${ctx}/sayimg/foods2.jpg">
				</p>
			</div>
	 
<!--富文本剪辑器st-->
<script type="text/javascript" src="${ctx }/simditor-1.0.5/scripts/js/module.js"></script>
<script type="text/javascript" src="${ctx }/simditor-1.0.5/scripts/js/uploader.js"></script>
<script type="text/javascript" src="${ctx }/simditor-1.0.5/scripts/js/simditor.js?t=901"></script>
<!--富文本剪辑器end-->
<script type="text/javascript">
  
$(".imgup img").click(function(){
	$(this).next().click();
});
$(".imgup img").next().change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	if (objUrl) {
		$(this).prev().attr('src',objUrl);
	} 
}); 
function getObjectURL(file) {
	var url = null ; 
	if (window.createObjectURL!=undefined) { // basic
		url = window.createObjectURL(file) ;
	} else if (window.URL!=undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file) ;
	} else if (window.webkitURL!=undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file) ;
	}
	return url ;
} 

function add_sub(){
	var d=$('#fdesc2').val();
	if($.trim(d).length>0)$('#fdesc').val(escapeHtml(d));
	
	var src=$('#firstimg').attr('src');
	if(src.indexOf('/img/upf.jpg')>-1){
		$("#firstimg_error").html('必须上传第一张图片');
		return false;
	}
}
function escapeHtml(str){
	var strArr = str.split('');  
    var htmlChar="&<>\'\"";  
    for(var i = 0; i< str.length;i++){  
        if(htmlChar.indexOf(str.charAt(i)) !=-1){  
            switch (str.charAt(i)) {                          
                case '<':  
                    strArr.splice(i,1,'&#60;');  
                    break;  
                case '>':  
                    strArr.splice(i,1,'&#62;');  
                    break;  
                case '&':  
                    strArr.splice(i,1,'&#38;'); 
                case '\'':  
                    strArr.splice(i,1,'&quot;'); 
                case '\"':  
                    strArr.splice(i,1,'&apos;'); 
            }  
        }
        
    } 
    return strArr.join('');
}
 

toolbar = [ 'title', 'bold', 'italic', 'underline', 'strikethrough',  
        	'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|',  
        	'link', 'image', 'hr', '|', 'indent', 'outdent' ];  
var editor = new Simditor({  
   	textarea : $('#fdesc2'),  
	placeholder : '这里输入内容...', 
	pasteImage: true,
	toolbarFloat:true,
	toolbar : toolbar,  //工具栏  
	defaultImage : '${ctx}/simditor-1.0.5/images/image.png', //编辑器插入图片时使用的默认图片  
	upload : {  
   		url : '${ctx}/foods/upFdescImg', //文件上传的接口地址  
   		params: {name:"fdesc"}, //键值对,指定文件上传接口的额外参数,上传的时候随文件一起提交  
   		fileKey: 'fileDataFileName', //服务器端获取文件数据的参数名  
   		connectionCount: 3,  
   		leaveConfirm: '正在上传文件'  
   	}   
}); 
</script>
</body>
</html>

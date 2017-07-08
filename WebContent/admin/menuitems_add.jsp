<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>菜单管理</title>
<%@ include file="common.jsp"%>
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
					<h4 style="border-left: 5px solid green;padding-left: 20px;font-weight: 600;">添加菜单</h4>
					<p style="color:#b3b3b3;">首页排序：由大到小</p>
					<form action="${ctx}/menuitems/add" method="post" enctype="multipart/form-data">
						<table style="width: 550px;">
							<tr  style="height: 50px;">
								<td>名称：</td>
								<td><input type="text" name="mname" class="form-control" placeholder="请输入名称" required="required" maxlength="6"></td>
								<td style="color:red;">6字以内</td>
							</tr>
							<tr  style="height: 50px;">
								<td>排序：</td>
								<td><input type="number" name="msort" value=0 class="form-control" placeholder="请输入排序" required="required"></td>
								<td style="color:red;"></td>
							</tr> 
							<tr  style="height: 50px;">
								<td>图标：</td>
								<td><input type="file" accept="image/*" name="icon"   class="form-control" placeholder="请上传图标" required="required"></td>
								<td style="color:red;">100*100</td>
							</tr> 
							<tr>
								<td colspan="2" style="text-align: center;">
									<img src="" id="upimg">
								</td>
							</tr>
							<tr style="height: 50px;">
								<td colspan="2" style="text-align: center;">
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
				<p><img src="${ctx}/sayimg/menuitems.jpg"></p>
			</div>
		
	 
</body>

<script type="text/javascript">
$("input[name=icon]").change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	if (objUrl) {
		$('#upimg').attr('src',objUrl).css("width","100px");
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

</script>
</html>

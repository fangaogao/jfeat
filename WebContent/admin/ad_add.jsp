<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>用户管理</title>
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
					<h4 style="border-left: 5px solid green;padding-left: 20px;font-weight: 600;">添加广告</h4>
					<form action="${ctx}/ad/add" method="post" enctype="multipart/form-data">
						<table style="width: 550px;">
							<tr  style="height: 50px;">
								<td>链接：</td>
								<td><input type="text" name="adurl" class="form-control" placeholder="请输入链接" maxlength="128" required="required"></td>
								<td style="color:red;">128字以内</td>
							</tr>
							<tr  style="height: 50px;">
								<td>图片：</td>
								<td><input type="file" name="adimg" class="form-control" placeholder="请上传图片"  required="required" accept="image/*" ></td>
								<td style="color:red;">650*450</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2" ><img src=""  id="img"></td>
							</tr>
							<tr  style="height: 50px;">
								<td>说明：</td>
								<td><input type="text" name="adesc" class="form-control" placeholder="请输入说明"></td>
								<td style="color:red;">可选</td>
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
				<div style="margin:10px 10px;">
					<h4>说明</h4>
					<p><img src="${ctx}/sayimg/ad.jpg"></p>
				</div>
		
				 
			</div>

	 
<script type="text/javascript">
$("input[name=adimg]").change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	if (objUrl) {
		$('#img').attr('src',objUrl).css("width","500px");
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
 
</body>
</html>

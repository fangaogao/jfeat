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
					<h4 style="border-left: 5px solid green;padding-left: 20px;font-weight: 600;">添加单位</h4>
					<form action="${ctx}/unit/add" method="post">
						<table style="width: 550px;">
							<tr  style="height: 50px;">
								<td>单位：</td>
								<td><input type="text" name="unit" class="form-control" placeholder="请输入单位" maxlength="1" required="required"></td>
								<td style="color:red;">1个字</td>
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
					<p><img src="${ctx}/sayimg/unit.jpg"></p>
				</div>
		
				 
			</div>

	 

 
</body>
</html>

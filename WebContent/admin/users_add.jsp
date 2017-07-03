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

<body bgcolor="#ffffff">
	<%@ include file="head.jsp"%>

	<div class="down-main">
		<%@ include file="left.jsp"%>

		<div class="right-product my-index right-full">
			<div class="container-fluid">
				 
				<!-- add start -->
				<div class="info-center-title"  style="background: #ffffff;padding: 10px 10px;">
					<h4 style="border-left: 5px solid green;padding-left: 20px;font-weight: 600;">添加用戶</h4>
					<p style="color:#b3b3b3;">默认密码是手机号前六位</p>
					<form action="${ctx}/users/add" method="post" onsubmit="return add_sub(this);">
						<table style="width: 550px;">
							<tr  style="height: 50px;">
								<td>手机号：</td>
								<td><input type="text" name="mobile" class="form-control" placeholder="请输入手机"></td>
								<td style="color:red;">${msg }</td>
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
		</div>
	</div>


	 

<script type="text/javascript">
  
 function add_sub(t){
	var mobile_input=$(t).find("input[name=mobile]");
    if(!(/^1[34578]\d{9}$/.test(mobile_input.val()))){ 
    	mobile_input.parent().next().html("手机号格式不对");
    	return false; 
    } 
 }
 
  
 
 
  
</script>
</body>
</html>

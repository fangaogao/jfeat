<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>后台登录</title>
	<%@ include file="common.jsp"%>
</head>
<body>

	<div class="login-form">
		<div class="top-login">
			<span><img src="${ctx}/images/group.png" alt="" /></span>
		</div>
		<h1>厨妈妈</h1>
		<div class="login-top">
			<form action="${ctx}/cmg/loginIn" method="post">
				<div class="login-ic">
					<i></i> <input type="text" value="用户" onFocus="this.value = '';"
						onBlur="if (this.value == '') {this.value = 'User name';}" name="cname"/>
					<div class="clear"></div>
				</div>
				<div class="login-ic">
					<i class="icon"></i> <input type="password" value="密码"
						onFocus="this.value = '';"
						onBlur="if (this.value == '') {this.value = 'password';}" name="pwd"/>
					<div class="clear"></div>
				</div>

				<div class="log-bwn">
					<input type="submit" value="登录">
				</div>
				<p style="color:red">${msg }</p>
			</form>
		</div>
		 
	</div>
	<!--header start here-->
</body>
</html>
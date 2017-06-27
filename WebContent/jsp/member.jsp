<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>厨房妈妈</title>
		<%@ include file="common.jsp"%>
	</head>
	<body>
		<div class="member">
			<div class="member-pic">
				<img src="images/default_photo.png" />
			</div>
			<div class="member-infor">157****8547</div>
		</div>
		<ul class="member-nav">
			<li><a href="address.jsp"><i class="am-icon-map-marker"></i><span>收货地址</span></a></li>
			<li><a href="order.jsp"><i class="am-icon-newspaper-o"></i><span>我的订单</span></a></li>
			<li><a href=""><i class="am-icon-cart-arrow-down"></i><span>购物车</span></a></li>
			<li><a href=""><i class="am-icon-bell-o"></i><span>系统通知</span></a></li>
			<li><a href=""><i class="am-icon-credit-card"></i><span>会员卡</span></a></li>
			<li><a href="yhq.jsp"><i class="am-icon-cc-mastercard"></i><span>优惠券</span></a></li>
			<li><a href=""><i class="am-icon-dollar"></i><span>积分</a></li>
		</ul>
		<ul class="member-nav mt">
			<li><a href=""><i class="am-icon-phone"></i>联系我们</a></li>
		</ul>
		<div class="h50"></div>
		<div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default footer "  id="">
		      <ul class="am-navbar-nav am-cf am-avg-sm-4">
		          <li >
		            <a href="index.jsp" class="">
		                <span class=""><img src="images/nav.png"/></span>
		                <span class="am-navbar-label">点餐</span>
		            </a>
		          </li>
		          <li>
		            <a href="speak.jsp" class="">
		                <span class=""><img src="images/nav2.png"/></span>
		                <span class="am-navbar-label">客说</span>
		            </a>
		          </li>
		          <li>
		            <a href="we.jsp" class="">
		                <span class=""><img src="images/nav3.png"/></span>
		                <span class="am-navbar-label">我们</span>
		            </a>
		          </li>
		          <li >
		            <a href="member.jsp" class="">
		                <span class=""><img src="images/nav4.png"/></span>
		                <span class="am-navbar-label">我的</span>
		            </a>
		          </li>
		   
		      </ul>
		</div>

	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>用户中心</title>
<%@ include file="common.jsp"%>
</head>

<body>

	<nav class="nav navbar-default navbar-mystyle navbar-fixed-top">
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand mystyle-brand"><span
				class="glyphicon glyphicon-home"></span></a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="li-border"><a class="mystyle-color" href="#">厨妈妈后台管理</a></li>
			</ul>

			<ul class="nav navbar-nav pull-right">
				<li class="li-border"><a href="#" class="mystyle-color"> <span
						class="glyphicon glyphicon-bell"></span> <span class="topbar-num">0</span>
				</a></li>
				<li class="li-border dropdown"><a href="#"
					class="mystyle-color" data-toggle="dropdown"> <span
						class="glyphicon glyphicon-search"></span> 搜索
				</a>
					<div class="dropdown-menu search-dropdown">
						<div class="input-group">
							<input type="text" class="form-control"> <span
								class="input-group-btn">
								<button type="button" class="btn btn-default">搜索</button>
							</span>
						</div>
					</div></li>
				<li class="dropdown li-border"><a href="#"
					class="dropdown-toggle mystyle-color" data-toggle="dropdown">${sessionScope.admin.cname }<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${ctx }/cmg/logout">退出</a></li>
					</ul></li>
				<li class="dropdown"><a href="#"
					class="dropdown-toggle mystyle-color" data-toggle="dropdown">换肤<span
						class="caret"></span></a>
					<ul class="dropdown-menu changecolor">
						<li id="blue"><a href="#">蓝色</a></li>
						<li class="divider"></li>
						<li id="green"><a href="#">绿色</a></li>
						<li class="divider"></li>
						<li id="orange"><a href="#">橙色</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<div class="down-main">
		<div class="left-main left-full">
			<div class="sidebar-fold">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</div>
			<div class="subNavBox">
				<div class="sBox">
					<div class="subNav sublist-down">
						<span class="title-icon glyphicon glyphicon-chevron-down"></span><span
							class="sublist-title">用户中心</span>
					</div>
					<ul class="navContent" style="display: block">
						<li class="active"><a href="${ctx}/users/list"><span
								class="sublist-icon glyphicon glyphicon-user"></span><span
								class="sub-title">用户管理</span></a></li>
					</ul>
				</div>
				<div class="sBox">
					<div class="subNav sublist-down">
						<span class="title-icon glyphicon glyphicon-chevron-down"></span><span
							class="sublist-title">菜品管理</span>
					</div>
					<ul class="navContent" style="display: none;">
						<li><a href="${ctx}/ad/list"><span
								class="sublist-icon glyphicon glyphicon-th-large"></span><span
								class="sub-title">广告管理</span></a></li>
						<li><a href="${ctx}/menuitems/list"><span
								class="sublist-icon glyphicon glyphicon-th-large"></span><span
								class="sub-title">菜单管理</span></a></li>
						<li><a href="${ctx}/unit/list"><span
								class="sublist-icon glyphicon glyphicon-tag"></span><span
								class="sub-title">单位管理</span></a></li>
						<li><a href="${ctx}/foods/list"><span
								class="sublist-icon glyphicon glyphicon-th"></span><span
								class="sub-title">菜品管理</span></a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="right-product my-index right-full">
			<iframe src="${ctx }/info.jsp" style="width:100%;height: 100%;border:none;"></iframe>
		</div>
	</div>
	<script type="text/javascript">
	 
$(function(){
/*换肤*/
$(".dropdown .changecolor li").click(function(){
	var style = $(this).attr("id");
    $("link[title!='']").attr("disabled","disabled"); 
	$("link[title='"+style+"']").removeAttr("disabled"); 

	$.cookie('mystyle', style, { expires: 7 }); // 存储一个带7天期限的 cookie 
})
var cookie_style = $.cookie("mystyle"); 
if(cookie_style!=null){ 
    $("link[title!='']").attr("disabled","disabled"); 
	$("link[title='"+cookie_style+"']").removeAttr("disabled"); 
} 
/*左侧导航栏显示隐藏功能*/
$(".subNav")
		.click(
				function() {
					/*显示*/
					if ($(this).find("span:first-child").attr('class') == "title-icon glyphicon glyphicon-chevron-down") {
						$(this).find("span:first-child").removeClass(
								"glyphicon-chevron-down");
						$(this).find("span:first-child").addClass(
								"glyphicon-chevron-up");
						$(this).removeClass("sublist-down");
						$(this).addClass("sublist-up");
					}
					/*隐藏*/
					else {
						$(this).find("span:first-child").removeClass(
								"glyphicon-chevron-up");
						$(this).find("span:first-child").addClass(
								"glyphicon-chevron-down");
						$(this).removeClass("sublist-up");
						$(this).addClass("sublist-down");
					}
					// 修改数字控制速度， slideUp(500)控制卷起速度
					$(this).next(".navContent").slideToggle(300).siblings(
							".navContent").slideUp(300);
				})
		/*左侧导航栏缩进功能*/
		$(".left-main .sidebar-fold").click(
		function() {

			if ($(this).parent().attr('class') == "left-main left-full") {
				$(this).parent().removeClass("left-full");
				$(this).parent().addClass("left-off");

				$(this).parent().parent().find(".right-product")
						.removeClass("right-full");
				$(this).parent().parent().find(".right-product").addClass(
						"right-off");

			} else {
				$(this).parent().removeClass("left-off");
				$(this).parent().addClass("left-full");

				$(this).parent().parent().find(".right-product")
						.removeClass("right-off");
				$(this).parent().parent().find(".right-product").addClass(
						"right-full");

			}
		})
	/*左侧鼠标移入提示功能*/
	$(".sBox ul li").mouseenter(function() {
		if ($(this).find("span:last-child").css("display") == "none") {
			$(this).find("div").show();
		}
	}).mouseleave(function() {
		$(this).find("div").hide();
	})
	
	/*左侧菜单点击修改iframe*/
	$(".sBox ul li a").click(function() {
		$("iframe").attr("src",$(this).attr('href'));
		$(".sBox ul li").removeClass("active");
		$(this).parent().addClass("active");
		return false;
	});
 
})
</script>
</body>
</html>

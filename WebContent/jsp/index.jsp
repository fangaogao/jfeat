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
		<div data-am-widget="slider" class="am-slider am-slider-default" data-am-slider='{}' >
			  <ul class="am-slides">
			      <li><img src="${ctx}/images/banner.jpg"> </li>
			      <li><img src="${ctx}/images/banner1.jpg"> </li>
			  </ul> 
		</div>
		<a href="${ctx}/search.jsp" class="search" style="top:180px;">
			开启你的美食之旅...
		</a>
		<ul class="nav">
			<c:forEach var="item" items="${mfli}" varStatus="status">
			 	<li>
					<a href="${ctx}/search.jsp">
						<img src="${imgctx}${item.menu.icon}" />
						<p>${item.menu.mname }</p>
					</a>
				</li>
			</c:forEach>
		</ul>
	<c:forEach var="item" items="${mfli}" varStatus="status">
		 
		<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default title" >
		    <h2 class="am-titlebar-title ">${item.menu.mname }</h2>
		    <nav class="am-titlebar-nav">
		        <a href="#more" class=""></a>
		    </nav>
		</div>
	    <ul data-am-widget="gallery" class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery-default product">
		     <c:forEach var="fitem" items="${item.foodsli}" varStatus="status">
		      <li>
		        <div class="am-gallery-item">
		            <a href="${ctx}/detail.jsp" class="">
		              <img src="${imgctx}${fitem.foodimg1}"  alt=""/>
		              <h3 class="am-gallery-title">${fitem.fname }</h3>
		              <div class="am-gallery-desc">
		              	<em>￥${fitem.price}/${fitem.unit}</em><i class="am-icon-cart-plus"></i>
		              </div>
		            </a>
		        </div>
		      </li>
		     </c:forEach>
		 </ul>	
	</c:forEach>
		
		 <div class="h50"></div>
		<div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default footer "  id="">
		      <ul class="am-navbar-nav am-cf am-avg-sm-4">
		          <li >
		            <a href="${ctx}/index.jsp" class="">
		                <span class=""><img src="${ctx}/images/nav.png"/></span>
		                <span class="am-navbar-label">点餐</span>
		            </a>
		          </li>
		          <li>
		            <a href="${ctx}/speak.jsp" class="">
		                <span class=""><img src="${ctx}/images/nav2.png"/></span>
		                <span class="am-navbar-label">客说</span>
		            </a>
		          </li>
		          <li>
		            <a href="${ctx}/we.jsp" class="">
		                <span class=""><img src="${ctx}/images/nav3.png"/></span>
		                <span class="am-navbar-label">我们</span>
		            </a>
		          </li>
		          <li >
		            <a href="${ctx}/member.jsp" class="">
		                <span class=""><img src="${ctx}/images/nav4.png"/></span>
		                <span class="am-navbar-label">我的</span>
		            </a>
		          </li>
		   
		      </ul>
		</div>

	</body>
</html>

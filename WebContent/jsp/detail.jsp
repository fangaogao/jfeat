<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>厨房妈妈</title>
		<%@ include file="common.jsp"%>
		<style type="text/css">
		a{color:black;}
		</style>
	</head>
	<body>
		<a style="position: absolute;z-index: 20;margin: 10px 10px;" onclick="javascript:history.go(-1);"><img src="${ctx }/images/pre.png" style="width:28px;"></a>
		<div data-am-widget="slider" class="am-slider am-slider-default" >
			  <ul class="am-slides">
			  	 <c:if test="${ not empty  foods.foodimg1}">
			  	 	<li><img src="${imgctx }${foods.foodimg1}"> </li>
			  	 </c:if>
			     <c:if test="${ not empty  foods.foodimg2}">
			  	 	<li><img src="${imgctx }${foods.foodimg2}"> </li>
			  	 </c:if>
			  	 <c:if test="${ not empty  foods.foodimg3}">
			  	 	<li><img src="${imgctx }${foods.foodimg3}"> </li>
			  	 </c:if>
			  	 <c:if test="${ not empty  foods.foodimg4}">
			  	 	<li><img src="${imgctx }${foods.foodimg4}"> </li>
			  	 </c:if>
			  	 <c:if test="${ not empty  foods.foodimg5}">
			  	 	<li><img src="${imgctx }${foods.foodimg5}"> </li>
			  	 </c:if>
			  	 <c:if test="${ not empty  foods.foodimg6}">
			  	 	<li><img src="${imgctx }${foods.foodimg6}"> </li>
			  	 </c:if>
			  	 <c:if test="${ not empty  foods.foodimg7}">
			  	 	<li><img src="${imgctx }${foods.foodimg7}"> </li>
			  	 </c:if>
			  	 <c:if test="${ not empty  foods.foodimg8}">
			  	 	<li><img src="${imgctx }${foods.foodimg8}"> </li>
			  	 </c:if> 
			      
			  </ul> 
		</div>
		<div class="detail">
			<h2>${foods.fname }</h2>
			<div class="price">
				<b>￥${foods.price }/${foods.unit }</b><span>（积分可抵扣5元）</span>
			</div>
			<div class="kucun">
				<p>库存：1000</p>
				<p>运费：免运费</p>
			</div>
		</div>
		<div class="comment">
			<h2>宝贝评价（0）</h2>
			<ul>
				<li><a hhref="">有图（0）</a></li>
				<li><a hhref="">好评（0）</a></li>
				<li><a hhref="">中评（0）</a></li>
				<li><a hhref="">差评（0）</a></li>
			</ul>
		</div>
        <div class="detail-con" id="detail-con" data-fdesc='${foods.fdesc}'>
        </div>
		<div class="h50"></div>
		<ul class="fixed-btn" style="bottom:-10px;">
			<li ><a href="" class="current">立即购买</a></li>
			<li><a href="javascript:;">加入购物车</a></li>
		</ul>
		
	</body>
	
	<script type="text/javascript">
	var fdesc=$('#detail-con').attr('data-fdesc');
	if($.trim(fdesc).length>0){
		$('#detail-con').html(fdesc);
	}
	
	 
	</script>
	
</html>

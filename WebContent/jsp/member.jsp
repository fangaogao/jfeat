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
	<section>
		<div class="member">
			<div class="member-pic">
				<img src="${imgctx }/upload/face.png" id="imgface" style="border-radius:50%;"/>
				<input type="file" id="upfileface" accept="image/*" style="display: none;">
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
	</section>	
	 <div id="img_box" style="position:absolute;top:0;width:100%;display:none;left:0px;height:100%;background: black;">
		<div id="clipArea" style="height: 300px;"></div>
	 </div>
	  <a id="img_box_cancle"  style="position:absolute;top:310px;left:10px;display: none;color:#ffffff;">取消</a>
	 <a id="img_box_btn"  style="position:absolute;top:310px;right:10px;display: none;color:#ffffff;">确定上传</a>
	
	
	</body>
	
<!--剪裁图片st-->
<script src="${ctx }/js/iscroll-zoom.js"></script>
<script src="${ctx }/js/hammer.js"></script>
<script src="${ctx }/js/lrz.all.bundle.js"></script>
<script src="${ctx }/js/jquery.photoClip.js"></script>
<!--剪裁图片end-->

<script type="text/javascript">
$("#imgface").click(function(){
	$("#upfileface").click();
});
$("#upfileface").change(function(){
    var objUrl=getObjectURL(this.files[0])
    if(objUrl){
        $(window).scrollTop(0); 
        $("#img_screen").show();              
        $("#img_box").show();              
        $("#img_box_btn").show();
        $("#img_box_cancle").show();
        $("#img_box_body").css("height","350px");
        var M=parseInt(this.files[0].size/1024000);
    	if(M>1)layer.open({content:'您的图片超过了'+M+'M，正在读取...',skin: 'msg',time:2});
    }
})


var clipArea = new bjj.PhotoClip("#clipArea", {
	size: [250, 250],
	file: "#upfileface",	    
	ok: "#img_box_btn",	   
    clipFinish: function(dataURL) {
    	$("section").show();      
    	$("#img_screen").hide();              
    	$("#img_box").hide();              
        $("#img_box_btn").hide();
        $("#img_box_cancle").hide();
    	$("#imgface").attr("src",dataURL);
    	uploadImg(dataURL);
	}
})

function uploadImg(base64){
	layer.open({content:'头像上传中，请勿关闭页面',skin: 'msg',time:2}); 
	var form = document.createElement("form");        
    var formData = new FormData(form);  
	formData.append("file",convertBase64UrlToBlob(base64),"1.jpg");
	formData.append("name","imgface");
	 $.ajax({//提交表单，异步上传图片  
        url : "${ctx}/member/upfaceimg",  
        type : "POST",  
        data : formData,  
        dataType:"json",  
        processData : false,  
        contentType : false,  
        success:function(data){
	    	layer.open({content:'头像上传成功了',skin: 'msg',time:2}); 
	    },
	    error:function(){
	    	layer.open({content:'头像上传失败，请重试！',skin: 'msg',time:2}); 
	    }   
    });  
}
 
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
function convertBase64UrlToBlob(urlData){  
    var bytes=window.atob(urlData.split(',')[1]);        //去掉url的头，并转换为byte  
    //处理异常,将ascii码小于0的转换为大于0  
    var ab = new ArrayBuffer(bytes.length);  
    var ia = new Uint8Array(ab);  
    for (var i = 0; i < bytes.length; i++) {  
        ia[i] = bytes.charCodeAt(i);  
    }  
    return new Blob( [ab] , {type : 'image/png'});  
}
</script>
</html>

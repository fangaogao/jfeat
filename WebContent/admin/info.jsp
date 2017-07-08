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
	   <div class="info-center">
       
       <!---title----->
            <div class="info-title">
              <div class="pull-left">
                <h4><strong>${sessionScope.admin.cname}</strong></h4>
                <p>登录时间：${sessionScope.admin.loginTs}</p>
              </div>
              <div class="time-title pull-right">
                  <div class="year-month pull-left">
                    <p id="week">星期X</p>
                    <p id="date"><span>XXXX</span>年xx月xx日</p>
                  </div>
                  <div class="hour-minute pull-right">
                     <strong id="time">x:xx:xx</strong>
                  </div>
              </div>
              <div class="clearfix"></div>
            </div>
           <!----content-list----> 
            <div class="content-list">
               <div class="row">
                 <div class="col-md-3">
                    <div class="content">
                       <div class="w30 left-icon pull-left">
                          <span class="glyphicon glyphicon-file blue"></span>
                       </div>
                       <div class="w70 right-title pull-right">
                       <div class="title-content">
                           <p>待送货订单</p>
                           <h3 class="number">90</h3>
                           <button class="btn btn-default">待送货<span style="color:red;">12</span></button>
                       </div>
                       </div>
                       <div class="clearfix"></div>
                    </div>
                 </div>
                  <div class="col-md-3">
                    <div class="content">
                       <div class="w30 left-icon pull-left">
                          <span class="glyphicon glyphicon-file violet"></span>
                       </div>
                       <div class="w70 right-title pull-right">
                       <div class="title-content">
                           <p>待退款订单</p>
                           <h3 class="number">90</h3>
                           <button class="btn btn-default">待退款<span style="color:red;">12</span></button>
                       </div>
                       </div>
                       <div class="clearfix"></div>
                    </div>
                 </div>
                  <div class="col-md-3">
                    <div class="content">
                       <div class="w30 left-icon pull-left">
                          <span class="glyphicon glyphicon-file orange"></span>
                       </div>
                       <div class="w70 right-title pull-right">
                       <div class="title-content">
                           <p>已退款订单</p>
                           <h3 class="number">90</h3>
                           <button class="btn btn-default">全部订单<span style="color:red;">12</span></button>
                       </div>
                       </div>
                       <div class="clearfix"></div>
                    </div>
                 </div>
                  <div class="col-md-3">
                    <div class="content">
                       <div class="w30 left-icon pull-left">
                          <span class="glyphicon glyphicon-file green"></span>
                       </div>
                       <div class="w70 right-title pull-right">
                       <div class="title-content">
                           <p>全部订单</p>
                           <h3 class="number">90</h3>
                           <button class="btn btn-default">待我处理<span style="color:red;">12</span></button>
                       </div>
                       </div>
                       <div class="clearfix"></div>
                    </div>
                 </div>
               </div>
               <!-------信息列表------->
               <div class="row newslist" style="margin-top:20px;">
                 <div class="col-md-12">
                   <div class="panel panel-default">
                      <div class="panel-heading">
                       		代发货订单<div class="caret"></div>
                       <a href="#" class="pull-right"><span class="glyphicon glyphicon-refresh"></span></a>
                      </div>     
                      <div class="panel-body">
                           <div class="w15 pull-left">
                             <img src="img/noavatar_middle.gif" width="25" height="25" alt="图片" class="img-circle">
                            	 安妮
                           </div>
                           <div class="w40 pull-left">鸡腿，可乐</div>
                            <div class="w20 pull-left">不要辣的</div>
                             <div class="w5 pull-left">10元</div>
                           <div class="w10 pull-left text-center">11:29</div>
                          <div class="w10 pull-left text-center"><span class="text-green-main">待发货</span></div>
                      </div>
                      
                      <div class="panel-body text-center">
                          <a href="#" style="color:#5297d6;">查看全部</a>
                      </div>
                      
                    </div>
                 </div>
                 
                  
               </div>
            </div>
            
       </div>			
	 </div>


<script type="text/javascript">
/*****js获取当前时间******/
  var myDate = new Date();
  $("#date").html('<span>'+myDate.getFullYear()+'</span>年'+(parseInt(myDate.getMonth())+1)+'月'+myDate.getDate()+'日');
  var week=["天","一","二","三","四","五","六"];
  $("#week").html("星期"+week[myDate.getDay()]);
  
  setInterval(function(){
	  var myDate = new Date();
	  var h=myDate.getHours(); //获取当前小时数(0-23)
	  if(h<10)h="0"+h;
	  var m=myDate.getMinutes(); //获取当前分钟数(0-59)
	  if(m<10)m="0"+m;
	  var s=myDate.getSeconds(); //获取当前秒数(0-59) 
	  if(s<10)s="0"+s;
	  $("#time").text(h+":"+m+":"+s);
  }, 1000);
</script>
</body>
</html>

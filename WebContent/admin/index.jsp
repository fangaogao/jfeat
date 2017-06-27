<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>用户中心</title>
	<%@ include file="common.jsp"%>
</head>

<body>
<%@ include file="head.jsp"%>
<div class="down-main">
  <%@ include file="left.jsp"%>
  <div class="right-product my-index right-full">
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
                           <p>全部订单</p>
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
                           <p>待办事项</p>
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
                 <div class="col-md-8">
                   <div class="panel panel-default">
                      <div class="panel-heading">
                       我的事务<div class="caret"></div>
                       <a href="#" class="pull-right"><span class="glyphicon glyphicon-refresh"></span></a>
                      </div>     
                      <div class="panel-body">
                           <div class="w15 pull-left">
                             <img src="img/noavatar_middle.gif" width="25" height="25" alt="图片" class="img-circle">
                             安妮
                           </div>
                           <div class="w55 pull-left">系统需要升级</div>
                           <div class="w20 pull-left text-center">2016年8月23日</div>
                          <div class="w10 pull-left text-center"><span class="text-green-main">处理中</span></div>
                      </div>
                      
                      <div class="panel-body">
                           <div class="w15 pull-left">
                             <img src="img/noavatar_middle.gif" width="25" height="25" alt="图片" class="img-circle">
                             安妮
                           </div>
                           <div class="w55 pull-left">系统需要升级</div>
                           <div class="w20 pull-left text-center">2016年8月23日</div>
                          <div class="w10 pull-left text-center"><span class="text-green-main">处理中</span></div>
                      </div>
                      
                      <div class="panel-body">
                           <div class="w15 pull-left">
                             <img src="img/noavatar_middle.gif" width="25" height="25" alt="图片" class="img-circle">
                             安妮
                           </div>
                           <div class="w55 pull-left">系统需要升级</div>
                           <div class="w20 pull-left text-center">2016年8月23日</div>
                           <div class="w10 pull-left text-center"><span class="text-gray">已关闭</span></div>
                      </div>
                      
                      <div class="panel-body">
                           <div class="w15 pull-left">
                             <img src="img/noavatar_middle.gif" width="25" height="25" alt="图片" class="img-circle">
                             安妮
                           </div>
                           <div class="w55 pull-left">系统需要升级</div>
                           <div class="w20 pull-left text-center">2016年8月23日</div>
                           <div class="w10 pull-left text-center"><span>处理中</span></div>
                      </div>
                      <div class="panel-body">
                           <div class="w15 pull-left">
                             <img src="img/noavatar_middle.gif" width="25" height="25" alt="图片" class="img-circle">
                             安妮
                           </div>
                           <div class="w55 pull-left">系统需要升级</div>
                           <div class="w20 pull-left text-center">2016年8月23日</div>
                           <div class="w10 pull-left text-center"><span>处理中</span></div>
                      </div>
                      <div class="panel-body">
                           <div class="w15 pull-left">
                             <img src="img/noavatar_middle.gif" width="25" height="25" alt="图片" class="img-circle">
                             安妮
                           </div>
                           <div class="w55 pull-left">系统需要升级</div>
                           <div class="w20 pull-left text-center">2016年8月23日</div>
                           <div class="w10 pull-left text-center"><span>处理中</span></div>
                      </div>
                      
                      <div class="panel-body text-center">
                          <a href="#" style="color:#5297d6;">查看全部</a>
                      </div>
                      
                    </div>
                 </div>
                 
                 <div class="col-md-4">
                     <div class="panel panel-default">
                      <div class="panel-heading">
                       我的事务统计
                       <a href="#" class="pull-right"><span class="glyphicon glyphicon-refresh"></span></a>
                      </div>     
                      <div class="panel-body">
                          
                      </div>
                    </div>
                    
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
	  console.log(s);
  }, 1000)
</script>
</body>
</html>

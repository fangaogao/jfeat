<div class="left-main left-full">
    <div class="sidebar-fold"><span class="glyphicon glyphicon-menu-hamburger"></span></div>
    <div class="subNavBox">
      <div class="sBox">
       <div class="subNav sublist-down"><span class="title-icon glyphicon glyphicon-chevron-down"></span><span class="sublist-title">用户中心</span>
        </div>
        <ul class="navContent" style="display:block">
          <li class="active">
            <div class="showtitle" style="width:100px;"><img src="img/leftimg.png" />账号管理</div>
            <a href="${ctx}/users/list"><span class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">用户管理</span></a> </li>
          <li>
            <div class="showtitle" style="width:100px;"><img src="img/leftimg.png" />消息中心</div>
            <a href="message.html"><span class="sublist-icon glyphicon glyphicon-envelope"></span><span class="sub-title">消息中心</span></a> </li>
          <li>
            <div class="showtitle" style="width:100px;"><img src="img/leftimg.png" />短信</div>
            <a href="smsInfo.html"><span class="sublist-icon glyphicon glyphicon-bullhorn"></span><span class="sub-title">短信</span></a></li>
          <li>
            <div class="showtitle" style="width:100px;"><img src="img/leftimg.png" />实名认证</div>
            <a href="identify.html"><span class="sublist-icon glyphicon glyphicon-credit-card"></span><span class="sub-title">实名认证</span></a></li>
        </ul>
      </div>
      <div class="sBox">
        <div class="subNav sublist-up"><span class="title-icon glyphicon glyphicon-chevron-up"></span><span class="sublist-title">关于我们</span></div>
        <ul class="navContent" style="display:none">
          <li>
            <div class="showtitle" style="width:100px;"><img src="img/leftimg.png" />添加新闻</div>
            <a href="#"><span class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">添加新闻</span></a></li>
          <li>
            <div class="showtitle" style="width:100px;"><img src="img/leftimg.png" />添加新闻</div>
            <a href="#"><span class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">新闻管理</span></a></li>
          <li>
            <div class="showtitle" style="width:100px;"><img src="img/leftimg.png" />添加新闻</div>
            <a href="#"><span class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">添加新闻</span></a></li>
          <li>
            <div class="showtitle" style="width:100px;"><img src="img/leftimg.png" />新闻管理</div>
            <a href="#"><span class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">新闻管理</span></a></li>
        </ul>
      </div>
    </div>
  </div>
 <script type="text/javascript"> 
  /*左侧导航栏显示隐藏功能*/
$(".subNav").click(function(){				
			/*显示*/
			if($(this).find("span:first-child").attr('class')=="title-icon glyphicon glyphicon-chevron-down")
			{
				$(this).find("span:first-child").removeClass("glyphicon-chevron-down");
			    $(this).find("span:first-child").addClass("glyphicon-chevron-up");
			    $(this).removeClass("sublist-down");
				$(this).addClass("sublist-up");
			}
			/*隐藏*/
			else
			{
				$(this).find("span:first-child").removeClass("glyphicon-chevron-up");
				$(this).find("span:first-child").addClass("glyphicon-chevron-down");
				$(this).removeClass("sublist-up");
				$(this).addClass("sublist-down");
			}	
		// 修改数字控制速度， slideUp(500)控制卷起速度
	    $(this).next(".navContent").slideToggle(300).siblings(".navContent").slideUp(300);
	})
/*左侧导航栏缩进功能*/
$(".left-main .sidebar-fold").click(function(){

	if($(this).parent().attr('class')=="left-main left-full")
	{
		$(this).parent().removeClass("left-full");
		$(this).parent().addClass("left-off");
		
		$(this).parent().parent().find(".right-product").removeClass("right-full");
		$(this).parent().parent().find(".right-product").addClass("right-off");
		
		}
	else
	{
		$(this).parent().removeClass("left-off");
		$(this).parent().addClass("left-full");
		
		$(this).parent().parent().find(".right-product").removeClass("right-off");
		$(this).parent().parent().find(".right-product").addClass("right-full");
		
		}
	})	
	/*左侧鼠标移入提示功能*/
		$(".sBox ul li").mouseenter(function(){
			if($(this).find("span:last-child").css("display")=="none")
			{$(this).find("div").show();}
			}).mouseleave(function(){$(this).find("div").hide();})	

	</script>
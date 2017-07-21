
	if(canUse3D)$("#rightmenuIcon").css({"animation":"rightmenuIcon_comein 3s","animation-fill-mode":"forwards"});
	setTimeout(function(){
		if(canUse3D)$("#leftQQ").css({"animation":"QQhide 1s","animation-fill-mode":"forwards"});
		else $("#leftQQ").hide();
	},3000);
	var windowW=$(window).width();
	var windowH=$(window).height();
	
	$("#rightmenuIcon_back").click(function(e){
		var right=$("#rightmenuIcon").css("right");
		if(canUse3D){		
			if(right=="0px")$("#rightmenuIcon").css({"animation":"rightmenuIcon_hide 1s","animation-fill-mode":"forwards"});
			else $("#rightmenuIcon").css({"animation":"rightmenuIcon_show 1s","animation-fill-mode":"forwards"});
	    }else{  
	        if(right=="0px")$("#rightmenuIcon").hide(); 
	       else $("#rightmenuIcon").show(); 
	    }  
	});
	$("#QQimg").click(function(event){
		event.preventDefault();
		event.stopPropagation();
		var left=$("#leftQQ").css("left");
		if(canUse3D){		
			if(left=="0px")$("#leftQQ").css({"animation":"QQhide 1s","animation-fill-mode":"forwards"});
			else $("#leftQQ").css({"animation":"QQshow 1s","animation-fill-mode":"forwards"});
	    }else{  
	        if(left=="0px")$("#leftQQ").hide(); 
	       else $("#leftQQ").show(); 
	    }  
	});
	$("#wentiList").on("click",".daiding",function(event){
		if(!notgohome()){tip("请登录！");return;}
		daiding(this,event);
	});
	
	$("#wentixq_daiding").click(function(event){
		if(!notgohome()){tip("请登录！");return;}
		daiding(this,event);
	});
	function daiding(obj,event){
		if($(obj).hasClass('sel'))return;
		var source="userId"+sessionStorage.userId;
		var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
		ajax({method:"answer_or_car",
			qid:$(obj).attr('data-id'),
			type:0,
			userId:sessionStorage.userId,
			source:source,
			sign:sign,
			tokenId:sessionStorage.tokenId},null,{event:event,obj:obj}); 
	}
	
	$("#wentiList").on("click",".seedesc",function(event){
		var obj=JSON.parse($(this).attr("data-msg"));
		$('#myModal_wentixq').modal('show');
		$('#wentixq_faceurl').attr('src',obj.faceUrl);
		$('#wentixq_nickname').text(obj.nickname);
		$('#wentixq_paytime').text(obj.pay_time); 
		$('#wentixq_credit').text("信用:"+obj.credit); 
		$('#wentixq_awardmoney').text("赏 ￥"+obj.award_money); 
		if(obj.solve_status==0){
			$('#wentixq_solvestatus').text("未解决").addClass('statusc0'); 
		}else{
			$('#wentixq_solvestatus').text("已完成").addClass('statusc1'); 
			$('#wentixq_answer').hide();
			$('#wentixq_daiding').hide();
		}
		$('#wentixq_assort').text("分类："+obj.assort); 
		$('#wentixq_title').text(obj.title); 
		$('#wentixq_content').html(obj.content);
		$('#wentixq_content img').addClass("img-responsive");
		$("#wentixq_daiding").attr('data-id',obj.id).removeClass('sel').text("待定");
		$("#wentixq_answer").attr('data-desc',$(this).attr("data-msg"));
		$(this).addClass("sel").text("已查看");
	});
	
	
	getQusetionList(1);
	$("#more").click(function(){
		var page=$(this).attr("data-p");
		getQusetionList(page,0);
	});
	$("#index_footer").on('click','li a',function(){
		var page=$(this).attr("data-p");
		if(parseInt(page)>0)getQusetionList(page,1);
		return false;
	});
	function getQusetionList(page,type){
		$("#more").text("加载中...稍等哦");
		var obj={
				method:"question_list",
				solve_status:sessionStorage.solve_status,
				cid:sessionStorage.first_category_me,
				sort:sessionStorage.sort,
				pageNo:page,
				pageSize:10
		};
		ajax(obj,null,type);
	}
	$('#index_a').click(function(){
		if($('#index_footer').is(":hidden")){
			$('#index_footer').show();
			$(this).text(">>隐藏分页");
		}else{
			$('#index_footer').hide();
			$(this).text("<<显示分页");
		}
		return false;
	});
	$("#index_qustion_search").click(function(){
		sessionStorage.sort=$("#sort_index").find("option:selected").attr("data-t");
		sessionStorage.solve_status=$("#solve_index").find("option:selected").attr("data-s");
		getQusetionList(1);
	});
	
	index_qustion_search();
	function index_qustion_search(){
		if(notblank(sessionStorage.sort))
			$("#sort_index").find("option[data-t='"+sessionStorage.sort+"']").attr("selected",true);
		if(notblank(sessionStorage.sort))
			$("#solve_index").find("option[data-s="+sessionStorage.solve_status+"]").attr("selected",true);		
	}
	
	
	if(notblank(sessionStorage.ad_list)){
		var list=JSON.parse(sessionStorage.ad_list);
		paint_ad_list(list);
	}else{
		ajax({method:"ad_list"});
	}
	
	if(notblank(sessionStorage.ranking_list)){
		var list=JSON.parse(sessionStorage.ranking_list);
		paint_ranking_list(list)
	}else{
		ajax({method:"ranking_list"});
	}
	
	$('#wentiList').on('click','.answer_right_now',function(){
		anwerRightNow($(this)); 
	});
	
	$("#wentixq_answer").click(function(){
		anwerRightNow($(this));
	});
	
	$('#rightmenuIcon a').click(function(){
		if($(this).attr('href')=='#'){
			if(!notgohome()){
				tip("请登录！",5);
				$('#myModal_landreg').modal('show');
				tip("请先登录，亲！");
				return false;
			}
			window.location=$(this).attr('data-h');
		}	
	});

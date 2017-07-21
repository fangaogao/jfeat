if(!notgohome()){window.location="index.html";}

plan();
function plan(){
	var me_id="#fabu";
	if((window.location.search+"").indexOf('plan')>-1){
		me_id="#carlist";
	}
	var obj=$("#go_menu li a");
	for(var i=0;i<obj.length;i++){
		var id=$(obj[i]).attr("href");
		if(id==me_id){
			$(id).show().addClass('in').addClass('active');
			$(obj[i]).parent().addClass("active");
			if(me_id=="#carlist")my_answer_list(0,1);
		}else{
			$(id).hide().removeClass("in").removeClass("active");
			$(obj[i]).parent().removeClass("active");
		}
	}
}


if(notblank(sessionStorage.faceUrl))$("#me_faceimg").attr("src",sessionStorage.faceUrl);
if(notblank(sessionStorage.ability))$("#me_ability").text(sessionStorage.ability);
if(notblank(sessionStorage.credit))$("#me_credit").text(sessionStorage.credit);
if(notblank(sessionStorage.credit))$("#me_credit").text(sessionStorage.credit);
if(notblank(sessionStorage.nickname))$("#me_nickname").text(sessionStorage.nickname);
if(notblank(sessionStorage.qq))$("#me_QQ").text(sessionStorage.qq);
if(notblank(sessionStorage.firstcatalog_list)){
	var list=JSON.parse(sessionStorage.firstcatalog_list);
	var s="";
	for(var i=0;i<list.length;i++){
		var one=list[i];
		if(notblank(sessionStorage.skill)&&sessionStorage.skill.indexOf(list[i].catalog_name)>-1){
			s+='<span class="sel">'+list[i].catalog_name+'</span>';
		}else s+='<span>'+list[i].catalog_name+'</span>';
	}
	$("#me_skill").html(s);
}
$("#me_skill").on("click","span",function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var text=$(this).text();
	var skill="";
	if(notblank(sessionStorage.skill))skill=sessionStorage.skill;
	if($(this).hasClass('sel')){
		$(this).removeClass('sel');
		if(skill.indexOf(text)>-1)skill=skill.replace(","+text, "");
	}else{
		$(this).addClass('sel');
		if(skill.indexOf(text)==-1)skill=skill+","+text;
	}
	sessionStorage.skill=skill;
	if(notgohome()){
		if(skill.length==0)return;
		var source="userId"+sessionStorage.userId;
    	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
		ajax({method:"user_update_property",
			oneInfo:"skill",
			value:skill,
			source:source,
			sign:sign,
			userId:sessionStorage.userId,
			tokenId:sessionStorage.tokenId});
	}else tip("请登录！",5);
});
$('#skill').click(function(){
	$('#myModal_skill').modal('show');
});
$("#me_faceimg").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	if(notblank(sessionStorage.faceUrl))$("#img_face").attr('src',sessionStorage.faceUrl);
	$("#myModal_imgface").modal('show');
});

$("#img_face").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	$("#upfileface").click();
});
$("#upfileface").change(function(){
	if(!notgohome()){tip("请登录！",5);return;}
    var objUrl=getObjectURL(this.files[0])
    if(objUrl){
        $(window).scrollTop(0); 
        $("#img_screen").show();              
        $("#img_box").show();              
        $("#img_box_p").show();
        $("#img_box_btn").show();
        $("#img_box_body").css("height","350px");
        var M=parseInt(this.files[0].size/1024000);
    	if(M>1)tip('您的图片超过了'+M+'M，正在读取...');
    }
})


var clipArea = new bjj.PhotoClip("#clipArea", {
	size: [250, 250],
	file: "#upfileface",	    
	ok: "#img_box_btn",	   
    clipFinish: function(dataURL) {
    	$("#img_screen").hide();              
    	$("#img_box").hide();              
    	$("#img_box_p").hide();
        $("#img_box_btn").hide();
        $("#img_box_body").css("height","0px");   
    	$("#me_faceimg").attr("src",dataURL);
    	sessionStorage.faceUrl=dataURL;
		$("#myModal_imgface").modal('hide');
    	uploadImg(dataURL,sessionStorage.userId+".jpg");
	}
})
function uploadImg(base64,fname){
	var form = document.createElement("form");        
    var formData = new FormData(form);  
	formData.append("file",convertBase64UrlToBlob(base64),fname);
	formData.append("Token",sys.imgsign);
	 $.ajax({//提交表单，异步上传图片  
        url : sys.imgurl,  
        type : "POST",  
        data : formData,  
        dataType:"json",  
        processData : false,  
        contentType : false,  
        success:function(data){  
            ajaxImgToSer(data.linkurl); 
        }  
    });  
}
function ajaxImgToSer(url){
	var source="userId"+sessionStorage.userId;
	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"save_img_url",
		imgface:url,
		source:source,
		sign:sign,
		userId:sessionStorage.userId,
		tokenId:sessionStorage.tokenId});
}
$("#go_menu li a").click(function(){
	var me_id=$(this).attr("href");
	var obj=$("#go_menu li a");
	for(var i=0;i<obj.length;i++){
		var id=$(obj[i]).attr("href");
		if(id==me_id)$(id).show();
		else $(id).hide();
	}
});
setYjfl();
function setYjfl(){
	if(!notblank(sessionStorage.firstcatalog_list)){tip("请登录！",5);return;}
	var list=JSON.parse(sessionStorage.firstcatalog_list);
	var s="";
	for(var i=0;i<list.length;i++){
		var one=list[i];
		s+='<option data-cid='+one.id+'>'+one.catalog_name+'</option>'
	}
	$('#yj_fl').html(s);
}
fabu_init();
function fabu_init(){
	$('#title_fb').val("");
	$('#ej_flinp').val("");
	$('#money_fb').val("");
	
	toolbar = [ 'title', 'bold', 'italic', 'underline', 'strikethrough',  
    	'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|',  
    	'link', 'image', 'hr', '|', 'indent', 'outdent' ];  
	var editor = new Simditor({  
    	textarea : $('#editor'),  
		placeholder : '这里输入内容...', 
		pasteImage: true,
		toolbarFloat:true,
		toolbar : toolbar,  //工具栏  
		defaultImage : 'simditor-1.0.5/images/image.png', //编辑器插入图片时使用的默认图片  
		upload : {  
    		url : sys.imgurl, //文件上传的接口地址  
    		params: {Token:sys.imgsign}, //键值对,指定文件上传接口的额外参数,上传的时候随文件一起提交  
    		fileKey: 'file', //服务器端获取文件数据的参数名  
    		connectionCount: 3,  
    		leaveConfirm: '正在上传文件'  
    	}  
    });  
}
$("#go_fabu").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	fabu_init();
});
$("#money_fb").change(function(){
	if(!notgohome()){ tip("请先登录!",5); return;}
	var money=$.trim(escapeHtml($("#money_fb").val()));
 	if(sys.zshu.test(money)&&parseInt(money)>=2){
 		//$("#realmoney_fb").val((money*1.03).toFixed(2));
 		$("#realmoney_fb").val(parseInt(money)+1);
 	}
});
$("#fabu_fb").click(function(){
 	if(!notgohome()){ tip("请先登录!",5); return;}
 	if($(this).attr('data-c')==1){
 		return;
 	}
 	var title=$.trim($("#title_fb").val());
 	if(title.length==0||title.length>50){
 		tip("标题0-50字以内哦");return;
 	}
 	var yjfl=$("#yj_fl").find("option:selected").attr("data-cid");
 	var yjflstr=$("#yj_fl").val();
 	var ejfl=$.trim($("#ej_flinp").val());
 	if(ejfl.length==0||ejfl.length>10){
		tip("标题0-10字以内哦");return;
	}
 	var money=$.trim($("#money_fb").val());
 	if(!sys.zeshu.test(money)){
 		tip("赏金必须是整数哦");return;
 	}
 	if(parseFloat(money)<2){
 		tip("金额至少大于2元");return;
 	}
 	var cont=$("#editor").val();
 	if(cont.length==0||cont.length>20000){
 		tip("请输入内容2w只以内");return;
 	} 
 	if(!$('#userbook').is(':checked')){
 		tip("接受用户协议才可以发表");return;
 	}
 	$(this).text('提交中....').attr('data-c',1);
	var source="userId"+sessionStorage.userId;
	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"post_ask",
		title:escapeHtml(title),
		award_money:money,
		content:escapeHtml(cont),
		first_catalog_id:yjfl,
		assort:yjflstr+"-"+ejfl,
		userId:sessionStorage.userId,
		source:source,
		sign:sign,
		tokenId:sessionStorage.tokenId},false,$(this));
 	
 });

$('#userbookiframe').click(function(){
	$('#myModal_userbook').modal('show');
});


$("#see_wallet").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var src=$(this).attr("src");
	if(src=="img/see0.png"){
		$(this).attr("src","img/see1.png");
		$("#me_wallet").text(sessionStorage.wallet);
	}else{
		$(this).attr("src","img/see0.png");
		$("#me_wallet").text("**");
	}
});
$("#me_nickname").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	$("#myModal_nickanme").modal('show');
	$("#xg_nickname").val($(this).text());
});
$("#xg_nickname,#xg_QQ").focus(function(){
	$(this).val("");
});
$("#xg_nickname").blur(function(){
	if($.trim($(this).val()).length==0)
		$(this).val(sessionStorage.nickname);
});
$("#xg_QQ").blur(function(){
	if($.trim($(this).val()).length==0)
		$(this).val(sessionStorage.qq);
});
$("#sure_nickname").click(function(){
	var nickname=$.trim($("#xg_nickname").val());
	if(nickname.length==0||nickname.length>11){
		tip("昵称1-11个字以内哦");return;
	}
	if(notgohome()){ 
		var source="userId"+sessionStorage.userId;
    	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
		ajax({method:"user_update_property",
			oneInfo:"nickname",
			value:nickname,
			source:source,
			sign:sign,
			userId:sessionStorage.userId,
			tokenId:sessionStorage.tokenId});
	}else tip("请登录！",5);
});
$("#me_QQ").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	$("#myModal_QQ").modal('show');
	$("#xg_QQ").val($(this).text());
});

$("#me_xiugaiPwd").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	$("#xg_oldpwd").val("");
	$("#xg_newpwd").val("");
	$("#xg_comfpwd").val("");
	$("#myModal_pwd").modal('show');
});
$("#sure_pwd").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var oldpwd=$.trim($("#xg_oldpwd").val());
	var newpwd=$.trim($("#xg_newpwd").val());
	var comfpwd=$.trim($("#xg_comfpwd").val());
	if(oldpwd.length<6||oldpwd.length>12){
		tip("旧密码6-12个字以内哦");return;
	}
	if(newpwd.length<6||newpwd.length>12){
		tip("新密码6-12个字以内哦");return;
	}
	if(newpwd!=comfpwd){
		tip("新密码与确认密码不匹配");return;
	}if(notgohome()){ 
		var source="userId"+sessionStorage.userId;
    	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
		ajax({method:"update_pwd",
			password:md5(oldpwd),
			newPwd:md5(newpwd),
			confirmPwd:md5(comfpwd),
			source:source,
			sign:sign,
			userId:sessionStorage.userId,
			tokenId:sessionStorage.tokenId});
	}else tip("请登录！",5);
});
 
var time2=60;
$("#sendcode").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	if(time2<60)return;
	var mobile=$("#xg_mobile").val();
	if(!sys.mobile.test(mobile)) { 
    	tip('手机格式错误的呢');return; 
	}
	var setI=setInterval(function(){
		$("#sendcode").text("还剩"+time2+"s");
		time2--;
		if(time2==-1){
			time2=60;
			clearInterval(setI);
			$("#sendcode").text("发送验证码");
		}
	},1000);	
	ajax({method:"send_sms",mobile:mobile,type:3});
});
$("#me_xiugaiPhone").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	$("#xg_mobile").val("");
	$("#xg_code").val("");
	$("#myModal_mobile").modal('show');	 
});
$("#sure_mobilexg").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	$("#load_bidding").show();
	var mobile=$("#xg_mobile").val();
	if(!sys.mobile.test(mobile)) { 
    	tip('手机格式错误的呢');return; 
	}
	var smsCode=$.trim($("#xg_code").val());
	if(smsCode.length!=6){
		tip('请输入正确的验证码');return; 
	}
	var source="userId"+sessionStorage.userId;
   	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"update_mobile",
			phone:mobile,
			code:smsCode,
			source:source,
			sign:sign,
			userId:sessionStorage.userId,
			tokenId:sessionStorage.tokenId});
});


$("#me_bill").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	$("#bill_list").html('');
	$("#myModal_bill").modal("show");
	bill_list(1);
});
function bill_list(bill_page){
	$("#load_bill").show();
	var source="userId"+sessionStorage.userId;
   	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"bill_list",
			pageNo:bill_page,
 			pageSize:10,
			source:source,
			sign:sign,
			userId:sessionStorage.userId,
			tokenId:sessionStorage.tokenId});
}
$("#bill_footer").on('click','li a',function(){
	var page=$(this).attr("data-p");
	if(parseInt(page)>0)bill_list(page);
	return false;
});

$("#me_withdrawal").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	$("#withdrawal_list").html('');	
	$("#myModal_withdrawal").modal("show");	 
	withdrawal_list(1);
});
function withdrawal_list(withdrawal_page){
	$("#load_withdrawal").show();
	var source="userId"+sessionStorage.userId;
   	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"withdrawal_list",
			pageNo:withdrawal_page,
 			pageSize:10,
			source:source,
			sign:sign,
			userId:sessionStorage.userId,
			tokenId:sessionStorage.tokenId});
}
$("#withdrawal_footer").on('click','li a',function(){
	var page=$(this).attr("data-p");
	if(parseInt(page)>0)withdrawal_list(page);
	return false;
});

$("#me_want_withdrawal").click(function(){
	if(!notgohome()||!notblank(sessionStorage.is_set)){tip("请登录！",5);return;}
	if(sessionStorage.is_set==0){
		myModal_setwithdpwd();
	}else if(sessionStorage.is_set==1){
		myModal_wantwithd();
		$("#sure_tixianBtn").show();
	}else{
		tip("错误的操作");
	}
});
function myModal_setwithdpwd(){
	$("#withd_pwd").val("");
	$("#conf_withd_pwd").val("");
	$("#myModal_setwithdpwd").modal('show');
}
function myModal_wantwithd(){
	if(!notgohome()){tip("请登录！",5);return;}
	$("#withd_money").val("");
	$("#withd_money_pwd").val("");
	$("#myModal_wantwithd").modal('show');
}
$("#sure_setwithdpwd").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var withd_pwd=$.trim($("#withd_pwd").val());
	if(withd_pwd.length<6||withd_pwd.length>12){
		tip("请输入6-12位密码");return;
	}
	var conf_withd_pwd=$.trim($("#conf_withd_pwd").val());
	if(conf_withd_pwd.length<6||conf_withd_pwd.length>12){
		tip("请输入6-12位密码");return;
	}
	if(conf_withd_pwd!=withd_pwd){
		tip("请输入一样的密码");return;
	}
	var source="userId"+sessionStorage.userId;
   	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"set_pay_pass",
			pay_pwd:md5(withd_pwd),
 			con_pwd:md5(conf_withd_pwd),
			source:source,
			sign:sign,
			userId:sessionStorage.userId,
			tokenId:sessionStorage.tokenId});
});
$("#sure_tixianBtn").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var withd_money=$.trim($("#withd_money").val());
	if(!sys.zeshu.test(withd_money)){
		tip("请输入整数金额");return;
	}
	var withd_money_pwd=$.trim($("#withd_money_pwd").val());
	if(withd_money_pwd.length<6||withd_money_pwd.length>12){
		tip("请输入6-12位密码");return;
	}
	$(this).hide();
	var source="userId"+sessionStorage.userId;
   	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"want_withdrawal",
			money:withd_money,
 			pay_pwd:md5(withd_money_pwd),
			source:source,
			sign:sign,
			userId:sessionStorage.userId,
			tokenId:sessionStorage.tokenId});
});

$("#go_tiwenlist,#matter_searh").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	$("#mymatter_list").html('');
	my_question_list(1);
});
function my_question_list(page){
	$("#load_matterlist").show();
	var solve_status=$("#matter_solve_status").find("option:selected").attr("data-va");
	var source="userId"+sessionStorage.userId;
   	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
   	var obj={method:"my_question_list",
			pageNo:page,
			pageSize:10,
			source:source,
			sign:sign,
			userid:sessionStorage.userId,
			tokenId:sessionStorage.tokenId};
	if(solve_status!=-1)obj.solve_status=solve_status;
	ajax(obj);
}
$("#matterlist_footer").on('click','li a',function(){
	var page=$(this).attr("data-p");
	if(parseInt(page)>0)my_question_list(page);
	return false;
});
$("#mymatter_list").on('click','.addbidding',function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var qid=$(this).attr("data-qid");
	$("#myModal_addbidding").modal("show");
	$("#sure_addbindding").attr("data-qid",qid);
});
$("#sure_addbindding").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var qid=$(this).attr("data-qid");
	var num=$.trim($("#xg_addbindding").val());
	if(!sys.zeshu.test(num)){
		tip("请输入数字");return;
	}
	var source="userId"+sessionStorage.userId;
   	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"add_bidding",
		num:num,
		qid:qid,
		source:source,
		sign:sign,
		userId:sessionStorage.userId,
		tokenId:sessionStorage.tokenId});
});
$("#mymatter_list").on('click','.qfinished',function(){
	if(!notgohome()){tip("请登录！",5);return;}
	$("#bidding_list").html('');
	var qid=$(this).attr("data-qid");
	$("#myModal_biddinglist").modal("show");
	var source="userId"+sessionStorage.userId;
   	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"my_bidding",
		qid:qid,
		source:source,
		sign:sign,
		userId:sessionStorage.userId,
		tokenId:sessionStorage.tokenId}); 
});

var sure_answer_index=null;
$("#bidding_list").on('click','.perfact_answer',function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var aid=$(this).attr("data-aid");
	var qid=$(this).attr("data-qid");
	var nickname=$(this).attr("data-nickname");
	var faceUrl=$(this).attr("data-faceUrl");
	var qq=$(this).attr("data-qq");
	layer.open({
	    content: "<h4><img src='"+faceUrl+"' class='img-circle' style='width:70px'><br>你确定是<i style='color:red'>"+nickname+"</i><i style='color:blue'>(QQ:"+qq+")</i>帮你解决了问题么？<br><small style='color:red'>此操作会将赏金打入对方账号，确认之后无法撤回</small></h4>",
	    btn: ["确定打钱", "取消"],
	    yes: function(index){
	    	sure_answer_index=index;
	    	sure_answer(aid,qid);
	    }
	  });
});
function sure_answer(aid,qid){
	if(!notgohome()){tip("请登录！",5);return;}
	var source="userId"+sessionStorage.userId;
   	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"sure_answer",
		qid:qid,
		aid:aid,
		source:source,
		sign:sign,
		userId:sessionStorage.userId,
		tokenId:sessionStorage.tokenId}); 
} 

$('#go_carlist').click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	$("#mycar_list").html('');
	my_answer_list(0,1);
});
function my_answer_list(type,page){
	if(type==0)$("#load_mycarlist").show();
	if(type==1)$("#load_myanswer").show();
	var source="userId"+sessionStorage.userId;
   	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
   	ajax({method:"my_answer_list",
   			type:type,
			pageNo:page,
			pageSize:10,
			source:source,
			sign:sign,
			userid:sessionStorage.userId,
			tokenId:sessionStorage.tokenId});	
}
$('#mycarlist_footer').on('click','li a',function(){
	var page=$(this).attr("data-p");
	if(parseInt(page)>0)my_answer_list(0,page);
	return false;
});
$('#myanswer_footer').on('click','li a',function(){
	var page=$(this).attr("data-p");
	if(parseInt(page)>0)my_answer_list(1,page);
	return false;
});
$('#mycar_list,#myanswer_list').on('click','.delanswer',function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var qid=$(this).attr('data-qid');
	var source="userId"+sessionStorage.userId;
	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"delete_anwser",
		qid:qid,
		userId:sessionStorage.userId,
		source:source,
		sign:sign,
		tokenId:sessionStorage.tokenId},null,this); 
});
$('#go_answerlist').click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	my_answer_list(1,1);
});
$('#myanswer_list').on('click','.complain',function(){
	if(!notgohome()){tip("请登录！",5);return;}
	$('#myModal_complain').modal('show');
	$('#complain_rea').val("")
	$('#complian_sure').attr('data-qid',$(this).attr('data-qid'));
});
$('#complian_sure').click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var content=$.trim($('#complain_rea').val());
	if(content.length==0){
		content=$('#complain_sel').find('option:selected').text();
	}else if(content.length>0&&content.length<500){
		content=escapeHtml(content);
	}else{
		tip('请输入1-500字以内');return ;
	}
	var qid=$(this).attr('data-qid');
	var source="userId"+sessionStorage.userId;
	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"complain",
		qid:qid,
		reason:content,
		userId:sessionStorage.userId,
		source:source,
		sign:sign,
		tokenId:sessionStorage.tokenId}); 
});

$("#mymatter_list").on('click','.seematterdesc',function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var obj=JSON.parse($(this).attr("data-desc"));
	$("#qdesc_faceurl").attr("src",sessionStorage.faceUrl);
	$("#qdesc_nickname").text(sessionStorage.nickname);
	$("#qdesc_credit").text("信用:"+sessionStorage.credit);
	desc(obj);
});
$("#mycar_list,#myanswer_list").on('click','.seematterdesc',function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var obj=JSON.parse($(this).attr("data-desc"));
	$("#qdesc_faceurl").attr("src",obj.faceUrl);
	$("#qdesc_nickname").text(obj.nickname);
	$("#qdesc_credit").text("信用:"+obj.credit);
	desc(obj);
});
function desc(obj){
	$("#myModal_qdesc").modal('show');
	$("#qdesc_paytime").text(obj.pay_time);
	$("#qdesc_awardmoney").text("赏 ￥"+obj.award_money);
	if(obj.solve_status==0){
		$("#qdesc_solvestatus").text("未解决").addClass('statusc0'); 
	}else{
		$('#qdesc_solvestatus').text("已完成").addClass('statusc1'); 
	}
	$("#qdesc_assort").text("分类："+obj.assort);
	$("#qdesc_title").text(obj.title);
	$("#qdesc_content").html(obj.content);
	$('#qdesc_content img').addClass("img-responsive");
}
$('#mycar_list').on('click','.answer_right_now',function(){
	anwerRightNow($(this)); 
	$(this).addClass('sel');
});

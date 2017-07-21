if(typeof(sessionStorage.first_category_me)=="undefined")sessionStorage.first_category_me=1;
if(typeof(sessionStorage.solve_status)=="undefined")sessionStorage.solve_status=-1;
if(typeof(sessionStorage.sort)=="undefined")sessionStorage.sort="pay_time";
if(typeof(localStorage.jizhu_pass)=="undefined")localStorage.jizhu_pass=0;
var sys={
	service:"http://123.206.135.150:8090/jf_api/server/api.do",
	//service:"http://localhost:8080/jf_api/server/api.do",
	imgurl:"http://up.imgapi.com/",
	imgsign:"9f447c7363f616a26a8c2ea3534c64d85521b1bc:EP3PSQjmpR9gP058fpghhmryKkc=:eyJkZWFkbGluZSI6MTQ5NDY0MDMxNSwiYWN0aW9uIjoiZ2V0IiwidWlkIjoiNTkzMDYxIiwiYWlkIjoiMTMwMTY0MSIsImZyb20iOiJmaWxlIn0=",
	mobile:/^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1})|(14[0-9]{1}))+\d{8})$/,
	zshu:/^[0,1,2,3,4,5,6,7,8,9,]*[.]?[0,1,2,3,4,5,6,7,8,9,]*$/,
	zeshu: /^[1-9]\d*$/,
	qqyz:/^\d{5,10}$/
}
function ajax(obj,async,other){
	if(typeof(async)=="undefined"||async==null)async=true;
	$.ajax({
		type: "post",
		url:sys.service,
		async:async,
		data: obj,
		dataType: "jsonp",
		success:function(data) {
			if(obj.method=="login")ret_login(data);
			else if(obj.method=="send_sms")ret_send_sms(data);
			else if(obj.method=="regist")ret_regist(data);
			else if(obj.method=="logout")ret_logout(data);
			else if(obj.method=="firstcatalog_list")ret_firstcatalog_list(data);
			else if(obj.method=="post_ask")ret_post_ask(data,other);
			else if(obj.method=="user_update_property")ret_user_update_property(data,obj);
			else if(obj.method=="update_pwd")ret_update_pwd(data);
			else if(obj.method=="save_img_url")ret_save_img_url(data); 
			else if(obj.method=="update_mobile")ret_update_mobile(data,obj); 
			else if(obj.method=="bill_list")ret_bill_list(data,obj);
			else if(obj.method=="withdrawal_list")ret_withdrawal_list(data,obj);
			else if(obj.method=="set_pay_pass")ret_set_pay_pass(data); 
			else if(obj.method=="want_withdrawal")ret_want_withdrawal(data);
			else if(obj.method=="my_question_list")ret_my_question_list(data,obj);
			else if(obj.method=="question_list")ret_question_list(data,obj,other);
			else if(obj.method=="ad_list")ret_ad_list(data);
			else if(obj.method=="ranking_list")ret_ranking_list(data);
			else if(obj.method=="add_bidding")ret_add_bidding(data);
			else if(obj.method=="my_bidding")ret_my_bidding(data,obj);
			else if(obj.method=="sure_answer")ret_sure_answer(data);
			else if(obj.method=="answer_or_car")ret_answer_or_car(data,obj,other);
			else if(obj.method=="my_answer_list")ret_my_answer_list(data,obj);
			else if(obj.method=="delete_anwser")ret_delete_anwser(data,obj,other);
			else if(obj.method=="complain")ret_complain(data,obj);
			
			if(data.statusCode=="100400"){
				logout_clear();
			}
			
		},error:function(XMLHttpRequest, textStatus, errorThrown) {
			tip("服务器内部错误！")
		}
	});
}
function tip(cont,time){
	if(typeof(time)=="undefined")time=2;
	layer.open({content:cont,skin: 'msg',time:time});
}
function notblank(str){
	if(typeof(str)!="undefined"&&str!=null&& $.trim(str).length>0)return true;
	else return false;
}
function escapeHtml(str){
	var strArr = str.split('');  
    var htmlChar="&<>\'\"";  
    for(var i = 0; i< str.length;i++){  
        if(htmlChar.indexOf(str.charAt(i)) !=-1){  
            switch (str.charAt(i)) {                          
                case '<':  
                    strArr.splice(i,1,'&#60;');  
                    break;  
                case '>':  
                    strArr.splice(i,1,'&#62;');  
                    break;  
                case '&':  
                    strArr.splice(i,1,'&#38;'); 
                case '\'':  
                    strArr.splice(i,1,'&apos;'); 
                case '\"':  
                    strArr.splice(i,1,'&quot;'); 
            }  
        }
    } 
    return strArr.join('');
}
 

var canUse3D=false;
var canUse=document.getElementsByTagName("body")[0].style;
if(typeof canUse.animation!="undefined"||typeof canUse.WebkitAnimation!="undefined")canUse3D=true;
	
	
/*--登陆之后可以点击的操作判断--*/
function notgohome(){
	return notblank(sessionStorage.tokenId)&&notblank(sessionStorage.secretKey)&&notblank(sessionStorage.userId);
}

/*----------------------------------------------------------------init-----------------------*/
island();
jizu_pass();

/*--获取一级菜单--*/
if(notblank(sessionStorage.firstcatalog_list)){
	var list=JSON.parse(sessionStorage.firstcatalog_list);
	paint_first_category(list);
}else{
	ajax({method:"firstcatalog_list"});
}

 
/**---------------------------------------------------------------page---------------------------*/

$("#first_category").on('click','li',function(){
	sessionStorage.first_category_me=$(this).attr("data-id");
});
$("#btn_land,#li_land").click(function(){
	$("#li_land").addClass("active");
	$("#index_land").addClass("active").addClass("in");
	$("#li_reg").removeClass("active");
	$("#index_reg").removeClass("active").removeClass("in");
	$("#btn_land_reg").attr("data-type","land");
});
$("#btn_reg,#li_reg").click(function(){
	$("#li_reg").addClass("active");
	$("#index_reg").addClass("active").addClass("in");
	$("#li_land").removeClass("active");
	$("#index_land").removeClass("active").removeClass("in");
	$("#btn_land_reg").attr("data-type","reg");
});

$("#btn_land_reg").click(function(){
	var type=$(this).attr("data-type");
	if(type=="land"){
		var mobile=$("#land_mobile").val();
		if(!sys.mobile.test(mobile)) { 
    		tip('手机格式错误的呢');return; 
		}
		var password=$.trim($("#land_pwd").val());
		if(!(password.length>=6&&password.length<=12||password.length==32)){
			tip('密码6-12位哦');return; 
		}
		if(password.length!=32)password=md5(password);
		if($("#jizhu_pass").is(':checked')){
			localStorage.jizhu_pass=1;
			localStorage.login_name=mobile;
			localStorage.login_pass=password;
			jizu_pass();
		}else{
			localStorage.jizhu_pass=0;
			localStorage.removeItem("login_name");
			localStorage.removeItem("login_pass");
		}
		ajax({method:"login",mobile:mobile,password:password});
	}else{
		var mobile=$("#reg_mobile").val();
		if(!sys.mobile.test(mobile)) { 
    		tip('手机格式错误的呢');return; 
		}
		var smsCode=$.trim($("#reg_smsCode").val());
		if(smsCode.length!=6){
			tip('请输入正确的验证码');return; 
		}
		var password=$.trim($("#reg_password").val());
		if(password.length==0||password.length<6||password.length>12){
			tip('密码6-12位哦');return; 
		}
		var confirmPwd=$.trim($("#reg_confirmPwd").val());
		if(confirmPwd!=password){
			tip('请输入一样的密码');return; 
		}
		password=md5(password);
		confirmPwd=md5(confirmPwd);
		ajax({method:"regist",mobile:mobile,smsCode:smsCode,password:password,confirmPwd:confirmPwd});
	}
});

var time=60;
$("#code").click(function(){
	if(time<60)return;
	var mobile=$("#reg_mobile").val();
	if(!sys.mobile.test(mobile)) { 
    	tip('手机格式错误的呢');return; 
	}
	var setI=setInterval(function(){
		$("#code").text("还剩"+time+"s");
		time--;
		if(time==-1){
			time=60;
			clearInterval(setI);
			$("#code").text("发送验证码");
		}
	},1000);	
	ajax({method:"send_sms",mobile:mobile,type:1});
});

$("#btn_logout").click(function(){
	ajax({method:"logout",tokenId:sessionStorage.tokenId});
});

$("#goto_fabu").click(function(){
	if(notgohome()){
		window.location="myhome.html";
	}else {
		$('#myModal_landreg').modal('show');
		tip("请先登录，亲！");
	}
		
});
 
$("#say_hello").click(function(){
	if(notgohome())window.location="myhome.html";
});

$("#jiantou_top").click(function(){
	var x=$("body").scrollTop()||$(document).scrollTop();
	var i=3;
	var timer = setInterval(function() {
		x = x - i*i;
		if (x < 100) {
			x = 0;
			window.scrollTo(x, x);
			clearInterval(timer);
		}
		window.scrollTo(x, x);
		i++;
	}, 10);
});

$("#sure_QQ").click(function(){
	if(!notgohome()){tip("请登录！",5);return;}
	var QQ=$.trim($("#xg_QQ").val());
	if(!sys.qqyz.test(QQ)){
 		tip("请输入真实的QQ");return;
 	}
	if(notgohome()){ 
		var source="userId"+sessionStorage.userId;
    	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
		ajax({method:"user_update_property",
			oneInfo:"qq",
			value:QQ,
			source:source,
			sign:sign,
			userId:sessionStorage.userId,
			tokenId:sessionStorage.tokenId});
	}else tip("请登录！",5);
});
/*----------------------------------------------------------------------renturn------------------**/
function ret_login(data){
	if(data.statusCode=="100000"){
		$('#myModal_landreg').modal('hide');
		tip('登录成功了，亲！');
		landreg_commot(data);
	}else{
		tip(data.statusStr);
	}
}
function ret_send_sms(data){
	if(data.statusCode=="100000"){
		tip("验证码已成功发送，5分钟内有效");
	}else{
		tip(data.statusStr);
	}
}
function ret_regist(data){
	if(data.statusCode=="100000"){
		$('#myModal_landreg').modal('hide');
		tip('注册成功了，亲！');
		landreg_commot(data);
	}else{
		tip(data.statusStr);
	}
}
function ret_firstcatalog_list(data){
	if(data.statusCode=="100000"){
		$('#first_category').html("");
		var list=data.data;
		sessionStorage.firstcatalog_list=JSON.stringify(list);
		paint_first_category(list);
	}else{
		tip(data.statusStr);
	}
}
function ret_post_ask(data,other){
	if(data.statusCode=="100000"){
		
	}else{
		tip(data.statusStr);
		$(other).text('下一步').attr('data-c',0);
	}
}
function ret_user_update_property(data,obj){
	if(data.statusCode=="100000"){		
		if(obj.oneInfo=="nickname"){
			tip("修改成功");
			$("#me_nickname").text(obj.value);
			$("#myModal_nickanme").modal('hide');
			sessionStorage.nickname=obj.value;
		}else if(obj.oneInfo=="qq"){
			tip("修改成功");
			$("#me_QQ").text(obj.value);
			sessionStorage.qq=obj.value;
			$("#myModal_QQ").modal('hide');
		}
	}else{
		tip(data.statusStr);
	}
}
function ret_update_pwd(data){
	if(data.statusCode=="100000"){
		$("#myModal_pwd").modal('hide');
	}else{
		tip(data.statusStr);
	}
}
function ret_save_img_url(data){
	if(data.statusCode=="100000"){
	}else{
		tip(data.statusStr);
	}
}
function ret_update_mobile(data,obj){
	if(data.statusCode=="100000"){
		sessionStorage.mobile=obj.phone;
		$("#myModal_mobile").modal('hide');
	}else{
		tip(data.statusStr);
	}
}
function ret_bill_list(data,obj){
	$("#load_bill").hide();	
	if(data.statusCode=="100000"){
		var list=data.data.list;
		if(list.length==0)tip("没有数据哦");
		var s="";
		for(var i=0;i<list.length;i++){
			var one=list[i];
			s +='<tr><td>'+
			one.create_ts+'</td><td>'+
			one.msg+'</td><td style="font-size: 16px;font-weight:600">'+
			one.type+one.money+'</td></tr>';
		}
		$("#bill_list").html(s);
		$("#bill_footer").html(page(data,obj));
	}else{
		tip(data.statusStr);
	}
}

function ret_withdrawal_list(data,obj){
	$("#load_withdrawal").hide();	
	if(data.statusCode=="100000"){
		var list=data.data.list;
		if(list.length==0)tip("没有数据哦");
		var s="";
		for(var i=0;i<list.length;i++){
			var one=list[i];
			var status="处理中";
			var wid_time="";
			var color='style="color:red;"';
			if(one.status==1){
				status="已提现";
				wid_time=one.wid_time;
				color="";
			}
			s +='<tr><td>'+
			one.create_time+'</td><td>'+
			one.money+'</td><td '+
			color+'>'+
			status+'</td><td>'+
			wid_time+'</td></tr>';
		}
		$("#withdrawal_list").html(s);	
		$("#withdrawal_footer").html(page(data,obj));
	}else{
		tip(data.statusStr);
	}
}
function ret_set_pay_pass(data){
	if(data.statusCode=="100000"){
		sessionStorage.is_set=1;
		$("#myModal_setwithdpwd").modal('hide');
		myModal_wantwithd();
	}else{
		tip(data.statusStr);
	}
}
function ret_want_withdrawal(data){
	if(data.statusCode=="100000"){
		$("#myModal_wantwithd").modal('hide');
		sessionStorage.wallet=data.data;
		$("#me_wallet").text(sessionStorage.wallet);
		tip("已提交提现申请");
	}else{
		tip(data.statusStr);
		if(data.statusCode=="100519"){
			myModal_setwithdpwd();
		}
	}
}
function ret_my_question_list(data,obj){
	$("#load_matterlist").hide();
	if(data.statusCode=="100000"){
		var list=data.data.list;
		if(list.length==0){tip("没有数据哦");return;}
		var s="";
		for(var i=0;i<list.length;i++){
			var one=list[i];
			var desc=JSON.stringify(one);
			var solve_status="已完成";
			var color='';
			var num=one.answer_number;
			var btn_addbidding="";
			var btn_qfinished="";
			if(one.solve_status==0){
				solve_status="待解决";
				color='style="color:red;"';
				if(one.now_answer_number==0)btn_addbidding='<button type="button" class="btn btn-default btn-sm  addbidding"  data-qid='+one.id+'>加标</button>';
				if(num>0)btn_qfinished='<button type="button" class="btn btn-default btn-sm qfinished"  data-qid='+one.id+'>完美解决</button>';
			}else{
				num='';
			}
			s +="<tr><td>"+
			one.pay_time+"</td><td>"+
			one.award_money+"</td><td>"+
			one.title+"</td><td  "+
			color+">"+
			solve_status+"</td><td>"+
			num+"</td><td>"+
			btn_addbidding+btn_qfinished+"<button type='button' class='btn btn-default btn-sm seematterdesc'  data-desc='"+
			desc+"'>查看</button></td></tr>";
		}
		$("#mymatter_list").html(s);
		$("#matterlist_footer").html(page(data,obj));
	}else{
		tip(data.statusStr);
	}
}
function ret_question_list(data,obj,other){	
	if(data.statusCode=="100000"){
		if(obj.pageNo==1)$("#wentiList").html("");
		var list=data.data.list;
		if(list.length==0){$("#more").text("没有数据了,T_T");return;}
		var s="";
		for(var i=0;i<list.length;i++){
			var one=list[i];
			var desc=JSON.stringify(one);
			var solve_status="statusc0";
			var solve_status_text="待解决";
			var btns="<button type='button'' class='btn btn_desc answer_right_now' data-desc='"+
				desc+"'>回答</button><button type='button' class='btn btn_desc daiding'  data-id="+
				one.id+" >待定</button>";
			if(one.solve_status==1){
				solve_status="statusc1";
				solve_status_text="已完成";
				btns="";
			}
			s +="<div class='mediaH'></div><div class='media'><a class='pull-left' ><img class='media-object' src='"+
				one.faceUrl+"' alt='"+
				one.nickname+"' style='border-radius: 10px 10px;width: 50px;'></a><div class='media-body fontfamilyh'><h4 class='media-heading  fontfamilyw'>"+
				one.title+"<small>&nbsp;&nbsp;"+
				one.pay_time+"</small><span class='xinyong'>信用:"+
				one.credit+"</span><span class='badge badge-red pull-right'>赏  "+
				one.award_money+"￥</span></h4><p>&spades;分类：<span>"+
				one.assort+"</span>&diams;状态：<span class='"+
				solve_status+"'>"+
				solve_status_text+"</span></p><p>"+
				btns+"<button type='button' class='btn btn_desc seedesc' data-id="+
				one.id+" data-msg='"+
				desc+"'>查看</button></p></div></div>";
		}
		if(other==1)$("#wentiList").html(s);
		else $("#wentiList").append(s);
		$("#more").text("点击加载更多...").attr("data-p",parseInt(obj.pageNo)+1);
		$("#index_footer").html(page(data,obj));
	}else{
		$("#more").text("加载出错了");
	}
}
function ret_ad_list(data){
	if(data.statusCode=="100000"){
		var list=data.data;
		sessionStorage.ad_list=JSON.stringify(list);
		paint_ad_list(list);
	}else{
		tip(data.statusStr);
	}
}
function ret_ranking_list(data){
	if(data.statusCode=="100000"){
		var list=data.data;
		sessionStorage.ranking_list=JSON.stringify(list);
		paint_ranking_list(list);
	}else{
		tip(data.statusStr);
	}
}
function ret_add_bidding(data){
	if(data.statusCode=="100000"){
		$("#myModal_addbidding").modal("hide");
	}else{
		tip(data.statusStr);
	}
}
function ret_my_bidding(data,obj){	
	$("#load_bidding").hide();
	if(data.statusCode=="100000"){
		var list=data.data;
		if(list.length==0){tip("没有数据了");return;}
		var s="";
		for(var i=0;i<list.length;i++){
			var one=list[i];
			s+="<tr><td><img src='"+
				one.faceUrl+"'  class='img-circle' style='width:50px'></td><td>"+
				one.nickname+"</td><td>"+
				one.credit+"</td><td>"+
				one.mobile+"</td><td><a>"+
				one.qq+"</a></td><td>"+
				one.create_time+"</td><td><button class='btn btn-default btn-sm perfact_answer' data-aid="+
				one.id+"  data-qid='"+
				obj.qid+"'  data-nickname='"+
				one.nickname+"'  data-qq='"+
				one.qq+"' data-faceUrl='"+
				one.faceUrl+"'>完美解决</button></td><tr>";
		}
		$("#bidding_list").html(s);
	}else{
		tip(data.statusStr);
	}
}
function ret_sure_answer(data){
	if(data.statusCode=="100000"){
		tip("确认成功");
		if(sure_answer_index!=null)layer.close(sure_answer_index);
		my_question_list(1);
	}else{
		tip(data.statusStr);
	}
}
function ret_answer_or_car(data,obj,other){
	if(data.statusCode=="100000"){
		if(obj.type==1){
			$('#myModal_answer_rhight_now').modal('show');
			$('#arn_mobile').text(data.data.mobile);
			$('#arn_QQ').text("QQ："+data.data.qq+"点击加好友")
				.attr('href','http://shang.qq.com/email/stop/email_stop.html?qq='+data.data.qq);
			$(other).addClass('sel');
		}else if(obj.type==0){
			$('#ddnum').text(parseInt($('#ddnum').text())+1);
			$(other.obj).addClass('sel').text("已待定");
			
			$("#rightmenuIcon").css({"animation":"rightmenuIcon_show 1s","animation-fill-mode":"forwards"});
			var flyer = $('<span  style="color: #FFFFFF;width:40px;height:40px;border-radius: 50px 50px;background:  #ff6600;display: block;text-align: center;line-height: 40px;z-index:100000">+</span>');
			flyer.fly({
				start: {
					left: other.event.clientX,
					top: other.event.clientY
				},
				end: {
					left: windowW-30,
					top: windowH*0.3,
					width: 0,
					height: 0
				},
				onEnd: function(){flyer.hide();$("#rightmenuIcon").css({"animation":"rightmenuIcon_hide 1s","animation-fill-mode":"forwards"});}
			});	 
		}
	}else{
		tip(data.statusStr);
		if(data.statusCode=="100522"){
			$("#myModal_QQ").modal('show');
			$("#xg_QQ").val("");
		}
	}
}
function ret_my_answer_list(data,obj){
	var type=obj.type;
	if(type==0)$("#load_mycarlist").hide();
	else $("#load_myanswer").hide();
	if(data.statusCode=="100000"){
		var list=data.data.list;
		if(list.length==0){tip("没有数据哦");return;}
		var s="";
		for(var i=0;i<list.length;i++){
			var one=list[i];
			var desc=JSON.stringify(one);
			var solve_status="";
			var cls='';
			var answerq='';
			var shanchu="";
			var chakan="<button class='btn btn-default btn-sm seematterdesc' type='button' data-desc='"+desc+"'>查看</button>";
			if(one.solve_status==1){
				solve_status='已完成'
				cls='color:green';
				answerq='';
				if(sessionStorage.userId!=one.matter_answer_userId)shanchu="<button class='btn btn-default btn-sm delanswer' type='button' data-qid="+one.id+">删除</button>";
			}else{
				solve_status='未解决'
				cls='color:red';
				answerq="<button class='btn btn-default btn-sm answer_right_now' type='button' data-desc='"+desc+"'>回答问题</button>";
				shanchu="<button class='btn btn-default btn-sm complain' type='button' data-qid="+one.matter_id+">投诉</button>";
			}
			if(type==0)s+="<tr><td><img class='img-circle' style='width:50px' src='"+
				one.faceUrl+"'></td><td>"+
				one.nickname+"</td><td>"+
				one.credit+"</td><td>"+
				one.title+"</td><td style='"+cls+"'>"+
				solve_status+"</td><td>"+
				one.create_time+"</td><td>"+
				chakan+answerq+"<button class='btn btn-default btn-sm delanswer' type='button' data-qid="+
				one.id+">删除</button></td></tr>";
			else s+="<tr><td><img class='img-circle' style='width:50px' src='"+
				one.faceUrl+"'></td><td>"+
				one.nickname+"</td><td>"+
				one.credit+"</td><td>"+
				one.mobile+"</td><td><a target='blank' href='http://shang.qq.com/email/stop/email_stop.html?qq="+
				one.qq+"'>"+
				one.qq+"</td><td>"+
				one.title+"</td><td style='"+cls+"'>"+
				solve_status+"</td><td>"+
				one.create_time+"</td><td>"+
				chakan+shanchu+"</td></tr>";
		}
		if(type==0){
			$("#mycar_list").html(s);
			$("#mycarlist_footer").html(page(data,obj));
		}else{
			$("#myanswer_list").html(s);
			$("#myanswer_footer").html(page(data,obj));
		}
	}else{
		tip(data.statusStr);
	}
}
function ret_complain(data,obj){
	if(data.statusCode=="100000"){
		$('#myModal_complain').modal('hide'); 
		$("#myanswer_list .complain[data-qid='"+obj.qid+"']").text('已投诉');
	}
	tip(data.statusStr);
}
function ret_delete_anwser(data,obj,other){
	if(data.statusCode=="100000"){
		$(other).parent().parent().remove();
	}
}			
/*-------------------------other-------------------------------------------*/
function landreg_commot(obj){
	sessionStorage.tokenId=obj.data.tokenId;
	sessionStorage.secretKey=obj.data.secretKey;
	sessionStorage.userId=obj.data.userInfo.id;
	sessionStorage.wallet=obj.data.userInfo.wallet;
	sessionStorage.ability=obj.data.userInfo.ability;
	sessionStorage.credit=obj.data.userInfo.credit;
	sessionStorage.nickname=obj.data.userInfo.nickname;
	sessionStorage.qq=obj.data.userInfo.qq;
	sessionStorage.mobile=obj.data.userInfo.mobile;
	sessionStorage.faceUrl=obj.data.userInfo.faceUrl;
	sessionStorage.skill=obj.data.userInfo.skill;
	sessionStorage.is_set=obj.data.userInfo.is_set;
	island();
}
/*--登陆后导航显示用户昵称和退出--*/
function island(){
	if(notblank(sessionStorage.tokenId)&&notblank(sessionStorage.secretKey)){
		$("#top_landreg").hide();
		$("#logout").show();
		$("#say_hello").text("你好,"+sessionStorage.nickname);
	}
}
/*--记住密码--*/
function jizu_pass(){
	if(notblank(localStorage.jizhu_pass)&&localStorage.jizhu_pass==1){
		$("#jizhu_pass").attr('checked',true);
		$("#land_mobile").val(localStorage.login_name);
		$("#land_pwd").val(localStorage.login_pass);
	}
}
function ret_logout(data){
	logout_clear();
}
function logout_clear(){
	sessionStorage.removeItem("tokenId");
	sessionStorage.removeItem("secretKey");
	sessionStorage.removeItem("userId");
	sessionStorage.removeItem("wallet");
	sessionStorage.removeItem("ability");
	sessionStorage.removeItem("credit");
	sessionStorage.removeItem("nickname");
	sessionStorage.removeItem("qq");
	sessionStorage.removeItem("mobile");
	sessionStorage.removeItem("faceUrl");
	sessionStorage.removeItem("skill");
	sessionStorage.removeItem("is_set");
	$("#top_landreg").show();
	$("#logout").hide();
	$("#say_hello").text("");
	if((window.location.pathname+"").indexOf('index.html')==-1)window.location="index.html";
}
function page(data,obj){
	var totalPage=parseInt(data.data.totalPage);
	var p="";
	var page=parseInt(obj.pageNo);
	var cls="";
	if(totalPage<11){
		for(var i=1;i<=totalPage;i++){
			if(page==i)cls="active";
			else cls="";
			p+='<li class="'+cls+'"><a href="#" data-p='+i+'>'+i+'</a></li>';
		}	
	}else{
		if(page==1)p+='<li class="disabled"><a href="#" data-p=0>&laquo;</a></li>';
		else if(page<totalPage)p+='<li><a href="#" data-p='+(page-1)+'>&laquo;</a></li>';
		
		if(page==1)p+='<li class="active"><a href="#" data-p=1>1</a></li>'; 
		else p+='<li><a href="#" data-p=1>1</a></li>';
		
		p+='<li><a href="#" data-p=0>...</a></li>';
		
		var j=2;
		if(page!=1)j=parseInt(page);
		for(var i=j;i<(j+10)&&i<totalPage;i++){
			if(page==i)cls="active";
			else cls="";
			p+='<li class="'+cls+'"><a href="#" data-p='+i+'>'+i+'</a></li>';
		}
		p+='<li><a href="#" data-p=0>...</a></li>';
		
		if(page==totalPage)p+='<li class="active"><a href="#"   data-p='+totalPage+'>'+totalPage+'</a></li>';
		else p+='<li><a href="#"  data-p='+totalPage+'>'+totalPage+'</a></li>';
		
		if(page==totalPage)p+='<li class="disabled"><a href="#"  data-p=0>&raquo;</a></li>'; 
		else p+='<li><a href="#" data-p='+(page+1)+' >&raquo;</a></li>';
	}
	return p;
}
function paint_first_category(list){
	for(var i=0;i<list.length;i++){
		var one=list[i];
		var sel="";
		if(sessionStorage.first_category_me==one.id)sel="selactive"; 
		s='<li class="'+
			sel+'"  data-id='+
			one.id+'><a href="index.html" style="color: #FFFFFF;">'+
			one.catalog_name+'</a></li>';
		$('#first_category').append(s);
	} 
}
function paint_ad_list(list){
	var s="";
	var ss="";
	for(var i=0;i<list.length;i++){
		var one=list[i];
		var active="";
		if(i==0)active="active";
		s+='<li data-target="#myCarousel" data-slide-to="'+i+'" class="'+active+'"></li>';
		ss+='<div class="item '+
			active+'"><a href="'+
			one.href+'" target="blank"><img src="'+
			one.img+'" alt="'+
			one.title+'" style="width: 100%;"></a></div>';
	}
	$('#ad_list_point').html(s);
	$('#ad_list_img').html(ss);
}
function paint_ranking_list(list){
	var s="";
	for(var i=0;i<list.length;i++){
		var one=list[i];
		var active="";
		if(i==0)active="active";
		s+='<div class="media"><a class="pull-left"><img class="media-object" src="'+
			one.faceUrl+'" alt="'+
			one.nickname+'" style="border-radius: 50% 50%;width: 40px;"></a><div class="media-body fontfamilyh"><h5 class="media-heading  fontfamilyw">'+
			one.nickname+'</h5>本月赚'+
			one.make_money+'元</div></div>';
	}
	$('#ranking_list').html(s);
}
function anwerRightNow(obj2){
	if(!notgohome()){tip("请登录！",5);return;}
	var obj=JSON.parse(obj2.attr("data-desc"));
	$('#arn_face').attr('src',obj.faceUrl);
	$('#arn_nickname').text(obj.nickname);
	$('#arn_title').text(obj.title);
	$('#arn_say').text("[JF3Q]我是"+sessionStorage.nickname+"(QQ："
			+sessionStorage.qq+"，手机号："+sessionStorage.mobile+"),我可以解决  "
			+obj.title.substring(0,10)+"...");
	var source="userId"+sessionStorage.userId;
	var sign=md5(source+"key"+sessionStorage.secretKey).toUpperCase();
	ajax({method:"answer_or_car",
		qid:obj.id,
		type:1,
		userId:sessionStorage.userId,
		source:source,
		sign:sign,
		tokenId:sessionStorage.tokenId},null,obj2);
}
/*---------图片操作--------------------------------------------*/
function getObjectURL(file){
	var url=null 
	if(window.createObjectURL!=undefined){
	    url=window.createObjectURL(file)
	}else if(window.URL!=undefined){
		url=window.URL.createObjectURL(file)
	} else if(window.webkitURL!=undefined){
		url=window.webkitURL.createObjectURL(file)
	}
	return url;
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
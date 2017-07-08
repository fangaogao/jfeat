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

<body style="background: none;background: #ffffff;">
	<div class="container-fluid">
		<div class="info-center">
			<div class="page-header">
				<div class="pull-left">
					<h4>用户列表</h4>
				</div>
			</div>
			<div class="info-center-title">
				<a class="btn btn-success pull-left" href="${ctx }/users/toAdd">添加用户</a>
				<form method="post" action="${ctx}/users/list">
					<input type="text" name="mobile" value="${mobile }"
						class="form-control" placeholder="请输入手机"
						style="width: 200px; float: left; margin-left: 20px;">
					<div class="input-group" style="width: 300px; float: left;">
						<input name="nickname" type="text" value="${nickname }"
							class="form-control" placeholder="请输入昵称"> 
							<span class="input-group-btn">
								<button class="btn btn-primary" type="submit">搜索</button>
							</span>
					</div>
				</form>
			</div>
			<div class="clearfix"></div>
			<div class="table-margin">
				<table class="table table-bordered table-header">
					<thead>
						<tr>
							<td><input type="checkbox" id="checkalls"></td>
							<td>id</td>
							<td>昵称</td>
							<td>电话</td>
							<td>状态</td>
							<td>注册时间</td>
							<td>来源</td>
							<td class="w45">操作</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${li}" varStatus="status">
							<tr>
								<td><input type="checkbox" value="${item.uid }" class="checkitem"></td>
								<td>${item.uid }</td>
								<td>${item.nickname }</td>
								<td>${item.mobile }</td>
								<td>${item.status==1?'启用':'禁用' }</td>
								<td>${item.cts }</td>
								<td>${item.userfrom==1?'用户自己注册':'后台管理员添加' }</td>
								<td><a class="btn btn-info"
									href="${ctx }/users/initPwd?uid=${item.uid}&pageNo=${pageNo}">初始化密码</a>
									<c:if test="${item.status eq 1 }">
										<a class="btn btn-danger"
											href="${ctx }/users/changeStatus?uid=${item.uid}&pageNo=${pageNo}">禁用</a>
									</c:if> <c:if test="${item.status eq 0 }">
										<a class="btn btn-success"
											href="${ctx }/users/changeStatus?uid=${item.uid}&pageNo=${pageNo}">启用</a>
									</c:if> <a class="btn btn-warning"
									href="${ctx }/users/toUpdate?uid=${item.uid}">修改</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="info-center-title" style="clear: both;">
			<form action="" method="post">
				<input type="hidden" name="ids">
				
				<input type="hidden" name="pageNo" value=${pageNo }>
				<input type="hidden" name="sort" value=${sort }>
				<input type="hidden" name="mname" value=${mname }>
				
				<button class="btn btn-success pull-left piliang" data-action="${ctx }/users/useIds" type="submit" style="margin-right: 10px;">批量启用账号</button>
				<button class="btn btn-danger pull-left piliang" data-action="${ctx }/users/nouseIds" type="submit" style="margin-right: 10px;">批量禁用账号</button>
				<button class="btn btn-info pull-left piliang" data-action="${ctx }/users/initPwdIds" type="submit" style="margin-right: 10px;">批量初始化密码</button>
			</form>
			 
		</div>
		<div style="text-align: center;clear: both;">
			<form method="post" action="${ctx}/users/list">
				<input type="hidden" name="mobile" value="${mobile }"> <input
					type="hidden" name="nickname" value="${nickname }">
				<%@ include file="page.jsp"%>
			</form>
		</div>
		
		 
	</div>



<script type="text/javascript">
/*批量复选框全选或者取消选中操作*/
$('#checkalls').click(function(){
	if($(this).is(':checked')){
		$('.checkitem').prop("checked", true);
	}else{
		$('.checkitem').prop("checked", false);
	}
});
/*点击批量按钮，提交到不同的action*/
$('.piliang').click(function(){
	var all=$('.checkitem:checked');
	if(all.length==0){
		alert("请选择数据")
		return false;
	}
	var ids='';
	for(var i=0;i<all.length;i++){
		ids+=$(all[i]).val()+",";
	}
	$('input[name=ids]').val(ids);
	$(this).parent().attr('action',$(this).attr('data-action')).submit();
});
</script>



</body>
</html>

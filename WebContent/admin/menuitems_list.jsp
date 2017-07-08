<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>菜单管理</title>
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
				<a class="btn btn-success pull-left" href="${ctx}/menuitems/toAdd">添加菜单</a>
				<form method="post" action="${ctx}/menuitems/list">
					<input type="text" name="mname" value="${mname }"
						class="form-control" placeholder="请输入菜单名称"
						style="width: 200px; float: left; margin-left: 20px;">
					<div class="input-group" style="width: 300px; float: left;">
						<select name="sort" class="form-control">
							<c:choose>
								<c:when test="${sort=='cts' or empty sort }">
									<option value="cts" selected="selected" >创建时间</option>
									<option value="msort">排序字段</option>
								</c:when>
								<c:otherwise>
									<option value="cts">创建时间</option>
									<option value="msort"  selected="selected" >排序字段</option>
								</c:otherwise>
							</c:choose>
						</select> 
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
							<td>名称</td>
							<td>图标</td>
							<td>状态</td>
							<td>创建时间</td>
							<td>排序</td>
							<td class="w45">操作</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${li}" varStatus="status">
							<tr>
								<td><input type="checkbox" value="${item.uid }" class="checkitem"></td>
								<td>${item.mid }</td>
								<td>${item.mname }</td>
								<td><img src="${imgctx}${item.icon }" style="width:30px;"></td>
								<td>${item.status==1?'启用':'禁用' }</td>
								<td>${item.cts }</td>
								<td>${item.msort}</td>
								<td>
									<c:if test="${item.status eq 1 }">
										<a class="btn btn-danger"
											href="">禁用</a>
									</c:if> 
									<c:if test="${item.status eq 0 }">
										<a class="btn btn-success"
											href="">启用</a>
									</c:if> 
									<a class="btn btn-warning"
									href="">修改</a>
									<a class="btn btn-danger"
									href="">删除</a>
								</td>
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
				 
				
				<button class="btn btn-success pull-left piliang" data-action="" type="submit" style="margin-right: 10px;">批量启用菜单</button>
				<button class="btn btn-danger pull-left piliang" data-action="" type="submit" style="margin-right: 10px;">批量禁用菜单</button>
				<button class="btn btn-danger pull-left piliang" data-action="" type="submit" style="margin-right: 10px;">
					<span class="glyphicon glyphicon-trash"></span>&nbsp;批量删除
				</button>
			</form>
			 
		</div>
		<div style="text-align: center;clear: both;">
			<form method="post" action="${ctx}/menuitems/list">
				<input type="hidden" name="sort" value="${sort }">
				<input type="hidden" name="mname" value="${mname }">
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

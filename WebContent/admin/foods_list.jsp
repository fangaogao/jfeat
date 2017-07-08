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
.foodimgs span{
	display: inline-block;
	width: 24%;
	padding: 3px 3px;
	border:1px solid #cfcfcf;
	float: left;
}
.foodimgs span img{
	width: 100%;
}
</style>
</head>

<body style="background: none;background: #ffffff;">
	<div class="container-fluid">
		<div class="info-center">
			<div class="page-header">
				<div class="pull-left">
					<h4>菜品列表</h4>
				</div>
			</div>
			<div class="info-center-title">
				<a class="btn btn-success pull-left" href="${ctx }/foods/toAdd">添加菜品</a>
				<form method="post" action="">
					<input type="text" name="" value=""
						class="form-control" placeholder="请输入商品名称"
						style="width: 200px; float: left;">
					<select name="" class="form-control" style="width: 200px; float: left; ">
						<option value="" selected="selected" >请选择</option>
						<option value="">上架</option>
						<option value="msort">下架</option>
					</select> 
					<select name="" class="form-control" style="width: 200px; float: left;">
						<option value="" selected="selected" >请选择菜单</option>
						<option value="">炒面</option>
						<option value="msort">炒饭</option>
					</select>
					<div class="input-group" style="width: 300px; float: left;">
						<select name="" class="form-control">
							<option value="" selected="selected" >创建时间</option>
							<option value="msort">排序字段</option>
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
							<td>价格</td>
							<td>上/下架</td>
							<td>上/下价时间</td>
							<td>状态</td>
							<td>所属菜单</td>
							<td>排序</td>
							<td>备注</td>
							<td>创建时间</td>
							<td class="w45">操作</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${li}" varStatus="status">
							<tr>
								<td><input type="checkbox" class="checkitem"></td>
								<td>${item.fid }</td>
								<td>${item.fname }</td>
								<td>${item.price }/${item.unit }</td>
								<td>${item.putaway eq 1?"上架":"下架" }</td>
								<td>${item.pts} </td>
								<td>${item.staus eq 1?"启用":"禁用" }</td>
								<td>${item.mname}</td>
								<td>${item.fsort}</td>
								<td>${item.note}</td>
								<td>${item.cts}</td>
								<td class="w45">
									<a class="btn btn-info seedesc"
									href="#" 
									data-fdesc='${item.fdesc}'
									data-d='{"fname":"${item.fname }","price":"${item.price }","unit":"${item.unit }","putaway":${item.putaway },"pts":"${item.pts }","status":${item.status },"mname":"${item.mname }","foodimg1":"${item.foodimg1 }","foodimg2":"${item.foodimg2 }","foodimg3":"${item.foodimg3 }","foodimg4":"${item.foodimg4 }","foodimg5":"${item.foodimg5 }","foodimg6":"${item.foodimg6 }","foodimg7":"${item.foodimg7 }","foodimg8":"${item.foodimg8 }","note":"${item.note}"}'>查看详情</a>
									<c:if test="${item.putaway eq 1 }">
										<a class="btn btn-danger"
											href="">下架</a>
									</c:if> <c:if test="${item.putaway eq 0 }">
										<a class="btn btn-success"
											href="">上架</a>
									</c:if> <a class="btn btn-warning"
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
				 
				<button class="btn btn-success pull-left piliang" data-action="" type="submit" style="margin-right: 10px;">批量上架</button>
				<button class="btn btn-danger pull-left piliang" data-action="" type="submit" style="margin-right: 10px;">批量下架</button>
				<button class="btn btn-danger pull-left piliang" data-action="" type="submit" style="margin-right: 10px;">
					<span class="glyphicon glyphicon-trash"></span>&nbsp;批量删除
				</button>
			</form>
			 
		</div>
		<div style="text-align: center;clear: both;">
			<form method="post" action="${ctx}/foods/list">
				 
				<%@ include file="page.jsp"%>
			</form>
		</div>
		
		 
	</div>
	
<!-- 查看详情弹出框 -->
<div class="modal fade" id="seedesc_modal" tabindex="-1" role="dialog" aria-labelledby="seedesc_modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					商品详情
				</h4>
			</div>
			<div class="modal-body" id="desc_body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
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
$('.seedesc').click(function(){//
	var obj=$.parseJSON($(this).attr('data-d'));
	var fdesc=$(this).attr('data-fdesc');
	var s="<h4>"+obj.fname+"</h4><p>价格:"+obj.price+"/"+obj.unit+
		"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;菜单："+obj.mname+"</p>";
	if(obj.status==1){
		if(obj.putaway==1)s+="<p><span style='color:green'>上架</span>&nbsp;时间："+obj.pts+"</p>";
		if(obj.putaway==0)s+="<p><span style='color:red'>下架</span>时间："+obj.pts+"</p>";
	}else{
		s+="<p><span style='color:red'>禁用</span>(原因：菜单被禁用)</p>";
	}
	s+="<p>备注："+obj.note+"</p><hr>";
	
	var imgctx="${imgctx}";
	s+="<h4 style='clear:both'>商品图片</h4>";
	s+="<div class='foodimgs'>";
	if(obj.foodimg1.length>0)s+="<span><img src='"+imgctx+obj.foodimg1+"'></span>";
	if(obj.foodimg2.length>0)s+="<span><img src='"+imgctx+obj.foodimg2+"'></span>";
	if(obj.foodimg3.length>0)s+="<span><img src='"+imgctx+obj.foodimg3+"'></span>";
	if(obj.foodimg4.length>0)s+="<span><img src='"+imgctx+obj.foodimg4+"'></span>";
	if(obj.foodimg5.length>0)s+="<span><img src='"+imgctx+obj.foodimg5+"'></span>";
	if(obj.foodimg6.length>0)s+="<span><img src='"+imgctx+obj.foodimg6+"'></span>";
	if(obj.foodimg7.length>0)s+="<span><img src='"+imgctx+obj.foodimg7+"'></span>";
	if(obj.foodimg8.length>0)s+="<span><img src='"+imgctx+obj.foodimg8+"'></span>";
	s+="</div>";
	
	s+="<h4 style='clear:both;line-height:50px;'>商品详情</h4>";
	s+="<div>"+fdesc+"</div>";
	
	$('#desc_body').html(s);
	$('#seedesc_modal').modal('show');
})
</script>



</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>分页</title>
<%@ include file="common.jsp"%>
 
</head>

<body>
	<ul class="pagination"  id="pagelist">
	<input type="hidden" value="${pageNo }" name="pageNo" id="pageNo"/>
 	<button type="submit" style="display: none" id="sub"></button>
			<c:if test="${pages gt 1}">
				<li><a href="#"  data-p=1>首页</a></li>
				<c:if test="${pageNo-1 gt 0 }">
					<li><a href="#" data-p=${pageNo-1 }>&laquo;</a></li>
				</c:if>
			</c:if>
			
			<c:if test="${pages<=10}">
				<c:forEach begin="1" end="${pages }" var="i">
					<c:choose>
						<c:when test="${i eq pageNo }">
							 <li class="active"><a href="#" data-p=${i } >${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#" data-p=${i }>${i}</a></li>
				 	 	</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>
			<c:if test="${pages>10}">
				<c:if test="${pageNo-5>0}">
					<c:if test="${pageNo+5>=pages}">
						<c:forEach begin="${pages-9 }" end="${pages}" var="i">
							<c:choose>
								<c:when test="${i eq pageNo }">
									   <li class="active"><a href="#" data-p=${i } >${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#" data-p=${i }>${i}</a></li>
						 	 	</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
				 	<c:if test="${pageNo+5<pages}">
						<c:forEach begin="${pageNo-5 }" end="${pageNo+4}" var="i">
							<c:choose>
								<c:when test="${i eq pageNo }">
									  <li class="active"><a href="#" data-p=${i } >${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#" data-p=${i }>${i}</a></li>
						 	 	</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
				</c:if>
				<c:if test="${pageNo-5<=0}">
				 	<c:forEach begin="1" end="10" var="i">
						<c:choose>
							<c:when test="${i eq pageNo }">
								   <li class="active"><a href="#" data-p=${i } >${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#" data-p=${i }>${i}</a></li>
					 	 	</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if> 
			</c:if>
	 
			 
			
			<c:if test="${pages gt 1}">
				<c:if test="${pageNo+1 lt pages or pageNo+1 eq pages }">
					<li><a href="#" data-p=${pageNo+1 } >&raquo;</a></li>
				</c:if>
				<li><a href="#"  data-p=${pages }>尾页</a></li>
			</c:if>
	</ul>
	 
	<p>共${count }条数据,共${pages }页</p>
 
<script type="text/javascript">
 $("#pagelist a").click(function(){
	 $("#pageNo").val( $(this).attr("data-p"));
	 $("#sub").click();
	 return false;
 })
 </script>
</body>
	 


</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/tag.jsp"%>
<c:set var="com" value="${ctx }/product"/>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${com }/list.html">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>标题：<input type="text" name="product.title" value="${entity.title }"/></td>
				<td>描述：<input type="text" name="product.desc" value="${entity.desc }"/></td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${com }/toAdd.html" target="dialog" width="550" height="450" mask="true"><span>添加</span></a></li>
			<li><a class="delete" href="${com }/delete.html?product.id={sid_user}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="edit" href="${com }/toUpdate.html?product.id={sid_user}" target="dialog" width="550" height="450" mask="true"><span>修改</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="5%" class="center">序号</th>
				<th width="10%" class="center">图片</th>
				<th width="20%" class="center">分类</th>
				<th class="center">标题</th>
				<th width="10%" class="center">市场价格</th>
				<th width="10%" class="center">销售价格</th>
				<th width="10%" class="center">是否热销</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${pager.totalRecord == 0 }">
				<tr><td colspan="7" align="center">暂无记录</td></tr>
			</c:if>
			<c:forEach items="${pager.datas}" var="d" varStatus="v">
				<tr target="sid_user" rel="${d.id }">
					<td class="center">${v.index + 1 }</td>
					<td class="center imgs"><img alt="" src="${ctx }/${d.img }" width="50px;" height="50px;"> </td>
					<td class="center">
						<c:forEach items="${s_cs}" var="cs">
							<c:if test="${cs.id eq d.categorySecond.id}">${cs.name }</c:if>
						</c:forEach>
					</td>
					<td class="center">${d.title }</td>
					<td class="center">￥${d.priceMarket }</td>
					<td class="center">￥${d.priceShop }</td>
					<td class="center">
						<c:if test="${d.hot}">热销</c:if>
						<c:if test="${d.hot ne true}">普通</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 这是 分页部分 -->
	<%@ include file="../common/pager.jsp"%>
</div>	
<style type="text/css" media="screen">
    .imgs{text-align:center;}
    .imgs div{height:50px!important;}
</style>
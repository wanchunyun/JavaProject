<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/tag.jsp"%>
<div class="pageContent">
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="5%" class="center">序号</th>
				<th width="10%" class="center">图片</th>
				<th class="center">名称</th>
				<th width="15%" class="center">价格</th>
				<th width="10%" class="center">数量</th>
				<th width="15%" class="center">总价</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="count_" value="0" />
			<c:forEach items="${entity.items}" var="d" varStatus="v">
				<tr target="sid_user" rel="${d.id }">
					<td class="center">${v.index + 1 }</td>
					<td class="center imgs"><img alt="" src="${ctx }/${d.img }" width="50px;" height="50px;"> </td>
					<td class="center">${d.title }</td>
					<td class="center">￥${d.price } 元</td>
					<td class="center">${d.count }</td>
					<td class="center">￥<fmt:formatNumber value="${d.price * d.count } " pattern="0.00" maxFractionDigits="2"/>元</td>
					<c:set var="count_" value="${count_ + d.price * d.count }" />
				</tr>
			</c:forEach>
			<tr>
				<td class="right" colspan="5">总计：</td>
				<td class="center">￥<fmt:formatNumber value="${count_ }" pattern="0.00" maxFractionDigits="2"/>元</td>
			</tr>
		</tbody>
	</table>
</div>
<style type="text/css" media="screen">
    .imgs{text-align:center;}
    .imgs div{height:50px!important;}
</style>
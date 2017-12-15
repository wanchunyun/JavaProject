<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/tag.jsp"%>
<c:set var="com" value="${ctx }/order"/>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${com }/list.html">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>姓名：<input type="text" name="order.name" value="${entity.name }"/></td>
				<td>电话：<input type="text" name="order.phone" value="${entity.phone }"/></td>
				<td>地址：<input type="text" name="order.address" value="${entity.address }"/></td>
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
			<li><a class="edit" href="${com }/toUpdate.html?order.id={sid_user}" target="dialog" width="550" height="300" mask="true"><span>修改</span></a></li>
			<li><a class="add" href="${com }/toInfo.html?order.id={sid_user}" target="dialog" width="600" height="400" mask="true"><span>查看详情</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="5%" class="center">序号</th>
				<th width="10%" class="center">订单号</th>
				<th width="8%" class="center">姓名</th>
				<th width="8%" class="center">电话</th>
				<th class="center">地址</th>
				<th width="8%" class="center">订单金额</th>
				<th width="8%" class="center">付款类型</th>
				<th width="15%" class="center">创建时间</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${pager.totalRecord == 0 }">
				<tr><td colspan="8" align="center">暂无记录</td></tr>
			</c:if>
			<c:forEach items="${pager.datas}" var="d" varStatus="v">
				<tr target="sid_user" rel="${d.id }">
					<td class="center">${v.index + 1 }</td>
					<td class="center">${d.num }</td>
					<td class="center">${d.name }</td>
					<td class="center">${d.phone }</td>
					<td class="center">${d.address }</td>
					<td class="center">￥${d.price }元</td>
					<td class="center">
						<c:if test="${d.type eq 'ICBC-NET-B2C'}">工商银行</c:if>
						<c:if test="${d.type eq 'BOC-NET-B2C'}">中国银行</c:if>
					</td>
					<td class="center"><fmt:formatDate value="${d.createDate}" pattern="yyyy/MM/dd  HH:mm:ss"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 这是 分页部分 -->
	<%@ include file="../common/pager.jsp"%>
</div>
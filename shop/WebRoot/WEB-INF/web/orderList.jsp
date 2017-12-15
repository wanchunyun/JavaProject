<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>订单页面</title>
<link href="${shop}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${shop}/css/cart.css" rel="stylesheet" type="text/css" />
<link href="${shop}/css/product.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${shop}/js/jquery-1.8.3.js"></script>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="container cart">
		<div class="span24">
			<div>
				<ul>
					<li class="current"></li>
					<li><b>我的订单</b></li>
				</ul>
			</div>
			<table>
				<tbody>
					<c:if test="${fn:length(pager.datas) == 0}">
						<tr>
							<th colspan="5">暂无订单</th>
						</tr>
					</c:if>
					<c:forEach var="d" items="${pager.datas}" varStatus="vvv">
						<tr>
							<th colspan="5">
								【${vvv.index + 1 }】&nbsp;&nbsp;收货人：${d.name}&nbsp;&nbsp;&nbsp;&nbsp;
								电话：${d.phone}&nbsp;&nbsp;&nbsp;&nbsp;
								收货地址：${d.address}
								<br>
								订单编号: ${d.num}&nbsp;&nbsp;&nbsp;&nbsp;
								订单金额：￥<font color="red">${d.price }</font>元 &nbsp;&nbsp;&nbsp;&nbsp;
								付款类型：<c:if test="${d.type eq 'ICBC-NET-B2C'}">工商银行</c:if>
										<c:if test="${d.type eq 'BOC-NET-B2C'}">中国银行</c:if> &nbsp;&nbsp;&nbsp;&nbsp;
								订单时间：<fmt:formatDate value="${d.createDate}" pattern="yyyy/MM/dd  HH:mm:ss"/>
							</th>
						</tr>
						<tr>
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>数量</th>
							<th>小计</th>
						</tr>
						<c:forEach var="item" items="${d.items}">
							<tr>
								<td width="60">
									<a href="${ctx }/findByPid.html?product.id=${item.pid}"><img src="${ctx}/${item.img}" /></a>
								</td>
								<td>${item.title}</td>
								<td>￥ ${item.price} 元</td>
								<td class="quantity" width="60">${item.count}</td>
								<td width="140"><span class="subtotal">￥ ${item.price * item.count} 元</span></td>
							</tr>
						</c:forEach>
					</c:forEach>
					<tr>
						<th colspan="5">
							<c:if test="${fn:length(pager.datas) != 0}">
								<c:set var="pager_url" value="${ctx}/orderList.html"></c:set>
								<%@ include file="pager.jsp"%>
							</c:if>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
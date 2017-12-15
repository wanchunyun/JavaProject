<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>购物车</title>
<link href="${shop}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${shop}/css/cart.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="header.jsp"%>
	
	<div class="container cart">
		<c:if test="${fn:length(s_cart) != 0}">
			<div class="span24">
				<table>
					<tbody>
						<tr>
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>数量</th>
							<th>小计</th>
							<th>操作</th>
						</tr>
						<c:set var="total" value="0" />
						<c:forEach var="cartItem" items="${s_cart}">
							<tr>
								<td width="60">
									<a href="${ctx }/findByPid.html?product.id=${cartItem.pid }">
										<img src="${ctx}/${cartItem.product.img}" />
									</a>
								</td>
								<td>
									<a href="${ctx }/findByPid.html?product.id=${cartItem.pid }">${cartItem.product.title}</a>
								</td>
								<td>￥${cartItem.price} 元</td>
								<td class="quantity" width="60">${cartItem.count}</td>
								<td width="140"><span class="subtotal">总价：￥${cartItem.count * cartItem.price} 元</span></td>
								<td><a href="${ctx}/removeCart.html?product.id=${cartItem.pid }" class="delete">删除</a></td>
							</tr>
							<c:set var="total" value="${cartItem.count * cartItem.price + total}" />
						</c:forEach>
					</tbody>
				</table>
				
				<div class="total">
					商品金额: <strong id="effectivePrice">￥${total } 元</strong>
				</div>
				<div class="bottom">
					<a href="${ctx }/clearCart.html" id="clear" class="clear">清空购物车</a>
					<a href="${ctx}/viewOrder.html" id="submit" class="submit">提交订单</a>
				</div>
			</div>
		</c:if>
		
		<c:if test="${fn:length(s_cart) == 0}">
			<div class="span24">
				<div class="step step1">
					<center style="color: red">
						<span><h2><a href="${ctx }/index.html"><br>亲!您还没有购物!请先去购物!</a></h2></span>
					</center>
				</div>
			</div>
		</c:if>
	</div>
	
	<%@ include file="footer.jsp"%>
</body>
</html>
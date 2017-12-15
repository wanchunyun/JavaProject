<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="tag.jsp"%>
<div class="container header">
		<div class="span5">
			<div class="logo">
				<a><img src="${shop}/image/r___________renleipic_01/logo.jpg" alt="网上商城" /> </a>
			</div>
		</div>
		<div class="span9">
			<div class="headerAd">
				<img src="${shop}/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
			</div>
		</div>
	<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				<c:if test="${s_user == null }">
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="${ ctx }/toLogin.html">登录</a>|
					</li>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
						<a href="${ ctx }/toRegister.html">注册</a>|
					</li>
				</c:if>
				<c:if test="${s_user != null}">
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						欢迎您：<c:out value="${s_user.username }"/> |
					</li>
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="${ ctx }/orderList.html">我的订单</a> |
					</li>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
						<a href="${ ctx }/logout.html">退出</a>|
					</li>
				</c:if>
				<li><a href="${ctx }/about.html?id=10">购物指南</a> |</li>
				<li><a href="${ctx }/about.html?id=1">关于我们</a> |</li>
				<li><a target="_blank" href="${ctx }/admin/index.html"><span style="color: red;">后台登陆</span></a></li>
			</ul>
		</div>
		<div class="cart">
			<a href="${ctx}/toCart.html">购物车(${fn:length(s_cart)})</a>
		</div>
		<div class="phone">
			客服热线: <strong>029-83145678</strong>
		</div>
	</div>
	<div class="span24">
		<ul class="mainNav">
			<li><a href="${ ctx }/index.html">首页</a>|</li>
			<s:action name="menu" namespace="/index" executeResult="true"></s:action>
			<c:forEach items="${s_category}" var="c">
			<li><a href="${ ctx }/findByCid.html?product.id=${c.id}">${c.name}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
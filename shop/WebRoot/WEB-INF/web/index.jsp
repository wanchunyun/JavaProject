<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>考拉商城</title>
<link href="${shop}/css/slider.css"	rel="stylesheet" type="text/css" />
<link href="${shop}/css/common.css"	rel="stylesheet" type="text/css" />
<link href="${shop}/css/index.css"	rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="container index">

		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
				<div class="title">
					<strong>热门商品</strong>
				</div>
				<ul class="tab">
					<li class="current"><a href="#" target="_blank"></a></li>
					<li><a target="_blank"></a></li>
					<li><a target="_blank"></a></li>
				</ul>

				<ul class="tabContent" style="display: block;">
					<c:forEach var="p" items="${hList.datas}">
						<li><a href="${ctx }/findByPid.html?product.id=${p.id}" target="_self"><img src="${ctx}/${p.img }" style="display: block;" /></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="span24">
			<div id="newProduct" class="newProduct clearfix">
				<div class="title">
					<strong>最新商品</strong> <a target="_blank"></a>
				</div>
				<ul class="tab">
					<li class="current"><a href="#" target="_blank"></a></li>
					<li><a target="_blank"></a></li>
					<li><a target="_blank"></a></li>
				</ul>
				<ul class="tabContent" style="display: block;">
					<c:forEach var="p" items="${nList.datas}">
						<li><a href="${ctx }/findByPid.html?product.id=${p.id}" target="_self"><img src="${ctx}/${p.img }" style="display: block;" /></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
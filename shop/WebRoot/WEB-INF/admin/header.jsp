<%@ page contentType="text/html;charset=UTF-8" %>
<div id="header">
	<div class="headerNav">
		<a class="logo">标志</a>
		<ul class="nav">
			<li style="color: white;">欢迎您：${admin.username }</li>
			<li><a href="${ctx }/admin/index.html">我的主页</a></li>
			<li><a href="${ctx }/admin/toPsw.html" target="dialog" width="520" height="180" mask="true">修改密码</a></li>
			<li><a href="${ctx }/admin/logout.html">退出</a></li>
		</ul>
		<ul class="themeList" id="themeList">
			<li theme="default"><div class="selected">蓝色</div></li>
			<li theme="green"><div>绿色</div></li>
			<li theme="purple"><div>紫色</div></li>
			<li theme="silver"><div>银色</div></li>
			<li theme="azure"><div>天蓝</div></li>
		</ul>
	</div>
	<!-- navMenu -->
</div>
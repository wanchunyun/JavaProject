<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统</title>
<link href="${dwz }/themes/css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="login">
		<div id="login_header">
			<h1 class="login_logo">
				<a href="#"><img src="${dwz }/themes/default/images/login_logo.jpg" /></a>
			</h1>
			<div class="login_headerContent">
				<div class="navList">
					<ul>
						<li><a href="#">设为首页</a></li>
						<li><a href="#">反馈</a></li>
						<li><a href="#">帮助</a></li>
					</ul>
				</div>
				<h2 class="login_title"></h2>
			</div>
		</div>
		<div id="login_content">
			<div class="loginForm">
				<form action="login.html" method="post">
					<p>
						<label>用户名：</label>
						<input type="text" name="user.username" size="20" class="login_input" value="admin" maxlength="20" required="required"/>
					</p>
					<p>
						<label>密码：</label>
						<input type="password" name="user.password" size="20" class="login_input" value="admin" maxlength="20" required="required"/>
					</p>
					<p>
						<span style="color: red;">${msg }</span>
					</p>
					<div class="login_bar">
						<input class="sub" type="submit" value=" "/>
					</div>
				</form>
			</div>
			<div class="login_banner"><img src="${dwz }/themes/default/images/login_banner.jpg" /></div>
			<div class="login_main">
				<ul class="helpList">
					<li><a href="#">下载驱动程序</a></li>
					<li><a href="#">如何安装密钥驱动程序？</a></li>
					<li><a href="#">忘记密码怎么办？</a></li>
					<li><a href="#">为什么登录失败？</a></li>
				</ul>
				<div class="login_inner">
					<p>您可以使用 xxxxxxx.</p>
					<p>您还可以使用 xxxxxxx.</p>
				</div>
			</div>
		</div>
		<div id="login_footer">
			Copyright &copy; 2010-2016 Powered by kaola (939313737). All Rights Reserved.
		</div>
	</div>
</body>
</html>
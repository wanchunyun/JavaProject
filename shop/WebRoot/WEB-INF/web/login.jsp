<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${shop}/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
  $(function(){
	  $("#username").focus(function(){
		  $("#username").val("");
	  });
  })
</script>
<title>会员登录</title>

<link href="${shop}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${shop}/css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container login">
		<div class="span12">
			<div class="ad">
				<img src="${shop}/image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录"/>
			</div>
		</div>
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>会员登录</strong>USER LOGIN
					</div>
					<form action="${ shop }/login.html" method="post">
						<table>
							<tbody>
								<tr>
									<th><span class="requiredField">*</span>用户名:</th>
									<td>
										<input type="text" class="text" name="user.username" id="username" maxlength="20" required="required" value="${entity.username }">
									</td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>密&nbsp;&nbsp;码:</th>
									<td>
										<input type="password" class="text" name="user.password" id="password" maxlength="20" required="required">
									</td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit" value="登 录"/>&nbsp;<label style="color: red;">${msg }</label></td>
								</tr>
								<tr class="register">
									<th>&nbsp;</th>
									<td>
										<dl>
											<dt>还没有注册账号？</dt>
											<dd>
												立即注册即可体验在线购物！ <a href="${ctx }/toRegister.html">立即注册</a>
											</dd>
										</dl>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
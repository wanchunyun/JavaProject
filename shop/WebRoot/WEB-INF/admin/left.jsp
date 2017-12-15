<%@ page contentType="text/html;charset=UTF-8" %>
<div id="leftside">
	<div id="sidebar_s">
		<div class="collapse">
			<div class="toggleCollapse"><div></div></div>
		</div>
	</div>
	<div id="sidebar">
		<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>

		<div class="accordion" fillSpace="sidebar">
			<div class="accordionContent">
				<ul class="tree treeFolder">
					<li><a>个人管理</a>
						<ul>
							<li><a href="${ctx }/admin/info.html" target="navTab" rel="main">个人信息</a></li>
							<li><a href="${ctx }/admin/toPsw.html" target="dialog" width="520" height="180" mask="true">修改密码</a></li>
						</ul>
					</li>
					<li><a>分类管理</a>
						<ul>
							<li><a href="${ctx }/category/list.html" target="navTab" rel="main">分类列表</a></li>
						</ul>
					</li>
					<li><a>商品管理</a>
						<ul>
							<li><a href="${ctx }/product/toList.html" target="navTab" rel="main">商品列表</a></li>
						</ul>
					</li>
					<li><a>订单管理</a>
						<ul>
							<li><a href="${ctx }/order/list.html" target="navTab" rel="main">订单列表</a></li>
						</ul>
					</li>
					<li><a>用户管理</a>
						<ul>
							<li><a href="${ctx }/adminUser/list.html" target="navTab" rel="main">用户列表</a></li>
						</ul>
					</li>
					<li><a>关于我们</a>
						<ul>
							<li><a href="${ctx }/about/list.html" target="navTab" rel="main">关于我们</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/tag.jsp"%>
<h2 class="contentTitle">个人信息</h2>
<div class="pageContent">
	<div class="pageFormContent" layoutH="97">
		<dl class="nowrap">
			<dt>账号：</dt>
			<dd>
				<input type="text" value="${admin.username }" readonly="readonly"/>
			</dd>
		</dl>
		<dl class="nowrap">
			<dt>级别：</dt>
			<dd>
				<input type="text" value="系统管理员" readonly="readonly"/>
			</dd>
		</dl>
	</div>
</div>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/tag.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx }/product/update.html" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<input type="hidden" name="product.id" value="${entity.id }">
			<div class="unit">
				<label>标题：</label>
				<input type="text" name="product.title" size="30" maxlength="20" class="required" value="${entity.title }"/>
			</div>
			<div class="unit">
				<label>市场价格：</label>
				<input type="text" name="product.priceMarket" size="30" maxlength="20" class="required number" value="${entity.priceMarket }"/>
			</div>
			<div class="unit">
				<label>销售价格：</label>
				<input type="text" name="product.priceShop" size="30" maxlength="20" class="required number" value="${entity.priceShop }"/>
			</div>
			<div class="unit">
				<label>商品分类：</label>
				<select class="combox" name="product.categorySecond.id" id="fl">
					<c:forEach items="${s_cs}" var="d">
						<option value="${d.id }">${d.name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="unit">
				<label>是否热销：</label>
				<input type="radio" name="product.hot" value="true"/>热销
				<input type="radio" name="product.hot" value="false"/>普通
			</div>
			<div class="unit">
				<label>图片</label>
				<input name="image" type="file" />
			</div>
			<div class="unit">
				<label>描述：</label>
				<textarea class="editor" name="product.desc" rows="10" cols="50" tools="Cut,Copy,About" maxlength="200">${entity.desc }</textarea>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript">
$(function(){
	// 单选
	$(":radio[name='product.hot'][value='${entity.hot}']").attr("checked","checked");
	// 下拉框
	var cid = '${entity.categorySecond.id}';
	if (cid != ""){
		$('#fl').val(cid);
	}
});
</script>
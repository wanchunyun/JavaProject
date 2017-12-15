<%@ page contentType="text/html;charset=UTF-8" %>
<c:if test="${pager != null && pager.totalRecord gt 0 }">
<form id="pagerForm_" method="post" action="${pager_url }">
	<input type="hidden" id="pageNum" name="pageNum" value="${pager.pageOffset}" />
</form>
<div class="pagination">
	<!-- 二级分类的上一页和下一页 -->
	<span>第 ${pager.pageOffset}/${pager.pageNum} 页</span>
	
	<c:if test="${pager.pageOffset != 1}">
		<!-- 首页 -->
		<span><a class="firstPage" onclick="firstPage();"></a></span>
		<!-- 上一页 -->
		<span><a class="previousPage" onclick="previousPage();"></a></span>
	</c:if>
	
	<!-- 循环页码 -->
	<c:forEach var="i" begin="1" end="${pager.pageNum }">
		<span>
		   <!-- 如果是当前页则不能够点击 -->
		   <c:if test="${i == pager.pageOffset }">
		    	<span class="currentPage">${pager.pageOffset }</span>
		   </c:if>
		   <c:if test="${i != pager.pageOffset }">
				<a onclick="pagerForm(${i});">${i}</a>
			</c:if>
		</span>
	</c:forEach>
	
	<c:if test="${pager.pageOffset != pager.pageNum }">
		<!-- 下一页 -->
		<span><a class="nextPage" onclick="nextPage();"></a></span>
		<!-- 尾页 -->
		<span><a class="lastPage" onclick="lastPage();"></a></span>
	</c:if>
</div>
<script type="text/javascript">
// 首页
function firstPage(){
	pagerForm(1);
}
// 上一页
function previousPage(){
	pagerForm('${pager.pageOffset - 1}');
}
// 下一页
function nextPage(){
	pagerForm('${pager.pageOffset + 1}');
}
// 最后一页
function lastPage(){
	pagerForm('${pager.pageNum}');
}
// 提交表单
function pagerForm(pageSize){
	$("#pageNum").val(pageSize);
	$("#pagerForm_").submit();
}
</script>
</c:if>
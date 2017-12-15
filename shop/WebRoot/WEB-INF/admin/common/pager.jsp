<%@ page contentType="text/html;charset=UTF-8" %>
<div class="panelBar">
	<form id="pagerForm" method="post" action="${com }/list.html">
		<input type="hidden" name="pageNum" value="${pager.pageOffset}" />
	</form>
	<div class="pages">
		<span>每页 10 条，</span>
		<span>共${pager.totalRecord}条，</span>
		<span>共${pager.pageNum}页</span>
	</div>
	<div class="pagination" targetType="navTab" totalCount="${pager.totalRecord}" numPerPage="${pager.pageSize}" pageNumShown="10" currentPage="${pager.pageOffset}"></div>
</div>
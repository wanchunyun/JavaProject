<%@ page contentType="text/html;charset=UTF-8" %>
<div class="span6">
	<div class="hotProductCategory">
		<c:forEach var="c" items="${s_category }">
			<dl>
				<dt>
					<a href="${ctx }/findByCid.html?product.id=${c.id}">${c.name}</a>
				</dt>
				<c:forEach var="cs" items="${c.secondsList}">
					<dd>
						<a href="${ctx }/findByCsid?product.id=${cs.id}">${cs.name}</a>
					</dd>
				</c:forEach>
			</dl>
		</c:forEach>
	</div>
</div>
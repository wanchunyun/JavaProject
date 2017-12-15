<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="common/tag.jsp"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<s:if test="null == #session.admin"><meta http-equiv="refresh" content="0; url=${ctx}/admin/login.jsp"></s:if>
<s:else>
<head>
<title>后台管理页面</title>

<link href="${dwz }/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="${dwz }/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<!--[if IE]>
<link href="${dwz }/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lt IE 9]><script src="${dwz }/js/speedup.js" type="text/javascript"></script><script src="${dwz }/js/jquery-1.11.3.min.js" type="text/javascript"></script><![endif]-->
<!--[if gte IE 9]><!--><script src="${dwz }/js/jquery-2.1.4.min.js" type="text/javascript"></script><!--<![endif]-->

<script src="${dwz }/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${dwz }/js/jquery.validate.js" type="text/javascript"></script>
<script src="${dwz }/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="${dwz }/xheditor/xheditor-1.2.2.min.js" type="text/javascript"></script>
<script src="${dwz }/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="${dwz }/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<!-- 可以用dwz.min.js替换前面全部dwz.*.js (注意：替换时下面dwz.regional.zh.js还需要引入)-->
<script src="${dwz }/bin/dwz.min.js" type="text/javascript"></script>

<script src="${dwz }/js/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	DWZ.init("${dwz }/dwz.frag.xml", {
		loginUrl:"login.html",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		keys: {statusCode:"statusCode", message:"message"}, //【可选】
		ui:{hideMode:'offsets'}, //【可选】hideMode:navTab组件切换的隐藏方式，支持的值有’display’，’offsets’负数偏移位置的值，默认值为’display’
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"${dwz }/themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});
</script>
</head>

<body>
	<div id="layout">
		<!-- 这是 头部分 -->
		<%@ include file="header.jsp"%>
		<!-- 这是 左边部分 -->
		<%@ include file="left.jsp"%>
		<!-- 这是 右边部分 -->
		<%@ include file="right.jsp"%>
	</div>
		<!-- 这是 底部部分 -->
		<%@ include file="footer.jsp"%>
</body>
</s:else>
</html>
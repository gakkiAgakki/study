<%@ page language="java" import="java.util.*" pageEncoding="utf-8" import="java.util.*,com.jspsmart.upload.*" %>
<%@page import="cn.haokeweiye.bean.Message" %>
<%@page import="cn.haokeweiye.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>留言板界面</title>
	<script src="${pageContext.request.contextPath}/js/NotNull.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/easyui/jquery.easyui.min.js" type="text/javascript" charset="utf-8"></script>
	<%--<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>--%>
</head>

<body bgcolor="white" >
<div>

		<input id="yinCang" type="hidden" value="${message}" onclick="dian()">


</div>
</body>
</html>
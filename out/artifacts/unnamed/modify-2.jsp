<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/imagetable.css">
	<style type="text/css">
		body{
			height:500px;
		}
		#divFormId{
			border: 5px solid #999;
			width: 500px;
			margin: 0 auto;
			padding: 50px;
			background-color: #dddddd;
		}
		#divbg{
			background: url(./img/xiangmu.jpg);
			height:100%;
			padding-top: 80px;
		}
	</style>
</head>
<body>
<div id="divbg">
	<div id="divFormId">
	 <h1>留言修改</h1>
	<form action="${pageContext.request.contextPath}/modifyPro" method="post">
	<!-- 修改时要使用 pid -->
		<table border="1" width="100%" class="imagetable">
			<input type="hidden" name="id" value="${message.id }" />
			<tr>
				<td>留言标题</td>
				<td><input type="text" name="title" value="${message.title }"/></td>
			</tr>

			<tr>
				<td>姓名</td>
				<td><input type="text" name="name" value="${message.name }"  /></td>
			</tr>
			<tr>
				<td>电话</td>
				<td>
					<input name="telephone" value="${message.telephone}"></input>
				</td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td>
					<input name="mail" value="${message.mail}"></input>
				</td>
			</tr>
			<tr>
				<td>单位</td>
				<td>
					<input name="unit" style="width: 300px ; height: 50px" value="${message.unit}"></input>
				</td>
			</tr>
			<tr>
				<td>地址</td>
				<td>
					<input name="site" style="width: 300px ; height: 50px" value="${message.site}"></input>
				</td>
			</tr>
			<tr>
				<td>内容</td>
				<td>
					<input size="auto" style="width: 300px ; height: 150px" name="content" value="${message.content}"></input>
					<%--<textarea rows="15" cols="35">${message.content}</textarea>--%>
				</td>
			</tr>
			<%--<tr>--%>
				<%--<td>附件位置</td>--%>
				<%--<td>--%>
					<%--<input size="auto" style="width: 300px ; height: 50px" name="accessory" value="${message.accessory}"></input>--%>
				<%--</td>--%>
			<%--</tr>--%>
			<tr>
				<td colspan="2">
					<input type="submit" value="修改留言"/>
				</td>
			</tr>
		</table>

	</form>
	</div>
</div>
</body>
</html>
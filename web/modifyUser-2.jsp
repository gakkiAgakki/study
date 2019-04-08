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
	 <h1>用户修改</h1>
	<form action="${pageContext.request.contextPath}/modifyUser2" method="post">
	<!-- 修改时要使用 pid -->
		<table border="1" width="100%" class="imagetable">
			<input type="hidden" name="id" value="${user.id }" />
			<tr>
				<td>用户姓名</td>
				<td><input type="text" name="userName" value="${user.userName }"/></td>
			</tr>
			<tr>
				<td>密码(加密后的，可直接修改)</td>
				<td>
					<input size="auto" name="password" value="${user.password}"></input>
				</td>
			</tr>
			<tr>
				<td>关键字</td>
				<td>
					<%--<textarea rows="5" cols="23">${user.keyword}</textarea>--%>
					<input name="keyword" size="auto" value="${user.keyword}"></input>
				</td>
			</tr>
			<tr>
				<td>描述</td>
				<td>
					<%--<textarea rows="10" cols="23">--%>
						<%--${user.description}--%>
					<%--</textarea>--%>
					<input name="description" value="${user.description}"></input>
				</td>
			</tr>
			<tr>
				<td>等级</td>
				<td>
					<%--level的下拉框--%>
						<select name="level" >
							<option value="0" ${user.level == '0' ? 'selected' : ''}>0(管理员最高权限)</option>
							<option value="1" ${user.level == '1' ? 'selected' : ''}>1(第二级可以操作留言，无法操作用户)</option>
							<option value="2" ${user.level == '2' ? 'selected' : ''}>2(第三级只能查看留言)</option>
						</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="修改用户"/>
				</td>
			</tr>
		</table>

	</form>
	</div>
</div>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/4/4
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.haokeweiye.bean.Message" %>
<%@page import="cn.haokeweiye.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Title</title>
    <!-- Bootstrap core CSS -->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <style type="text/css">
        .login{
            position: absolute;
            left: 880px;
            top: 240px;
        }
        body{
            background-image: url(img/bj.png);
            background-size:cover;
        }
    </style>

</head>

<body background="img/bj.png">
    <div class="login">
        <form class="form-signin" id="form1" action="loginServlet" method="post">
            <%--<h2 class="form-signin-heading">留言板</h2>--%>
            <label for="title" class="sr-only">用户名</label>
            <input style="width: 300px;height: 40px" type="text" id="userName" name="userName" class="form-control" placeholder="用户名" required autofocus>
            <label for="name" class="sr-only">密码</label>
            <input style="width: 300px;height: 40px" type="password" id="password" name="password" class="form-control" placeholder="密码" required>
        </form>
        ${msg}<br>
        <script type="text/javascript">
            function chongZhi() {
            window.location.reload(true);
            }
            function login() {
                document.getElementById("form1").submit();
            }
        </script>
        <input type="submit" style="height: 40px;width: 100px" class="btn btn-info" onclick="chongZhi()"  value="重置"/>
        <input id="login" type="submit" style="height: 40px;width: 100px" class="btn btn-info" onclick="login()" value="登录">
    </div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/4/4
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>创建用户</title>

    <script src="js/jquery.min.js" type="text/javascript"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        function findUser() {
            location.href = "${pageContext.request.contextPath}/findUser";
        }
        function creatUser() {
            location.href = "createUser.jsp";
        }
        function management() {
            location.href="${pageContext.request.contextPath}/management";
        }
    </script>

</head>
<body>
<div style="width: 1000px;height: 200px;text-align: center">
    <img src="img/pingtai.png">
</div>
<div class="row" style="width: 1400px">
    <div class="col-xs-3 col-md-2" style="width: 220px">
        <%--<div style="z-index: 9999; position: fixed ! important; left: 0px; top: 0;">--%>
            <%--<div style="height: 200px"></div>--%>
            <div class="row" style="height: 80px">
                <div class="col-xs-8 col-sm-6 col-xs-offset-3">
                    <input  class="btn btn-primary btn-lg" type="submit" style="width: 120px" value="查看用户" onclick="findUser()">
                </div>
            </div>
            <div class="row" style="height: 80px">
                <div class="col-xs-8 col-sm-6 col-xs-offset-3">
                    <input  class="btn btn-primary btn-lg" type="submit" style="width: 120px" value="创建用户" onclick="creatUser()">
                </div>
            </div>
            <div class="row" style="height: 80px">
                <div class="col-xs-8 col-sm-6 col-xs-offset-3">
                    <input  class="btn btn-primary btn-lg" type="submit" style="width: 120px" value="查看留言" onclick="management()">
                </div>
            </div>
        <%--</div>--%>
    </div>
    <div class="col-xs-10 col-md-10">

        <h2>创建用户</h2>
        <form class="form-signin" id="createUser" action="createUser" method="post">
            <%--<h2 class="form-signin-heading">留言板</h2>--%>
            <table style="text-align: center" width="100%"  class="table table-striped table-bordered">
                <tr>
                    <td style="width: 150px">名称</td>
                    <td>
                        <label for="userName" class="sr-only">名称</label>
                        <input style="width: 300px;height: 40px" id="userName" type="text" name="userName" class="form-control" placeholder="名称" required autofocus>
                    </td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td>
                        <label for="password" class="sr-only">密码</label>
                        <input style="width: 300px;height: 40px" id="password" type="password" name="password" class="form-control" placeholder="密码" required autofocus>
                    </td>
                </tr>
                <tr>
                    <td>关键字</td>
                    <td>
                        <label for="keyword" class="sr-only">关键字</label>
                        <input style="width: 300px;height: 40px" id="keyword" type="text" name="keyword" class="form-control" placeholder="关键字" required autofocus>
                    </td>
                </tr>
                <tr>
                    <td>描述</td>
                    <td>
                        <label for="description" class="sr-only">邮箱</label>
                        <%--<input style="width: 300px;height: 40px" id="mail" type="text" value="${message.mail }" name="mail" class="form-control" placeholder="邮箱" required autofocus>--%>
                        <textarea name="description" rows="4" cols="60" class="form-control"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>等级</td>
                    <td>
                        <%--level的下拉框--%>
                        <select id="level" name="level" class="form-control">
                            <option value="2">可查看回复留言</option>
                            <option value="1">可以修改回复审核留言</option>
                            <option value="0">管理员最高权限</option>
                        </select>
                        <script>
                            form.level.value = document.getElementById("level").value;
                        </script>
                    </td>
                </tr>
                <%--<tr>--%>
                    <%--<td>地址</td>--%>
                    <%--<td>--%>
                        <%--<label for="site" class="sr-only">地址</label>--%>
                        <%--<input style="width: 300px;height: 40px" id="theSite" type="hidden" value="${message.site }" class="form-control" placeholder="地址" required autofocus>--%>
                        <%--<textarea id="site" name="site" rows="4" type="text" cols="5"  class="form-control" placeholder="地址" required autofocus></textarea>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<script type="text/javascript">--%>
                    <%--function changeTextarea() {--%>
                        <%--document.getElementById("content").value=document.getElementById("theText").value;--%>
                        <%--document.getElementById("site").value=document.getElementById("theSite").value;--%>
                    <%--}--%>
                <%--</script>--%>
                <%--<tr>--%>
                    <%--<td>内容</td>--%>
                    <%--<td>--%>
                        <%--<label for="content" class="sr-only">内容</label>--%>
                        <%--<input style="width: 600px;height: 100px" type="hidden" id="theText" value="${message.content }" class="form-control" placeholder="内容" required autofocus>--%>
                        <%--<textarea id="content" name="content" rows="10" type="text" cols="80"  class="form-control" placeholder="内容" required autofocus></textarea>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td>附件名</td>--%>
                    <%--<td>--%>
                        <%--<label for="accessory" class="sr-only">附件名</label>--%>
                        <%--<input disabled style="width: 300px;height: 40px" id="accessory" type="text" value="${message.accessory }" name="accessory" class="form-control" placeholder="附件名" required autofocus>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<td>--%>
                <%--<input type="submit" style="height: 40px;width: 100px" class="btn btn-info" value="修改留言">--%>

                <%--</td>--%>
                <%--</tr>--%>
            </table>
        </form>
        <script type="text/javascript">
            function createUser() {
                document.getElementById("createUser").submit();
            }
        </script>
        <input type="submit" style="height: 40px;width: 100px" class="btn btn-info" onclick="createUser()" value="创建用户">

    </div>
</div>
</body>
</html>

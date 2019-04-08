<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/4/4
  Time: 15:04
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

    <title>修改用户信息</title>
    <!-- Bootstrap core CSS -->
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

    <style type="text/css">
        .modify{
            position: absolute;
            left: 400px;
            top: 100px;
        }
    </style>

</head>
<body>
<div class="modify row">
    <div class="col-xs-2 col-md-1" >
        <div style="z-index: 9999; position: fixed ! important; left: 0px; top: 0;">
            <div style="height: 200px"></div>
            <div class="row" style="height: 100px">
                <div class="col-xs-8 col-sm-6 col-xs-offset-3">
                    <input  class="btn btn-info" type="submit" value="查看用户" onclick="findUser()">
                </div>
            </div>
            <div class="row" style="height: 100px">
                <div class="col-xs-8 col-sm-6 col-xs-offset-3">
                    <input  class="btn btn-info" type="submit" value="创建用户" onclick="creatUser()">
                </div>
            </div>
            <div class="row" style="height: 100px">
                <div class="col-xs-8 col-sm-6 col-xs-offset-3">
                    <input  class="btn btn-info" type="submit" value="查看留言" onclick="management()">
                </div>
            </div>
            <div class="row" style="height: 100px">
                <div class="col-xs-8 col-sm-6 col-xs-offset-3">
                    <input  class="btn btn-primary btn-xs" type="button" value="删除选中留言" onclick="delMsgs()">
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-10 col-md-10">

        <h2>修改用户信息</h2>
        <form class="form-signin" id="modifyUser" action="modifyUser2" method="post">
            <%--<h2 class="form-signin-heading">留言板</h2>--%>
            <table width="100%"  class="table table-striped table-bordered">
                <%--隐藏域放入被修改的留言ID--%>
                <input type="hidden" name="id" value="${user.id }" />
                <tr>
                    <td>姓名</td>
                    <td>
                        <label for="userName" class="sr-only">姓名</label>
                        <input style="width: 300px;height: 40px" id="userName" type="text" value="${user.userName }" name="userName" class="form-control" placeholder="姓名" required autofocus>
                    </td>
                </tr>
                <tr>
                    <td>密码(此为加密后的，可直接修改)</td>
                    <td>
                        <label for="password" class="sr-only">姓名</label>
                        <input style="width: 300px;height: 40px" id="password" type="text" value="${user.password }" name="password" class="form-control" placeholder="密码" required autofocus>
                    </td>
                </tr>
                <tr>
                    <td>关键字</td>
                    <td>
                        <label for="keyword" class="sr-only">关键字</label>
                        <input style="width: 300px;height: 40px" id="keyword" type="text" value="${user.keyword }" name="keyword" class="form-control" placeholder="关键字" required autofocus>
                    </td>
                </tr>
                <tr>
                    <td>描述</td>
                    <td>
                        <label for="description" class="sr-only">描述</label>
                        <input style="width: 300px;height: 40px" id="description" type="text" value="${user.description }" name="description" class="form-control" placeholder="描述" required autofocus>
                    </td>
                </tr>
                <tr>
                    <td>等级</td>
                    <td>
                        <%--level的下拉框--%>
                        <select class="form-control" name="level" >
                            <option value="0" ${user.level == '0' ? 'selected' : ''}>0(管理员最高权限)</option>
                            <option value="1" ${user.level == '1' ? 'selected' : ''}>1(第二级可以操作留言，无法操作用户)</option>
                            <option value="2" ${user.level == '2' ? 'selected' : ''}>2(第三级只能查看留言)</option>
                        </select>
                    </td>
                </tr>
                <%--<tr>--%>
                    <%--<td>--%>
                        <%--<input type="submit" style="height: 40px;width: 100px" class="btn btn-info" value="修改用户">--%>

                    <%--</td>--%>
                <%--</tr>--%>
            </table>
        </form>
        <script type="text/javascript">
            function User() {
                    document.getElementById("modifyUser").submit();
            }
        </script>
        <input type="submit" style="height: 40px;width: 100px" class="btn btn-info" onclick="User()" value="修改用户">

    </div>
</div>
</body>
</html>

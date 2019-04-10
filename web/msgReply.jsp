<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/4/9
  Time: 09:36
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

    <title>回复留言</title>
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

        <%--<style type="text/css">--%>
        <%--.modify{--%>
            <%--position: absolute;--%>
            <%--left: 350px;--%>
            <%--top: 0px;--%>
        <%--}--%>
    <%--</style>--%>

</head>
<body onload="changeTextarea()">
    <div style="width: 1000px;height: 200px;text-align: center">
        <img src="img/pingtai.png">
    </div>
    <div class="row" style="width: 1400px">
        <div class="col-xs-3 col-md-2" style="width: 220px" >
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

                    <h2>回复留言</h2>
                <form class="form-signin" id="replyMsg" action="msgReply2" method="post">
                    <%--<h2 class="form-signin-heading">留言板</h2>--%>
                    <table width="100%"  class="table table-striped table-bordered">
                        <%--隐藏域放入被修改的留言ID--%>
                        <input type="hidden" name="id" value="${message.id }" />
                        <tr>
                            <td style="width: 150px">留言标题</td>
                            <td>
                                <label for="title" class="sr-only">留言标题</label>
                                <input disabled style="width: 300px;height: 40px" id="title" type="text" value="${message.title }" name="title" class="form-control" placeholder="留言标题" required autofocus>
                            </td>
                        </tr>
                        <tr>
                            <td>姓名</td>
                            <td>
                                <label for="name" class="sr-only">姓名</label>
                                <input disabled style="width: 300px;height: 40px" id="name" type="text" value="${message.name }" name="name" class="form-control" placeholder="姓名" required autofocus>
                            </td>
                        </tr>
                        <tr>
                            <td>电话</td>
                            <td>
                                <label for="telephone" class="sr-only">电话</label>
                                <input disabled style="width: 300px;height: 40px" id="telephone" type="text" value="${message.telephone }" name="telephone" class="form-control" placeholder="电话" required autofocus>
                            </td>
                        </tr>
                        <tr>
                            <td>邮箱</td>
                            <td>
                                <label for="mail" class="sr-only">邮箱</label>
                                <input disabled style="width: 300px;height: 40px" id="mail" type="text" value="${message.mail }" name="mail" class="form-control" placeholder="邮箱" required autofocus>
                            </td>
                        </tr>
                        <tr>
                            <td>单位</td>
                            <td>
                                <label for="unit" class="sr-only">单位</label>
                                <input disabled style="width: 300px;height: 40px" id="unit" type="text" value="${message.unit }" name="unit" class="form-control" placeholder="单位" required autofocus>
                            </td>
                        </tr>
                        <tr>
                            <td>地址</td>
                            <td>
                                <label for="site" class="sr-only">地址</label>
                                <input style="width: 300px;height: 40px" id="theSite" type="hidden" value="${message.site }" class="form-control" placeholder="地址" required autofocus>
                                <textarea disabled id="site" name="site" rows="4" type="text" cols="5"  class="form-control" placeholder="地址" required autofocus></textarea>
                            </td>
                        </tr>
                            <script type="text/javascript">
                                function changeTextarea() {
                                    document.getElementById("content").value=document.getElementById("theText").value;
                                    document.getElementById("site").value=document.getElementById("theSite").value;
                                    document.getElementById("reply").value=document.getElementById("theReply").value;
                                }
                            </script>
                        <tr>
                            <td>内容</td>
                            <td>
                                <label for="content" class="sr-only">内容</label>
                                <input style="width: 600px;height: 100px" type="hidden" id="theText" value="${message.content }" class="form-control" placeholder="内容" required autofocus>
                                <textarea disabled id="content" name="content" rows="10" type="text" cols="80"  class="form-control" placeholder="内容" required autofocus></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>附件名</td>
                            <td>
                                <label for="accessory" class="sr-only">附件名</label>
                                <input disabled style="width: 300px;height: 40px" id="accessory" type="text" value="${message.accessory }" name="accessory" class="form-control" placeholder="附件名" required autofocus>
                            </td>
                        </tr>
                        <tr>
                            <td>回复内容</td>
                            <td>
                                <label for="reply" class="sr-only">回复内容</label>
                                <input style="width: 600px;height: 100px" type="hidden" id="theReply" value="${message.reply }" class="form-control" placeholder="内容" required autofocus>
                                <c:if test="${message.state == '审核通过'}">
                                    <textarea id="reply" disabled name="reply" rows="10" type="text" cols="80"  class="form-control" placeholder="回复内容" required autofocus></textarea>
                                </c:if>
                                <c:if test="${message.state != '审核通过'}">
                                    <textarea id="reply" name="reply" rows="10" type="text" cols="80"  class="form-control" placeholder="回复内容" required autofocus></textarea>
                                </c:if>

                            </td>
                        </tr>
                    </table>
                </form>
                    <script type="text/javascript">
                        function replyMsg() {
                            document.getElementById("replyMsg").submit();
                        }
                    </script>
                <input type="submit" style="height: 40px;width: 100px" class="btn btn-info" onclick="replyMsg()" value="回复留言">

            </div>
    </div>
</body>
</html>

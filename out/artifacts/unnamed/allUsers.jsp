<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/4/4
  Time: 16:04
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

    <title>全部用户</title>
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

        function del(){
            var flag = window.confirm("确认删除吗?");
            return flag;
        }

        function delUsers(){
            //1、获取所有被选定的商品的 pid
            //A、为每一个复选框添加一个 value 属性，值是该留言的 id
            //B、使用 选择器获取
            var cs = $("input[type='checkbox']:checked");

            //优化:
            if(cs.length == 0){
                return;
            }

            if(!window.confirm("确定删除吗")){
                return;
            }

            //C、使用 JQ 将复选框的 value值组织成一个格式化字符串
            var ids = cs.serialize();//样式: pid=xx&pid=XX...
            //2、提交到服务器的一个Servlet
            location.href = "${pageContext.request.contextPath}/delUsers?" + ids ;
        }
    </script>

    <style type="text/css">
        .modify{
            position: absolute;
            left: 150px;
            top: 0px;
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
                    <input  class="btn btn-primary btn-xs" type="button" value="删除选中用户" onclick="delUsers()">
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-10 col-md-10">

        <h2>用户查询</h2>
            <%--<h2 class="form-signin-heading">留言板</h2>--%>
        <table style="width: 1300px;position: absolute" class="table table-striped table-bordered">
            <%--<tr>--%>
            <%--<th align="right">--%>
            <%--&lt;%&ndash;<input type="button" value="保存" onclick="toSave()"/>&ndash;%&gt;--%>
            <%--<input class="btn btn-primary btn-xs" type="button" value="删除留言" onclick="delMsgs()"/>--%>
            <%--</th>--%>
            <%--</tr>--%>
            <tr>
                <th width="1%">选择</th>
                <th width="2%">id</th>
                <th width="3%">用户名</th>
                <th width="2%">密码</th>
                <th width="4%">关键字</th>
                <th width="7%">描述</th>
                <th width="6%" >等级</th>
                <%--&lt;%&ndash;下拉框，该条留言所属类别&ndash;%&gt;--%>
                <%--<script type="text/javascript">--%>
                    <%--function findByCate() {--%>
                        <%--var options=$("#category option:selected").val(); //获取选中的项--%>
                        <%--window.location.href="findByCateServlet?category="+options;--%>
                    <%--}--%>
                <%--</script>--%>
                <%--<th width="8%">--%>
                    <%--<select class="form-control" id="category" name="category" onchange="findByCate()">--%>
                        <%--<option value="0">请选择留言所属分类</option>--%>
                        <%--<option value="10">查看全部</option>--%>
                        <%--<option value="1">科技项目申报</option>--%>
                        <%--<option value="2">科技成果转化</option>--%>
                        <%--<option value="3">高新技术企业认定</option>--%>
                        <%--<option value="4">技术中心/重点实验室</option>--%>
                        <%--<option value="5">专精特新申报</option>--%>
                        <%--<option value="6">技术改造申报</option>--%>
                        <%--<option value="7">知识产权服务</option>--%>
                        <%--<option value="8">入区申请</option>--%>
                        <%--<option value="9">其他服务</option>--%>
                    <%--</select>--%>
                <%--</th>--%>
                <th>操作</th>
            </tr>

            <c:forEach var="user" items="${userList}" >
                <tr>
                    <td><input class="checkbox" type="checkbox" name="id" value="${user.id }" /></td>
                    <td>${user.id }</td>
                    <td>${user.userName }</td>
                    <td>${user.password }</td>
                    <td>${user.keyword }</td>
                    <td>${user.description }</td>

                    <td>
                        <select  class="form-control" name="level" >
                            <option value="0" ${user.level == '0' ? 'selected' : ''}>0(管理员最高权限)</option>
                            <option value="1" ${user.level == '1' ? 'selected' : ''}>1(第二级可以操作留言，无法操作用户)</option>
                            <option value="2" ${user.level == '2' ? 'selected' : ''}>2(第三级只能查看留言)</option>
                        </select>
                    </td>

                    <td width="5%">
                        <a href="${pageContext.request.contextPath}/modifyUser?id=${user.id}">修改此用户</a>
                        <br/>
                        <a href="${pageContext.request.contextPath}/delUser?id=${user.id}" onclick="return del()" >删除此用户</a>
                    </td>

                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>

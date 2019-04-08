<%@ page import="cn.haokeweiye.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/3/30
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="favicon.ico" rel="icon" type="image/x-icon" />
    <!-- 导入jquery核心类库 -->
    <script type="text/javascript" src="./js/jquery-1.8.3.js"></script>
    <!-- 导入easyui类库 -->
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="./js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="./js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="./css/default.css">
    <script type="text/javascript" src="./js/easyui/jquery.easyui.min.js"></script>
    <!-- 导入ztree类库 -->
    <link rel="stylesheet" href="./js/ztree/zTreeStyle.css" type="text/css" />
    <script src="./js/ztree/jquery.ztree.all-3.5.js" type="text/javascript"></script>
    <script src="./js/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
      
    <script type="text/javascript">

        function findUser() {
            location.href = "${pageContext.request.contextPath}/findUser";
        }
        function creatUser() {
            location.href = "createUser-2.jsp";
        }

        function del(){
            var flag = window.confirm("确认删除吗?");
            return flag;
        }
        function management() {
            location.href="${pageContext.request.contextPath}/management";
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


    <title>查看用户</title>

</head>


<body class="easyui-layout">
<div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>
<div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>
<div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:200px;"></div>
<div data-options="region:'west',title:'West',split:true" style="width:200px;">
    <input type="submit" value="查看用户" onclick="findUser()">
    <input type="submit" value="创建用户" onclick="creatUser()">
    <input type="submit" value="查看留言" onclick="management()">
</div>
<div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;">

    <table border="1" width="40%" class="imagetable" align="center">
        <tr>
            <th>留言列表</th>
        </tr>
    </table>
    <hr/>
    <table border="1" width="100%" class="imagetable">
        <tr>
            <th>
                <input type="button" value="删除用户" onclick="delUsers()"/>
            </th>
        </tr>
        <tr>
            <th>选择</th>
            <th>id</th>
            <th>用户名</th>
            <th>密码</th>
            <th>关键字</th>
            <th>描述</th>
            <th>等级</th>
        </tr>
        <c:forEach var="user" items="${userList}" >
            <tr>
                <td><input type="checkbox" name="id" value="${user.id }"/></td>
                <td>${user.id }</td>
                <td>${user.userName }</td>
                <td>${user.password }</td>
                <td>${user.keyword }</td>
                <td>${user.description }</td>
                <%--<td>${user.level}</td>--%>
                <%--<td>--%>
                    <%--<select id="level" name="level">--%>
                        <%--<option value="2">2(第三级只能查看留言)</option>--%>
                        <%--<option value="1">1(第二级可以操作留言，无法操作用户)</option>--%>
                        <%--<option value="0">0(管理员最高权限)</option>--%>
                    <%--</select>--%>
                <%--</td>--%>
                <td>

                    <select name="level" >
                        <option value="0" ${user.level == '0' ? 'selected' : ''}>0(管理员最高权限)</option>
                        <option value="1" ${user.level == '1' ? 'selected' : ''}>1(第二级可以操作留言，无法操作用户)</option>
                        <option value="2" ${user.level == '2' ? 'selected' : ''}>2(第三级只能查看留言)</option>
                    </select>
                </td>

                    <%--<td>${user.accessory }</td>--%>
                <td width="100px;">
                    <a href="${pageContext.request.contextPath}/modifyUser?id=${user.id}">修改此用户</a>
                    <br/>
                    <a href="${pageContext.request.contextPath}/delUser?id=${user.id}" onclick="return del()" >删除此用户</a>
                </td>
                    <%--<td width="100px;">--%>
                    <%--<a href="${pageContext.request.contextPath}/FinduserAndCategory?pid=${user.pid}">修改此留言</a>--%>
                    <%--<br/>--%>
                    <%--<a href="${pageContext.request.contextPath}/Deluser?pid=${user.pid}" onclick="return del()" >删除此留言</a>--%>
                    <%--</td>--%>
            </tr>
        </c:forEach>
    </table>

</div>



</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/3/30
  Time: 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- 导入jquery核心类库 -->
    <script type="text/javascript" src="./js/jquery-1.8.3.js"></script>
    <!-- 导入easyui类库 -->
    <link rel="stylesheet" type="text/css" href="./js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="./js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="./js/easyui/ext/portal.css">
    <link rel="stylesheet" type="text/css" href="./css/default.css">
    <script type="text/javascript" src="./js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="./js/easyui/ext/jquery.portal.js"></script>
    <script type="text/javascript" src="./js/easyui/ext/jquery.cookie.js"></script>
    <script src="./js/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
    <!-- 导入ztree类库 -->
    <link rel="stylesheet" href="./js/ztree/zTreeStyle.css" type="text/css" />
    <script src="./js/ztree/jquery.ztree.all-3.5.js" type="text/javascript"></script>

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

    <title>create User</title>
</head>
<body class="easyui-layout">
<%--<div region="north" style="height:31px;overflow:hidden;" split="false" border="false">--%>
    <%--<div class="datagrid-toolbar">--%>
        <%--<a id="save" icon="icon-save" href="JavaScript:void(0)" onclick="submitForm('createUser')"  class="easyui-linkbutton" plain="true">保存</a>--%>
    <%--</div>--%>
<%--</div>--%>
<div>
    <div id="divFormId">
    <form id="createUser" method="post" action="createUser">
        <table class="table-edit" width="80%" align="center">
            <tr class="title">
                <td colspan="2">角色信息</td>
            </tr>
            <tr>
                <td>名称</td>
                <td>
                    <input type="text" name="userName" class="easyui-validatebox" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td>密码</td>
                <td>
                    <input type="password" name="password" class="easyui-validatebox" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td>关键字</td>
                <td>
                    <input type="text" name="keyword" class="easyui-validatebox" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td>描述</td>
                <td>
                    <textarea name="description" rows="4" cols="60"></textarea>
                </td>
            </tr>
            <tr>
                <td>等级</td>
                <td>
                    <%--level的下拉框--%>
                    <select id="level" name="level">
                        <option value="2">2(第三级只能查看留言)</option>
                        <option value="1">1(第二级可以操作留言，无法操作用户)</option>
                        <option value="0">0(管理员最高权限)</option>
                    </select>
                    <script>
                        form.level.value = document.getElementById("level").value;
                    </script>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="提交" >
                </td>
            </tr>

                <%--<tr>--%>
                <%--<td>权限选择</td>--%>
                <%--<td id="permissionPosition" >--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>菜单授权</td>--%>
                <%--<td>--%>
                    <%--<!-- 将选中的菜单id放入隐藏域 -->--%>
                    <%--<input type="hidden" name="menuIds" id="menuIds" >--%>
                    <%--<ul id="menuTree" class="ztree"></ul>--%>
                <%--</td>--%>
            <%--</tr>--%>
        </table>
    </form>
    </div>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/3/28
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="favicon.ico" rel="icon" type="image/x-icon" />
    <!-- 导入jquery核心类库 -->
    <script type="text/javascript" src="./js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <!-- 导入easyui类库 -->
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="./js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="./js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="./css/default.css">
    <script type="text/javascript" src="./js/easyui/jquery.easyui.min.js"></script>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/easyui/jquery.easyui.min.js" type="text/javascript" charset="utf-8"></script>

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
        <form id="form1" action="loginServlet" onsubmit="false" method="post">
            <table width="600">
                <tr>
                    <td align="right">用户名:</td>
                    <td><input id="userName" name="userName" type="text"></td>
                </tr>
                <tr>
                    <td align="right" >密    码:</td>
                    <td>
                        <input id="password" name="password" type="password">
                    </td>
                </tr>
                <tr><td>

                </td>
                    <td>
                        ${msg}
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                     <td>
                         <input id="login" type="submit"  value="登录" >
                         <input type="reset" value="重置">
                     </td>
                </tr>

            </table>
        </form>
    </div>
</div>

</body></html>

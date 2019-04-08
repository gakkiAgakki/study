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

        function delMsgs(){
            //1、获取所有被选定的留言的 id
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
            location.href = "${pageContext.request.contextPath}/delMsgs?" + ids ;
        }


    </script>

    <title>留言板展示</title>

    <!-- Bootstrap core CSS -->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap/js/bootstrap.min.js"></script>

</head>

<body style="overflow: auto; width: 100%;">

<%--<div style="overflow: auto; width: 100%;">--%>

        <div class="row">
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

                <%--<div style="overflow: auto; width: 100%;">--%>
                <table style="width: 1800px;position: absolute" class="table table-striped table-bordered">
                    <%--<tr>--%>
                        <%--<th align="right">--%>
                            <%--&lt;%&ndash;<input type="button" value="保存" onclick="toSave()"/>&ndash;%&gt;--%>
                            <%--<input class="btn btn-primary btn-xs" type="button" value="删除留言" onclick="delMsgs()"/>--%>
                        <%--</th>--%>
                    <%--</tr>--%>
                    <tr>
                        <th width="2%">选择</th>
                        <th width="2%">id</th>
                        <th width="5%">留言标题</th>
                        <th width="4%">姓名</th>
                        <th width="4%">电话</th>
                        <th width="5%">邮箱</th>
                        <th width="6%" >单位</th>
                        <th width="6%">地址</th>

                        <th width="9%">主要内容</th>
                        <th width="5%">附件存储<br>(点击下载)</th>
                        <%--下拉框，该条留言所属类别--%>
                        <script type="text/javascript">
                            function findByCate() {
                                var options=$("#category option:selected").val(); //获取选中的项
                                window.location.href="findByCateServlet?category="+options;
                            }
                        </script>
                        <th width="8%">
                            <select class="form-control" id="category" name="category" onchange="findByCate()">
                                <option value="0">请选择留言所属分类</option>
                                <option value="10">查看全部</option>
                                <option value="1">科技项目申报</option>
                                <option value="2">科技成果转化</option>
                                <option value="3">高新技术企业认定</option>
                                <option value="4">技术中心/重点实验室</option>
                                <option value="5">专精特新申报</option>
                                <option value="6">技术改造申报</option>
                                <option value="7">知识产权服务</option>
                                <option value="8">入区申请</option>
                                <option value="9">其他服务</option>
                            </select>
                        </th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="msg" items="${msgList}" >
                        <tr>
                            <td><input class="checkbox" type="checkbox" name="id" value="${msg.id }" /></td>
                            <td>${msg.id }</td>
                            <td>${msg.title }</td>
                            <td>${msg.name }</td>
                            <td>${msg.telephone }</td>
                            <td>${msg.mail }</td>
                            <td>${msg.unit }</td>
                            <td>${msg.site }</td>
                            <td>${msg.content }</td>
                            <td><a href="download?downFile=${msg.accessory}">${msg.accessory}</a> </td>
                            <td>${msg.category}</td>
                                <%--<td>${msg.accessory }</td>--%>
                            <td width="5%">
                                <a href="${pageContext.request.contextPath}/modify?id=${msg.id}">修改此留言</a>
                                <br/>
                                <a href="${pageContext.request.contextPath}/delMsg?id=${msg.id}" onclick="return del()" >删除此留言</a>
                            </td>
                                <%--<td width="100px;">--%>
                                <%--<a href="${pageContext.request.contextPath}/FindmsgAndCategory?pid=${msg.pid}">修改此留言</a>--%>
                                <%--<br/>--%>
                                <%--<a href="${pageContext.request.contextPath}/Delmsg?pid=${msg.pid}" onclick="return del()" >删除此留言</a>--%>
                                <%--</td>--%>
                        </tr>
                    </c:forEach>
                </table>
            <%--</div>--%>
            </div>
        </div>
<%--</div> <!-- /container -->--%>
</body>
</html>

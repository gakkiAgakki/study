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

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/imagetable.css">

    <!-- Bootstrap core CSS -->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap/js/bootstrap.min.js"></script>

</head>

<body>
<%--<body >--%>
    <div style="width: 1000px;height: 200px;text-align: center">
        <img src="img/pingtai.png">
    </div>
        <div class="row" style="width: 1400px">
            <div class="col-xs-3 col-md-2" style="width: 220px" >
                <%--<div style="z-index: 9999; position: fixed ! important; left: 0px; top: 0;">--%>
                    <%--<div style="height: 200px;text-align: center">--%>

                    <%--</div>--%>
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
                    <div class="row" style="height: 80px">
                        <div class="col-xs-8 col-sm-6 col-xs-offset-3">
                            <input  class="btn btn-primary" type="button" style="width: 120px;height: 40px" value="删除选中留言" onclick="delMsgs()">
                        </div>
                    </div>
                <%--</div>--%>
            </div>
            <div class="col-xs-10 col-md-10">
                <div style="overflow: auto; width: 1290px;">


                    <table style="text-align: center;width: 1800px;" class="table table-striped table-bordered" align="center">
                        <tr>
                            <td width="2.5%"><b>选择</b></td>
                            <td width="2%"><b>id</b></td>
                            <td width="5%"><b>留言标题</b></td>
                            <td width="4%"><b>姓名</b></td>
                            <td width="4%"><b>电话</b></td>
                            <td width="5%"><b>邮箱</b></td>
                            <td width="6%" ><b>单位</b></td>
                            <td width="6%"><b>地址</b></td>

                            <td width="9%"><b>主要内容</b></td>
                            <td width="8%"><b>回复内容</b></td>
                            <td width="5%"><b>附件存储</b><br>(点击下载)</td>
                            <%--下拉框，该条留言所属类别--%>
                            <script type="text/javascript">
                                function findByCate() {
                                    var options=$("#category option:selected").val(); //获取选中的项
                                    window.location.href="findByCateServlet?category="+options;
                                }
                            </script>
                            <td width="8%">
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
                            </td>
                            <td><b>操作</b></td>
                            <td><b>状态</b></td>
                        </tr>
                        <c:forEach var="msg" items="${pb.pList}" >
                            <tr>
                                <td><input class="checkbox" type="checkbox" name="id" value="${msg.id }" /></td>
                                <td>${msg.id }</td>
                                <td>${msg.title }</td>
                                <td>${msg.name }</td>
                                <td>${msg.telephone }</td>
                                <td>${msg.mail }</td>
                                <td>${msg.unit }</td>
                                <td>${msg.site }</td>
                                <td><input class="form-control" value="${msg.content }" disabled></td>
                                <td><input class="form-control" value="${msg.reply}" disabled></td>
                                <td><a href="download?downFile=${msg.accessory}">${msg.accessory}</a> </td>
                                <td>${msg.category}</td>
                                    <%--<td>${msg.accessory }</td>--%>
                                <td width="5%">
                                    <a href="${pageContext.request.contextPath}/modify?id=${msg.id}">修改此留言</a>
                                    <br/>
                                    <a href="${pageContext.request.contextPath}/delMsg?id=${msg.id}" onclick="return del()" >删除此留言</a>
                                </td>
                                <td width="5%">
                                    <a href="${pageContext.request.contextPath}/msgReply?id=${msg.id}">回复此留言</a>
                                    <br/>
                                    <script type="text/javascript">
                                        function replyState(id) {
                                            window.location.href="${pageContext.request.contextPath}/replyState?id="+id;
                                        }
                                    </script>
                                    <c:if test="${not empty msg.state}">
                                        <input  class="btn btn-primary btn-xs" type="submit" onclick="replyState(${msg.id})" value="${msg.state}" >
                                    </c:if>

                                    <%--${msg.state}--%>
                                </td>
                            </tr>
                        </c:forEach>

                            <%--分页--%>
                            <table class="table table-striped table-bordered" align="center">
                                <tr align="center">
                                    <td>
                                        <a <c:if test="${pb.pageNum > 1 }"> href="${pageContext.request.contextPath }/management?pageNum=${pb.pageNum - 1}"</c:if>>上一页</a>

                                        <c:forEach var="current" begin="1" end="${pb.pages }" >
                                            <a href="${pageContext.request.contextPath }/management?pageNum=${current}">${current }</a>
                                        </c:forEach>

                                        <a <c:if test="${pb.pageNum < pb.pages }"> href="${pageContext.request.contextPath }/management?pageNum=${pb.pageNum + 1}"</c:if>>下一页</a>

                                    </td>
                                </tr>
                                <%--记录数，总条数--%>
                                <tr>
                                    <td align="right">
                                        <font size="2" color="red">共 ${pb.totalRecord } 条记录，每页显示 ${pb.rows }条，共 ${pb.pages }页，当前页从第 ${pb.startIndex + 1} 条记录开始</font>
                                    </td>
                                </tr>
                            </table>

                    </table>
                </div>
        </div>
</div> <!-- /container -->
</body>
</html>
